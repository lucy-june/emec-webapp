/**
 * Created by lucywu on 7/4/14.
 * 营业员库存管理(需要严格事务与加锁)
 */
var generalDAO              = require("../../dao/generalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var myLogger = require('../../logging/contextLogger')("web/stockService");
var mec_itm_stockDAO        = require('../../dao/mec_itm_stockDAO');
var mec_itm_skcDAO  = require('../../dao/mec_itm_skcDAO');
var mec_itm_storeitemDAO        = require('../../dao/mec_itm_storeitemDAO');
var mec_vi_counter_skc_stockDAO    =require('../../dao/mec_vi_counter_skc_stockDAO');
var mec_vi_offline_hasstock_counter_sku_totalDAO   =require("../../dao/mec_vi_offline_hasstock_counter_sku_totalDAO");

//获取柜台线下在卖的管库存的商品
exports.getCounterHasstockSku=function(countercode,qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        qry={COUNTERCODE:countercode};
        mec_vi_offline_hasstock_counter_sku_totalDAO.queryAndCount({"where":qry,"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getCounterHasstockSku [offline_hasstock_counter_sku_total.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getCounterHasstockSku [offline_hasstock_counter_sku.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        qry.COUNTERCODE=countercode;
        mec_vi_offline_hasstock_counter_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getCounterHasstockSku [offline_hasstock_counter_sku.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getCounterHasstockSku [offline_hasstock_counter_sku.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
   else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "PRODUCTCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME"
        ];
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: "%" + qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: "%" + qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        qryOptions = sequelize.and(qryOptions,{COUNTERCODE:countercode});
        mec_vi_offline_hasstock_counter_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getCounterHasstockSku [offline_hasstock_counter_sku.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getCounterHasstockSku [offline_hasstock_counter_sku.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取柜台某商品skc的所有库存(包括该商品的所有skc,没库存的按0显示出来)
exports.getCounterSkcStock=function(countercode,itemcode,cb){
    mec_vi_counter_skc_stockDAO.queryAll({where:{COUNTERCODE:countercode,ITEMCODE:itemcode}},function(err,msg){
        if(!err) myLogger.trace("getCounterSkcStock [mec_vi_counter_skc_stock.queryAll]: "+(msg&&msg.length));
        else myLogger.error("getCounterSkcStock [mec_vi_counter_skc_stock.queryAll]: "+logErr(err));
        cb(err,msg);
    })
}

//进货
exports.increaseStock=function(countercode,skccode,num,assistantid,cb){
    myLogger.trace("increaseStock [countercode,skccode,num,assistantid]: "+countercode+" "+skccode+" "+num+ " "+assistantid);

    //参数检查
    var reg=new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    if(!reg.test(num)){
        myLogger.error("increaseStock [Check Params]: illegal num");
        cb("illegal num",null);
        return;
    }
    if(typeof(num)!="number") num=Number(num);//必须保证是整数不能是字符串
    if(!num || num<0) {
        myLogger.error("increaseStock [Check Params]: illegal num");
        cb("illegal num",null);
        return;
    }

    //首先查询该库存信息是否存在,需要添加更新锁
    var sql="select AMOUNT from mec_itm_stock where COUNTERCODE='?1' and SKCCODE='?2' and RECORDSTATE=1 limit 1 FOR UPDATE";
    sql=sql.replace('?1',countercode);
    sql=sql.replace('?2',skccode);

    sequelize.transaction({
//        isolationLevel: "SERIALIZABLE",
        autocommit:false //必须disable autocommit
    },function(t){
        async.waterfall([
            function(cb){
                generalDAO.runSql(sql,{transaction:t},cb);
            },
            function(x,cb){
                myLogger.trace("increaseStock [select AMOUNT from mec_itm_stock]: "+JSON.stringify(x));
                //如果库存表中有该柜-skc记录
                if(x&& x.length==1){
                    var amount= x[0].AMOUNT+num;
                    myLogger.trace("increaseStock [new amount]: "+amount);
                    var value={AMOUNT:amount,LASTOPERATEPERSON:assistantid};
                    var where={COUNTERCODE:countercode,SKCCODE:skccode,RECORDSTATE:1};
                    mec_itm_stockDAO.update(value,where,t,cb);
                }
                else{
                    async.parallel([
                        function(cb){
                            //插入库存记录(AMOUNT unsigned int 插入对象不能是整数??)
                            var value={COUNTERCODE:countercode,SKCCODE:skccode,AMOUNT:num+"",LASTOPERATEPERSON:assistantid};
                            myLogger.trace("increaseStock [mec_itm_stockDAO.add obj]: "+JSON.stringify(value));
                            mec_itm_stockDAO.add(value,t,cb);
                        },
                        function(cb){
                            //更新商品的sellingstate为2(如果原sellingstate=0)
                            var sql="update mec_itm_item set SELLINGSTATE=2 where CHECKSTATE=1 and SELLINGSTATE=0 and " +
                                "ITEMCODE = (select ITEMCODE from mec_itm_skc where SKCCODE='?2')";
                            sql=sql.replace("?2",skccode);
                            generalDAO.runSql(sql,{transaction:t},cb);
                        }
                    ],cb);
                }
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("increaseStock [mec_itm_stock.update/add, mec_itm_item.update]: "+JSON.stringify(msg));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("increaseStock [waterfall.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//退货
exports.decreaseStock=function(countercode,skccode,num,assistantid,cb){
    myLogger.trace("decreaseStock [countercode,skccode,num,assistantid]: "+countercode+" "+skccode+" "+num+ " "+assistantid);

    //参数检查
    var reg=new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    if(!reg.test(num)){
        myLogger.error("decreaseStock [Check Params]: illegal num");
        cb("illegal num",null);
        return;
    }
    if(typeof(num)!="number") num=Number(num);//必须保证是整数不能是字符串
    if(!num || num<0) {
        myLogger.error("decreaseStock [Check Params]: illegal num");
        cb("illegal num",null);
        return;
    }

//首先查询该库存信息是否存在,需要添加更新锁
    var sql="select AMOUNT from mec_itm_stock where COUNTERCODE='?1' and SKCCODE='?2' and RECORDSTATE=1 limit 1 FOR UPDATE";
    sql=sql.replace('?1',countercode);
    sql=sql.replace('?2',skccode);

    sequelize.transaction({
//        isolationLevel: "SERIALIZABLE",
        autocommit:false //for update必须disable autocommit
    },function(t){
        async.waterfall([
            function(cb){
                generalDAO.runSql(sql,{transaction:t},cb);
            },
            function(x,cb){
                //TODO 退货是否允许一定负库存
                myLogger.trace("decreaseStock [select AMOUNT from mec_itm_stock]: "+JSON.stringify(x));
                if(x && x.length==1 && x[0].AMOUNT>=num){
                    var amount= x[0].AMOUNT-num;
                    myLogger.trace("decreaseStock [new amount]: "+amount);
                    var value={AMOUNT:amount,LASTOPERATEPERSON:assistantid};
                    var where={COUNTERCODE:countercode,SKCCODE:skccode,RECORDSTATE:1};
                    mec_itm_stockDAO.update(value,where,t,cb);
                }
                else{
                    cb("unenougth stock","warn");
                }
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("decreaseStock [mec_itm_stockDAO.add/update]: "+JSON.stringify(msg));
                t.commit();
                cb(null,msg);
            }
            else{
                if(msg=="warn")  myLogger.warn("decreaseStock [waterfall.warn]: "+logErr(err));
                else myLogger.error("decreaseStock [waterfall.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//设置负库存
exports.setNegativeStock=function(countercode,options,cb){
    myLogger.trace("setNegativeStock [countercode,options]: "+countercode+"\n"+JSON.stringify(options));

    sequelize.transaction(function(t){
        async.forEach(options,function(option,cb){
            async.waterfall([
                function(cb){
                    mec_itm_storeitemDAO.update(option,{COUNTERCODE:countercode,ITEMCODE:option.ITEMCODE},t,cb);
                },
                function(x,cb){
                    mec_itm_skcDAO.queryAll({where:{ITEMCODE:option.ITEMCODE},attributes:["SKCCODE"]},t,cb);
                },
                function(x,cb){
                    async.forEach(x,function(skc,cb){
                        mec_itm_stockDAO.queryOne({where:{COUNTERCODE:countercode,SKCCODE:skc.SKCCODE}},t,function(err,msg){
                            if(err) cb(err,null);
                            else if(!msg){
                                var obj={
                                    COUNTERCODE:countercode,
                                    SKCCODE:skc.SKCCODE,
                                    ISALLOWNEGATIVE:option.ISALLOWNEGATIVE,
                                    BUFFER:option.BUFFER
                                }
                                mec_itm_stockDAO.add(obj,t,cb);
                            }
                            else{
                                var value={
                                    ISALLOWNEGATIVE:option.ISALLOWNEGATIVE,
                                    BUFFER:option.BUFFER
                                }
                                var where={
                                    COUNTERCODE:countercode,
                                    SKCCODE:skc.SKCCODE
                                }
                                mec_itm_stockDAO.update(value,where,t,cb);
                            }
                        });
                    },function(err){
                        cb(err,null);
                    })
                }
            ],cb);
        },function(err){
            if(err){
                t.rollback();
                myLogger.error("setNegativeStock [async.forEach]: "+logErr(err));
                cb(err,null);
            }
            else{
                t.commit();
                cb(null,null);
            }
        })
    });
}