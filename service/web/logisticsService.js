/**
 * Created by lucywu on 10/21/14.
 */
var myLogger = require('../../logging/contextLogger')("web/logisticsService");
var async                       = require('async');
var sequelize                   = require('../../dao/_sequelize');
var generalDAO                  = require('../../dao/generalDAO');
var stringUtil                  = require("../../util/stringUtil");
var dateUtil                    = require("../../util/dateUtil");
var httpRequest                 = require('../../util/httpRequest');
var mec_lgt_packageDAO                 = require("../../dao/mec_lgt_packageDAO");
var mec_lgt_packagecontentDAO           = require("../../dao/mec_lgt_packagecontentDAO");
var mec_lgt_logisticsDAO             = require("../../dao/mec_lgt_logisticsDAO");
var mec_vi_package_item_totalDAO  = require("../../dao/mec_vi_package_item_totalDAO");
var mec_buy_onlineorderDAO = require("../../dao/mec_buy_onlineorderDAO");
var mec_buy_offlineorderDAO = require("../../dao/mec_buy_offlineorderDAO");
var mec_lgt_pickdeptDAO = require("../../dao/mec_lgt_pickdeptDAO");
var mec_hct_counterDAO = require("../../dao/mec_hct_counterDAO");
var mec_lgt_pickcounterDAO= require("../../dao/mec_lgt_pickcounterDAO");
var mec_vi_lgt_pickcounter_totalDAO =  require("../../dao/mec_vi_lgt_pickcounter_totalDAO");


//获取特定状态包裹对应到的不同订单
exports.getOrderLevel=function(qry,datefrom,dateto,cb){
    var sql="select distinct ORDERCODE,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,PLACEORDERTIME from mec_lgt_package ";
    if(qry && Object.keys(qry).length!=0){
        sql+="where ";
        sql+=stringUtil.optionsToSqlString(qry);
    }

    sql+=" and "+generateDateSql(datefrom,dateto);

    generalDAO.runSql(sql,cb);
}

//获取本门店需要关注的特定状态包裹对应到的不同订单
exports.getRelatedOrderLevel=function(qry,datefrom,dateto,deptcode,cb){
    var sql="select distinct ORDERCODE,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,PLACEORDERTIME from mec_lgt_package ";
    if(qry && Object.keys(qry).length!=0){
        sql+="where ";
        sql+=stringUtil.optionsToSqlString(qry);
    }

    sql+=" and "+generateDateSql(datefrom,dateto);
    sql+=" and (     (DEPTCODE='"+deptcode+"' and DELIVERYDEPTCODE='"+deptcode+"')     " +
        "or     (DEPTCODE<>'"+deptcode+"' and DELIVERYDEPTCODE='"+deptcode+
        "' and PACKAGESTATE in (2,5,3,6,7))     or     (DEPTCODE='"+deptcode+
        "' and DELIVERYDEPTCODE<>'"+deptcode+"' and (PACKAGESTATE in (0,1,4)) )    ) "

    generalDAO.runSql(sql,cb);
}

//获取特定类型的包裹
exports.getPackageLevel=function(qry,datefrom,dateto,cb){
    var sql="select * from mec_lgt_package ";
//    console.log(qry);
    if(qry && Object.keys(qry).length!=0){
        sql+="where ";
        sql+=stringUtil.optionsToSqlString(qry);
    }

    sql+=" and "+generateDateSql(datefrom,dateto);

    generalDAO.runSql(sql,cb);
}

//获取本门店需要关注的特定类型的包裹
exports.getRelatedPackageLevel=function(qry,datefrom,dateto,deptcode,cb){
    var sql="select * from mec_lgt_package ";
//    console.log(qry);
    if(qry && Object.keys(qry).length!=0){
        sql+="where ";
        sql+=stringUtil.optionsToSqlString(qry);
    }

    sql+=" and "+generateDateSql(datefrom,dateto);
    sql+=" and (     (DEPTCODE='"+deptcode+"' and DELIVERYDEPTCODE='"+deptcode+
        "')     or     (DEPTCODE<>'"+deptcode+"' and DELIVERYDEPTCODE='"+deptcode+
        "' and PACKAGESTATE in (2,5,3,6,7))     or     (DEPTCODE='"+deptcode+
        "' and DELIVERYDEPTCODE<>'"+deptcode+"' and (PACKAGESTATE in (0,1,4)) )    ) "

    generalDAO.runSql(sql,cb);
}

//分页搜索全部包裹
exports.searchTotalPackage = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_lgt_packageDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchTotalPackage [mec_lgt_packageDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchTotalPackage [mec_lgt_packageDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_lgt_packageDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchTotalPackage [mec_lgt_packageDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchTotalPackage [mec_lgt_packageDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "PACKAGECODE",
            "ORDERCODE",
            "DEPTCODE",
            "COUNTERCODE",
            "POSITIONCODE"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("PLACEORDERTIME"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: "%"+qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_lgt_packageDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchTotalPackage [mec_lgt_packageDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchTotalPackage [mec_lgt_packageDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取包裹内的商品详情
exports.getDetailLevel=function(qry,cb){
    mec_vi_package_item_totalDAO.queryAll(qry,cb);
}

//更新包裹的状态位置等信息
exports.updatePackageState=function(packagecodes,oldstate,newstate,oldposition,newposition,operateperson,callback){
    sequelize.transaction(function(t){
        async.forEach(packagecodes,function(packagecode,callback){//对于每一个包裹
            async.waterfall([
                    function(cb){
                        //更新包裹状态
                        var change={};
                        if(newstate!=oldstate)change.PACKAGESTATE=newstate;
                        if(newposition!=oldposition) {
                            if (newposition == "#") {
                                change.POSITIONCODE = "";
                            }
                            else {
                                change.POSITIONCODE = newposition;
                            }
                        }
                        change.LASTOPERATEPERSON=operateperson;

                        var option={
                            PACKAGECODE:packagecode
                        };
                        if(oldstate) option.PACKAGESTATE=oldstate;
                        if(oldposition) option.POSITIONCODE=oldposition;
                        mec_lgt_packageDAO.update(change,option,t,cb);
                    },
                    function(x,cb){
                        adjustPackageState(t,packagecode,cb);
                    }
                ],
                callback);
        },function(err){
            if(err){
                t.rollback();
                callback(err);
            }
            else{
                t.commit();
                callback(null,null);
            }
        })
    })
}

//检查包裹是否应该发往别的门店
exports.isToOtherDept=function(packagecode,callback){
    mec_lgt_packageDAO.queryAll({where:{"PACKAGECODE":packagecode,"PACKAGESTATE":1}},function(err,msg){
        if(err){
            callback(err);
        }
        else if(msg && msg.length==1){
            var deliverymode=msg[0].DELIVERYMODE;
            var deptcode=msg[0].DEPTCODE;
            var deliverydeptcode=msg[0]["DELIVERYDEPTCODE"];
            //分门店配送
//            if(deliverymode==0 && deptcode!=deliverydeptcode){
//                callback(null,1);
//            }
//            else{
//                callback(null,0);
//            }

            //统一配送
            if(deptcode!=deliverydeptcode){
                callback(null,1);
            }
            else{
                callback(null,0);
            }
        }
        else{
            callback("不是待取货包裹!");
        }
    });
}

//自动调整集齐包裹的状态
var adjustPackageState=function(t,packagecode,callback){
    async.waterfall([
        function(cb){
            mec_lgt_packageDAO.queryAll({where:{"PACKAGECODE":packagecode,"PACKAGESTATE":2}},t,cb);
        },
        function(x,cb){
            if(x && x.length==1){
                var ordercode=x[0].ORDERCODE;
                var deptcode=x[0].DEPTCODE;
                var deliverymode=x[0].DELIVERYMODE;

                var qry={where:{"ORDERCODE":ordercode}};

//                //分门店配送
//                if(deliverymode==1){
//                    qry.where.DEPTCODE=deptcode;
//                }

                mec_lgt_packageDAO.queryAll(qry,t,cb);
            }
            else{
                cb(null,null);
            }
        },
        function(x,cb){
            if(x && x.length>=1){
                var isReady=1;
                for(var k=0;k< x.length;k++){
                    if(x[k].PACKAGESTATE!=2){
                        isReady=0;
                        break;
                    }
                }
                if(isReady==1){
                    async.forEach(x,function(record,cb){
                        var change={
                            PACKAGESTATE:record.DELIVERYMODE==0?7:3,
                            LASTOPERATEPERSON:null
                        };
                        mec_lgt_packageDAO.update(change,record,t,cb);
                    },function(err){
                        if(err) cb(err);
                        else cb(null,null);
                    });
                }
                else{
                    cb(null,null);
                }
            }
            else{
                cb(null,null);
            }
        }
    ],callback);
}

//生成日期sql条件语句
var generateDateSql=function(datefrom,dateto){
    if((!datefrom||datefrom=="")&&(!dateto||dateto=="")){
        dateto=new Date();
        dateto.setDate(dateto.getDate()+1);
        datefrom=new Date("2000-01-01 00:00:00");
        datefrom.setDate(datefrom.getDate()-1);
//        datefrom=new Date(dateto);
//        datefrom.setMonth(datefrom.getMonth()-3);
    }
    else if(!datefrom||datefrom==""){
        datefrom=new Date("2000-01-01 00:00:00");
        datefrom.setDate(datefrom.getDate()-1);
        dateto = new Date(Date.parse(dateto.replace(/-/g,"/")));
        dateto.setDate(dateto.getDate()+1);
    }
    else if(!dateto||dateto==""){
        datefrom = new Date(Date.parse(datefrom.replace(/-/g,"/")));
        datefrom.setDate(datefrom.getDate()-1);
        dateto=new Date();
        dateto.setDate(dateto.getDate()+1);
    }
    else{
        datefrom = new Date(Date.parse(datefrom.replace(/-/g,"/")));
        datefrom.setDate(datefrom.getDate()-1);
        dateto = new Date(Date.parse(dateto.replace(/-/g,"/")));
        dateto.setDate(dateto.getDate()+1);
    }

    var sql="createdAt between 'DATEFROM' and 'DATETO' ";
    sql=sql.replace(/DATEFROM/g,datefrom.Format("yyyy/MM/dd"));
    sql=sql.replace(/DATETO/g,dateto.Format("yyyy/MM/dd"));

    return sql;
}

//获取建议位置
exports.getSuggestPosition=function(packagecode,deptcode,callback){
    sequelize.transaction(function(t){
        async.waterfall([
            function(cb){
                mec_lgt_packageDAO.queryAll({where:{"PACKAGECODE":packagecode,"PACKAGESTATE":[1,5]}},t,cb);
            },
            function(x,cb){
                if(x&& x.length==1){
                    var _deliverymode=x[0].DELIVERYMODE;
                    var _deptcode=x[0].DEPTCODE;
                    var _ordercode=x[0].ORDERCODE;

                    //分门店配送
//                    if(_deliverymode==0){
//                        mec_lgt_packageDAO.queryAll({where:{"ORDERCODE":_ordercode,PACKAGESTATE:2}},t,cb);
//                    }
//                    else{
//                        mec_lgt_packageDAO.queryAll({where:{"ORDERCODE":_ordercode,"DEPTCODE":_deptcode,PACKAGESTATE:2}},t,cb);
//                    }

                    //统一配送
                    mec_lgt_packageDAO.queryAll({where:{"ORDERCODE":_ordercode,PACKAGESTATE:2}},t,cb);
                }
                else{
                    cb("不是合适的包裹!");
                }
            },
            function(x,cb){
                if(x&& x.length>=1){
                    var position="";
                    for(var k=0;k< x.length;k++){
                        if(x[k].POSITIONCODE!=""){
                            position=x[k].POSITIONCODE;
                            break;
                        }
                    }
                    cb(null,position);
                }
                else if(x&& x.length==0){
                    cb(null,"");
                }
                else{
                    cb("不是合适的包裹!");
                }
            }
        ],function(err,msg){
            if(err){
                t.rollback();
                callback(err);
            }
            else{
                t.commit();
                callback(null,msg);
            }
        });
    });
}

//获取多个包裹建议的位置数组
exports.getSuggestPositions=function(packagecodes,deptcode,callback){
    var positions=[];

    async.forEach(packagecodes,function(packagecode,cb){
        exports.getSuggestPosition(packagecode,deptcode,function(err,msg){
            if(err){

            }
            else{
                if(msg!="" && positions.indexOf(msg)==-1) positions.push(msg);
            }
            cb();
        })
    },function(err){
        callback(positions);
    });
};

//获取待备货的包裹
exports.getPreparingPackage=function(countercode,qry,cb){
    if(!qry){
        exports.getPackageLevel({PACKAGESTATE:0,COUNTERCODE:countercode},null,null,cb);
    }
    else{
        exports.getPackageLevel({PACKAGESTATE:0,COUNTERCODE:countercode,ORDERCODE:qry},null,null,cb);
    }
}

//备货完成
exports.preparePackage=function(packagecode,assistantid,cb){
    var value={PACKAGESTATE:1,LASTOPERATEPERSON:assistantid};
    var where={PACKAGECODE:packagecode,PACKAGESTATE:0};
    mec_lgt_packageDAO.update(value,where,cb);
}

//获取等待收包裹
exports.getCollectingPackage=function(deptcode,cb){
    exports.getRelatedPackageLevel({PACKAGESTATE:[1,5]},null,null,deptcode,cb);
}

//收包裹,从营业员到集货区
exports.collectPackage1=function(packagecode,position,usercode,cb){
    //TODO 跟踪订单状态
    exports.updatePackageState([packagecode],1,2,"",position,usercode,cb);
}

//收包裹,从营业员到调货区
exports.collectPackage2=function(packagecode,position,usercode,cb){
    //TODO 跟踪订单状态
    exports.updatePackageState([packagecode],1,4,"",position,usercode,cb);
}

//收包裹,从调货员到集货区
exports.collectPackage3=function(packagecode,position,usercode,cb){
    exports.updatePackageState([packagecode],5,2,"",position,usercode,cb);
}

//获取需要调货的包裹
exports.getTransferablePackage=function(deptcode,cb){
    exports.getRelatedPackageLevel({PACKAGESTATE:4},null,null,deptcode,cb);
}

//门店调货包裹
exports.transferPackage=function(packagecode,usercode,cb){
    var value={PACKAGESTATE:5,LASTOPERATEPERSON:usercode,POSITIONCODE:""};
    var where={PACKAGECODE:packagecode,PACKAGESTATE:4};
    mec_lgt_packageDAO.update(value,where,cb);
}

//获取需要打包的订单
exports.getPackableOrder=function(deptcode,cb){
    exports.getRelatedOrderLevel({PACKAGESTATE:[3,7]},null,null,deptcode,cb);
}

//打包订单
exports.packOrder=function(ordercode,position,usercode,cb){
    myLogger.trace("packOrder [ordercode]: "+ordercode);
    if(ordercode.charAt(0)=='0'){//线下订单
        sequelize.transaction(function(t){
            async.waterfall([
                function(cb){
                    //查询订单相关信息
                    mec_buy_offlineorderDAO.queryOne({attributes:["COUNTERCODE"],where:{OFFLINEORDERCODE:ordercode}},t,cb);
                },
                function(x,cb){
                    //查询订单的门店信息
                    mec_hct_counterDAO.queryOne({attributes:["STORECODE"],where:{COUNTERCODE: x.COUNTERCODE}},t,cb);
                },
                function(x,cb){
                    //修改订单状态,并生成logistics或pickdept信息
                    if(x){
                        async.parallel([
                            function(cb){
                                mec_buy_offlineorderDAO.update({ORDERSTATE:5},{OFFLINEORDERCODE:ordercode},t,cb);
                            },
                            function(cb){
                                var value={
                                    ORDERCODE:ordercode,
                                    ISONLINEORDER:0,
                                    LGTSTATE:0,
                                    DEPTCODE: x.STORECODE,
                                    POSITIONCODE:position
                                };
                                mec_lgt_logisticsDAO.add(value,t,cb);
                            }
                        ],cb);
                    }
                    else{
                        cb("unfound order's deptcode",null);
                    }
                },
                function(x,cb){
                    //更新包裹状态
                    var value={PACKAGESTATE:99,POSITIONCODE:position,LASTOPERATEPERSON:usercode};
                    var where={ORDERCODE:ordercode,PACKAGESTATE:{in:[3,7]}};
                    mec_lgt_packageDAO.update(value,where,t,cb);
                }
            ],function(err,msg){
                if(!err){
                    myLogger.trace("packOrder [waterfall.msg]: "+JSON.stringify(msg));
                    t.commit();
                    cb(null,msg);
                }
                else{
                    myLogger.error("packOrder [waterfall.err]: "+logErr(err));
                    t.rollback();
                    cb(err,null);
                }
            })
        });
    }
    else if(ordercode.charAt(0)=='1'){//线上订单
        sequelize.transaction(function(t){
            async.waterfall([
                function(cb){
                    //查询订单相关信息
                    mec_buy_onlineorderDAO.queryOne({where:{ONLINEORDERCODE:ordercode}},t,cb);
                },
                function(x,cb){
                    //修改订单状态,并生成logistics或pickdept信息
                    if(x){
                        if(x.DELIVERYMODE==1){//配送
                            async.parallel([
                                function(cb){
                                    mec_buy_onlineorderDAO.update({ORDERSTATE:5},{ONLINEORDERCODE:ordercode},t,cb);
                                },
                                function(cb){
                                    var value={
                                        ORDERCODE:ordercode,
                                        ISONLINEORDER:1,
                                        LGTSTATE:0,
                                        DEPTCODE: x.DELIVERYDEPTCODE,
                                        POSITIONCODE:position
                                    };
                                    mec_lgt_logisticsDAO.add(value,t,cb);
                                }
                            ],cb);
                        }
                        else if(x.DELIVERYMODE==0 && x.PAYMENTMODE==1){//网付自提
                            async.parallel([
                                function(cb){
                                    mec_buy_onlineorderDAO.update({ORDERSTATE:7},{ONLINEORDERCODE:ordercode},t,cb);
                                },
                                function(cb){
                                    var value={
                                        ORDERCODE:ordercode,
                                        PICKCODE:stringUtil.autoComple(Math.floor(Math.random()*1000000),6,'0'),
                                        PICKSTATE:0,
                                        DEPTCODE: x.DELIVERYDEPTCODE,
                                        POSITIONCODE:position
                                    };
                                    mec_lgt_pickdeptDAO.add(value,t,cb);
                                }
                            ],cb);
                        }
                        else{
                            cb("unsuitable ordercode",null);
                        }
                    }
                    else{
                        cb("unknow ordercode",null);
                    }
                },
                function(x,cb){
                    //更新包裹状态
                    var value={PACKAGESTATE:99,POSITIONCODE:position,LASTOPERATEPERSON:usercode};
                    var where={ORDERCODE:ordercode,PACKAGESTATE:{in:[3,7]}};
                    mec_lgt_packageDAO.update(value,where,t,cb);
                }
            ],function(err,msg){
                if(!err){
                    myLogger.trace("packOrder [waterfall.msg]: "+JSON.stringify(msg));
                    t.commit();
                    cb(null,msg);
                }
                else{
                    myLogger.error("packOrder [waterfall.err]: "+logErr(err));
                    t.rollback();
                    cb(err,null);
                }
            })
        })
    }
    else{
        cb("illegal ordercode",null);
    }
}

//获取待发快递的订单信息
exports.getDeliverableOrders=function(deptcode,cb){
    mec_lgt_logisticsDAO.queryAll({where:{DEPTCODE:deptcode,LGTSTATE:0}},cb);
}

//发快递
exports.sendExpress=function(ordercode,lgtcompany, lgtnumber,usercode,cb){
    //TODO 跟踪订单状态
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                var value={
                    LGTCOMPANY:lgtcompany,
                    LGTNUMBER:lgtnumber,
                    LGTSTATE:1,
                    OPERATEPERSON:usercode
                }
                mec_lgt_logisticsDAO.update(value,{ORDERCODE:ordercode},t,cb);
            },
            function(cb){
                if(ordercode.charAt(0)=='0'){//线下订单
                    mec_buy_offlineorderDAO.update({ORDERSTATE:6},{OFFLINEORDERCODE:ordercode,ORDERSTATE:5},t,cb)
                }
                else {//线上订单
                    mec_buy_onlineorderDAO.update({ORDERSTATE:6},{ONLINEORDERCODE:ordercode,ORDERSTATE:5},t,cb)
                }
            }
        ],function(err,msg){
            if(!err){
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("sendExpress [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })

}

//获取已经发快递为确认收货的订单信息
exports.getDeliveringOrders=function(deptcode,cb){
    mec_lgt_logisticsDAO.queryAll({where:{DEPTCODE:deptcode,LGTSTATE:1}},cb);
}

//查看门店提货包裹
exports.getPickDeptOrders=function(deptcode,cb){
    mec_lgt_pickdeptDAO.queryAll({where:{DEPTCODE:deptcode,PICKSTATE:0}},cb);
}

//门店提货
exports.pickDeptOrder=function(ordercode,pickcode,usercode,cb){
    //TODO 跟踪订单状态
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                var value={
                    PICKSTATE:1,
                    OPERATEPERSON:usercode
                }
                mec_lgt_pickdeptDAO.update(value,{ORDERCODE:ordercode,PICKCODE:pickcode},t,function(err,msg){
                    if(!err){
                        if(msg==1){
                            cb(null,msg);
                        }
                        else{
                            cb("提货码错误",null);
                        }
                    }
                    else{
                        myLogger.trace("pickDeptOrder [mec_lgt_logisticsDAO.update]: "+logErr(err));
                        cb(err,null);
                    }
                })
            },
            function(cb){
               mec_buy_onlineorderDAO.update({ORDERSTATE:8},{ONLINEORDERCODE:ordercode,ORDERSTATE:7},t,cb);
            }
        ],function(err,msg){
            if(!err){
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("pickDeptOrder [series.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//查看柜台自提包裹
exports.getPickCounterOrders=function(countercode,qry,cb){
    if(!qry){
        mec_vi_lgt_pickcounter_totalDAO.queryAll({where:{COUNTERCODE:countercode,PICKSTATE:0}},cb);
    }
    else{
        var where=sequelize.and({COUNTERCODE:countercode},{PICKSTATE:0},sequelize.or({ORDERCODE:qry},{POSTRANSCODE:qry}));
        mec_vi_lgt_pickcounter_totalDAO.queryAll({where: where},cb);
    }
}

//柜台提货
exports.pickCounterOrder=function(ordercode,countercode,pickcode,assistantid,cb){
    //TODO 跟踪订单状态
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                var value={
                    PICKSTATE:1,
                    OPERATEPERSON:assistantid
                };
                var where={
                    ORDERCODE:ordercode,
                    COUNTERCODE:countercode,
                    PICKCODE:pickcode
                };
                mec_lgt_pickcounterDAO.update(value,where,t,function(err,msg){
                    if(!err){
                        if(msg==1){
                            cb(null,msg);
                        }
                        else{
                            cb("提货码错误",null);
                        }
                    }
                    else{
                        myLogger.trace("pickOrder [mec_lgt_logisticsDAO.update]: "+logErr(err));
                        cb(err,null);
                    }
                })
            },
            function(cb){
                if(ordercode.charAt(0)=='0'){//线下订单
                    mec_buy_offlineorderDAO.update({ORDERSTATE:8},{OFFLINEORDERCODE:ordercode,ORDERSTATE:4},t,cb);
                }
                else{//线上订单
                    async.waterfall([
                        function(cb){
                            mec_lgt_pickcounterDAO.queryAll({where:{ORDERCODE:ordercode}},t,cb);
                        },
                        function(x,cb){
                            var isReady=1;
                            for(var k= 0;k<x.length;k++){
                                if(x[k].PICKSTATE==0){
                                    isReady=0;
                                    break;
                                }
                            }
                            if(isReady==1){
                                mec_buy_onlineorderDAO.update({ORDERSTATE:8},{ONLINEORDERCODE:ordercode,ORDERSTATE:3},t,cb);
                            }
                            else{
                                cb(null,"some counter not pick");
                            }
                        }
                    ],cb)
                }
            }
        ],function(err,msg){
            if(!err){
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("pickCounterOrder [series.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}