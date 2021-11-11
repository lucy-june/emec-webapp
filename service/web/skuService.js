/**
 * Created by lucywu on 7/4/14.
 */
var generalDAO = require("../../dao/generalDAO");
var mec_itm_itemDAO = require("../../dao/mec_itm_itemDAO");
var mec_itm_skcDAO = require("../../dao/mec_itm_skcDAO");
var mec_itm_item_tmp1DAO = require("../../dao/mec_itm_item_tmp1DAO");
var mec_vi_revisable_sku_totalDAO = require("../../dao/mec_vi_revisable_sku_totalDAO");
var mec_vi_checkable_sku_totalDAO = require("../../dao/mec_vi_checkable_sku_totalDAO");
var mec_vi_deletable_sku_totalDAO = require("../../dao/mec_vi_deletable_sku_totalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var myLogger = require('../../logging/contextLogger')("web/skuService");
var codeCursors = require('../../global/codeCursors');
var mec_itm_storeitemDAO   =require('../../dao/mec_itm_storeitemDAO');
var stringUtil      =require('../../util/stringUtil');
var mis = require("../../interaction/mis");
var rdms = require("../../interaction/rdms");
var objectUtil=require("../../util/objectUtil");

//查看可以修改的sku信息
exports.getRevisableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_revisable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getRevisableSku [mec_vi_revisable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getRevisableSku [mec_vi_revisable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_revisable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getRevisableSku [mec_vi_revisable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getRevisableSku [mec_vi_revisable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "LASTOPERATEPERSON",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_revisable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getRevisableSku [mec_vi_revisable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getRevisableSku [mec_vi_revisable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取可以删除的sku信息
exports.getDeletableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_deletable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getDeletableSku [mec_vi_deletable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getDeletableSku [mec_vi_deletable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_deletable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getDeletableSku [mec_vi_deletable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getDeletableSku [mec_vi_deletable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "INPUTPERSON",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_deletable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getDeletableSku [mec_vi_deletable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getDeletableSku [mec_vi_deletable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取等待审核的sku信息
exports.getCheckableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_checkable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getCheckableSku [mec_vi_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getCheckableSku [mec_vi_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_checkable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getCheckableSku [mec_vi_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getCheckableSku [mec_vi_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "LASTOPERATEPERSON",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_checkable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getCheckableSku [mec_vi_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getCheckableSku [mec_vi_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//修改sku信息到暂存表里面(id为tmp1表的id,value中不要包含TMPSTATE和LASTOPERATEPERSON
exports.reviseSku = function (id, value, usercode, cb) {
    delete value.PRICE;
    delete value.TEMPPRICE;

    if (id) {
        value.LASTOPERATEPERSON = usercode;
        mec_itm_item_tmp1DAO.update(value, {"ID": id}, function (err, msg) {
            if (!err) {
                myLogger.trace("reviseSku [mec_itm_item_tmp1DAO.update]: " + JSON.stringify(msg));
                cb(null, msg);
            }
            else {
                myLogger.error("reviseSku [mec_itm_item_tmp1DAO.update]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if(value.ITEMCODE) {
        value.LASTOPERATEPERSON = usercode;
        value.TMPSTATE = 2;
        var itemcode=value.ITEMCODE;
        mec_itm_itemDAO.queryOne({where:{ITEMCODE:itemcode,CHECKSTATE:1}},function(err,msg){
            if(!err){
                if(msg){
                    var keys=Object.keys(value);
                    for(var k=0;k<keys.length;k++){
                        msg[keys[k]]=value[keys[k]];
                    }
                    mec_itm_item_tmp1DAO.add(msg, function (err, msg) {
                        if (!err) {
                            myLogger.trace("reviseSku [mec_itm_item_tmp1DAO.add]: " + (msg && msg.null));
                            cb(null, msg);
                        }
                        else {
                            myLogger.error("reviseSku [mec_itm_item_tmp1DAO.add]: " + logErr(err));
                            cb(err, null);
                        }
                    })
                }
                else{
                    myLogger.error("reviseSku [mec_itm_itemDAO.queryOne]: " + "unknown itemcode");
                    cb("unknown itemcode",null);
                }
            }
            else{
                myLogger.error("reviseSku [mec_itm_itemDAO.queryOne]: " + logErr(err));
                cb(err,null);
            }
        })
    }
    else{
        myLogger.error("reviseSku [change]: " + "unfound itemcode");
        cb("unfound itemcode",null);
    }
}

//添加sku信息
exports.addSku = function (value, usercode, cb) {
    //业务层验证value信息是否合法
    if ((value.isALLOWNEGATIVE == 1 || value.ISALLOWONLINE == 1) && value.ISCONSIDERSTOCK == 0) {
        cb("库存与上线标志位错误", null);
        return;
    }

    //为插入sku暂存表的value添加其它相关信息
    value.CHECKSTATE = 1;//oracle数据库移植到mysql中无用字段,默认为2
//    value.INPUTPERSON = usercode;//inputperson只允许char6,而usercode允许char32,先不考虑这里
    value.TMPSTATE = 0;
    value.LASTOPERATEPERSON = usercode;

    //添加到sku暂存表中
    async.waterfall([
        function (cb) {
            exports.generateItemcode(cb);
        },
        function (x, cb) {
            myLogger.trace("addSku [generateItemcode]: " + x);
            value.ITEMCODE = x;
            if (!value.BARCODE) value.BARCODE = exports.generateBarcode(x);
            mec_itm_item_tmp1DAO.add(value, cb);
        }
    ], function (err, msg) {
        if (!err) {
            myLogger.trace("addSku [mec_itm_item_tmp1DAO.add]: " + JSON.stringify(msg));
            cb(null, msg);
        }
        else {
            myLogger.error("addSku [waterfall.err]: " + logErr(err));
            cb(err, null);
        }
    })
}

//删除sku信息到暂存表里面
exports.deleteSku = function (itemcode, usercode, cb) {
    async.waterfall([
        function(cb){
            mec_itm_itemDAO.queryOne({where:{"ITEMCODE":itemcode,"CHECKSTATE":1}},cb)
        },
        function(x,cb){
            myLogger.trace("deleteSku [mec_itm_itemDAO.queryOne]: " + JSON.stringify(x));
            if(x){//如果查询到的商品不为null
                //删除商品信息中的原有时间信息
                delete x.updatedAt;
                delete x.createdAt;
                x.LASTOPERATEPERSON=usercode;
                x.TMPSTATE=1;
                mec_itm_item_tmp1DAO.add(x, cb);
            }
            else{
                cb("illegal itemcode","warn");
            }
        }
    ],function(err,msg){
        if (!err) {
            myLogger.trace("deleteSku [mec_itm_item_tmp1DAO.add]: " + (msg && msg.null));
            cb(null, msg);
        }
        else {
            if(msg=="warn") myLogger.warn("deleteSku [waterfall.warn]: " + logErr(err));
            else myLogger.error("deleteSku [waterfall.err]: " + logErr(err));
            cb(err, null);
        }
    });

}

//审核通过相应的sku信息
exports.approveSku = function (id, usercode, cb) {
    sequelize.transaction(function(t){
        async.waterfall([
            function(cb){
                mec_itm_item_tmp1DAO.queryOne({where:{ID:id}},t,cb);
            },
            function(x,cb){
                myLogger.trace("approveSku [mec_itm_item_tmp1DAO.queryOne]: " + JSON.stringify(x));
                var tmpstate= x.TMPSTATE;
                var itemcode= x.ITEMCODE;
                myLogger.trace("approveSku [tmpstate]: " + tmpstate);
                myLogger.trace("approveSku [itemcode]: " + itemcode);

                x.CHECKSTATE=1;
                x.INPUTPERSON=usercode;
                //删除时间数据,这样插入商品表的时间为当前审核通过时间,更新商品表的更新时间为当前时间
                delete x.createdAt;
                delete x.updatedAt;

                if(tmpstate==0){//如果是新增的商品通过审核
                    mec_itm_itemDAO.add(x,t,function(err,msg){
                        if(!err){
                            myLogger.trace("approveSku [mec_itm_itemDAO.add]: " + JSON.stringify(msg));
                            //调用mis接口：createSKU
                            mis.createSKU(x,function(msg){
                                    console.log("MIS create sku item response:" + msg);
                                    cb(null,tmpstate);
                            });
                        }
                        else{
                            cb(err,null);
                        }
                    })
                }
                else if(tmpstate==2){//如果是修改的商品通过审核
                    mec_itm_itemDAO.update(x,{"ITEMCODE":itemcode},t,function(err,msg){
                        if(!err){
                            myLogger.trace("approveSku [mec_itm_itemDAO.update]: " + JSON.stringify(msg));
                            //调用mis接口：updateSKU
                            mis.updateSKU(x,function(msg){
                                console.log("MIS update sku item response:" + msg);
                                cb(null,tmpstate);
                            });
                        }
                        else{
                            cb(err,null);
                        }
                    })
                }
                else if(tmpstate==1){//如果是删除商品通过审核
                    mec_itm_itemDAO.update({"CHECKSTATE":0,"INPUTPERSON":usercode},{"ITEMCODE":itemcode},t,function(err,msg){
                        if(!err){
                            myLogger.trace("approveSku [mec_itm_itemDAO.update]: " + JSON.stringify(msg));
                            cb(null,tmpstate);
                            //调用mis接口：delSKU
                        }
                        else{
                            cb(err,null);
                        }
                    })
                }
                else{
                    cb("illegal tmpstate","warn");
                }
            },
            function(x,cb){
                //将当前暂存表的状态转变为审核通过后的对应状态
                var newTmpState = x+3;
                mec_itm_item_tmp1DAO.update({TMPSTATE:newTmpState,LASTOPERATEPERSON:usercode},{ID:id},t,cb);
            }
        ],function(err,msg){
            if(!err) {
                myLogger.trace("approveSku [mec_itm_item_tmp1DAO.update]: " + JSON.stringify(msg));
                t.commit();
            }
            else{
                if(msg=="warn") myLogger.warn("approveSku [waterfall.warn]: " + logErr(err));
                else myLogger.error("approveSku [waterfall.err]: " + logErr(err));
                t.rollback();
            }
            cb(err,msg);
        })
    })
}

//作废相应的sku信息
exports.invalidSku = function (id, usercode, cb) {
    generalDAO.runSql("update mec_itm_item_tmp1 set TMPSTATE=6, LASTOPERATEPERSON='" + usercode + "' where ID=" + id,
        function (err, msg) {
            if (!err) {
                myLogger.trace("approveSku [update mec_itm_item_tmp1DAO]: " + JSON.stringify(msg));
                cb(null, msg);
            }
            else {
                myLogger.error("approveSku [update mec_itm_item_tmp1DAO]: " + logErr(err));
                cb(err, null);
            }
        })
}

//为新添加的商品生成itemcode(在已有的最大itemcode上+1)
var curItemcode=null;
exports.generateItemcode = function (cb) {
    if (!curItemcode) {
        async.waterfall([
                function (cb) {
                    mec_itm_itemDAO.table.max("ITEMCODE", {}).success(function (msg) {
                        myLogger.trace("generateItemcode [mec_itm_itemDAO.table.max]: " + msg);
                        cb(null, msg);
                    }).error(function (err) {
                        cb(err, null);
                    })
                },
                function (x, cb) {
                    mec_itm_item_tmp1DAO.table.max("ITEMCODE", {}).success(function (msg) {
                        myLogger.trace("generateItemcode [mec_itm_item_tmp1DAO.table.max]: " + msg);
                        if (msg > x) cb(null, msg);
                        else cb(null, x);
                    }).error(function (err) {
                        cb(err, null);
                    })
                }
            ],
            function (err, msg) {
                if (!err) {
                    curItemcode = Number(msg) + 1;
                    if(curItemcode<2000000)curItemcode=2000000 //序列器从2000000开始
                    cb(null, curItemcode);
                }
                else {
                    myLogger.error("generateItemcode [waterfall.err]: " + logErr(err));
                    cb(err, null);
                }
            });
    }
    else {
        curItemcode = curItemcode + 1;
        cb(null,curItemcode);
    }
}

//为没有条形码的商品生成条形码
exports.generateBarcode = function (itemcode) {
    var nNum1 = 0;
    var nNum2 = 0;
    var nNum3 = 0;
    //校验位
    var t = 0;
    var TEMPBarcode = "20000" + itemcode;
    for (var i = 0; i < TEMPBarcode.length; i++) {
        if (i % 2 == 0) {
            nNum1 += parseInt(TEMPBarcode[i].toString()); //奇数位
        }
        else {
            nNum2 += parseInt(TEMPBarcode[i].toString()); //偶数位
        }
    }
    nNum3 = nNum1 + nNum2 * 3;
    if (nNum3 % 10 > 0)
        t = 10 - (nNum3 % 10);
    else
        t = 0;

    var BarCode = TEMPBarcode + t.toString();
    return BarCode;
}

//sku商品到柜storeitem
//values结构为:[{ITEMCODE:,COUNTERCODE:,...},{ITEMCODE:,COUNTERCODE:,....},...]
exports.toCounter = function(values,cb){
    sequelize.transaction(function(t){
        async.waterfall([
            function(cb){
                generalDAO.runSql("select max(ID) as MAXID from mec_itm_storeitem where CHAR_LENGTH(ID)=12",t,cb)
            },
            function(x,cb){
                myLogger.trace("toCounter [maxID]: "+JSON.stringify(x));
                if(x&& x.length==1){
                    var maxid=Number(x[0].MAXID);
                    async.forEach(values,function(value,cb){
                        myLogger.trace("toCounter [single toCounter value]: "+JSON.stringify(value));
                        value.CHECKSTATE=1;//oracle原表中该数据为null
                        if(!value.ID && value.ID!=0) value.ID=stringUtil.autoComple(maxid+1,12,'0');
                        var itemcode=value.ITEMCODE;
                        var countercode=value.COUNTERCODE;
                        myLogger.trace("toCounter [itemcode]: "+itemcode);
                        myLogger.trace("toCounter [countercode]: "+countercode);
                        async.parallel([
                            function(cb){//写入storeitem
                                mec_itm_storeitemDAO.add(value,t,cb);
                                //插入storeitem后，触发器会自动生成相应的mec_itm_stock库存记录
                            },
                            function(cb){//更新item表的sellingstate=1(如果原sellingstate=0,并且isconsiderstock=0)
                                mec_itm_itemDAO.update({SELLINGSTATE:1},{ITEMCODE:itemcode,SELLINGSTATE:0,ISCONSIDERSTOCK:0},t,cb);
                            }
                        ],function(err,msg){
                            if(!err){
                                myLogger.trace("toCounter [mec_itm_storeitemDAO.add]: "+ JSON.stringify(msg[0]));
                                myLogger.trace("toCounter [mec_itm_itemDAO.update]: "+ JSON.stringify(msg[1]));
                            }
                            cb(err,msg);
                        })
                    },function(err){
                        cb(err,null);
                    })
                }
                else{
                    cb("unknow maxcode",null);
                }
            }
        ],function(err,msg){
            if(!err){
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("toCounter [async.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    });
}

//商品调价格
exports.adjustPrice = function(itemcode,price,tempprice,cb){
    var value={};
    if(price) value.PRICE=price;
    if(tempprice) value.TEMPPRICE=tempprice;
    var where={ITEMCODE:itemcode};
    mec_itm_itemDAO.update(value,where,function(err,msg){
        if(!err){
            if(msg!=0){
                cb(null,msg);
            }
            else{
                cb("unfound itemcode",null);
            }
        }
        else{
            cb(err,null);
        }
    });
}

//到柜调价格
exports.adjustCounterPrice = function(itemcode,countercode,storecheckedprice,storetempprice,cb){
    var value={};
    if(storecheckedprice) value.STORECHECKEDPRICE=storecheckedprice;
    if(storetempprice) value.STORETEMPPRICE=storecheckedprice;
    var where={ITEMCODE:itemcode,COUNTERCODE:countercode};
    mec_itm_storeitemDAO.update(value,where,function(err,msg){
        if(!err){
            if(msg!=0){
                cb(null,msg);
            }
            else{
                cb("unfound itemcode in the counter",null);
            }
        }
        else{
            cb(err,null);
        }
    });
}

//到柜调促销标志
exports.adjustPromotionMark = function(itemcode,countercode,promotionmark,cb){
    var value={PROMOTIONMARK:promotionmark};
    var where={ITEMCODE:itemcode,COUNTERCODE:countercode};
    mec_itm_storeitemDAO.update(value,where,function(err,msg){
        if(!err){
            if(msg!=0){
                cb(null,msg);
            }
            else{
                cb("unfound itemcode in the counter",null);
            }
        }
        else{
            cb(err,null);
        }
    });
}

//到柜调销售状态
exports.adjustStoreSaleState = function(itemcode,countercode,storesalestate,cb){
    var value={STORESALESTATE:storesalestate};
    var where={ITEMCODE:itemcode,COUNTERCODE:countercode};
    mec_itm_storeitemDAO.update(value,where,function(err,msg){
        if(!err){
            if(msg!=0){
                cb(null,msg);
            }
            else{
                cb("unfound itemcode in the counter",null);
            }
        }
        else{
            cb(err,null);
        }
    });
}

//mis通知mec创建sku TODO 考虑上线信息获取
exports.createSku=function(skuinfo,cb){
    var errList=[];
    var currNum=0;
    var totalNum=skuinfo.length;

    var createSingle=function(sku,cb){
        sku=objectUtil.toUpperCase(sku);
        var itemcode=sku.ITEMCODE;
        var itemid=sku.ITEMID;


        //验证参数合法性
        //调整参数
        if(sku.ISCONSIDERSTOCK==1) sku.SKCCHECKSTATE=1;
        if(sku.ISALLOWONLINE==1) sku.ONLINECHECKSTATE=1;
        if(sku.ISCONSIDERSTOCK==0&&sku.ISALLOWONLINE==0){//不管库存不上线
            SELLINGSTATE=1;
        }
        else if(sku.ISCONSIDERSTOCK==1&&sku.ISALLOWONLINE==0){//管库存不上线
            SELLINGSTATE=2;
        }
        else if(sku.ISCONSIDERSTOCK==0&&sku.ISALLOWONLINE==1){//管库存上线
            SELLINGSTATE=3;
        }


        //写入数据库
        var isconsiderstock=sku.ISCONSIDERSTOCK;
        var isallowonline=sku.ISALLOWONLINE;

        if(isconsiderstock==0){//无skc
            mec_itm_itemDAO.add(sku,function(err,msg){
                if(!err) cb(null,msg);
                else{
                    myLogger.error("createSku [mec_itm_itemDAO.add]: "+logErr(err));
                    cb(sku,null);
                }
            });
        }
        else if(isconsiderstock==1 && isallowonline==0){//有skc
            sequelize.transaction(function(t){
                async.waterfall([
                    function(cb){
                        mec_itm_itemDAO.add(sku,t,cb);
                    },
                    function(x,cb){
                        if(!itemid) cb(null,null);
                        else rdms.getSkc(itemid,cb);
                    },
                    function(x,cb){
                        if(!itemid) cb(null,null);
                        else{
                            x=eval("("+x+")");
                            myLogger.trace("createSku [write skc]: "+JSON.stringify(x));
                            async.forEach(x.rows,function(skc,cb){
                                skc.ITEMCODE=itemcode;
                                skc.SKCCODE=skc.ITEMCODE+skc.SKCCODE;
                                mec_itm_skcDAO.add(skc,t,cb);
                            },cb)
                        }
                    }
                ],function(err,msg){
                    if(!err){
                        t.commit();
                        cb(null,null);
                    }
                    else{
                        t.rollback();
                        myLogger.error("createSku [async.waterfall]: "+logErr(err));
                        cb(sku,null);
                    }
                });
            });
        }
        else{
            sequelize.transaction(function(t){
                async.waterfall([
                    function(cb){
                        mec_itm_itemDAO.add(sku,t,cb);
                    },
                    function(x,cb){
                        rdms.getSkc(itemid,cb);
                    },
                    function(x,cb){
                        x=eval("("+x+")");
                        myLogger.trace("createSku [write skc]: "+JSON.stringify(x));
                        async.forEach(x.rows,function(skc,cb){
                            skc.ITEMCODE=itemcode;
                            skc.SKCCODE=skc.ITEMCODE+skc.SKCCODE;
                            mec_itm_skcDAO.add(skc,t,cb);
                        },cb)
                    }
//                    ,
//                    function(x,cb){
//                        //获取上线信息
//                        cb(null,null);
//                    },
//                    function(x,cb){
//                        //写入上线信息
//                        cb(null,null);
//                    }
                ],function(err,msg){
                    if(!err){
                        t.commit();
                        cb(null,null);
                    }
                    else{
                        t.rollback();
                        myLogger.error("createSku [async.waterfall]: "+logErr(err));
                        cb(sku,null);
                    }
                });
            });
        }
    }

    for(var k=0;k<skuinfo.length;k++){
        createSingle(skuinfo[k],function(err,msg){
            if(err) errList.push(err);
            currNum++;
            if(currNum==totalNum){
                if(errList.length==0){
                    cb(null,"total success");
                }
                else{
                    cb(errList,null);
                }
            }
        })
    }
}

//mis通知mec更新sku  TODO 考虑更新ISCONSIDERSTOCK ISONLINE状态位
exports.updateSku=function(skuinfo,cb){
    var errList=[];
    var currNum=0;
    var totalNum=skuinfo.length;

    var updateSingle=function(sku,cb){
        sku=objectUtil.toUpperCase(sku);
        var itemcode=sku.ITEMCODE;
        var isconsiderstock=sku.ISCONSIDERSTOCK;
        var isallowonline=sku.ISALLOWONLINE;

        //验证参数合法性
        if(!itemcode) cb("unfound itemcode",null);

        //写入数据库
        sequelize.transaction(function(t){
            async.series([
                function(cb){
                    if(isconsiderstock==1||isallowonline==1){
                        mec_itm_itemDAO.queryOne({where:{ITEMCODE:itemcode}},function(err,msg){
                            if(!err){
                                if(msg){
                                    var itemid=msg.ITEMID;
                                    if(Object.keys(sku).indexOf("ITEMCODE")>=0)itemid=sku.ITEMID;

                                    if(!itemid) cb(null,null);
                                    else{
                                        async.parallel([
                                            function(cb){
                                                if(msg.ISCONSIDERSTOCK==0&&isconsiderstock==1){
                                                    //获取并写入skc信息
                                                    async.waterfall([
                                                        function(cb){
                                                            rdms.getSkc(itemid,cb);
                                                        },
                                                        function(x,cb){
                                                            x=eval("("+x+")");
                                                            myLogger.trace("updateSku [write skc]: "+JSON.stringify(x));
                                                            async.forEach(x.rows,function(skc,cb){
                                                                skc.ITEMCODE=itemcode;
                                                                skc.SKCCODE=skc.ITEMCODE+skc.SKCCODE;
                                                                mec_itm_skcDAO.add(skc,t,cb);
                                                            },cb)
                                                        }
                                                    ],cb)
                                                }
                                                else cb(null,null);
                                            },
                                            function(cb){
                                                if(msg.ISALLOWONLINE==0&&isallowonline==1){
                                                    //获取并写入online信息
                                                    cb(null,null);
                                                }
                                                else cb(null,null);
                                            }
                                        ],cb)
                                    }
                                }
                                else{
                                    myLogger.error("updateSku [mec_itm_itemDAO.queryOne]: unfound this item "+itemcode);
                                }
                            }
                            else{
                                myLogger.error("updateSku [mec_itm_itemDAO.queryOne]: "+logErr(err));
                            }
                        })
                    }
                    else{
                        cb(null,null);
                    }
                },
                function(cb){
                    mec_itm_itemDAO.update(sku,{ITEMCODE:itemcode},t,function(err,msg){
                        if(!err) cb(null,msg);
                        else{
                            myLogger.error("updateSku [mec_itm_itemDAO.update]: "+logErr(err));
                            cb(err,null);
                        }
                    });
                }
            ],function(err,msg){
                if(!err){
                    t.commit();
                    cb(null,msg);
                }
                else{
                    t.rollback();
                    myLogger.error("updateSku [async.series]: "+logErr(err));
                    cb(sku,null);
                }
            })
        })

    }

    for(var k=0;k<skuinfo.length;k++){
        updateSingle(skuinfo[k],function(err,msg){
            if(err) errList.push(err);
            currNum++;
            if(currNum==totalNum){
                if(errList.length==0){
                    cb(null,"total success");
                }
                else{
                    cb(errList,null);
                }
            }
        })
    }
}

