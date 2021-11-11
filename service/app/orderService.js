/**
 * Created by lucywu on 14-7-19.
 * 营业员开单与接单与已处理订单管理
 */
var myLogger = require('../../logging/contextLogger')("app/orderService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var codeCursors = require('../../global/codeCursors');
var stringUtil = require('../../util/stringUtil');
var mec_itm_itemDAO = require('../../dao/mec_itm_itemDAO');
var mec_itm_skcDAO = require('../../dao/mec_itm_skcDAO');
var promotionService = require('./promotionService');
var mec_ctm_siteDAO = require('../../dao/mec_ctm_siteDAO');
var mec_buy_onlineorderDAO = require('../../dao/mec_buy_onlineorderDAO');
var mec_itm_stockDAO = require('../../dao/mec_itm_stockDAO');
var mec_buy_onlinecontentDAO = require('../../dao/mec_buy_onlinecontentDAO');
var mec_buy_offlineorderDAO = require('../../dao/mec_buy_offlineorderDAO');
var mec_buy_offlinecontentDAO = require('../../dao/mec_buy_offlinecontentDAO');
var mec_vi_online_skc_stockDAO = require('../../dao/mec_vi_online_skc_stockDAO');
var mec_vi_online_dept_skc_stockDAO = require('../../dao/mec_vi_online_dept_skc_stockDAO');
var mec_vi_online_counter_skc_stockDAO = require('../../dao/mec_vi_online_counter_skc_stockDAO');
var mec_vi_online_counter_dept_skc_stockDAO = require('../../dao/mec_vi_online_counter_dept_skc_stockDAO');
var mec_vi_offline_order_totalDAO = require('../../dao/mec_vi_offline_order_totalDAO');
var mec_vi_offline_content_totalDAO = require('../../dao/mec_vi_offline_content_totalDAO');
var mec_vi_online_order_total_forcustomerDAO = require('../../dao/mec_vi_online_order_total_forcustomerDAO');
var mec_vi_online_content_total_forcustomerDAO = require('../../dao/mec_vi_online_content_total_forcustomerDAO');
var businessSetting = require('../../global/businessSetting');
var dateUtil=require("../../util/dateUtil");
var objectUtil=require("../../util/objectUtil");
var masterConfig=require("../../config/masterConfig");
var httpsRequest = require('../../util/httpsRequest');

/**
 * 顾客开线上订单
 * orderinfo: usercode,paymentmode,deliverymode,siteid(配送-必须有),deliverydeptcode(自提-必须有)
 * contentinfo: skc-num的数组
 * orderinfo内程序生成信息: deliverydeptcode(配送时),finalprice,finalrulestring,ordercode
 * contentinfo内程序生成信息: countercode,finalpricelist,finalrulelist,ordercode,contentcode
 */
exports.placeOnlineOrder = function (orderinfo, contentinfo, cb) {
    //检查usercode,paymentmode,deliverymode不准为空,配送时地址不允许为空,自提时deliverydeptcode不许为空
    if (!orderinfo.USERCODE) {
        myLogger.error("placeOnlineOrder [Check Params]: unfound usercode");
        cb("unfound usercode", null);
        return;
    }
    if (!orderinfo.PAYMENTMODE && orderinfo.PAYMENTMODE!=0) {
        myLogger.error("placeOnlineOrder [Check Params]: unfound paymentmode");
        cb("unfound paymentmode", null);
        return;
    }
    if (!orderinfo.DELIVERYMODE && orderinfo.DELIVERYMODE!=0) {
        myLogger.error("placeOnlineOrder [Check Params]: unfound deliverymode");
        cb("unfound deliverymode", null);
        return;
    }
    if(orderinfo.DELIVERYMODE==1 && !orderinfo.SITEID && orderinfo.SITEID!=0){
        myLogger.error("placeOnlineOrder [Check Params]: unfound logistics siteinfo");
        cb("unfound logistics siteinfo",null);
        return;
    }
    if(orderinfo.DELIVERYMODE==0 && !orderinfo["DELIVERYDEPTCODE"]){
        myLogger.error("placeOnlineOrder [Check Params]: unfound pick deptcode");
        cb("unfound pick deptcode",null);
        return;
    }

    async.series([
        function(cb){
            //如果是配送,根据订单明细分配发货门店
            if(orderinfo.DELIVERYMODE==1){
                exports.allocateDept(contentinfo,function(err,msg){
                    if(!err){
                        orderinfo.DELIVERYDEPTCODE=msg;
                        cb(null,orderinfo.DELIVERYDEPTCODE);
                    }
                    else{
                        cb(err,null);
                    }
                });
            }
            else{
                cb(null,orderinfo.DELIVERYDEPTCODE);
            }
        },
        function(cb){
            //根据发货或自提的门店进而分配订单明细到每个柜
            exports.allocateCounter(orderinfo.DELIVERYDEPTCODE,contentinfo,function(err,msg){
                if(!err){ //将content分配到每个counter,更新contentinfo内容
                    contentinfo=msg;
                    cb(null,contentinfo);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            //content中包含的是skccode,获取其itemcode添加到contentinfo中
            async.forEach(contentinfo,function(content,cb){
                async.series([
                    function(cb){
                        if(!content.ITEMCODE && content.SKCCODE){
                            mec_itm_skcDAO.queryOne({attributes:["ITEMCODE"],where:{SKCCODE:content.SKCCODE}},function(err,msg){
                                if(!err){
                                    if(msg){
                                        content["ITEMCODE"]=msg.ITEMCODE;
                                        cb(null,msg);
                                    }
                                    else{
                                        cb("unexist skccode in contentinfo",null);
                                    }
                                }
                                else{
                                    cb(err,msg);
                                }
                            })
                        }
                        else if(content.ITEMCODE){
                            cb(null,content.ITEMCODE);
                        }
                        else{
                            cb("illegal contentinfo",null);
                        }
                    },
                    function(cb){
                        mec_itm_itemDAO.queryOne({attributes:["TEMPPRICE"],where:{ITEMCODE:content.ITEMCODE}},function(err,msg){
                            if(!err){
                                if(msg){
                                    content["UNITPRICE"]=msg.TEMPPRICE;
                                    cb(null,msg);
                                }
                                else{
                                    cb("illegal itemcode in contentinfo",null);
                                }
                            }
                            else{
                                cb(err,msg);
                            }
                        });
                    }
                ],cb);
            },function(err){
                if(!err) myLogger.trace("placeOnlineOrder [contentinfo]: "+JSON.stringify(contentinfo));
                else myLogger.error("placeOnlineOrder [mec_itm_skcDAO.queryOne]: "+logErr(err));
                cb(err,null);
            })
        },
        function(cb){
            //过促销引擎,将促销引擎结果放到orderinfo和contentinfo中
            promotionService.process(true,contentinfo,function(err,msg){
                myLogger.trace("placeOnlineOrder [promotionService.process]: "+JSON.stringify(msg));
                if(!err){
                    var finalprice=0;
                    var finalrulestring={};
                    for(var k=0;k<msg.length;k++){
                        var finalpricelist=msg[k].FINALPRICELIST;
                        var finalrulelist=msg[k].FINALRULELIST;
                        contentinfo[k].FINALPRICELIST=JSON.stringify(finalpricelist);
                        contentinfo[k].FINALRULELIST=JSON.stringify(finalrulelist);
                        //计算最终总价
                        for(var i=0;i<finalpricelist.length;i++){
                            var _price=finalpricelist[i].PRICE;
                            var _num=finalpricelist[i].NUM;
                            finalprice+=_price*_num;
                        }
                        //构建finalrulestring
                        var itemcode=contentinfo[k].ITEMCODE;
                        for(var j=0;j<finalrulelist.length;j++){
                            var _rule=finalrulelist[j]["RULE"];
                            var _num=finalrulelist[j].NUM;
                            if(!finalrulestring[_rule]) finalrulestring[_rule]={};
                            if(!finalrulestring[_rule][itemcode]) finalrulestring[_rule][itemcode]=0;
                            finalrulestring[_rule][itemcode]=finalrulestring[_rule][itemcode]+_num;
                        }
                    }
                    orderinfo.FINALPRICE=finalprice;
                    orderinfo.FINALRULESTRING=JSON.stringify(finalrulestring);
                    myLogger.trace("placeOnlineOrder [finalprice]: "+finalprice);
                    myLogger.trace("placeOnlineOrder [finalrulestring]"+JSON.stringify(finalrulestring));
                    cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            });
        },
        function(cb){
            //生成订单编码,放入到orderinfo和contentinfo中,并为contentinfo生成contentcode
            exports.generateOrderCode(true,false,function(err,ordercode){
                myLogger.trace("placeOnlineOrder [generateOrderCode.ordercode]: "+ordercode);
                if(!err){
                    orderinfo.ONLINEORDERCODE=ordercode;
                    for(var k=0;k<contentinfo.length;k++){
                        contentinfo[k].ONLINEORDERCODE=ordercode;
                        contentinfo[k].ONLINECONTENTCODE=exports.generateContentCode(ordercode,k+1);
                    }
                    cb(null,ordercode);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            //数据库操依次插入orderinfo,contentinfo
            sequelize.transaction(function(t){
                async.series([
                    function(cb){
                        //写入订单信息
                        myLogger.trace("placeOnlineOrder [orderinfo]: "+JSON.stringify(orderinfo));
                        mec_buy_onlineorderDAO.add(orderinfo,t,cb);
                    },
                    function(cb){
                        //写入订单明细信息
                        async.forEach(contentinfo,function(content,cb){
                            async.waterfall([
                                //TODO 库存处理测试
                                function(cb){//查询库存
                                    if(!content.SKCCODE) cb(null,null);
                                    var sql="select * from mec_itm_stock where SKCCODE='?1' and COUNTERCODE='?2' for UPDATE";
                                    sql=sql.replace("?1",content.SKCCODE);
                                    sql=sql.replace("?2",content.COUNTERCODE);
                                    generalDAO.runSql(sql,t,function(err,msg){
                                        if(err){
                                            cb(err,null);
                                        }
                                        else if(!msg || msg.length==0 ||msg.length>1){
                                            cb("unfound counter's skc: "+content.COUNTERCODE+"-"+content.SKCCODE,null);
                                        }
                                        else{
                                            var AMOUNT=msg[0].AMOUNT;
                                            var ISALLOWNEGATIVE=msg[0].ISALLOWNEGATIVE;
                                            var BUFFER=msg[0].BUFFER;

                                            if(AMOUNT>=content.NUM){
                                                cb(null,AMOUNT-content.NUM);
                                            }
                                            else{
                                                if(ISALLOWNEGATIVE==0){
                                                    cb("negative stock error: "+content.COUNTERCODE+"-"+content.SKCCODE+"-"+content.NUM,null);
                                                }
                                                else{
                                                    if(AMOUNT+BUFFER>=content.NUM){
                                                        cb(null,AMOUNT-content.NUM);
                                                    }
                                                    else{
                                                        cb("negative stock buffer overflow: "+content.COUNTERCODE+"-"+content.SKCCODE+"-"+content.NUM,null);
                                                    }
                                                }
                                            }
                                        }
                                    })
                                },
                                function(x,cb){//更新库存
                                    if(!x) cb(null,null);
                                    mec_itm_stockDAO.update({AMOUNT:x},{COUNTERCODE:content.COUNTERCODE,SKCCODE:content.SKCCODE},t,cb);
                                },
                                function(x,cb){//插入订单明细
                                    mec_buy_onlinecontentDAO.add(content,t,cb);
                                }
                            ],cb)
                        },function(err){
                            cb(err,null);
                        })
                    }
                ],function(err,msg){
                    if(!err) {
                        myLogger.trace("placeOnlineOrder [mec_buy_onlineorderDAO.add]: "+JSON.stringify(msg[0]));
                        myLogger.trace("placeOnlineOrder [mec_buy_onlinecontentDAO.add]: "+JSON.stringify(msg[1]));
                        t.commit();
                        cb(null,msg);
                    }
                    else {
                        myLogger.trace("placeOnlineOrder [series.err]: "+logErr(err));
                        t.rollback();
                        cb(err,null);
                    }
                });
            });
        }
    ],cb);
}

//获取线下(待支付的订单)
exports.getOfflineOrderUnpay = function (usercode, qry, options, cb) {
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx ||
            "concat(" +
            "left(COALESCE(OFFLINEGROUPCODE, concat(offlineordercode,'**')),7)," +
            "right(COALESCE(OFFLINEGROUPCODE, concat(offlineordercode,'**')),6)" +
            ") desc, TIME ";
        var sord = options.sord || "desc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry && qry!=0) {
            var where={USERCODE:usercode,ORDERSTATE:0};
            mec_vi_offline_order_totalDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderUnpay [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderUnpay [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.USERCODE=usercode;
            qry.ORDERSTATE=0;
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderUnpay [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderUnpay [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "FINALPRICE"
            ];
            var reg = new RegExp(/^[\x00-\xff]+$/);
            if (reg.test(qry)) qryFields.push("createdAt"); //时间字段的like查询不允许有中文
            //构造查询条件
            var qryOptions = {};
            qryOptions[qryFields[0]] = {like: qry + "%"};
            for (var k = 1; k < qryFields.length; k++) {
                var tmp = {};
                tmp[qryFields[k]] = {like: qry + "%"};
                qryOptions = sequelize.or(qryOptions, tmp);
            }
            qryOptions=sequelize.and(qryOptions,{USERCODE:usercode,ORDERSTATE:0});
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderUnpay [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderUnpay [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    })
}

//获取线上(待支付)
exports.getOnlineOrderUnpay = function (usercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx || "TIME";
        var sord = options.sord || "desc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            //订单状态为1,刚下订单,支付模式为现付或网付
            var where={USERCODE:usercode,ORDERSTATE:1,PAYMENTMODE:{between:[0,1]}};
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnpay [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnpay [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.USERCODE=usercode;
            qry.ORDERSTATE=1;
            qry.PAYMENTMODE={between:[0,1]};
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnpay [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnpay [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE"
            ];
            var reg = new RegExp(/^[\x00-\xff]+$/);
            if (reg.test(qry)) qryFields.push("TIME"); //时间字段的like查询不允许有中文
            //构造查询条件
            var qryOptions = {};
            qryOptions[qryFields[0]] = {like: qry + "%"};
            for (var k = 1; k < qryFields.length; k++) {
                var tmp = {};
                tmp[qryFields[k]] = {like: qry + "%"};
                qryOptions = sequelize.or(qryOptions, tmp);
            }
            qryOptions=sequelize.and(qryOptions,{USERCODE:usercode,ORDERSTATE:1,PAYMENTMODE:{between:[0,1]}});
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnpay [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnpay [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    })
}

//获取线下(待收货者待自提的)
exports.getOfflineOrderUnconfirm = function (usercode, qry, options, cb) {
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx ||
            "concat(" +
            "left(COALESCE(OFFLINEGROUPCODE, concat(offlineordercode,'**')),7)," +
            "right(COALESCE(OFFLINEGROUPCODE, concat(offlineordercode,'**')),6)" +
            ") desc, TIME ";
        var sord = options.sord || "desc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={USERCODE:usercode,ORDERSTATE:{between:[4,6]}};
            mec_vi_offline_order_totalDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderUnconfirm [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderUnconfirm [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.USERCODE=usercode;
            qry.ORDERSTATE={between:[4,6]};
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderUnconfirm [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderUnconfirm [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "FINALPRICE"
            ];
            var reg = new RegExp(/^[\x00-\xff]+$/);
            if (reg.test(qry)) qryFields.push("createdAt"); //时间字段的like查询不允许有中文
            //构造查询条件
            var qryOptions = {};
            qryOptions[qryFields[0]] = {like: qry + "%"};
            for (var k = 1; k < qryFields.length; k++) {
                var tmp = {};
                tmp[qryFields[k]] = {like: qry + "%"};
                qryOptions = sequelize.or(qryOptions, tmp);
            }
            qryOptions=sequelize.and(qryOptions,{USERCODE:usercode,ORDERSTATE:{between:[4,6]}});
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderUnconfirm [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderUnconfirm [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    })
}

//获取线上((待收货物者待自提的)
exports.getOnlineOrderUnconfirm = function (usercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx || "TIME";
        var sord = options.sord || "desc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            //订单状态为1,刚下订单,支付模式为现付或网付
            var where={USERCODE:usercode,ORDERSTATE:{between:[2,7]}};
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnconfirm [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnconfirm [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.USERCODE=usercode;
            qry.ORDERSTATE={between:[2,7]};
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnconfirm [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnconfirm [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE"
            ];
            var reg = new RegExp(/^[\x00-\xff]+$/);
            if (reg.test(qry)) qryFields.push("TIME"); //时间字段的like查询不允许有中文
            //构造查询条件
            var qryOptions = {};
            qryOptions[qryFields[0]] = {like: qry + "%"};
            for (var k = 1; k < qryFields.length; k++) {
                var tmp = {};
                tmp[qryFields[k]] = {like: qry + "%"};
                qryOptions = sequelize.or(qryOptions, tmp);
            }
            qryOptions=sequelize.and(qryOptions,{USERCODE:usercode,ORDERSTATE:{between:[2,7]}});
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnconfirm [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnconfirm [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    })
}

//获取全部线下订单
exports.getOfflineOrder = function (usercode, qry, options, cb) {
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx ||
            "concat(" +
            "left(COALESCE(OFFLINEGROUPCODE, concat(offlineordercode,'**')),7)," +
            "right(COALESCE(OFFLINEGROUPCODE, concat(offlineordercode,'**')),6)" +
            ") desc, TIME ";
        var sord = options.sord || "desc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={USERCODE:usercode};
            mec_vi_offline_order_totalDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrder [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrder [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.USERCODE=usercode;
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrder [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrder [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "FINALPRICE"
            ];
            var reg = new RegExp(/^[\x00-\xff]+$/);
            if (reg.test(qry)) qryFields.push("createdAt"); //时间字段的like查询不允许有中文
            //构造查询条件
            var qryOptions = {};
            qryOptions[qryFields[0]] = {like: qry + "%"};
            for (var k = 1; k < qryFields.length; k++) {
                var tmp = {};
                tmp[qryFields[k]] = {like: qry + "%"};
                qryOptions = sequelize.or(qryOptions, tmp);
            }
            qryOptions=sequelize.and(qryOptions,{USERCODE:usercode});
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrder [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrder [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    })
}

//获取全部线上订单
exports.getOnlineOrder = function (usercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx || "TIME";
        var sord = options.sord || "desc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            //订单状态为1,刚下订单,支付模式为现付或网付
            var where={USERCODE:usercode};
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrder [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrder [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.USERCODE=usercode;
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrder [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrder [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE"
            ];
            var reg = new RegExp(/^[\x00-\xff]+$/);
            if (reg.test(qry)) qryFields.push("TIME"); //时间字段的like查询不允许有中文
            //构造查询条件
            var qryOptions = {};
            qryOptions[qryFields[0]] = {like: qry + "%"};
            for (var k = 1; k < qryFields.length; k++) {
                var tmp = {};
                tmp[qryFields[k]] = {like: qry + "%"};
                qryOptions = sequelize.or(qryOptions, tmp);
            }
            qryOptions=sequelize.and(qryOptions,{USERCODE:usercode});
            mec_vi_online_order_total_forcustomerDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrder [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrder [mec_vi_online_order_total_forcustomerDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    })
}

//获取线下订单的商品
exports.getOfflineContentByOrder = function (ordercode, cb) {
    mec_vi_offline_content_totalDAO.queryAll({where:{OFFLINEORDERCODE:ordercode}},cb);
}

//获取线上订单的商品
exports.getOnlineContentByOrder = function (ordercode, cb) {
    mec_vi_online_content_total_forcustomerDAO.queryAll({where:{ONLINEORDERCODE:ordercode}},cb);
}

//线下订单拒绝
exports.cancelOfflineOrder = function (ordercode, cb) {
    mec_buy_offlineorderDAO.update({ORDERSTATE:10},{OFFLINEORDERCODE:ordercode,ORDERSTATE:0},cb);
}

//线上订单拒绝
exports.cancelOnlineOrder = function (ordercode, cb) {
    mec_buy_onlineorderDAO.update({ORDERSTATE:10},{ONLINEORDERCODE:ordercode,ORDERSTATE:1},cb);
}

//线下订单确认收获
exports.confirmOfflineOrder = function (ordercode, cb) {
    mec_buy_offlineorderDAO.update({ORDERSTATE:8},{OFFLINEORDERCODE:ordercode,ORDERSTATE:6},cb);
}

//线上订单确认收获
exports.confirmOnlineOrder = function (ordercode, cb) {
    mec_buy_onlineorderDAO.update({ORDERSTATE:8},{ONLINEORDERCODE:ordercode,ORDERSTATE:6},cb);
}

//生成订单编码(本地cache)
exports.generateOrderCode = function (isonline,isreturn,cb) {
    var ordercode = "0";
    if(isonline && !isreturn) ordercode="1";
    if(!isonline && isreturn) ordercode="2";
    if(isonline && isreturn) ordercode="3";

    var date = new Date();
    var month = stringUtil.autoComple(date.getMonth()+1,2,'0');
    var year = date.getFullYear().toString().substr(2, 2);
    var day = stringUtil.autoComple(date.getDate(), 2, '0');
    var dateStr = year + month + day;
    ordercode += dateStr;
    var randomNumber = Math.floor(Math.random() * 100000);
    ordercode += stringUtil.autoComple(randomNumber, 5, '0');

    if (codeCursors.curOrderDateStr == null || codeCursors.curOrderDailyNum == null) {
        var sql = "select max(DAILYNUM) as MAXDAILYNUM  "+
            "FROM ( "+
            "select right(ONLINEORDERCODE,5) as DAILYNUM from mec_buy_onlineorder where (ONLINEORDERCODE like '1"+dateStr+"%' or ONLINEORDERCODE like '3"+dateStr+"%') and left(right(ONLINEORDERCODE,6),1)='"+codeCursors.machine_code+"' "+
            "union "+
            "select right(OFFLINEORDERCODE,5) as DAILYNUM from mec_buy_offlineorder where (OFFLINEORDERCODE like '0"+dateStr+"%' or OFFLINEORDERCODE like '2"+dateStr+"%') and left(right(OFFLINEORDERCODE,6),1)='"+codeCursors.machine_code+"' "+
            ") as t";
        generalDAO.runSql(sql,function(err,msg){
            if(!err){
                if(msg&&msg.length==1){
                    var maxDailyNum=msg[0]["MAXDAILYNUM"];
                    //重新检查是否为空,防止其他异步请求是\重复执行该操作(!!!必须的!!!)
                    if (codeCursors.curOrderDateStr == null || codeCursors.curOrderDailyNum == null) {
                        codeCursors.curOrderDateStr = dateStr;
                        codeCursors.curOrderDailyNum = Number(maxDailyNum);
                    }
                }
                else{
                    //重新检查是否为空,防止其他异步请求是\重复执行该操作(!!!必须的!!!)
                    if (codeCursors.curOrderDateStr == null || codeCursors.curOrderDailyNum == null) {
                        codeCursors.curOrderDateStr = dateStr;
                        codeCursors.curOrderDailyNum = 0;
                    }
                }
                codeCursors.curOrderDailyNum++;
//                ordercode += stringUtil.autoComple(codeCursors.curOrderDailyNum, 6, '0');
                ordercode += codeCursors.machine_code+stringUtil.autoComple(codeCursors.curOrderDailyNum, 5, '0');
                myLogger.trace("generateOrderCode [ordercode]: "+ordercode);
                cb(null,ordercode);
            }
            else{
                cb(err,null);
            }
        });
    }
    else{
        //第二天,订单数从0计算起来
        if (dateStr != codeCursors.curOrderDateStr) {
            codeCursors.curOrderDateStr = dateStr;
            codeCursors.curOrderDailyNum = 0;
        }
        codeCursors.curOrderDailyNum++;
        ordercode += codeCursors.machine_code+stringUtil.autoComple(codeCursors.curOrderDailyNum, 5, '0');
        cb(null,ordercode);
    }
}

//生成订单明细编码
exports.generateContentCode = function (ordercode, i) {
    var contentcode = ordercode ;
	//+ stringUtil.autoComple((Math.floor(Math.random() * 100000)), 5, '0');
    contentcode += stringUtil.autoComple(i, 3,'0');
    return contentcode;
}

//将配送订单分配到门店
//contents结构为[{SKCCODE:?,NUM:?},{SKCCODE:?,NUM:?},{SKCCODE:?,NUM:?}]
exports.allocateDept = function (contents, cb) {
    var skccodes = [];
    for (var k = 0; k < contents.length; k++) {
        skccodes.push(contents[k].SKCCODE);
    }
    mec_vi_online_dept_skc_stockDAO.queryAll({where: {SKCCODE: {in: skccodes}}}, function (err,msg) {
        myLogger.trace("allocateDept [mec_vi_online_dept_skc_stockDAO.queryAll]: "+JSON.stringify(msg&&msg.length));
        if(!err){
            var costMap = {};
            for (var i = 0; i < msg.length; i++) {
                for (var j = 0; j < contents.length; j++) {
                    if (msg[i].SKCCODE = contents[j].SKCCODE) {
                        //计算单个skc的开销
                        var dept = msg[i].DEPTCODE;
                        var cost = 0;
                        if (msg[i].AMOUNT < contents[j].NUM) cost = contents[j].NUM - msg[i].AMOUNT;

                        if (!costMap[dept]) {
                            costMap[dept] = 0;
                        }
                        costMap[dept] += cost;
                    }
                }
            }
            myLogger.trace("allocateDept [costMap]: "+JSON.stringify(costMap));
            var keys = Object.keys(costMap);
            var deptcode = keys[0];
            for (var k = 1; k < keys.length; k++) {
                if (costMap[keys[k]] < costMap[deptcode]) deptcode = keys[k];
            }
            cb(null,deptcode);
        }
        else{
            cb(err,null);
        }
    });
}

//为全部订单明细contents分配counter
exports.allocateCounter = function (deptcode, contents, cb) {
    var skccodes = [];
    var orgMap = {};
    for (var k = 0; k < contents.length; k++) {
        skccodes.push(contents[k].SKCCODE);
        orgMap[contents[k].SKCCODE] = contents[k].NUM;
    }

    mec_vi_online_counter_dept_skc_stockDAO.queryAll({where:{SKCCODE: {in: skccodes}}}, function(err,msg) {
        myLogger.trace("allocateCounter [mec_vi_online_counter_dept_skc_stockDAO.queryAll]: "+JSON.stringify(msg&&msg.length));
        if(!err){
            var newMap = {};
            for (var k = 0; k < msg.length; k++) {
                if (!newMap[msg[k].SKCCODE]) newMap[msg[k].SKCCODE] = [];
                newMap[msg[k].SKCCODE].push(msg[k]);
            }
            myLogger.trace("allocateCounter [orgMap]: "+JSON.stringify(orgMap));
            myLogger.trace("allocateCounter [newMap]: "+JSON.stringify(newMap));

            //排序任意一个skccode对应的deptcode,如果可以满足skc数目优先考虑所选deptcode,如果不能满足按库存量从大到小排列
            for (var k = 0; k < Object.keys(newMap).length; k++) {
                //计算dept的库存和,对dept优先级排序
                var arr = newMap[Object.keys(newMap)[k]];
                var deptSum = {};
                for (var i = 0; i < arr.length; i++) {
                    if (!deptSum[arr[i].DEPTCODE]) deptSum[arr[i].DEPTCODE] = 0;
                    deptSum[arr[i].DEPTCODE] += arr[i].AMOUNT;
                }
                myLogger.trace("allocateCounter [deptSum]: "+JSON.stringify(deptSum));
                var sortedDept = [];
                //优先考虑本门店的柜
                sortedDept.push(deptcode);
                delete deptSum[deptcode];
                while (Object.keys(deptSum).length != 0) {
                    var curDept = Object.keys(deptSum)[0];
                    for (var j = 1; j < Object.keys(deptSum).length; j++) {
                        if (deptSum[curDept] < deptSum[Object.keys(deptSum)[j]]) {
                            curDept = Object.keys(deptSum)[j];
                        }
                    }
                    sortedDept.push(curDept);
                    delete deptSum[curDept];
                }
                myLogger.trace("allocateCounter [sortedDept]: "+JSON.stringify(sortedDept));

                //排序newMap中每个skccode对应数组内的优先级,首先考虑deptcode优先级,其次考虑amount
                var by = function (sortedDept) {
                    return function (o, p) {
                        var a, b, c, d;
                        if (typeof o === "object" && typeof p === "object" && o && p) {
                            a = sortedDept.indexOf(o["DEPTCODE"]);
                            b = sortedDept.indexOf(p["DEPTCODE"]);
                            c = o["AMOUNT"];
                            d = p["AMOUNT"];
//                        console.log("#####"+a+"#####"+b);
                            if (a === b && c === d) {
                                return 0;
                            }

                            if (a < b) {
                                return -1;
                            }
                            else if (a > b) {
                                return 1;
                            }
                            else {
                                if (c > d)  return -1;
                                else return 1;

                            }
                        }
                        else {
                            throw ("error");
                        }
                    }
                }
                newMap[Object.keys(newMap)[k]].sort(by(sortedDept));

                //将newMap中的库存数量,转化为订单的切分量
                var list = newMap[Object.keys(newMap)[k]];
                var num = orgMap[Object.keys(newMap)[k]];
                for (var n = 0; n < list.length; n++) {
                    if (list[n].AMOUNT >= num) {
                        list[n].DELTA = num;
                        num = 0;
                        break;
                    }
                    else {
                        list[n].DELTA = list[n].AMOUNT;
                        num = num - list[n].AMOUNT;
                    }
                }
                if (num > 0) {
                    cb("库存不足",null);
                    return;
                }
            }

            var resultArr = [];
            for (var k = 0; k < Object.keys(newMap).length; k++) {
                var tmpArr=newMap[Object.keys(newMap)[k]];
                for(var n=0;n<tmpArr.length;n++){
                    if(tmpArr[n].DELTA){
                        var obj={};
                        obj.DEPTCODE=tmpArr[n].DEPTCODE;
                        obj.SKCCODE=tmpArr[n].SKCCODE;
                        obj.COUNTERCODE=tmpArr[n].COUNTERCODE;
                        obj.NUM=tmpArr[n].DELTA;
                        resultArr.push(obj);
                    }
                }
            }
            cb(null,resultArr);
        }
        else{
            cb(err,null);
        }
    })
};

//拼单过促销引擎获取总价
exports.getGroupTotalPrice = function(offlineordercodes,cb){
    if(offlineordercodes.length>1){
        async.waterfall([
            function(cb){
                //查询订单对应的countercode
                var attributes=["OFFLINEORDERCODE","COUNTERCODE"];
                var where={OFFLINEORDERCODE:{in:offlineordercodes}};
                mec_buy_offlineorderDAO.queryAll({attributes:attributes,where:where},cb);
            },
            function(x,cb){
                //查询订单明细
                var attributes=["OFFLINEORDERCODE","ITEMCODE","NUM"];
                var where={OFFLINEORDERCODE:{in:offlineordercodes}};
                mec_buy_offlinecontentDAO.queryAll({attributes:attributes,where:where},function(err,contents){
                    if(!err){
                        //将上一步等到的countercode加入到查询结果中
                        for(var k=0;k<contents.length;k++){
                            var content=contents[k];
                            for(var n=0;n< x.length;n++){
                                if(content.OFFLINEORDERCODE==x[n].OFFLINEORDERCODE){
                                    content.COUNTERCODE=x[n].COUNTERCODE;
                                    break;
                                }
                            }
                        }
                        cb(null,contents);
                    }
                    else{
                        cb(err,null);
                    }
                });
            },
            function(x,cb){
                myLogger.trace("getGroupTotalPrice [mec_buy_offlinecontentDAO.queryAll]: "+JSON.stringify(x));
                promotionService.process(false,x,cb);
            },
            function(x,cb){
                myLogger.trace("getGroupTotalPrice [promotionService.process]: "+JSON.stringify(x));
                var sumPrice=0;
                for(var k=0;k<x.length;k++){
                    var finalpricelist=x[k].FINALPRICELIST;
                    for(var i=0;i<finalpricelist.length;i++){
                        var _price=finalpricelist[i].PRICE;
                        var _num=finalpricelist[i].NUM;
                        sumPrice+=_price*_num;
                    }
                }
                myLogger.trace("getGroupTotalPrice [sumPrice]: "+sumPrice);
                cb(null,sumPrice);
            }
        ],function(err,msg){
            if(!err){
                cb(null,msg);
            }
            else{
                myLogger.error("getGroupTotalPrice [waterfall.err]: "+logErr(err));
                cb(err,null);
            }
        })
    }
    else if(offlineordercodes.length==1){
        var offlineordercode=offlineordercodes[0];
        mec_buy_offlineorderDAO.queryOne({attributes:["FINALPRICE"],where:{OFFLINEORDERCODE:offlineordercode}},function(err,msg){
            if(!err){
                if(msg){
                    myLogger.trace("getGroupTotalPrice [FINALPRICE]: "+msg.FINALPRICE);
                    cb(null,msg.FINALPRICE);
                }
                else{
                    cb("unknown offlineordercode",null);
                }
            }
            else{
                cb(err,null);
            }
        })
    }
    else{
        cb(null,0);
    }
}

//更新过期线下订单
exports.updateOfflineOrderOverdue=function(cb){
    async.parallel([
        function(cb){
            mec_buy_offlineorderDAO.update({ORDERSTATE:11},{
                ORDERSTATE:0,
                createdAt:{
                    lt: dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime})
                }
            },cb);
        },
        function(cb){
            mec_buy_offlineorderDAO.update({ORDERSTATE:102},{
                ORDERSTATE:100,
                createdAt:{
                    lt: dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime})
                }
            },cb);
        }
    ],cb)
}

//更新过期线上订单
exports.updateOnlineOrderOverdue=function(cb){
    async.parallel([
        function(cb){
            mec_buy_onlineorderDAO.update({ORDERSTATE:11},{
                ORDERSTATE:1,
                createdAt:{
                    lt: dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime})
                }
            },cb);
        },
        function(cb){
            mec_buy_onlineorderDAO.update({ORDERSTATE:102},{
                ORDERSTATE:100,
                createdAt:{
                    lt: dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime})
                }
            },cb);
        }
    ],cb);
}