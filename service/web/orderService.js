/**
 * Created by lucywu on 14-7-19.
 * 营业员开单与接单与已处理订单管理
 **********************************************************
 0-线下开出订单
 1-线上开出订单
 2-线上支付完成
 3-线上支付后营业员确认
 4-线下支付完成
 5-内部物流完成待发货
 6-已发货
 7-内部物流完成待自提
 8-交易完成
 9-营业员取消订单
 10-顾客取消订单
 11-超时未支付
 12-营业员拒绝接单
 100-退货中
 101-退货成功
 102-退货取消
 ***********************************************************
 */
var myLogger = require('../../logging/contextLogger')("web/orderService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var node_env = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var masterConfig = require('../../config/masterConfig')[node_env];
var httpsRequest = require('../../util/httpsRequest');
var generalDAO = require("../../dao/generalDAO");
var codeCursors = require('../../global/codeCursors');
var stringUtil = require('../../util/stringUtil');
var businessSetting = require('../../global/businessSetting');
var mec_ctm_customerDAO = require('../../dao/mec_ctm_customerDAO');
var mec_itm_skcDAO = require('../../dao/mec_itm_skcDAO');
var mec_itm_itemDAO = require('../../dao/mec_itm_itemDAO');
var mec_itm_storeitemDAO = require('../../dao/mec_itm_storeitemDAO');
var mec_vi_counter_skc_stockDAO = require('../../dao/mec_vi_counter_skc_stockDAO');
var hct_brandDAO = require('../../dao/hct_brandDAO');
var promotionService = require('./promotionService');
var mec_hct_counterDAO = require('../../dao/mec_hct_counterDAO');
var mec_buy_offlineorderDAO = require('../../dao/mec_buy_offlineorderDAO');
var mec_itm_stockDAO = require('../../dao/mec_itm_stockDAO');
var mec_buy_offlinecontentDAO = require('../../dao/mec_buy_offlinecontentDAO');
var mec_buy_onlineorderDAO = require('../../dao/mec_buy_onlineorderDAO');
var mec_buy_onlinecontentDAO = require('../../dao/mec_buy_onlinecontentDAO');
var mec_vi_offline_order_totalDAO = require('../../dao/mec_vi_offline_order_totalDAO');
var mec_vi_offline_content_totalDAO = require('../../dao/mec_vi_offline_content_totalDAO');
var mec_vi_order_counter_userbuyDAO = require('../../dao/mec_vi_order_counter_userbuyDAO');
var mec_vi_online_order_total_forassistantDAO = require('../../dao/mec_vi_online_order_total_forassistantDAO');
var mec_vi_online_content_total_forassistantDAO = require('../../dao/mec_vi_online_content_total_forassistantDAO');
var mec_vi_online_content_total_forcustomerDAO = require('../../dao/mec_vi_online_content_total_forcustomerDAO');
var mec_vi_online_content_total_forposDAO = require('../../dao/mec_vi_online_content_total_forposDAO');
var mec_vi_ret_returnable_contentinfoDAO = require('../../dao/mec_vi_ret_returnable_contentinfoDAO');
var mec_vi_offline_selling_counter_skc_totalDAO = require('../../dao/mec_vi_offline_selling_counter_skc_totalDAO');
var mec_ctm_siteDAO = require('../../dao/mec_ctm_siteDAO');
var dateUtil=require("../../util/dateUtil");
var engine=require("../../interaction/engine");
var mis=require("../../interaction/mis");
var objectUtil      = require("../../util/objectUtil");
var mec_audit_discountDAO   = require("../../dao/mec_audit_discountDAO");
var mec_audit_chargeDAO = require("../../dao/mec_audit_chargeDAO");
var numberUtil  = require("../../util/numberUtil");
var mis = require("../../interaction/mis");
var mec_vi_ret_returnable_paylistDAO = require("../../dao/mec_vi_ret_returnable_paylistDAO");
var mec_vi_ret_offlineorder_totalDAO = require("../../dao/mec_vi_ret_offlineorder_totalDAO");
var mec_vi_ret_offlinecontent_totalDAO= require("../../dao/mec_vi_ret_offlinecontent_totalDAO");
var mec_vi_sku_totalDAO = require("../../dao/mec_vi_sku_totalDAO");
var mec_sys_statepointerDAO = require("../../dao/mec_sys_statepointerDAO");
var decimalUtil = require("../../util/decimalUtil");
//营业员选商品过促销引擎显示总价钱(原促销引擎）
//entries的结构是:[{ITEMCODE:?,NUM:?,COUNTERCODE:?},{SKCCODE:?,NUM:?,COUNTERCODE:?},{SKCCODE:?,NUM:?,COUNTERCODE:?}...]
exports.getTotalPrice2 = function(entries,cb){
    async.forEach(entries,function(entry,cb){
        if(entry.SKCCODE){
            //该条目包含skccode
            mec_itm_skcDAO.queryOne({attributes:["ITEMCODE"],where:{SKCCODE:entry.SKCCODE,RECORDSTATE:1}},function(err,msg){
                if(!err){
                    if(msg){
                        entry.ITEMCODE=msg.ITEMCODE;
                        myLogger.trace("getTotalPrice [entry.ITEMCODE]: "+entry.ITEMCODE);
                        cb(null,msg);
                    }
                    else{
                        cb("unfound itemcode for the skc",null);
                    }
                }
                else{
                    cb(err,null)
                }
            })
        }
        else if(entry.ITEMCODE){
            //该条目不包含skccode,但是包含sku码
            cb(null,entry.ITEMCODE);
        }
        else{
            //该条目既不包含skc码也不包含sku码
            cb("unknow item",null);
        }
    },function(err){
        if(!err){
            promotionService.process2(false,entries,function(err,msg){
                myLogger.trace("getTotalPrice [promotionService.process.msg]: "+JSON.stringify(msg));
                if(!err){
                    var sumPrice=0;
                    for(var k=0;k<msg.length;k++){
                        var finalpricelist=msg[k].FINALPRICELIST;
                        for(var i=0;i<finalpricelist.length;i++){
                            var _price=finalpricelist[i].PRICE;
                            var _num=finalpricelist[i].NUM;
                            sumPrice+=_price*_num;
                        }
                    }
                    myLogger.trace("getTotalPrice [sumPrice]: "+sumPrice);
                    cb(null,sumPrice);
                }
                else{
                    myLogger.error("getTotalPrice [promotionService.process.err]: "+logErr(err));
                    cb(err,null);
                }
            });
        }
        else{
            myLogger.error("getTotalPrice [forEach.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//营业员选商品过促销引擎显示总价钱(修改后促销引擎)
//初始参数vipcode+entries:[{itemcode/skccode,num,originprice(如果经销B)}]
//entries的结构是:[{itemcode,countercode,num,^^^deptcode,^^^originprice,^^^promotionmark,###viptype,###vipdiscountrate}...]
exports.getTotalPrice = function(vipcode,countercode,entries,cb){
    var _entries=[]
    for (var i=0;i<entries.length;i++){
        var newentry=objectUtil.toLowerCase(entries[i]);
        _entries.push(newentry);
    }
    entries=_entries;
    promotionService.process(vipcode,countercode,entries,function(err,msg){
        if (!err) {
            myLogger.trace("getTotalPrice [promotionService.process.msg]: " + JSON.stringify(msg));
            if(msg=="NoPromotion"){
                var finalprice=0;
                for(var k=0;k<entries.length;k++){
                    var entry=entries[k];
//                    finalprice+=entry.originprice;
                    finalprice=finalprice.add(entry.originprice);
                }
                cb(null,finalprice);
            }
            else{
                var discountDetail={};
                msg = eval("(" + msg + ")");
                var finalPrice = 0;
                var vipDiscount = 0;
                var manualDiscount = 0;
                var deptDiscount = 0;
                var originPrice = 0;
                var num = 0;
                for (var k = 0; k < msg.length; k++) {
                    finalPrice = finalPrice.add(msg[k].finalprice);
                    vipDiscount = vipDiscount.add(msg[k].finalvipdiscount + msg[k].finalvipfloor);
                    deptDiscount = deptDiscount.add(msg[k].finalreduce);
                    manualDiscount = manualDiscount.add(msg[k].finalmanual);
                    originPrice = originPrice.add(msg[k].origintotalprice);
                    num = num.add(msg[k].num);
                    myLogger.trace("getTotalPrice [item.finalprice." + k + "]: " + msg[k].finalprice);
                }
                discountDetail.finalPrice = finalPrice;
                discountDetail.vipDiscount = vipDiscount;
                discountDetail.manualDiscount = manualDiscount;
                discountDetail.deptDiscount = deptDiscount;
                discountDetail.originPrice = originPrice;
                discountDetail.num = num;
                cb(null, discountDetail);
            }
        }
        else {
            myLogger.error("getTotalPrice [promotionService.process.err]: " + logErr(err));
            cb(err, null);
        }
    })
}

/**
 * 柜营业员开线下订单(原开单)
 * orderinfo: deliverymode,countercode,usercode(界面输入手机号自动查询到),assistantid
 * contentinfo: sku-num/skc-num的数组
 * siteinfo: 订单的地址信息
 * orderinfo程序生成信息: finalprice,finalrulestring,ordercode,siteid
 * contentinfo程序生成信息:itemcode(管库存记录skc时),finalpricelist,finalrulelist,ordercode,contentcode
 */
exports.placeOfflineOrder2 = function (orderinfo, contentinfo, siteinfo, cb) {
    //检查countercode和assistantid不准为空,配送时地址不允许为空
    if (!orderinfo.COUNTERCODE && orderinfo.COUNTERCODE!=0) {
        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound countercode");
        cb("unfound countercode", null);
        return;
    }
    if (!orderinfo.SALESMANCODE && orderinfo.SALESMANCODE!=0) {
        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound assistandid");
        cb("unfound assistandid", null);
        return;
    }
    if(orderinfo.DELIVERYMODE==1 && !siteinfo){
        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound logistics siteinfo");
        cb("unfound logistics siteinfo",null);
    }

    async.series([
        function(cb){
            //如果content中包含的是skccode,则获取其itemcode,countercode添加到contentinfo中
            async.forEach(contentinfo,function(content,cb){
                content["COUNTERCODE"]=orderinfo.COUNTERCODE;
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
                        mec_itm_storeitemDAO.queryOne({attributes:["STORETEMPPRICE"],where:{ITEMCODE:content.ITEMCODE,COUNTERCODE:content.COUNTERCODE}},function(err,msg){
                            if(!err){
                                if(msg){
                                    content["UNITPRICE"]=msg["STORETEMPPRICE"];
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
                if(!err) myLogger.trace("placeOfflineOrder [contentinfo]: "+JSON.stringify(contentinfo));
                else myLogger.error("placeOfflineOrder [mec_itm_skcDAO.queryOne]: "+logErr(err));
                cb(err,null);
            })
        },
        function(cb){
            //过促销引擎,将促销引擎结果放到orderinfo和contentinfo中
            promotionService.process2(false,contentinfo,function(err,msg){
                myLogger.trace("placeOfflineOrder [promotionService.process]: "+JSON.stringify(msg));
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
                    myLogger.trace("placeOfflineOrder [finalprice]: "+finalprice);
                    myLogger.trace("placeOfflineOrder [finalrulestring]"+JSON.stringify(finalrulestring));
                    cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            });
        },
        function(cb){
            //生成订单编码,放入到orderinfo和contentinfo中,并为contentinfo生成contentcode
            exports.generateOrderCode(false,false,function(err,ordercode){
                myLogger.trace("placeOfflineOrder [generateOrderCode.ordercode]: "+ordercode);
                if(!err){
                    orderinfo.OFFLINEORDERCODE=ordercode;
                    for(var k=0;k<contentinfo.length;k++){
                        contentinfo[k].OFFLINEORDERCODE=ordercode;
                        contentinfo[k].OFFLINECONTENTCODE=exports.generateContentCode(ordercode,k+1);
                    }
                    cb(null,ordercode);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            //数据库操依次插入siteinfo,orderinfo,contentinfo
            sequelize.transaction(function(t){
                async.series([
                    function(cb){
                        //如果有就写入地址信息,返回地址id放到orderinfo里面
                        if(orderinfo.DELIVERYMODE==1 && siteinfo){
                            mec_ctm_siteDAO.add(siteinfo,t,function(err,msg){
                                if(!err){
                                    if(msg){
                                        orderinfo.SITEID=msg.null;
                                        cb(null,msg);
                                    }
                                    else{
                                        cb("add site exception",null);
                                    }
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        }
                        else{
                            cb(null,null);
                        }
                    },
                    function(cb){
                        //写入订单信息
                        myLogger.trace("placeOfflineOrder [orderinfo]: "+JSON.stringify(orderinfo));
                        mec_buy_offlineorderDAO.add(orderinfo,t,cb);
                    },
                    function(cb){
                        //写入订单明细信息
                        async.forEach(contentinfo,function(content,cb){
                            mec_buy_offlinecontentDAO.add(content,t,cb);
                        },function(err){
                            cb(err,null);
                        })
                    }
                ],function(err,msg){
                    if(!err) {
                        myLogger.trace("placeOfflineOrder [mec_ctm_siteDAO.add]: "+JSON.stringify(msg[0]));
                        myLogger.trace("placeOfflineOrder [mec_buy_offlineorderDAO.add]: "+JSON.stringify(msg[1]));
                        myLogger.trace("placeOfflineOrder [mec_buy_offlinecontentDAO.add]: "+JSON.stringify(msg[2]));
                        t.commit();
                        cb(null,msg);
                    }
                    else {
                        myLogger.error("placeOfflineOrder [series.err]: "+logErr(err));
                        t.rollback();
                        cb(err,null);
                    }
                });
            });
        }
    ],cb);
}

/**
 * 柜营业员开线下订单(新开单)
 *
 * orderinfo: countercode,deliverymode,usercode(界面输入手机号自动查询到),assistantid,      VIPCODE,      TEMPDISTRIBUTIONMARK,      SHIPPRICE,REALSHIPPRICE,PACKING,REALPACKING
 * contentinfo: itemcode-skccode-num-(ORIGINPRICE)的数组
 * siteinfo: 订单的地址信息
 *
 * orderinfo程序生成信息: ordercode,siteid,      ORDERSTATE,PLACETIME      +STORECODE,     +VIPCARDNO,VIPCODE,VIPCARDTYPE,VIPDISCOUNTRATE,     +RECEIVABLEAMT
 * contentinfo程序生成信息:itemcode(管库存记录skc时),ordercode,contentcode,     UNITPRICE,PROMOTIONMARK,      REALVIPCARDTYPE,REALVIPDISCOUNTRATE,     RETAILAMT,VIPDISCOUNTAMT,DISCOUNTOUTAMT,DISCOUNTINAMT,PRESENTSHAREQTY,MERCHANTDISCOUTAMT,      SHIPPRICECHARGESHARE,PACKINGCHARGESHARE
 * discountinfo程序生成信息:ISONLINEORDER，GROUPCODE，ORDERCODE，CONTENTCODE，       DISCOUNTREASON，DISCOUNTAMT，VIPCARDTYPE
 * chargeinfo程序生成信息:ISONLINEORDER，ORDERCODE，      CHARGECODE，AMT
 */
exports.placeOfflineOrder = function (orderinfo, contentinfo, siteinfo, cb) {
    //检查countercode和assistantid不准为空,配送时地址不允许为空
    if (!orderinfo.COUNTERCODE && orderinfo.COUNTERCODE!=0) {
            myLogger.error("placeOfflineOrder [Check Params]: "+"unfound countercode");
            cb("unfound countercode", null);
        return;
    }
    if (!orderinfo.SALESMANCODE && orderinfo.SALESMANCODE!=0) {
        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound assistandid");
        cb("unfound assistandid", null);
        return;
    }
    if(orderinfo.DELIVERYMODE==1 && !siteinfo){
        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound logistics siteinfo");
        cb("unfound logistics siteinfo",null);
    }

    if(!orderinfo.VIPCODE) orderinfo.VIPCODE=null;
    if(!orderinfo.TEMPDISTRIBUTIONMARK) orderinfo.TEMPDISTRIBUTIONMARK=0;
    if(!orderinfo.SHIPPRICE) orderinfo.SHIPPRICE=0;
    if(!orderinfo.REALSHIPPRICE) orderinfo.REALSHIPPRICE=0;
    if(!orderinfo.PACKING) orderinfo.PACKING=0;
    if(!orderinfo.REALPACKING) orderinfo.REALPACKING=0;

    var discountinfo=[];
    var chargeinfo=[];

    async.waterfall([
        function(cb){
            //构建entries对象，并过促销引擎
            var vipcode=orderinfo.VIPCODE;
            var countercode=orderinfo.COUNTERCODE;
            var entries=[];
            for(var k=0;k<contentinfo.length;k++){
                entries[k]=objectUtil.toLowerCase(contentinfo[k]);
            }
            promotionService.process(vipcode,countercode,entries,function(err,msg){
                if (!err) {
                    myLogger.trace("placeOfflineOrder [promotionService.process.msg]: " + JSON.stringify(msg));
                    msg = eval("(" + msg + ")");
                    cb(null, msg);
                }
                else {
                    myLogger.error("placeOfflineOrder [promotionService.process.err]: " + logErr(err));
                    cb(err, null);
                }
            })
        },
        function(x,cb){
            async.series([
                function(cb){
                    //生成订单编码,放入到orderinfo和contentinfo中,并为contentinfo生成contentcode
                    exports.generateOrderCode(false,false,function(err,ordercode){
                        myLogger.trace("placeOfflineOrder [generateOrderCode.ordercode]: "+ordercode);
                        if(!err){
                            orderinfo.OFFLINEORDERCODE=ordercode;
                            for(var k=0;k<contentinfo.length;k++){
                                contentinfo[k].OFFLINEORDERCODE=ordercode;
                                contentinfo[k].OFFLINECONTENTCODE=exports.generateContentCode(ordercode,k+1);
                            }
                            cb(null,ordercode);
                        }
                        else{
                            cb(err,null);
                        }
                    })
                },
                function(cb){
                    //将促销引擎数据装配到结构对象

                    //补充orderinfo相关
                    orderinfo.ORDERSTATE=0;
                    orderinfo.PLACETIME=new Date();
                    orderinfo.TIMEOUTTIME=dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime*-1});
                    orderinfo.RECEIVABLEAMT = 0;

                    //补充contentinfo和discountinfo相关
                    for (var k = 0; k < x.length; k++) {
//                        orderinfo.RECEIVABLEAMT += x[k].finalprice;
                        orderinfo.RECEIVABLEAMT=(orderinfo.RECEIVABLEAMT).add(x[k].finalprice);

                        contentinfo[k].ITEMCODE=x[k].itemcode;
                        contentinfo[k].COUNTERCODE=orderinfo.COUNTERCODE;
                        contentinfo[k].SKCCODE=x[k].skccode;
                        contentinfo[k].NUM=x[k].num;
                        contentinfo[k].UNITPRICE=x[k].originprice;
                        contentinfo[k].PROMOTIONMARK=x[k].promotionmark;
                        contentinfo[k].REALVIPCARDTYPE=x[k].viptype;
                        contentinfo[k].REALVIPDISCOUNTRATE=x[k].vipdiscountrate;
                        contentinfo[k].RETAILAMT=x[k].finalprice;
                        contentinfo[k].VIPDISCOUNTAMT=x[k].finalvipdiscount;
                        contentinfo[k].VIPFLOORAMT=x[k].finalvipfloor;
                        contentinfo[k].DISCOUNTOUTAMT=x[k].finalreduce;
                        contentinfo[k].DISCOUNTINAMT=x[k].finalcoupon;
                        contentinfo[k].PRESENTSHAREQTY=x[k].finalgiftshare;
                        contentinfo[k].MERCHANTDISCOUTAMT=x[k].finalmerchantdiscount;
                        contentinfo[k].TEMPDISTRIBUTIONMARK=orderinfo.TEMPDISTRIBUTIONMARK;
                        contentinfo[k].HANDAMT=x[k].finalmanual;

                    if(x[k].finalvipdiscount>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:1,DISCOUNTTYPE:0, DISCOUNTAMT:x[k].finalvipdiscount,VIPCARDTYPE:x[k].viptype});
                    if(x[k].finalvipfloor>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:2,DISCOUNTTYPE:0, DISCOUNTAMT:x[k].finalvipfloor,VIPCARDTYPE:x[k].viptype});
                    if(x[k].finalreduce>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:3,DISCOUNTTYPE:1, DISCOUNTAMT:x[k].finalreduce,VIPCARDTYPE:null});
                    if(x[k].finalcoupon>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:4,DISCOUNTTYPE:2, DISCOUNTAMT:x[k].finalcoupon,VIPCARDTYPE:null});
                    if(x[k].finalgiftshare>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:5,DISCOUNTTYPE:3, DISCOUNTAMT:x[k].finalgiftshare,VIPCARDTYPE:null})
                    if(x[k].finalmanual>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:7,DISCOUNTTYPE:4, DISCOUNTAMT:x[k].finalmanual,VIPCARDTYPE:null});
                    if(x[k].finalmerchantdiscount>0)
                        discountinfo.push({ISONLINEORDER:0, GROUPCODE:null, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:6,DISCOUNTTYPE:5, DISCOUNTAMT:x[k].finalmerchantdiscount,VIPCARDTYPE:null});

                }

                    //补充chargeinfo相关
//                    var shipcharge=orderinfo.SHIPPRICE-orderinfo.REALSHIPPRICE||0;
//                    var packcharge=orderinfo.PACKING-orderinfo.REALPACKING||0;
                    var shipcharge=orderinfo.SHIPPRICE.sub(orderinfo.REALSHIPPRICE)||0;
                    var packcharge=orderinfo.PACKING.sub(orderinfo.REALPACKING)||0;

                    if(shipcharge>0){
                        chargeinfo.push({ISONLINEORDER:0, ORDERCODE:orderinfo.OFFLINEORDERCODE, CHARGECODE:"Q59", AMT:shipcharge});
                    }
                    if(packcharge>0){
                        chargeinfo.push({ISONLINEORDER:0, ORDERCODE:orderinfo.OFFLINEORDERCODE, CHARGECODE:"Q60", AMT:packcharge});
                    }

                    //补充contentinfo中的运费包装非分摊
                    var remainshipcharge=shipcharge;
                    var remainpackcharge=packcharge;
                    var max_finalprice_index=0;
                    for (var k = 0; k < x.length; k++) {
//                        contentinfo[k].SHIPPRICECHARGESHARE=numberUtil.floor1(shipcharge* x[k].finalprice/orderinfo.RECEIVABLEAMT);
//                        contentinfo[k].PACKINGCHARGESHARE=numberUtil.floor1(packcharge* x[k].finalprice/orderinfo.RECEIVABLEAMT);
//                        remainshipcharge-=contentinfo[k].SHIPPRICECHARGESHARE;
//                        remainpackcharge-=contentinfo[k].PACKINGCHARGESHARE;
                        contentinfo[k].SHIPPRICECHARGESHARE=numberUtil.floor1(shipcharge.mul(x[k].finalprice.div(orderinfo.RECEIVABLEAMT)));
                        contentinfo[k].PACKINGCHARGESHARE=numberUtil.floor1(packcharge.mul(x[k].finalprice.div(orderinfo.RECEIVABLEAMT)));
                        remainshipcharge=remainshipcharge.sub(contentinfo[k].SHIPPRICECHARGESHARE);
                        remainpackcharge=remainpackcharge.sub(contentinfo[k].PACKINGCHARGESHARE);

                        if(x[max_finalprice_index].finalprice<x[k].finalprice) max_finalprice_index=k;
                    }
//                    contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE=Number(contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE)+remainshipcharge;
//                    contentinfo[max_finalprice_index].PACKINGCHARGESHARE=Number(contentinfo[max_finalprice_index].PACKINGCHARGESHARE)+remainpackcharge;
                    contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE=(Number(contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE)).add(remainshipcharge);
                    contentinfo[max_finalprice_index].PACKINGCHARGESHARE=(Number(contentinfo[max_finalprice_index].PACKINGCHARGESHARE)).add(remainpackcharge);

                    cb(null,null);
                },
                function(cb){
                    //为orderinfo获取STORECODE
                    mec_hct_counterDAO.queryOne({"attributes":["STORECODE"],where:{COUNTERCODE:orderinfo.COUNTERCODE}},function(err,msg){
                        if(!err){
                            if(msg){
                                orderinfo.STORECODE=msg.STORECODE;
                                cb(null,msg);
                            }
                            else{
                                cb("unfound storecode for the counter",null);
                            }
                        }
                        else{
                            cb(err,null);
                        }
                    })
                },
                function(cb){
                    //为orderinfo获取VIPCARDNO,VIPCODE,VIPCARDTYPE,VIPDISCOUNTRATE
                    mis.getVIPInfo(orderinfo.VIPCODE,function(err,msg){
                        if(!err){
                            if(msg){
                                orderinfo.VIPCARDNO=msg.cardno;
                                orderinfo.VIPCARDTYPE=msg.cardtype;
                                orderinfo.VIPDISCOUNTRATE=msg.vipdiscount;
                                cb(null,msg);
                            }
                            else{
                                orderinfo.VIPCARDNO='';
                                orderinfo.VIPCARDTYPE='00';
                                orderinfo.VIPDISCOUNTRATE=100;
                                cb(null,null);
//                                cb("unfound vipinfo for "+orderinfo.VIPCODE,null);
                            }
                        }
                        else{
                            orderinfo.VIPCARDNO='';
                            orderinfo.VIPCARDTYPE='00';
                            orderinfo.VIPDISCOUNTRATE=100;
                            cb(null,null);
                        }
                    })
                },
                function(cb){

                    console.log("##############Order Meta Data##############");
                    console.log(orderinfo);
                    console.log(contentinfo);
                    console.log(siteinfo);
                    console.log(discountinfo);
                    console.log(chargeinfo);
                    console.log("###########################################");

                    //数据库操依次插入siteinfo,orderinfo,contentinfo
                    sequelize.transaction(function(t){
                        async.series([
                            function(cb){
                                //如果有就写入地址信息,返回地址id放到orderinfo里面
                                if(orderinfo.DELIVERYMODE==1 && siteinfo){
                                    mec_ctm_siteDAO.add(siteinfo,t,function(err,msg){
                                        if(!err){
                                            if(msg){
                                                orderinfo.SITEID=msg.null;
                                                cb(null,msg);
                                            }
                                            else{
                                                cb("add site exception",null);
                                            }
                                        }
                                        else{
                                            cb(err,null);
                                        }
                                    })
                                }
                                else{
                                    cb(null,null);
                                }
                            },
                            function(cb){
                                //写入订单信息
                                myLogger.trace("placeOfflineOrder [orderinfo]: "+JSON.stringify(orderinfo));
                                mec_buy_offlineorderDAO.add(orderinfo,t,cb);
                            },
                            function(cb){
                                //写入订单明细信息
                                async.forEach(contentinfo,function(content,cb){
                                    console.log("@@@@@@@@@@@@");console.log(content);console.log("@@@@@@@@@@@@");
                                    async.waterfall([
                                        //TODO 库存处理测试
                                        function(cb){//查询库存
                                            if(!content.SKCCODE || content.SKCCODE == '') cb(null,null);
                                            else {
                                                var sql = "select * from mec_itm_stock where SKCCODE='?1' and COUNTERCODE='?2' ";
                                                sql = sql.replace("?1", content.SKCCODE);
                                                sql = sql.replace("?2", content.COUNTERCODE);
                                                generalDAO.runSql(sql, t, function (err, msg) {
                                                    if (err) {
                                                        cb(err, null);
                                                    }
                                                    else if (!msg || msg.length == 0 || msg.length > 1) {
                                                        cb("unfound counter's skc: " + content.COUNTERCODE + "-" + content.SKCCODE, null);
                                                    }
                                                    else {
                                                        var AMOUNT = msg[0].AMOUNT;
                                                        var ISALLOWNEGATIVE = msg[0].ISALLOWNEGATIVE;
                                                        var BUFFER = msg[0].BUFFER;

                                                        if (AMOUNT >= content.NUM) {
                                                            cb(null, AMOUNT - content.NUM);
                                                        }
                                                        else {
                                                            if (ISALLOWNEGATIVE == 0) {
                                                                cb("negative stock error: " + content.COUNTERCODE + "-" + content.SKCCODE + "-" + content.NUM, null);
                                                            }
                                                            else {
                                                                if (AMOUNT + BUFFER >= content.NUM) {
                                                                    cb(null, AMOUNT - content.NUM);
                                                                }
                                                                else {
                                                                    cb("negative stock buffer overflow: " + content.COUNTERCODE + "-" + content.SKCCODE + "-" + content.NUM, null);
                                                                }
                                                            }
                                                        }
                                                    }
                                                })
                                            }
                                        },
                                        function(x,cb){//更新库存
                                            if(!content.SKCCODE || content.SKCCODE == '') cb(null,null);
                                            else mec_itm_stockDAO.update({AMOUNT:x},{COUNTERCODE:content.COUNTERCODE,SKCCODE:content.SKCCODE},t,cb);
                                        },
                                        function(x,cb){//插入订单明细
                                            mec_buy_offlinecontentDAO.add(content,t,cb);
                                        }
                                    ],cb)
                                },function(err){
                                    cb(err,"写入订单明细");
                                })
                            },
                            function(cb){
                                //写入折扣分摊信息
                                async.forEachSeries(discountinfo,function(discount,cb){
                                    mec_audit_discountDAO.add(discount,t,cb);
                                },function(err){
                                    cb(err,null);
                                })
                            },
                            function(cb){
                                //写入差额信息
                                async.forEachSeries(chargeinfo,function(charge,cb){
                                    mec_audit_chargeDAO.add(charge,t,cb);
                                },function(err){
                                    cb(err,null);
                                })
                            }
                        ],function(err,msg){
                            if(!err) {
                                myLogger.trace("placeOfflineOrder [mec_ctm_siteDAO.add]: "+JSON.stringify(msg[0]));
                                myLogger.trace("placeOfflineOrder [mec_buy_offlineorderDAO.add]: "+JSON.stringify(msg[1]));
                                myLogger.trace("placeOfflineOrder [mec_buy_offlinecontentDAO.add]: "+JSON.stringify(msg[2]));
                                myLogger.trace("placeOfflineOrder [mec_audit_discountDAO.add]: "+JSON.stringify(msg[3]));
                                myLogger.trace("placeOfflineOrder [mec_audit_chargeDAO.add]: "+JSON.stringify(msg[4]));
                                t.commit();
                                cb(null,msg);
                            }
                            else {
                                myLogger.error("placeOfflineOrder [series.err]: "+logErr(err));
                                t.rollback();
                                cb(err,null);
                            }
                        });
                    });
                }
            ],cb);
        }
    ],function(err,msg){
         if(!err){
             myLogger.trace("placeOfflineOrder [async.waterfall]: placeorder successfully");
             cb(null,msg);
         }
         else{
             myLogger.error("placeOfflineOrder [async.waterfall]: "+logErr(err));
             cb(err,null);
         }
    })
}

//获取本柜全部线下订单
exports.getOfflineOrder=function(countercode,qry,options,cb){
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:{lt:100}};
            mec_buy_offlineorderDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrder [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrder [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE={lt:100};
            mec_buy_offlineorderDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrder [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrder [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:{lt:100}});
            mec_buy_offlineorderDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrder [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrder [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//获取本柜全部线上订单
exports.getOnlineOrder=function(countercode,qry,options,cb){
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:{lt:100}};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrder [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrder [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE={lt:100};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrder [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrder [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:{lt:100}});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrder [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrder [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//获取本柜全部线下订单
exports.getOfflineRetOrder=function(countercode,qry,options,cb){
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry && qry != 0) {
        var where={COUNTERCODE:countercode};
        mec_vi_ret_offlineorder_totalDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOfflineRetOrder [mec_vi_ret_offlineorder_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOfflineRetOrder [mec_vi_ret_offlineorder_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        qry.COUNTERCODE=countercode;
        mec_vi_ret_offlineorder_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOfflineRetOrder mec_vi_ret_offlineorder_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOfflineRetOrder [mec_vi_ret_offlineorder_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "OFFLINEORDERCODE",
            "RETORIPOSTRANSCODE"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("PLACETIME"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode});
        mec_vi_offline_order_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOfflineRetOrder [mec_vi_ret_offlineorder_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOfflineRetOrder [mec_vi_ret_offlineorder_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取今日开出的线下订单
exports.getOfflineOrderPlacedToday = function(countercode,qry,options,cb){
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);
        var itemCount = 0, amt = 0;



        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,IFRETURN:0,createdAt:{between:dateUtil.getTodayStartEnd()}};
            mec_buy_offlineorderDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    getOrderStatToday(countercode, function(error,result){
                         myLogger.trace("getOfflineOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                         msg.ITEMCOUNT = result[0];
                         msg.AMT = result[1];
                         cb(null, msg);
                    });
                }
                else {
                    myLogger.error("getOfflineOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.createdAt={between:dateUtil.getTodayStartEnd()};
            qry.IFRETURN=0;
            mec_buy_offlineorderDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "RECEIVABLEAMT",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,IFRETURN:0,createdAt:{between:dateUtil.getTodayStartEnd()}});
            mec_buy_offlineorderDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    getOrderStatToday(countercode, function(error,result){
                        myLogger.trace("getOfflineOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                        msg.ITEMCOUNT = result[0];
                        msg.AMT = result[1];
                        cb(null, msg);
                    });
                }
                else {
                    myLogger.error("getOfflineOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}


function getOrderStatToday(countercode,cb){
    async.series([
        function(cb){
            mec_vi_offline_content_totalDAO.sum("NUM",{"where":{COUNTERCODE:countercode,ORDERSTATE:{between:[4,8]},createdAt:{between:dateUtil.getTodayStartEnd()}}}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderPlacedToday [mec_vi_offline_content_totalDAO.sum(NUM)]: " + msg);
                    if(msg == null)
                        msg = 0;
                    cb(err, msg);
                }
                else {
                    myLogger.error("getOfflineOrderPlacedToday [mec_vi_offline_content_totalDAO.sum(NUM)]: " + logErr(err));
                    cb(err, null);
                }
            });
        },
        function(cb){
            mec_vi_offline_content_totalDAO.sum("RETAILAMT",{"where":{COUNTERCODE:countercode,ORDERSTATE:{between:[4,8]},createdAt:{between:dateUtil.getTodayStartEnd()}}}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderPlacedToday [mec_vi_offline_content_totalDAO.sum(RETAILAMT)]: " + msg);
                    if(msg == null)
                        msg = 0;
                    cb(err, msg);
                }
                else {
                    myLogger.error("getOfflineOrderPlacedToday [mec_vi_offline_content_totalDAO.sum(RETAILAMT)]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    ],cb)
}

//获取今日接的线上订单
//今日的所有orderstate>3的网上订单(confirmstate肯定为1),加上订单状态为[1,2]且confirmstate=1的订单
exports.getOnlineOrderAcceptedToday = function(countercode,qry,options,cb){
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,CONFIRMSTATE:1,CONFIRMTIME:{between:dateUtil.getTodayStartEnd()}};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderAcceptedToday [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderAcceptedToday [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.CONFIRMSTATE=1;
            qry.CONFIRMTIME={between:dateUtil.getTodayStartEnd()};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderAcceptedToday [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderAcceptedToday [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,CONFIRMSTATE:1,CONFIRMTIME:{between:dateUtil.getTodayStartEnd()}});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderAcceptedToday [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderAcceptedToday [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//尚未接受的线上订单
//包括:未支付的网上订单,到付等待本柜确认的,支付完等待本柜确认的
//orderstate=[1,2] 且本柜的confirmstate=0;
exports.getOnlineOrderUnaccepted = function (countercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:{between:[1,2]},CONFIRMSTATE:0};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE={between:[1,2]};
            qry.CONFIRMSTATE=0;
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:{between:[1,2]},CONFIRMSTATE:0});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//待付款的线上订单
//orderstate=1 且 paymentmode=[0,1] 且 本柜的confirmstate=0;
exports.getOnlineOrderUnpay = function (countercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:1,PAYMENTMODE:{between:[0,1]},CONFIRMSTATE:0};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE=1;
            qry.PAYMENTMODE={between:[0,1]};
            qry.CONFIRMSTATE=0;
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:1,PAYMENTMODE:{between:[0,1]},CONFIRMSTATE:0});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//需要确认的线上订单
//( (orderstate=1且paymentmode=2) 或者 (orderstate=2) ) 且 本柜的confirmstate=0;
exports.getOnlineOrderConfirmable = function (countercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var qryOptions=sequelize.and({ORDERSTATE:1},{PAYMENTMODE:2});
            qryOptions=sequelize.or(qryOptions,{ORDERSTATE:2});
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,CONFIRMSTATE:0});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            var qryOptions=sequelize.and({ORDERSTATE:1},{PAYMENTMODE:2});
            qryOptions=sequelize.or(qryOptions,{ORDERSTATE:2});
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,CONFIRMSTATE:0});
            qry=sequelize.and(qry,qryOptions);
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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

            var qryOptions2=sequelize.and({ORDERSTATE:1},{PAYMENTMODE:2});
            qryOptions2=sequelize.or(qryOptions2,{ORDERSTATE:2});
            qryOptions2=sequelize.and(qryOptions2,{COUNTERCODE:countercode,CONFIRMSTATE:0});

            qryOptions=sequelize.and(qryOptions,qryOptions2);
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderUnaccepted [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//获取线下(待支付的订单)
exports.getOfflineOrderWaiting = function (countercode, qry, options, cb) {
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:0};
            mec_vi_offline_order_totalDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderWaiting [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderWaiting [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE=0;
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderWaiting [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderWaiting [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:0});
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderWaiting [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderWaiting [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//获取线上(待支付或者待确认的订单,包括订单的本柜部分已经确认但是别柜部分未确认的)
//orderstate=1,paymentmode=0,1的只能拒绝,不能确认
//[orderstate=1,paymentmode=2或者orderstate=2]的本柜尚未确认的前提下(可能已经确认过,但订单涉及多个柜还未完全确认)可以确认
exports.getOnlineOrderWaiting = function (countercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:{between:[1,2]}};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderWaiting [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderWaiting [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE={between:[1,2]};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderWaiting [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderWaiting [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:{between:[1,2]}});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderWaiting [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderWaiting [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//处理完成的线下订单(处理完代表支付且确认--这里面仍有一部分需要备货,需要等用户自提)
exports.getOfflineOrderDealed = function (countercode, qry, options, cb) {
    exports.updateOfflineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:{between:[3,13]}};
            mec_vi_offline_order_totalDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderDealed [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderDealed [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE={between:[3,13]};
            qry.ORDERSTATE=0;
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderDealed [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderDealed [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:{between:[3,13]}});
            mec_vi_offline_order_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineOrderDealed [mec_vi_offline_order_totalDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineOrderDealed [mec_vi_offline_order_totalDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//处理完成的线上订单(处理完代表支付且确认--这里面仍有一部分需要备货,需要等用户自提)
exports.getOnlineOrderDealed = function (countercode, qry, options, cb) {
    exports.updateOnlineOrderOverdue(function(err,msg){
        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {
            var where={COUNTERCODE:countercode,ORDERSTATE:{between:[3,13]}};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderDealed [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderDealed [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.ORDERSTATE={between:[3,13]};
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderDealed [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderDealed [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "ONLINEORDERCODE",
                "FINALPRICE",
                "USERCODE"
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
            qryOptions=sequelize.and(qryOptions,{COUNTERCODE:countercode,ORDERSTATE:{between:[3,13]}});
            mec_vi_online_order_total_forassistantDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOnlineOrderDealed [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOnlineOrderDealed [mec_vi_online_order_total_forassistantDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
    });
}

//处理完成的线上订单(处理完代表支付且确认--这里面仍有一部分需要备货,需要等用户自提)
exports.getOrderCounterUserBuy = function (countercode, qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    //要模糊查询的所有列
    var qryFields = [
        "VIPCARDNO",
        "TELEPHONE",
        "USERCODE"
    ];
    //构造查询条件
    var qryOptions = {};
    qryOptions[qryFields[0]] = {like: qry + "%"};
    for (var k = 1; k < qryFields.length; k++) {
        var tmp = {};
        tmp[qryFields[k]] = {like: qry + "%"};
        qryOptions = sequelize.or(qryOptions, tmp);
    }
    qryOptions=sequelize.and(qryOptions,{
//        COUNTERCODE:countercode,
        ORDERSTATE:{between:[0,8]}});
    mec_vi_order_counter_userbuyDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
        if (!err) {
            myLogger.trace("getOrderCounterUserBuy [mec_vi_order_counter_userbuyDAO.queryAndCount]: " + (msg && msg.count));
            cb(null, msg);
        }
        else {
            myLogger.error("getOrderCounterUserBuy [mec_vi_order_counter_userbuyDAO.queryAndCount]: " + logErr(err));
            cb(err, null);
        }
    });
}

//获取线下订单的商品
exports.getOfflineContentByOrder = function (countercode,ordercode, cb) {
    async.waterfall([
        function(cb){
            var where={OFFLINEORDERCODE:ordercode};
            if(countercode) where.COUNTERCODE=countercode;
            mec_buy_offlineorderDAO.queryOne({where:where},cb);
        },
        function(x,cb){
            if(x){
                mec_vi_offline_content_totalDAO.queryAll({where:{OFFLINEORDERCODE:ordercode}},cb);
            }
            else{
                cb("not the counter's order",null);
            }
        }
    ],function(err,msg){
        if(!err){
            cb(null,msg);
        }
        else{
            myLogger.error("getOfflineContentByOrder [waterfall.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//获取线下退货单的明细
exports.getOfflineRetContentByOrder = function (countercode,ordercode, cb) {
    mec_vi_ret_offlinecontent_totalDAO.queryAll({where:{OFFLINEORDERCODE:ordercode}},cb);
}

//获取线上订单在本柜的商品
exports.getOnlineContentByOrder = function (countercode, ordercode, cb) {
    var where={ONLINEORDERCODE:ordercode}
    if(countercode){
        where.COUNTERCODE=countercode;
    }
    mec_vi_online_content_total_forposDAO.queryAll({where:where},cb);
}

//线下订单拒绝
exports.cancelOfflineOrder = function (ordercode, assistantid, cb) {
    //TODO 跟踪订单状态
    if(ordercode.charAt(0)=='0')
        mec_buy_offlineorderDAO.update({ORDERSTATE:9},{OFFLINEORDERCODE:ordercode,ORDERSTATE:0},cb);
    else if(ordercode.charAt(0)=='2')
        mec_buy_offlineorderDAO.update({ORDERSTATE:102},{OFFLINEORDERCODE:ordercode,ORDERSTATE:100},cb);
}

//本柜线上订单拒绝
exports.cancelOnlineOrder = function (countercode,ordercode, assistantid, cb) {
    //TODO 跟踪订单状态
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                //拒绝状态写入订单明细表中
                var value={CONFIRMSTATE:2,CONFIRMTIME:new Date(),SALESMANCODE:assistantid};
                var where={ONLINEORDERCODE:ordercode,COUNTERCODE:countercode,CONFIRMSTATE:0};
                mec_buy_onlinecontentDAO.update(value,where,t,cb);
            },
            function(cb){
                //如果未付款或到付,取消订单进入状态9
                mec_buy_onlineorderDAO.update({ORDERSTATE:9},{ONLINEORDERCODE:ordercode,ORDERSTATE:1},t,cb);
            },
            function(cb){
                //如果已经付款,强行取消订单进入状态12
                mec_buy_onlineorderDAO.update({ORDERSTATE:12},{ONLINEORDERCODE:ordercode,ORDERSTATE:2},t,cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("cancelOnlineOrder [mec_buy_onlinecontentDAO.update]: "+msg[0]);
                myLogger.trace("cancelOnlineOrder [mec_buy_onlineorderDAO.update]: "+msg[1]);
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("cancelOnlineOrder [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//本柜线上订单确认
exports.confirmOnlineOrder = function (countercode,ordercode, assistantid, cb) {
    //TODO 跟踪订单状态
    sequelize.transaction(function(t){
        async.waterfall([
            function(cb){
                var value={CONFIRMSTATE:1,CONFIRMTIME:new Date(), SALESMANCODE:assistantid};
                var where={ONLINEORDERCODE:ordercode,COUNTERCODE:countercode,CONFIRMSTATE:0};
                mec_buy_onlinecontentDAO.update(value,where,t,cb);
            },
            function(x,cb){
                //获取订单明细里面的每一各确认状态,用以检查是否全部确认,这里要严格封锁(!!!重要!!!)
                var sql="select CONFIRMSTATE from mec_buy_onlinecontent where ONLINEORDERCODE='"+ordercode+"' FOR UPDATE";
                generalDAO.runSql(sql,{transaction:t},cb);
            },
            function(x,cb){
                //检查是否全部确认
                var isTotalConfirmed=true;
                for(var k=0; k< x.length; k++){
                    if(x[k].CONFIRMSTATE!=1){
                        isTotalConfirmed=false;
                        break;
                    }
                }

                //如果全部确认就更新订单状态为确认状态
                if(isTotalConfirmed){
                    var value={ORDERSTATE:3};
                    var where={ONLINEORDERCODE:ordercode,ORDERSTATE:{between:[1,2]}};
                    mec_buy_onlineorderDAO.update(value,where,t,function(err,msg){
                        if(!err){
                            if(msg==1) cb(null,1) //全部确认
                            else cb("状态不允许该操作",null);
                        }
                        else{
                            cb(err,null);
                        }
                    });
                }
                else{
                    //判断未全部确认是否有拒绝
                    var isRefused=false;
                    for(var k=0; k< x.length; k++){
                        if(x[k].CONFIRMSTATE==2){
                            isRefused=true;
                            break;
                        }
                    }
                    if(isRefused) cb(null,2);//拒绝
                    else cb(null,0);//部分确认
                }
            }
        ],function(err,msg){
            if(!err){
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("confirmOnlineOrder [waterfall.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
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

//生成订单编码(读写数据库状态)
exports.generateOrderCode3 = function (isonline,isreturn,cb) {
    var ordercode = "0";
    if(isonline && !isreturn) ordercode="1";
    if(!isonline && isreturn) ordercode="2";
    if(isonline && isreturn) ordercode="3";

    sequelize.transaction({autocommit:false},function(t){
        async.waterfall([
            function(cb){
                var sql="select "+
                    "Now() as date, "+
                    "(select VALUE from mec_sys_statepointer where mec_sys_statepointer.KEY='curOrderDailyNum') as curOrderDailyNum, "+
                    "(select VALUE from mec_sys_statepointer where mec_sys_statepointer.KEY='curOrderDateStr') as curOrderDateStr " +
                    "FOR UPDATE; ";
                generalDAO.runSql(sql,t,cb);
            },
            function(x,cb){
                if(x && x.length==1){
                    var date=x[0].date;
                    var curOrderDailyNum=x[0].curOrderDailyNum;
                    var curOrderDateStr=x[0].curOrderDateStr;
                    var date = new Date();
                    var month = stringUtil.autoComple(date.getMonth()+1,2,'0');
                    var year = date.getFullYear().toString().substr(2, 2);
                    var day = stringUtil.autoComple(date.getDate(), 2, '0');
                    var dateStr = year + month + day;
                    if(dateStr!=curOrderDateStr){ //进入第二天
                        curOrderDateStr=dateStr;
                        curOrderDailyNum=1;

                        ordercode += curOrderDateStr;
                        var randomNumber = Math.floor(Math.random() * 100000);
                        ordercode += stringUtil.autoComple(randomNumber, 5, '0');
                        ordercode += stringUtil.autoComple(curOrderDailyNum, 6, '0');

                        async.series([
                            function(cb){
                                mec_sys_statepointerDAO.update({VALUE:curOrderDateStr},{KEY:"curOrderDateStr"},t,cb);
                            },
                            function(cb){
                                mec_sys_statepointerDAO.update({VALUE:curOrderDailyNum},{KEY:"curOrderDailyNum"},t,cb);
                            }
                        ],cb)
                    }
                    else{ //当天
                        curOrderDailyNum=Number(curOrderDailyNum)+1;

                        ordercode += curOrderDateStr;
                        var randomNumber = Math.floor(Math.random() * 100000);
                        ordercode += stringUtil.autoComple(randomNumber, 5, '0');
                        ordercode += stringUtil.autoComple(curOrderDailyNum, 6, '0');

                        mec_sys_statepointerDAO.update({VALUE:curOrderDailyNum},{KEY:"curOrderDailyNum"},t,cb);
                    }
                }
                else{
                    cb("error sys_statepointer",null);
                }
            }
        ],function(err,msg){
              if(!err){
                  t.commit();
                  cb(null,ordercode);
              }
              else{
                  t.rollback();
                  myLogger.error("generateOrderCode [ordercode]: "+logErr(err));
                  cb(err,null);
              }
        })
    })
}

//生成订单编码(请求master node)
exports.generateOrderCode2=function(isonline,isreturn,cb){
    var config=objectUtil.clone(masterConfig);
    config.path="/orders/generateOrderCode?isonline="+isonline+"&isreturn="+isreturn;
    config.method="get";

    myLogger.trace("generateOrderCode [config]: "+JSON.stringify(config));

    httpsRequest(config,function(err,msg){
        if(err){
            cb(err,null);
        }
        else{
            msg=eval("("+msg+")");
            if(msg.status){
                cb(null,msg.data);
            }
            else{
                cb(msg.data,null);
            }
        }
    });
}

//生成订单明细编码
exports.generateContentCode = function (ordercode, i) {
    var contentcode = ordercode ;
	//+ stringUtil.autoComple((Math.floor(Math.random() * 100000)), 5, '0');
    contentcode += stringUtil.autoComple(i, 3,'0');
    return contentcode;
}

//开单时根据itemcode和countercode获取该商品的相应信息
exports.getInfoByCounterSku=function(countercode,itemcode,cb){
    var obj={ITEMCODE:itemcode};
    async.series([
        function(cb){
            //获取单价
            mec_itm_storeitemDAO.queryOne({
                attributes:["STORETEMPPRICE","PROMOTIONMARK","STORESALESTATE"],
                where:{ITEMCODE:itemcode,COUNTERCODE:countercode}
            },function(err,msg){
                if(!err){
                    if(msg){
                        if(msg.STORESALESTATE!=0) cb("该商品已经下架",null);
                        obj.STORESALESTATE=msg.STORESALESTATE;
                        obj.STORETEMPPRICE=msg.STORETEMPPRICE;
                        obj.PROMOTIONMARK = msg.PROMOTIONMARK;
                        cb(null,msg);
                    }
                    else{
                        cb("unfound itemcode-countercode","warn");
                    }
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            //获取商品名称和品牌编码
            mec_itm_itemDAO.queryOne({attributes:["ITEMNAME","BRANDCODE","ISCONSIDERSTOCK","ITEMCODETYPE"],where:{ITEMCODE:itemcode}},function(err,msg){
                if(!err){
                    if(msg){
                        obj.ITEMNAME=msg.ITEMNAME;
                        obj.BRANDCODE=msg.BRANDCODE;
                        obj.ISCONSIDERSTOCK=msg.ISCONSIDERSTOCK;
                        obj.ITEMCODETYPE = msg.ITEMCODETYPE;
                        cb(null,msg);
                    }
                    else{
                        cb("unfound itemcode","warn");
                    }
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            //获取品牌名称
            hct_brandDAO.queryOne({attributes:["BRANDNAME"],where:{BRANDCODE:obj.BRANDCODE}},function(err,msg){
                if(!err){
                    if(msg){
                        obj.BRANDNAME=msg.BRANDNAME;
                    }
                    cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            //获取商品skc编码,颜色,尺寸
            if(obj.ISCONSIDERSTOCK==1){
                mec_vi_counter_skc_stockDAO.queryAll({where:{COUNTERCODE:countercode,ITEMCODE:itemcode}},function(err,msg){
                    if(!err){
                        obj.SKCS=msg;
                        cb(null,msg);
                    }
                    else{
                        cb(err,null);
                    }
                })
            }
            else{
                cb(null,"unconsiderstock");
            }
        }
    ],function(err,msg){
        if(!err){
            myLogger.trace("getInfoByCounterSku [final obj]: "+JSON.stringify(obj));
            cb(null,obj);
        }
        else{
            myLogger.error("getInfoByCounterSku [series.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//开单时根据skccode和countercode获取该商品的相应信息
exports.getInfoByCounterSkc=function(countercode,skccode,cb){

    mec_vi_offline_selling_counter_skc_totalDAO.queryOne({where:{MERCHANTSKCCODE:skccode,COUNTERCODE:countercode}},function(err,msg){
        myLogger.trace("getInfoByCounterSkc [mec_vi_offline_selling_skc_totalDAO queryOne]: " + JSON.stringify(msg));
        if(!err){
            if(msg){
                if(msg.STORESALESTATE != 0)
                    cb("该商品已经下架",null);
                else
                    cb(null,msg);
            }
            else{
                cb("此柜没有该商品","warn");
            }
        }
        else{
            myLogger.trace("getInfoByCounterSkc [mec_vi_offline_selling_skc_totalDAO queryOne]: " + logErr(err));
            cb(err,null);
        }
    });


//    var obj={MERCHANTSKCCODE:skccode};
//    async.series([
//        function(cb){
//            //获取商品编码,颜色,尺寸
//            mec_itm_skcDAO.queryOne({where:{MERCHANTSKCCODE:skccode}},function(err,msg){
//                if(!err){
//                    if(msg){
//                        obj.SKCCODE=msg.SKCCODE;
//                        obj.COLOR=msg.COLOR;
//                        obj.SIZE=msg.SIZE;
//                        obj.ITEMCODE=msg.ITEMCODE;
//                        cb(null,msg);
//                    }
//                    else{
//                        cb("供应商SKC码不存在","warn");
//                    }
//                }
//                else{
//                    cb(err,null);
//                }
//            })
//        },
//        function(cb){
//            //获取单价
//            mec_itm_storeitemDAO.queryOne({
//                attributes:["PROMOTIONMARK","STORECHECKEDPRICE","STORETEMPPRICE","STORESALESTATE"],
//                where:{ITEMCODE:obj.ITEMCODE,COUNTERCODE:countercode}
//            },function(err,msg){
//                if(!err){
//                    if(msg){
//                        if(msg.STORESALESTATE!=0) cb("该商品已经下架",null);
//                        obj.PROMOTIONMARK=msg.PROMOTIONMARK;
//                        obj.STORECHECKEDPRICE=msg.STORECHECKEDPRICE;
//                        obj.STORETEMPPRICE=msg.STORETEMPPRICE;
//                        obj.STORESALESTATE=msg.STORESALESTATE;
//                        cb(null,msg);
//                    }
//                    else{
//                        cb("商品不属于此柜，禁止销售","warn");
//                    }
//                }
//                else{
//                    cb(err,null);
//                }
//            })
//        },
//        function(cb){
//            //获取商品名称和品牌编码
//            mec_itm_itemDAO.queryOne({attributes:["ITEMNAME","BRANDCODE"],where:{ITEMCODE:obj.ITEMCODE}},function(err,msg){
//                if(!err){
//                    if(msg){
//                        obj.ITEMNAME=msg.ITEMNAME;
//                        obj.BRANDCODE=msg.BRANDCODE;
//                        cb(null,msg);
//                    }
//                    else{
//                        cb("查询商品信息失败","warn");
//                    }
//                }
//                else{
//                    cb(err,null);
//                }
//            })
//        },
//        function(cb){
//            //获取品牌名称
//            hct_brandDAO.queryOne({attributes:["BRANDNAME"],where:{BRANDCODE:obj.BRANDCODE}},function(err,msg){
//                if(!err){
//                    if(msg){
//                        obj.BRANDNAME=msg.BRANDNAME;
//                    }
//                    cb(null,msg);
//                }
//                else{
//                    cb(err,null);
//                }
//            })
//        }
//    ],function(err,msg){
//        if(!err){
//            myLogger.trace("getInfoByCounterSkc [final obj]: "+JSON.stringify(obj));
//            cb(null,obj);
//        }
//        else{
//            myLogger.error("getInfoByCounterSkc [series.err]: "+logErr(err));
//            cb(err,null);
//        }
//    })
}

//开单时获取用户的账户根据用户的手机号
exports.getUsercodeByTelephone=function(telephone,cb){
    mec_ctm_customerDAO.queryOne({attributes:["USERCODE"],where:{TELEPHONE:telephone}},cb);
}

//开单时根据用户的手机号查询vipcode进而得到vipinfo
exports.getVipinfoByTelephone=function(telephone,cb){
    mec_ctm_customerDAO.queryOne({attributes:["VIPCODE"],where:{TELEPHONE:telephone}},function(err,msg){
        if (!err){
            if(!msg) {
                myLogger.warn("getVipinfoByTelephone [mec_ctm_customerDAO.queryOne]: unfound user of TEL."+telephone)
                cb("unfound user of TEL."+telephone, null);
                return;
            }
            var vipcode=msg.VIPCODE;
            mis.getVIPInfo(vipcode,function (err, msg) {
                if (!err){
                    myLogger.trace("getVipinfoByTelephone [vipinfo obj]: "+JSON.stringify(msg));
                    cb(null,msg);
                }else{
                    myLogger.error("getVipinfoByTelephone [mis.getVIPInfo2]: "+logErr(err));
                    cb(err,null);
                }
            });
        }else{
            myLogger.error("getVipinfoByTelephone [customerDAO.queryOne]: "+logErr(err));
            cb(err,null);
        }
    });
}

//更新过期线下订单
exports.updateOfflineOrderOverdue=function(cb){
    //TODO 跟踪订单状态
    mec_buy_offlineorderDAO.update({ORDERSTATE:11},{
        ORDERSTATE:0,
        createdAt:{
            lt: dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime})
        }
    },cb);
}

//更新过期线上订单
exports.updateOnlineOrderOverdue=function(cb){
    //TODO 跟踪订单状态
    mec_buy_onlineorderDAO.update({ORDERSTATE:11},{
        ORDERSTATE:1,
        createdAt:{
            lt: dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime})
        }
    },cb);
}

//查询订单地址信息
exports.getSiteInfoByOrder=function(isonline,ordercode,cb){
    var orderdao=isonline?mec_buy_onlineorderDAO:mec_buy_offlineorderDAO;
    var where={};
    if(isonline) where.ONLINEORDERCODE=ordercode;
    else where.OFFLINEORDERCODE=ordercode;

    async.waterfall([
        function(cb){
            orderdao.queryOne({attributes:["SITEID"],where:where},cb);
        },
        function(x,cb){
            if(x && x.SITEID){
                mec_ctm_siteDAO.queryOne({where:{SITEID: x.SITEID}},cb)
            }
            else{
                myLogger.warn("getSiteInfoByOrder [orderdao.queryOne]: "+"no siteinfo of this order")
                cb(null,null);
            }
        }
    ],function(err,msg){
        if(!err){
            myLogger.trace("getSiteInfoByOrder [mec_ctm_siteDAO.queryOne]: "+JSON.stringify(msg));
            cb(null,msg);
        }
        else{
            myLogger.error("getSiteInfoByOrder [waterfall.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//退货时根据pos条号码搜索订单明细信息
exports.getOrderInfoWhenReturn=function(postranscode,storecode,cb){
    mec_vi_ret_returnable_contentinfoDAO.queryAll({where:{POSTRANSCODE:postranscode,STORECODE:storecode}},function(err,msg){
        if (!err){
            myLogger.trace("getOrderInfoWhenReturn [mec_vi_ret_returnable_contentinfoDAO.queryAll]: "+JSON.stringify(msg));
            cb(null,msg);

        }else{
            myLogger.error("getOrderInfoWhenReturn [mec_vi_ret_returnable_contentinfoDAO.queryAll]: "+logErr(err));
            cb(err,null);
        }
    });
}

//通过pos条开线下退货订单，这时一个pos条可以对应多个线下退货订单
exports.placeOfflineReturnOrderByPos = function (usercode,orderinfo, contentinfoArray, cb) {
    //TODO 跟踪订单状态
    //检查countercode和assistantid不准为空,配送时地址不允许为空
    //    if (!orderinfo.COUNTERCODE && orderinfo.COUNTERCODE!=0) {
    //        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound countercode");
    //        cb("unfound countercode", null);
    //        return;
    //    }
    //    if (!orderinfo.SALESMANCODE && orderinfo.SALESMANCODE!=0) {
    //        myLogger.error("placeOfflineOrder [Check Params]: "+"unfound assistandid");
    //        cb("unfound assistandid", null);
    //        return;
    //    }

    //补充oderinfo
    if(!orderinfo.VIPCODE) orderinfo.VIPCODE=null;
    if(!orderinfo.TEMPDISTRIBUTIONMARK) orderinfo.TEMPDISTRIBUTIONMARK=0;
    if(!orderinfo.SHIPPRICE) orderinfo.SHIPPRICE=0;
    if(!orderinfo.REALSHIPPRICE) orderinfo.REALSHIPPRICE=0;
    if(!orderinfo.PACKING) orderinfo.PACKING=0;
    if(!orderinfo.REALPACKING) orderinfo.REALPACKING=0;

    orderinfo.PLACETIME=new Date();
    orderinfo.TIMEOUTTIME=dateUtil.getAheadDate({minute:businessSetting.paymentExpireTime*-1});
    orderinfo.DELIVERYMODE=0;
    orderinfo.PAYMENTSTATE=0;
    orderinfo.SALESMANCODE=usercode;
    orderinfo.RETUSERCODE=usercode;

    async.series([
        function (cb) {
            //生成订单编码,放入到orderinfo和contentinfo中,并为contentinfo生成contentcode
            exports.generateOrderCode(false,true, function (err, ordercode) {
                myLogger.trace("placeOfflineReturnOrderByPos [generateOrderCode.ordercode]: " + ordercode);
                if (!err) {
                    orderinfo.OFFLINEORDERCODE = ordercode;
                    var i=0;
                    for (var k = 0; k < contentinfoArray.length; k++) {
                        contentinfoArray[k].OFFLINEORDERCODE = ordercode;
                        contentinfoArray[k].OFFLINECONTENTCODE = exports.generateContentCode(ordercode, i + 1);
                        i++;
                    }
                    cb(null, ordercode);
                }
                else {
                    cb(err, null);
                }
            })
        },
        function (cb) {
            //contentinfoArray不符合格式，新建newcontentinfoArray以符合数据库的格式
            var newcontentinfoArray=[];
            for (var i=0;i<contentinfoArray.length;i++){
                var newcontentinfo={};
                newcontentinfo.OFFLINECONTENTCODE=contentinfoArray[i].OFFLINECONTENTCODE;
                newcontentinfo.OFFLINEORDERCODE=contentinfoArray[i].OFFLINEORDERCODE;
                newcontentinfo.ITEMCODE=contentinfoArray[i].ITEMCODE;
                newcontentinfo.COUNTERCODE=contentinfoArray[i].COUNTERCODE;
                newcontentinfo.SKCCODE=contentinfoArray[i].SKCCODE;
                newcontentinfo.UNITPRICE=contentinfoArray[i].UNITPRICE;
                newcontentinfo.NUM=contentinfoArray[i].RETURNNUM;
                newcontentinfo.RETAILAMT=contentinfoArray[i].RETURNAMT;
                newcontentinfo.ORIGINORDERCODE=contentinfoArray[i].ORDERCODE;
                newcontentinfo.ORIGINCONTENTCODE=contentinfoArray[i].CONTENTCODE;
                newcontentinfo.IFRETURN=1;
                newcontentinfo.PROMOTIONMARK="X";
                newcontentinfoArray.push(newcontentinfo);
            }
            console.log("############################################");
            console.log(orderinfo);
            console.log(newcontentinfoArray);
            console.log("############################################");

            //数据库操依次插入orderinfo,contentinfo
            sequelize.transaction(function (t) {
                async.series([
                    function (cb) {
                        //写入订单信息
                        myLogger.trace("placeOfflineOrder [orderinfo]: " + JSON.stringify(orderinfo));
                        mec_buy_offlineorderDAO.add(orderinfo, t, cb);
                    },
                    function (cb) {
                        //写入订单明细信息
                        async.forEach(newcontentinfoArray, function (contentinfo, cb) {
                            mec_buy_offlinecontentDAO.add(contentinfo, t, cb);
                        }, function (err) {
                            cb(err, null);
                        })
                    }
                ], function (err, msg) {
                    if (!err) {
                        myLogger.trace("placeOfflineReturnOrderByPos [mec_buy_offlineorderDAO.add]: " + JSON.stringify(msg[0]));
                        myLogger.trace("placeOfflineReturnOrderByPos [mec_buy_offlinecontentDAO.add]: " + JSON.stringify(msg[1]));
//                        console.log("!!!!!!!!!!!!!");
//                        console.log(JSON.stringify(msg));
                        t.commit();
                        cb(null, msg);
                    }
                    else {
                        myLogger.error("placeOfflineReturnOrderByPos [series.err]: " + logErr(err));
                        t.rollback();
                        cb(err, null);
                    }
                });
            });
        }
    ], cb);

}

//获取今日开出的线下退货单
exports.getOfflineReturnOrderPlacedToday = function(storecode,qry,options,cb){

        var rows = options.rows || 20;
        var page = options.page || 1;
        var sidx = options.sidx;
        var sord = options.sord || "asc";

        var offset = rows * (page - 1);
        var limit = rows;
        var order = sidx && (sidx + " " + sord);

        if (!qry &&  typeof (qry) != "number") {//代表搜索栏为空
            var where={STORECODE:storecode,IFRETURN:1,createdAt:{between:dateUtil.getTodayStartEnd()}};
            mec_buy_offlineorderDAO.queryAndCount({"where":where, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineReturnOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineReturnOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else if (typeof(qry) == 'object') {
            qry.COUNTERCODE=countercode;
            qry.createdAt={between:dateUtil.getTodayStartEnd()};
            qry.IFRETURN=1;
            mec_buy_offlineorderDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineReturnOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineReturnOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            //要模糊查询的所有列
            var qryFields = [
                "OFFLINEORDERCODE"

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
            qryOptions=sequelize.and(qryOptions,{STORECODE:storecode,IFRETURN:1,createdAt:{between:dateUtil.getTodayStartEnd()}});
            mec_buy_offlineorderDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
                if (!err) {
                    myLogger.trace("getOfflineReturnOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + (msg && msg.count));
                    cb(null, msg);
                }
                else {
                    myLogger.error("getOfflineReturnOrderPlacedToday [mec_buy_offlineorderDAO.queryAndCount]: " + logErr(err));
                    cb(err, null);
                }
            });
        }

}

//根据pos条号码获取退货单的支付明细信息
exports.getPayListWhenReturn=function(postranscode,storecode,cb){
    mec_vi_ret_returnable_paylistDAO.queryAll({where:{POSTRANSCODE:postranscode,STORECODE:storecode}},function(err,msg){
        if (!err){
            myLogger.trace("getPayListWhenReturn [mec_vi_ret_returnable_paylistDAO.queryAll]: "+JSON.stringify(msg));
            cb(null,msg);
        }else{
            myLogger.error("getPayListWhenReturn [mec_vi_ret_returnable_paylistDAO.queryAll]: "+logErr(err));
            cb(err,null);
        }
    });
}