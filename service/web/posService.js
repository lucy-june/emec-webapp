/**
 * Created by lucywu on 12/1/14.
 * pos机器相关服务(!!!安全性!!!)
 */

var myLogger = require('../../logging/contextLogger')("web/posService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var promotionService = require('./promotionService');
var mec_buy_onlineorderDAO = require('../../dao/mec_buy_onlineorderDAO');
var mec_buy_offlinegroupDAO = require('../../dao/mec_buy_offlinegroupDAO');
var mec_buy_offlineorderDAO = require('../../dao/mec_buy_offlineorderDAO');
var mec_buy_offlinecontentDAO = require('../../dao/mec_buy_offlinecontentDAO');
var mec_buy_onlinecontentDAO = require('../../dao/mec_buy_onlinecontentDAO');
var stringUtil = require('../../util/stringUtil');
var mec_vi_pos_orderinfoDAO = require("../../dao/mec_vi_pos_orderinfoDAO");
var mec_vi_pos_contentinfoDAO = require("../../dao/mec_vi_pos_contentinfoDAO");
var mec_vi_order_tagsDAO = require("../../dao/mec_vi_order_tagsDAO");
var mec_vi_pos_payprepareinfoDAO = require("../../dao/mec_vi_pos_payprepareinfoDAO");
var mec_vi_prm_order_content_paramsDAO = require("../../dao/mec_vi_prm_order_content_paramsDAO");
var mec_audit_discountDAO = require("../../dao/mec_audit_discountDAO");
var mec_audit_payDAO = require("../../dao/mec_audit_payDAO");
var mis = require("../../interaction/mis");
var engine = require("../../interaction/engine");
var numberUtil = require("../../util/numberUtil");
var dateUtil = require("../../util/dateUtil");
var mec_vi_paid_orderinfoDAO = require("../../dao/mec_vi_paid_orderinfoDAO");
var mec_vi_paid_contentinfoDAO = require("../../dao/mec_vi_paid_contentinfoDAO");
var mec_vi_paid_discountinfoDAO = require("../../dao/mec_vi_paid_discountinfoDAO");
var mec_vi_paid_chargeinfoDAO = require("../../dao/mec_vi_paid_chargeinfoDAO");
var mec_vi_paid_payinfoDAO = require("../../dao/mec_vi_paid_payinfoDAO");
var objectUtil = require("../../util/objectUtil");
var exhandler =  require("../../exception/exhandler");
var decimalUtil = require("../../util/decimalUtil");

/**
 * pos机获取订单信息
 * @param ordercode
 * @param 参见util/slale.order.proto
 */
exports.getOrderInfo = function (ordercode, cb) {
    var proto = {};

    async.parallel([
        function (cb) {
            mec_vi_pos_orderinfoDAO.queryOne({where: {ordercode: ordercode}}, function (err, msg) {
                if (!err) {
                    if (msg) {
                        proto.storecode=msg.storecode;
                        proto.salemancode = msg.salemancode;
                        proto.salemanname = msg.salemanname;
                        proto.vipcode = msg.vipcode && msg.vipcode.replace("00000000","");//vip卡号
                        proto.ifreturn = msg.ifreturn;
                        proto.ifonline = msg.ifonline;

                        mis.getVIPInfo(proto.vipcode, function (err, msg) {
                            if (!err&&msg) {
                                proto.score = msg.usableamt;
                                proto.isbirthday = (dateUtil.getNowDateStr() == msg.birthday)? 1:0;
                                proto.congealcredit = msg.preparativecongeal;
                                proto.cardname=msg.cardname;
                                proto.msg=msg.cardstate==4 ? "疑似卡":"无";
                                cb(null, msg);
                            }
                            else {
                                proto.score = 0;
                                proto.isbirthday = 0;
                                proto.congealcredit = 0;
                                proto.cardname='';
                                proto.msg='无';
                                proto.vipcode='';
                                myLogger.warn("getOrderInfo [mis.getVIPInfo]: unfound vipinfo "+logErr(err));
                                cb(null, null);
                            }
                        })

                    }
                    else {
                        cb("unfound this in unpaid order: " + ordercode, null);
                    }
                }
                else {
                    cb(err, null);
                }
            })
        },
        function (cb) {
            mec_vi_pos_contentinfoDAO.queryAll({where: {ordercode: ordercode}}, function (err, msg) {
                if (!err) {
                    var items = [];
                    for (var k = 0; k < msg.length; k++) {
                        var item = {};

                        item.itemcode = msg[k].itemcode;
                        item.cabinet = msg[k].cabinet;
                        item.unit = msg[k].unit;
                        item.promotioncode = msg[k].promotioncode;
                        item.itemname = msg[k].itemname;
                        item.count = msg[k].count;
                        item.oriprice = msg[k].oriprice;
                        item.discountprice = msg[k].discountprice;
                        item.discount = msg[k].discount;
                        item.actualprice = msg[k].actualprice;
                        item.totaloriprice=msg[k].totaloriprice;
                        item.handdiscount = msg[k].handdiscount;
                        item.merchantdiscount = msg[k].merchantdiscount;
                        items.push(item);
                    }
                    proto.items = items;
                    cb(null, msg);
                }
                else {
                    cb(err, null);
                }
            })
        }
    ], function (err, msg) {
        if (!err) {
            cb(null, proto);
        }
        else {
            myLogger.error("getOrderInfo [async.parallel]: " + logErr(err));
            cb(err, null);
        }
    })
}

/**
 * 支付前预处理(原支付预处理)
 * isonlineorder是否是线上订单
 * ordercodes是订单编码的数组
 * 其中的priceshare结构为:{OFFLINEGROUPCODE:?,FINALPRICE:?,FINALRULESTRING:?,ORDERS:?}
 * 其中ORDERS结构为:[{OFFLINEORDERCODE:?,FINALPRICE:?,FINALRULESTRING:?,CONTENTS:?},{},{}...]
 * 其中CONTENTS结构为:[{OFFLINECONTENTCODE:?,FINALPRICELIST:?,FINALRULELIST:?},{},{}...]
 * 返回的结果为:[type,ordercode/groupcode,finalprice,(priceshare)]
 * type=1单一线上单付款 type=0单一线下单付款 type=2线下单拼单付款
 */
exports.payPrepare2 = function (isonlineorder, ordercodes, cb) {
    if (isonlineorder) {//线上订单,只能单一订单付款,价格在下订单时已确定
        var ordercode = ordercodes[0];
        mec_buy_onlineorderDAO.queryOne({attributes: ["FINALPRICE"], where: {ONLINEORDERCODE: ordercode}}, function (err, msg) {
            if (!err) {
                if (msg) {
                    myLogger.trace("payPrepare [FINALPRICE]: " + msg.FINALPRICE);
                    cb(null, ['0', ordercode, msg.FINALPRICE]);
                }
                else {
                    cb("unknown onlineordercode", null);
                }
            }
            else {
                cb(err, null);
            }
        })
    }
    else if (!isonlineorder && ordercodes.length == 1) {//单一线下订单,价格在下订单时已确定
        var ordercode = ordercodes[0];
        mec_buy_offlineorderDAO.queryOne({attributes: ["FINALPRICE"], where: {OFFLINEORDERCODE: ordercode}}, function (err, msg) {
            if (!err) {
                if (msg) {
                    myLogger.trace("payPrepare [FINALPRICE]: " + msg.FINALPRICE);
                    cb(null, ['1', ordercode, msg.FINALPRICE]);
                }
                else {
                    cb("unknown offlineordercode", null);
                }
            }
            else {
                cb(err, null);
            }
        })
    }
    else {//拼单线下订单,需要过促销引擎
        async.waterfall([
            function (cb) {
                //查询订单对应的countercode
                var attributes = ["OFFLINEORDERCODE", "COUNTERCODE"];
                var where = {OFFLINEORDERCODE: {in: ordercodes}};
                mec_buy_offlineorderDAO.queryAll({attributes: attributes, where: where}, cb);
            },
            function (x, cb) {
                //查询订单明细
                var attributes = ["OFFLINECONTENTCODE", "OFFLINEORDERCODE", "ITEMCODE", "NUM"];
                var where = {OFFLINEORDERCODE: {in: ordercodes}};
                mec_buy_offlinecontentDAO.queryAll({attributes: attributes, where: where}, function (err, contents) {
                    if (!err) {
                        //将上一步等到的countercode加入到查询结果中
                        for (var k = 0; k < contents.length; k++) {
                            var content = contents[k];
                            for (var n = 0; n < x.length; n++) {
                                if (content.OFFLINEORDERCODE == x[n].OFFLINEORDERCODE) {
                                    content.COUNTERCODE = x[n].COUNTERCODE;
                                    break;
                                }
                            }
                        }
                        cb(null, contents);
                    }
                    else {
                        cb(err, null);
                    }
                });
            },
            function (x, cb) {
                myLogger.trace("payPrepare [mec_buy_offlinecontentDAO.queryAll]: " + JSON.stringify(x));
                promotionService.process2(false, x, function (err, msg) {
                    myLogger.trace("payPrepare [promotionService.process]: " + JSON.stringify(msg));
                    if (!err) {
                        //构建价格分摊明细
                        var priceshare = {};
                        priceshare.OFFLINEGROUPCODE = exports.generateGroupCode(ordercodes);
                        priceshare.ORDERS = [];

                        //计算group级别的总价格,规则字符串
                        var finalprice = 0;
                        var finalrulestring = {};
                        for (var k = 0; k < msg.length; k++) {
                            var finalpricelist = msg[k].FINALPRICELIST;
                            var finalrulelist = msg[k].FINALRULELIST;

                            //计算最终总价
                            for (var i = 0; i < finalpricelist.length; i++) {
                                var _price = finalpricelist[i].PRICE;
                                var _num = finalpricelist[i].NUM;
//                                finalprice += _price * _num;
                                finalprice=finalprice.add(_price.mul(_num));
                            }

                            //构建finalrulestring
                            var itemcode = x[k].ITEMCODE;
                            for (var j = 0; j < finalrulelist.length; j++) {
                                var _rule = finalrulelist[j]["RULE"];
                                var _num = finalrulelist[j].NUM;
                                if (!finalrulestring[_rule]) finalrulestring[_rule] = {};
                                if (!finalrulestring[_rule][itemcode]) finalrulestring[_rule][itemcode] = 0;
//                                finalrulestring[_rule][itemcode] = finalrulestring[_rule][itemcode] + _num;
                                finalrulestring[_rule][itemcode] = finalrulestring[_rule][itemcode].add(_num);
                            }
                        }
                        priceshare.FINALPRICE = finalprice;
                        priceshare.FINALRULESTRING = finalrulestring;
                        myLogger.trace("payPrepare [group finalprice]: " + finalprice);
                        myLogger.trace("payPrepare [group finalrulestring]: " + finalrulestring);

                        //将原始finalpricelist,finalrulelist划分给每个订单
                        var orderTemp = {};
                        for (var k = 0; k < x.length; k++) {
                            var ordercode = x[k].OFFLINEORDERCODE;
                            var contentcode = x[k].OFFLINECONTENTCODE;
                            msg[k].OFFLINECONTENTCODE = contentcode;
                            msg[k].index = k;
                            if (!orderTemp[ordercode]) orderTemp[ordercode] = [];
                            orderTemp[ordercode].push(msg[k]);
                        }

                        //对每个订单生成FINALPRICE,FINALRULESTRING
                        for (var n = 0; n < ordercodes.length; n++) {
                            var orderobj = {"CONTENTS": []};

                            var ordercode = ordercodes[n];
                            var contentTemp = orderTemp[ordercode];

                            var finalprice = 0;
                            var finalrulestring = {};
                            for (var k = 0; k < contentTemp.length; k++) {
                                var finalpricelist = contentTemp[k].FINALPRICELIST;
                                var finalrulelist = contentTemp[k].FINALRULELIST;
                                var index = contentTemp[k].index;
                                delete contentTemp[k].index;
                                //为每个订单中的contents添加一个content对象
                                orderobj["CONTENTS"].push(contentTemp[k]);

                                //计算最终总价
                                for (var i = 0; i < finalpricelist.length; i++) {
                                    var _price = finalpricelist[i].PRICE;
                                    var _num = finalpricelist[i].NUM;
//                                    finalprice += _price * _num;
                                    finalprice=finalprice.add(_price.mul(_num));
                                }

                                //构建finalrulestring
                                var itemcode = x[index].ITEMCODE;
                                for (var j = 0; j < finalrulelist.length; j++) {
                                    var _rule = finalrulelist[j]["RULE"];
                                    var _num = finalrulelist[j].NUM;
                                    if (!finalrulestring[_rule]) finalrulestring[_rule] = {};
                                    if (!finalrulestring[_rule][itemcode]) finalrulestring[_rule][itemcode] = 0;
//                                    finalrulestring[_rule][itemcode] = finalrulestring[_rule][itemcode] + _num;
                                    finalrulestring[_rule][itemcode] = finalrulestring[_rule][itemcode].add(_num);
                                }
                            }
                            orderobj.OFFLINEORDERCODE = ordercode;
                            orderobj.FINALPRICE = finalprice;
                            orderobj.FINALRULESTRING = finalrulestring;

                            priceshare.ORDERS.push(orderobj);
                        }

                        recordPriceshare(priceshare, function (err, msg) {
                            if (!err) {
                                cb(null, ['2', priceshare.OFFLINEGROUPCODE, priceshare.FINALPRICE, priceshare]);
                            }
                            else {
                                cb(err, null);
                            }
                        })
                    }
                    else {
                        cb(err, null);
                    }
                });
            }
        ], function (err, msg) {
            if (!err) {
                cb(null, msg);
            }
            else {
                myLogger.error("payPrepare [waterfall.err]: " + logErr(err));
                cb(err, null);
            }
        })
    }
}

/**
 * 支付前预处理(新支付预处理)
 * @param ordercodes是订单编码的数组
 * @param 参见util/sale.payprepare.proto
 */
exports.payPrepare = function (vipcode, ordercodes, cb) {
    var tags = [];
    //获取订单tags标志信息
    async.forEach(ordercodes, function (ordercode, cb) {
        mec_vi_order_tagsDAO.queryOne({where: {ORDERCODE: ordercode}}, function (err, msg) {
            if (!err) {
                if (msg) {
                    tags.push(msg);
                    cb(null, msg);
                }
                else {
                    cb("unfound this order: " + ordercode, null);
                }
            }
            else {
                cb(err, null);
            }
        })
    }, function (err) {
        if (err) {
            myLogger.error("payPrepare [async.forEach]: " + logErr(err));
            cb(err, null);
        }
        else {
            myLogger.trace("payPrepare [tags]: " + JSON.stringify(tags));
            if (tags.length == 1) {//单一订单
                if(ordercodes[0].charAt(0)=="0" || ordercodes[0].charAt(0)=="1"){
                    async.waterfall([
                        function (cb) {//获取过促销引擎所需要的参数
                            var params = null;
                            mec_vi_prm_order_content_paramsDAO.queryAll({where: {ordercode: {in: ordercodes}}}, function (err, msg) {
                                if (!err) {
                                    params = msg;
                                    async.forEach(params, function (entry, cb) {
                                        var itemcode = entry.itemcode;
                                        var countercode = entry.countercode;
                                        mis.getVIPDiscount(itemcode, countercode, vipcode, function (err, res) {
                                            if (!err&&res) {
                                                entry.viptype = res.cardtype;
                                                entry.vipdiscountrate = res.discount;
                                                cb(null, res);
                                            }
                                            else {
                                                entry.viptype = '00';
                                                entry.vipdiscountrate = 100;
                                                myLogger.warn("payPrepare [mis.getVIPDiscount]: unfound vipdiscount "+logErr(err));
                                                cb(null, null);
                                            }
                                        })
                                    }, function (err) {
                                        if (!err) {
                                            cb(null, params);
                                        }
                                        else {
                                            cb(err, null);
                                        }
                                    });
                                }
                                else {
                                    cb(err, null);
                                }
                            })
                        },
                        function (x, cb) {//过促销引擎并完成数据库写入操作
                            myLogger.trace("payPrepare [prm.params]: " + JSON.stringify(x));
                            engine.process(JSON.stringify(x), cb);//TODO
                        },
                        function (x, cb) {//根据促销引擎结果，做数据库写入处理，并构建proto结果
                            myLogger.trace("payPrepare [prm.return]: " + JSON.stringify(x));
                            x = eval("(" + x + ")");

                            //生成
//                            var groupinfo = {};
                            var orderinfo = [];
                            var contentinfo = [];
                            var discountinfo = [];

//                            //生成订单组号
//                            var groupcode = exports.generateGroupCode(ordercodes);
//                            myLogger.trace("payPrepare [groupcode]: " + groupcode);
//                            groupinfo = {OFFLINEGROUPCODE: groupcode, PAYMENTMODE: 0};

                            //补充orderinfo,contentinfo和discountinfo相关
                            for (var k = 0; k < x.length; k++) {
                                //补充orderinfo相关
                                var isfound = 0;
                                for (var n = 0; n < orderinfo.length; n++) {
                                    if (orderinfo[n].OFFLINEORDERCODE == x[k].ordercode) {
//                                        orderinfo[n].RECEIVABLEAMT += x[k].finalprice;
                                        orderinfo[n].RECEIVABLEAMT =orderinfo[n].RECEIVABLEAMT.add(x[k].finalprice);
                                        isfound = 1;
                                        break;
                                    }
                                }
                                if (isfound == 0) {
                                    orderinfo.push({
                                        OFFLINEORDERCODE: x[k].ordercode,
                                        OFFLINEGROUPCODE: null,
                                        RECEIVABLEAMT: x[k].finalprice
                                    });
                                }

                                //补充contentinfo相关
                                contentinfo.push({});
                                contentinfo[k].OFFLINEORDERCODE = x[k].ordercode;
                                contentinfo[k].OFFLINECONTENTCODE = x[k].contentcode;
                                contentinfo[k].REALVIPCARDTYPE = x[k].viptype;
                                contentinfo[k].REALVIPDISCOUNTRATE = x[k].vipdiscountrate;
                                contentinfo[k].RETAILAMT = x[k].finalprice;
                                contentinfo[k].VIPDISCOUNTAMT = x[k].finalvipdiscount;
                                contentinfo[k].VIPFLOORAMT = x[k].finalvipfloor;
                                contentinfo[k].DISCOUNTOUTAMT = x[k].finalreduce;
                                contentinfo[k].DISCOUNTINAMT = x[k].finalcoupon;
                                contentinfo[k].PRESENTSHAREQTY = x[k].finalgiftshare;
                                contentinfo[k].MERCHANTDISCOUTAMT = x[k].finalmerchantdiscount;

                                //补充discountinfo相关
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

                            async.parallel([
                                function (cb) {
                                    //获取新的vipinfo信息
                                    mis.getVIPInfo(vipcode, function (err, msg) {
                                        if (!err&&msg) {
                                            var vipcode = msg.vipcode;
                                            var cardno = msg.cardno;
                                            var cardtype = msg.cardtype;
                                            var vipdiscount = msg.vipdiscount;
                                            if (vipdiscount == 0) vipdiscount = 100;

                                            for (var k = 0; k < orderinfo.length; k++) {
                                                orderinfo[k].VIPCARDNO = cardno;
                                                orderinfo[k].VIPCODE = vipcode;
                                                orderinfo[k].VIPCARDTYPE = cardtype;
                                                orderinfo[k].VIPDISCOUNTRATE = vipdiscount;
                                            }
                                            cb(null, msg);
                                        }
                                        else {
                                            var vipcode = null;
                                            var cardno = null;
                                            var cardtype = null;
                                            var vipdiscount = null;

                                            for (var k = 0; k < orderinfo.length; k++) {
                                                orderinfo[k].VIPCARDNO = cardno;
                                                orderinfo[k].VIPCODE = vipcode;
                                                orderinfo[k].VIPCARDTYPE = cardtype;
                                                orderinfo[k].VIPDISCOUNTRATE = vipdiscount;
                                            }
                                            myLogger.warn("payPrepare [mis.getVIPInfo]: unfound vipinfo "+logErr(err));
                                            cb(null, null);
                                        }
                                    })
                                },
                                function (cb) {
                                    //获取订单的运费包装费信息
                                    async.forEach(ordercodes, function (ordercode, cb) {
                                        mec_buy_offlineorderDAO.queryOne({
                                            attributes: ["SHIPPRICE", "REALSHIPPRICE", "PACKING", "REALPACKING"],
                                            where: {OFFLINEORDERCODE: ordercode}
                                        }, function (err, msg) {
                                            if (!err) {
                                                if (msg) {
                                                    //补充contentinfo中的运费包装非分摊
                                                    var curorderinfo = null;
                                                    for (var k = 0; k < orderinfo.length; k++) {
                                                        if (orderinfo[k].OFFLINEORDERCODE == ordercode) {
                                                            curorderinfo = orderinfo[k];
                                                            break;
                                                        }
                                                    }

//                                                    var shipcharge = (msg.SHIPPRICE - msg.REALSHIPPRICE) || 0;
//                                                    var packcharge = (msg.PACKING - msg.REALPACKING) || 0;
                                                    var shipcharge = (msg.SHIPPRICE.sub(msg.REALSHIPPRICE)) || 0;
                                                    var packcharge = (msg.PACKING.sub(msg.REALPACKING)) || 0;
                                                    var remainshipcharge = shipcharge;
                                                    var remainpackcharge = packcharge;
                                                    var max_finalprice_index = 0;
                                                    for (var k = 0; k < x.length; k++) {
                                                        if (contentinfo[k].OFFLINEORDERCODE != ordercode) continue;
//                                                        contentinfo[k].SHIPPRICECHARGESHARE = Number(numberUtil.floor1(shipcharge * x[k].finalprice / curorderinfo.RECEIVABLEAMT));
//                                                        contentinfo[k].PACKINGCHARGESHARE = Number(numberUtil.floor1(packcharge * x[k].finalprice / curorderinfo.RECEIVABLEAMT));
//                                                        remainshipcharge -= contentinfo[k].SHIPPRICECHARGESHARE;
//                                                        remainpackcharge -= contentinfo[k].PACKINGCHARGESHARE;
                                                        contentinfo[k].SHIPPRICECHARGESHARE = Number(numberUtil.floor1(shipcharge.mul(x[k].finalprice.div(curorderinfo.RECEIVABLEAMT))));
                                                        contentinfo[k].PACKINGCHARGESHARE = Number(numberUtil.floor1(packcharge.mul(x[k].finalprice.div(curorderinfo.RECEIVABLEAMT))));
                                                        remainshipcharge = remainshipcharge.sub(contentinfo[k].SHIPPRICECHARGESHARE);
                                                        remainpackcharge = remainpackcharge.sub(contentinfo[k].PACKINGCHARGESHARE);
                                                        if (x[max_finalprice_index].finalprice < x[k].finalprice) max_finalprice_index = k;
                                                    }
//                                                    contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE = Number(contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE) + remainshipcharge;
//                                                    contentinfo[max_finalprice_index].PACKINGCHARGESHARE = Number(contentinfo[max_finalprice_index].PACKINGCHARGESHARE) + remainpackcharge;
                                                    contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE = (Number(contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE)).add(remainshipcharge);
                                                    contentinfo[max_finalprice_index].PACKINGCHARGESHARE = (Number(contentinfo[max_finalprice_index].PACKINGCHARGESHARE)).add(remainpackcharge);

                                                    cb(null, msg);
                                                }
                                                else {
                                                    cb("unfound this order " + ordercode, null);
                                                }
                                            }
                                            else {
                                                cb(err, null);
                                            }
                                        })
                                    }, cb)
                                }
                            ], function (err, msg) {
                                if (!err) {
//                                    myLogger.trace("payPrepare [groupinfo]: " + JSON.stringify(groupinfo));
                                    myLogger.trace("payPrepare [orderinfo]: " + JSON.stringify(orderinfo));
                                    myLogger.trace("payPrepare [contentinfo]: " + JSON.stringify(contentinfo));
                                    myLogger.trace("payPrepare [discountinfo]: " + JSON.stringify(discountinfo));

                                    sequelize.transaction(function (t) {
                                        async.series([
//                                            function (cb) {
//                                                mec_buy_offlinegroupDAO.add(groupinfo, t, cb)
//                                            },
                                            function (cb) {
                                                async.forEach(orderinfo, function (order, cb) {
                                                    mec_buy_offlineorderDAO.update(order, {OFFLINEORDERCODE: order.OFFLINEORDERCODE}, t, cb);
                                                }, cb);
                                            },
                                            function (cb) {
                                                async.forEach(contentinfo, function (content, cb) {
                                                    mec_buy_offlinecontentDAO.update(content, {OFFLINECONTENTCODE: content.OFFLINECONTENTCODE}, t, cb);
                                                }, cb);
                                            },
//                                            function(cb){
//                                                mec_audit_discountDAO.del({ORDERCODE:ordercodes[0]},t,cb);
//                                            },
                                            function (cb) {
                                                async.forEach(discountinfo, function (discount, cb) {
                                                    mec_audit_discountDAO.update(discount, {CONTENTCODE: discount.CONTENTCODE},t, cb);
                                                }, cb);
                                            }
                                        ], function (err, msg) {
                                            if (!err) {
                                                var proto = {totalpay: 0, actualtotalpay: 0, orderorgroupcode: ordercodes[0], paylists: []};
                                                for(var s=0;s<ordercodes.length;s++){
                                                    var od=ordercodes[s];

                                                }
                                                for (var k = 0; k < x.length; k++) {
                                                    var entry = {};
                                                    entry.itemcode = x[k].itemcode;
                                                    entry.amount = x[k].num;
//                                                    entry.vipdiscount = x[k].finalvipdiscount + x[k].finalvipfloor;
                                                    entry.vipdiscount = x[k].finalvipdiscount.add(x[k].finalvipfloor);
                                                    entry.handdiscount = x[k].finalmanual;
                                                    entry.promotiondiscount = x[k].finalreduce;
                                                    entry.vipcardtype = x[k].viptype;
                                                    entry.vipdiscountstr = x[k].vipdiscountrate + "";
                                                    entry.merchantdiscount = x[k].finalmerchantdiscount;
                                                    proto.paylists.push(entry);
//                                                    proto.actualtotalpay += x[k].finalprice;
//                                                    proto.totalpay += x[k].origintotalprice;
                                                    proto.actualtotalpay =proto.actualtotalpay.add(x[k].finalprice);
                                                    proto.totalpay = proto.totalpay.add(x[k].origintotalprice);
                                                }
                                                t.commit();
                                                cb(null, proto);
                                            }
                                            else {
                                                t.rollback();
                                                cb(err, null);
                                            }
                                        });
                                    });
                                }
                                else {
                                    cb(err, null);
                                }
                            })
                        }
                    ], function (err, msg) {
                        if (!err) {
                            myLogger.trace("payPrepare [proto]: " + JSON.stringify(msg));
                            cb(null, msg);
                        }
                        else {
                            myLogger.error("payPrepare [async.waterfall]: " + logErr(err));
                            cb(err, null);
                        }
                    })
                }
                else{ //单一退货单
                    mec_vi_pos_payprepareinfoDAO.queryAll({where: {ordercode: ordercodes[0]}}, function (err, msg) {
                        if (!err) {
                            var proto = {totalpay: 0, actualtotalpay: 0, orderorgroupcode: ordercodes[0], paylists: []};
                            for (var k = 0; k < msg.length; k++) {
                                var entry = {};
                                if(tags[0].IFRETURN==0){//单个普通订单
                                    entry.itemcode = msg[k].itemcode;
                                    entry.amount = msg[k].amount;
                                    entry.vipdiscount = msg[k].vipdiscount;
                                    entry.handdiscount = msg[k].handdiscount;
                                    entry.promotiondiscount = msg[k].promotiondiscount;
                                    entry.merchantdiscount = msg[k].merchantdiscount;
                                    entry.vipcardtype = msg[k].vipcardtype;
                                    entry.vipdiscountstr = msg[k].vipdiscountstr;
                                }
                                else{//单个退货订单
                                    entry.itemcode = msg[k].itemcode;
                                    entry.amount = msg[k].amount;
                                    entry.vipdiscount = 0;
                                    entry.handdiscount = 0;
                                    entry.promotiondiscount = 0;
                                    entry.merchantdiscount = 0;
                                    entry.vipcardtype = '';
                                    entry.vipdiscountstr = '';
                                }

                                proto.paylists.push(entry);
//                                proto.actualtotalpay += msg[k].retailamt;
//                                proto.totalpay+= msg[k].retailamt;
//                                proto.totalpay += msg[k].unitprice * msg[k].amount;

                                proto.actualtotalpay =proto.actualtotalpay.add(msg[k].retailamt);
                                proto.totalpay=proto.totalpay.add(msg[k].retailamt);//退货单totalpay和actualtotalpay一样
                            }
                            myLogger.trace("payPrepare [proto]: " + JSON.stringify(proto));
                            cb(null, proto);
                        }
                        else {
                            myLogger.error("payPrepare [mec_vi_pos_payprepareinfoDAO.queryAll]: " + logErr(err));
                            cb(err, null);
                        }
                    })
                }
//                if(tags[0].IFRETURN==0){//单个普通订单
//                    mec_vi_pos_payprepareinfoDAO.queryAll({where:{ordercode:ordercodes[0]}},function(err,msg){
//                          if(!err){
//                              var proto={totalpay:0,actualtotalpay:0,orderorgroupcode:ordercodes[0],paylists:[]};
//                              for(var k=0;k<msg.length;k++){
//                                  var entry={};
//                                  entry.itemcode = msg[k].itemcode;
//                                  entry.amount = msg[k].amount;
//                                  entry.vipdiscount = msg[k].vipdiscount;
//                                  entry.handdiscount = msg[k].handdiscount;
//                                  entry.promotiondiscount = msg[k].promotiondiscount;
//                                  entry.vipcardtype = msg[k].vipcardtype;
//                                  entry.vipdiscountstr = msg[k].vipdiscountstr;
//
//                                  proto.paylists.push(entry);
//                                  proto.actualtotalpay+=msg[k].retailamt;
//                                  proto.totalpay+=msg[k].unitprice*msg[k].amount;
//                              }
//                              myLogger.trace("payPrepare [proto]: "+JSON.stringify(proto));
//                              cb(null,proto);
//                          }
//                          else{
//                              myLogger.error("payPrepare [mec_vi_pos_payprepareinfoDAO.queryAll]: "+logErr(err));
//                              cb(err,null);
//                          }
//                    })
//                }
//                else{//单个退货订单
//                    mec_vi_pos_payprepareinfoDAO.queryAll({where:{ordercode:ordercodes[0]}},function(err,msg){
//                        if(!err){
//                            var proto={totalpay:0,actualtotalpay:0,orderorgroupcode:ordercodes[0],paylists:[]};
//                            for(var k=0;k<msg.length;k++){
//                                proto.actualtotalpay+=msg[0].retailamt;
//                                proto.totalpay+=msg[0].unitprice*msg[0].amount;
//                            }
//                            myLogger.trace("payPrepare [proto]: "+JSON.stringify(proto));
//                            cb(null,proto);
//                        }
//                        else{
//                            myLogger.error("payPrepare [mec_vi_pos_payprepareinfoDAO.queryAll]: "+logErr(err));
//                            cb(err,null);
//                        }
//                    })
//                }
            }
            else {//多个订单
                var isonlineorder = tags[0].ISONLINEORDER;
                var ifreturn = tags[0].IFRETURN;
                var storecode=tags[0].STORECODE;
                //遍历订单的isonlineorder和ifreturn标志
                for (var k = 1; k < tags.length; k++) {
                    if (tags[k].ISONLINEORDER != isonlineorder) {
                        myLogger.error("payPrepare [check tags]: isonlineorder tag not agreed");
                        cb("isonlineorder tag not agreed", null);//是否线上标识不一致
                        return;
                    }
                    if (tags[k].IFRETURN != ifreturn) {
                        myLogger.error("payPrepare [check tags]: ifreturn tag not agreed");
                        cb("ifreturn tag not agreed", null);//是否进退货标识不一致
                        return;
                    }
                    if (tags[k].STORECODE != storecode) {
                        myLogger.error("payPrepare [check tags]: storecode tag not agreed");
                        cb("storecode tag not agreed", null);//门店标识不一致
                        return;
                    }
                }
                if (isonlineorder == 1) {//多个线上订单，不允许拼单
                    myLogger.error("payPrepare [check tags]: mutiple onlineorder");
                    cb("mutiple onlineorder", null);
                    return;
                }
                if (ifreturn == 1) {//多个线下退货单
                    async.waterfall([
                        function (cb) {//获取过促销引擎所需要的参数
                            var params = null;
                            mec_vi_prm_order_content_paramsDAO.queryAll({where: {ordercode: {in: ordercodes}}}, function (err, msg) {
                                if (!err) {
                                    params = msg;
                                    async.forEach(params, function (entry, cb) {
                                        var itemcode = entry.itemcode;
                                        var countercode = entry.countercode;
                                        mis.getVIPDiscount(itemcode, countercode, vipcode, function (err, res) {
                                            if (!err&&res) {
                                                entry.viptype = res.cardtype;
                                                entry.vipdiscountrate = res.discount;
                                                cb(null, res);
                                            }
                                            else {
                                                entry.viptype = '00';
                                                entry.vipdiscountrate = 100;
                                                myLogger.warn("payPrepare [mis.getVIPDiscount]: unfound vipdiscount "+logErr(err));
                                                cb(null, null);
                                            }
                                        })
                                    }, function (err) {
                                        if (!err) {
                                            cb(null, params);
                                        }
                                        else {
                                            cb(err, null);
                                        }
                                    });
                                }
                                else {
                                    cb(err, null);
                                }
                            })
                        },
                        function (x, cb) {//做数据库写入处理，并构建proto结果
                            myLogger.trace("payPrepare [mec_vi_prm_order_content_paramsDAO.queryAll]: " + JSON.stringify(x));
                            var groupcode = exports.generateGroupCode(ordercodes);
                            myLogger.trace("payPrepare [groupcode]: " + groupcode);
                            groupinfo = {OFFLINEGROUPCODE: groupcode, PAYMENTMODE: 0, IFRETURN: 1,STORECODE:storecode};

                            sequelize.transaction(function (t) {
                                async.series([
                                    function (cb) {
                                        mec_buy_offlinegroupDAO.add(groupinfo, t, cb)
                                    },
                                    function (cb) {
                                        async.forEach(ordercodes,function(ordercode,cb){
                                            var grouplistid=ordercodes.indexOf(ordercode);
                                            mec_buy_offlineorderDAO.update({OFFLINEGROUPCODE: groupcode,GROUPLISTID:grouplistid}, {OFFLINEORDERCODE: ordercode}, t, cb);
                                        },function(err){
                                            cb(err,null);
                                        });
                                    }
                                ], function (err, msg) {
                                    if (!err) {
                                        var proto = {totalpay: 0, actualtotalpay: 0, orderorgroupcode: groupcode, paylists: []};
                                        async.forEachSeries(ordercodes,function(ordercode,cb){
                                            mec_buy_offlinecontentDAO.queryAll({
                                                attributes: ["UNITPRICE", "RETAILAMT"],
                                                where: {OFFLINEORDERCODE: ordercode},
                                                order: "OFFLINECONTENTCODE"
                                            }, function (err, msg) {
                                                if (!err) {
                                                    for (var k = 0; k < msg.length; k++) {
                                                        var entry = {};
                                                        entry.itemcode = x[k].itemcode;
                                                        entry.amount = x[k].num;
                                                        entry.vipdiscount = 0;
                                                        entry.handdiscount = 0;
                                                        entry.promotiondiscount = 0;
                                                        entry.vipcardtype = '';
                                                        entry.vipdiscountstr = '';
                                                        entry.merchantdiscount = 0;
                                                        proto.paylists.push(entry);
//                                                        proto.totalpay += msg[k].UNITPRICE;
//                                                        proto.totalpay += msg[k].RETAILAMT;
//                                                        proto.actualtotalpay += msg[k].RETAILAMT;

                                                        proto.totalpay =proto.totalpay.add(msg[k].RETAILAMT);//退货单totalpay和actualtotalpay一样的
                                                        proto.actualtotalpay=proto.actualtotalpay.add(msg[k].RETAILAMT);
                                                    }
                                                    cb(null, null);
                                                }
                                                else {
                                                    cb(err, null);
                                                }
                                            });
                                        },function(err){
                                            if(!err){
                                                t.commit();
                                                cb(null, proto);
                                            }
                                            else{
                                                t.rollback();
                                                cb(err, null);
                                            }
                                        })
                                    }
                                    else {
                                        t.rollback();
                                        cb(err, null);
                                    }
                                });
                            });
                        }
                    ], function (err, msg) {
                        if (!err) {
                            myLogger.trace("payPrepare [proto]: " + JSON.stringify(msg));
                            cb(null, msg);
                        }
                        else {
                            myLogger.error("payPrepare [async.waterfall]: " + logErr(err));
                            cb(err, null);
                        }
                    })
//                    var groupcode=exports.generateGroupCode(ordercodes);
//                    myLogger.trace("payPrepare [groupcode]: "+groupcode);
//                    groupinfo={OFFLINEGROUPCODE:groupcode,PAYMENTMODE:0,IFRETURN:1};
//
//                    sequelize.transaction(function(t){
//                        async.series([
//                            function(cb){
//                                mec_buy_offlinegroupDAO.add(groupinfo,t,cb)
//                            },
//                            function(cb){
//                                mec_buy_offlineorderDAO.update({OFFLINEGROUPCODE:groupcode},{OFFLINEORDERCODE:{in:ordercodes}},t,cb);
//                            }
//                        ],function(err,msg){
//                            if(!err){
//                                var proto={totalpay:0,actualtotalpay:0,orderorgroupcode:groupcode,paylists:[]};
//                                mec_buy_offlinecontentDAO.queryAll({
//                                    attributes:["UNITPRICE","RETAILAMT"],
//                                    where:{OFFLINEORDERCODE:{in:ordercodes}}
//                                    },function(err,msg){
//                                    if(!err){
//                                        for(var k=0;k<msg.length;k++){
//                                            proto.totalpay+=msg[k].UNITPRICE;
//                                            proto.actualtotalpay+=msg[k].RETAILAMT;
//                                        }
//                                        t.commit();
//                                        cb(null,proto);
//                                    }
//                                    else{
//                                        cb(err,null);
//                                    }
//                                });
//                            }
//                            else{
//                                t.rollback();
//                                cb(err,null);
//                            }
//                        });
//                    });
                }
                else {//多个线下普通订单
                    async.waterfall([
                        function (cb) {//获取过促销引擎所需要的参数
                            var _params = [];
                            async.forEachSeries(ordercodes,function(ordercode,cb){
                                mec_vi_prm_order_content_paramsDAO.queryAll({where: {ordercode: ordercode}}, function (err, msg) {
                                        if (!err) {
                                        var params = msg;
                                        async.forEach(params, function (entry, cb) {
                                            var itemcode = entry.itemcode;
                                            var countercode = entry.countercode;
                                            mis.getVIPDiscount(itemcode, countercode, vipcode, function (err, res) {
                                                if (!err&&res) {
                                                    entry.viptype = res.cardtype;
                                                    entry.vipdiscountrate = res.discount;
                                                    cb(null, res);
                                                }
                                                else {
                                                    entry.viptype = '00';
                                                    entry.vipdiscountrate = 100;
                                                    myLogger.warn("payPrepare [mis.getVIPDiscount]: unfound vipdiscount "+logErr(err));
                                                    cb(null, null);
                                                }
                                            })
                                        }, function (err) {
                                            if (!err) {
                                                for(var k=0;k<params.length;k++) _params.push(params[k]);
                                                cb(null, null);
                                            }
                                            else {
                                                cb(err, null);
                                            }
                                        });
                                    }
                                    else {
                                        cb(err, null);
                                    }
                                })
                            },function(err){
                                if (!err) {
                                    cb(null, _params);
                                }
                                else {
                                    cb(err, null);
                                }
                            })
                        },
                        function (x, cb) {//过促销引擎并完成数据库写入操作
                            myLogger.trace("payPrepare [prm.params]: " + JSON.stringify(x));
                            engine.process(JSON.stringify(x), cb);//TODO 
                        },
                        function (x, cb) {//根据促销引擎结果，做数据库写入处理，并构建proto结果
                            myLogger.trace("payPrepare [prm.return]: " + JSON.stringify(x));
                            x = eval("(" + x + ")");

                            //生成
                            var groupinfo = {};
                            var orderinfo = [];
                            var contentinfo = [];
                            var discountinfo = [];

                            //生成订单组号
                            var groupcode = exports.generateGroupCode(ordercodes);
                            myLogger.trace("payPrepare [groupcode]: " + groupcode);
                            groupinfo = {OFFLINEGROUPCODE: groupcode, PAYMENTMODE: 0, STORECODE:storecode};

                            //补充orderinfo,contentinfo和discountinfo相关
                            for (var k = 0; k < x.length; k++) {
                                //补充orderinfo相关
                                var isfound = 0;
                                for (var n = 0; n < orderinfo.length; n++) {
                                    if (orderinfo[n].OFFLINEORDERCODE == x[k].ordercode) {
//                                        orderinfo[n].RECEIVABLEAMT2 += x[k].finalprice;
                                        orderinfo[n].RECEIVABLEAMT2 =orderinfo[n].RECEIVABLEAMT2.add(x[k].finalprice);
                                        isfound = 1;
                                        break;
                                    }
                                }
                                if (isfound == 0) {
                                    orderinfo.push({
                                        GROUPLISTID:ordercodes.indexOf(x[k].ordercode)+1,
                                        OFFLINEORDERCODE: x[k].ordercode,
                                        OFFLINEGROUPCODE: groupcode,
                                        RECEIVABLEAMT2: x[k].finalprice
                                    });
                                }

                                //补充contentinfo相关
                                contentinfo.push({});
                                contentinfo[k].OFFLINEORDERCODE = x[k].ordercode;
                                contentinfo[k].OFFLINECONTENTCODE = x[k].contentcode;
                                contentinfo[k].REALVIPCARDTYPE2 = x[k].viptype;
                                contentinfo[k].REALVIPDISCOUNTRATE2 = x[k].vipdiscountrate;
                                contentinfo[k].RETAILAMT2 = x[k].finalprice;
                                contentinfo[k].VIPDISCOUNTAMT2 = x[k].finalvipdiscount;
                                contentinfo[k].VIPFLOORAMT2 = x[k].finalvipfloor;
                                contentinfo[k].DISCOUNTOUTAMT2 = x[k].finalreduce;
                                contentinfo[k].DISCOUNTINAMT2 = x[k].finalcoupon;
                                contentinfo[k].PRESENTSHAREQTY2 = x[k].finalgiftshare;
                                contentinfo[k].MERCHANTDISCOUTAMT2 = x[k].finalmerchantdiscount;

                                //补充discountinfo相关
                                if(x[k].finalvipdiscount>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:1,DISCOUNTTYPE:0, DISCOUNTAMT:x[k].finalvipdiscount,VIPCARDTYPE:x[k].viptype});
                                if(x[k].finalvipfloor>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:2,DISCOUNTTYPE:0, DISCOUNTAMT:x[k].finalvipfloor,VIPCARDTYPE:x[k].viptype});
                                if(x[k].finalreduce>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:3,DISCOUNTTYPE:1, DISCOUNTAMT:x[k].finalreduce,VIPCARDTYPE:null});
                                if(x[k].finalcoupon>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:4,DISCOUNTTYPE:2, DISCOUNTAMT:x[k].finalcoupon,VIPCARDTYPE:null});
                                if(x[k].finalgiftshare>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:5,DISCOUNTTYPE:3, DISCOUNTAMT:x[k].finalgiftshare,VIPCARDTYPE:null})
                                if(x[k].finalmanual>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:7,DISCOUNTTYPE:4, DISCOUNTAMT:x[k].finalmanual,VIPCARDTYPE:null});
                                if(x[k].finalmerchantdiscount>0)
                                    discountinfo.push({ISONLINEORDER:0, GROUPCODE:groupcode, ORDERCODE:contentinfo[k].OFFLINEORDERCODE, CONTENTCODE:contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON:6,DISCOUNTTYPE:5, DISCOUNTAMT:x[k].finalmerchantdiscount,VIPCARDTYPE:null});

//                                if (x[k].finalvipdiscount > 0)
//                                    discountinfo.push({ISONLINEORDER: 0, GROUPCODE: groupcode, ORDERCODE: contentinfo[k].OFFLINEORDERCODE, CONTENTCODE: contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON: 1, DISCOUNTAMT: x[k].finalvipdiscount, VIPCARDTYPE: x[k].viptype});
//                                if (x[k].finalvipfloor > 0)
//                                    discountinfo.push({ISONLINEORDER: 0, GROUPCODE: groupcode, ORDERCODE: contentinfo[k].OFFLINEORDERCODE, CONTENTCODE: contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON: 2, DISCOUNTAMT: x[k].finalvipfloor, VIPCARDTYPE: x[k].viptype});
//                                if (x[k].finalreduce > 0)
//                                    discountinfo.push({ISONLINEORDER: 0, GROUPCODE: groupcode, ORDERCODE: contentinfo[k].OFFLINEORDERCODE, CONTENTCODE: contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON: 3, DISCOUNTAMT: x[k].finalreduce, VIPCARDTYPE: x[k].viptype});
//                                if (x[k].finalcoupon > 0)
//                                    discountinfo.push({ISONLINEORDER: 0, GROUPCODE: groupcode, ORDERCODE: contentinfo[k].OFFLINEORDERCODE, CONTENTCODE: contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON: 4, DISCOUNTAMT: x[k].finalcoupon, VIPCARDTYPE: x[k].viptype});
//                                if (x[k].finalgiftshare > 0)
//                                    discountinfo.push({ISONLINEORDER: 0, GROUPCODE: groupcode, ORDERCODE: contentinfo[k].OFFLINEORDERCODE, CONTENTCODE: contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON: 5, DISCOUNTAMT: x[k].finalgiftshare, VIPCARDTYPE: x[k].viptype});
//                                if (x[k].finalmerchantdiscount > 0)
//                                    discountinfo.push({ISONLINEORDER: 0, GROUPCODE: groupcode, ORDERCODE: contentinfo[k].OFFLINEORDERCODE, CONTENTCODE: contentinfo[k].OFFLINECONTENTCODE, DISCOUNTREASON: 6, DISCOUNTAMT: x[k].finalmerchantdiscount, VIPCARDTYPE: x[k].viptype});
                            }

                            async.parallel([
                                function (cb) {
                                    //获取新的vipinfo信息
                                    mis.getVIPInfo(vipcode, function (err, msg) {
                                        if (!err&&msg) {
                                                var vipcode = msg.vipcode;
                                                var cardno = msg.cardno;
                                                var cardtype = msg.cardtype;
                                                var vipdiscount = msg.vipdiscount;
                                                if (vipdiscount == 0) vipdiscount = 100;

                                                for (var k = 0; k < orderinfo.length; k++) {
                                                    orderinfo[k].VIPCARDNO2 = cardno;
                                                    orderinfo[k].VIPCODE2 = vipcode;
                                                    orderinfo[k].VIPCARDTYPE2 = cardtype;
                                                    orderinfo[k].VIPDISCOUNTRATE2 = vipdiscount;
                                                }
                                                cb(null, msg);
                                        }
                                        else {
                                            var vipcode = null;
                                            var cardno = null;
                                            var cardtype = null;
                                            var vipdiscount = null;

                                            for (var k = 0; k < orderinfo.length; k++) {
                                                orderinfo[k].VIPCARDNO2 = cardno;
                                                orderinfo[k].VIPCODE2 = vipcode;
                                                orderinfo[k].VIPCARDTYPE2 = cardtype;
                                                orderinfo[k].VIPDISCOUNTRATE2 = vipdiscount;
                                            }
                                            myLogger.warn("payPrepare [mis.getVIPInfo]: unfound vipinfo "+logErr(err));
                                            cb(null, null);
                                        }
                                    })
                                },
                                function (cb) {
                                    //获取订单的运费包装费信息
                                    async.forEach(ordercodes, function (ordercode, cb) {
                                        mec_buy_offlineorderDAO.queryOne({
                                            attributes: ["SHIPPRICE", "REALSHIPPRICE", "PACKING", "REALPACKING"],
                                            where: {OFFLINEORDERCODE: ordercode}
                                        }, function (err, msg) {
                                            if (!err) {
                                                if (msg) {
                                                    //补充contentinfo中的运费包装非分摊
                                                    var curorderinfo = null;
                                                    for (var k = 0; k < orderinfo.length; k++) {
                                                        if (orderinfo[k].OFFLINEORDERCODE == ordercode) {
                                                            curorderinfo = orderinfo[k];
                                                            break;
                                                        }
                                                    }

//                                                    var shipcharge = (msg.SHIPPRICE - msg.REALSHIPPRICE) || 0;
//                                                    var packcharge = (msg.PACKING - msg.REALPACKING) || 0;
                                                    var shipcharge = (msg.SHIPPRICE.sub(msg.REALSHIPPRICE)) || 0;
                                                    var packcharge = (msg.PACKING.sub(msg.REALPACKING)) || 0;
                                                    var remainshipcharge = shipcharge;
                                                    var remainpackcharge = packcharge;
                                                    var max_finalprice_index = 0;
                                                    for (var k = 0; k < x.length; k++) {
                                                        if (contentinfo[k].OFFLINEORDERCODE != ordercode) continue;
//                                                        contentinfo[k].SHIPPRICECHARGESHARE2 = Number(numberUtil.floor1(shipcharge * x[k].finalprice / curorderinfo.RECEIVABLEAMT2));
//                                                        contentinfo[k].PACKINGCHARGESHARE2 = Number(numberUtil.floor1(packcharge * x[k].finalprice / curorderinfo.RECEIVABLEAMT2));
//                                                        remainshipcharge -= contentinfo[k].SHIPPRICECHARGESHARE2;
//                                                        remainpackcharge -= contentinfo[k].PACKINGCHARGESHARE2;
                                                        contentinfo[k].SHIPPRICECHARGESHARE2 = Number(numberUtil.floor1(shipcharge.mul(x[k].finalprice.div(curorderinfo.RECEIVABLEAMT2))));
                                                        contentinfo[k].PACKINGCHARGESHARE2 = Number(numberUtil.floor1(packcharge.mul(x[k].finalprice.div(curorderinfo.RECEIVABLEAMT2))));
                                                        remainshipcharge = remainshipcharge.sub(contentinfo[k].SHIPPRICECHARGESHARE2);
                                                        remainpackcharge = remainpackcharge.sub(contentinfo[k].PACKINGCHARGESHARE2);
                                                        if (x[max_finalprice_index].finalprice < x[k].finalprice) max_finalprice_index = k;
                                                    }
//                                                    contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE2 = Number(contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE2) + remainshipcharge;
//                                                    contentinfo[max_finalprice_index].PACKINGCHARGESHARE2 = Number(contentinfo[max_finalprice_index].PACKINGCHARGESHARE2) + remainpackcharge;
                                                    contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE2 = (Number(contentinfo[max_finalprice_index].SHIPPRICECHARGESHARE2)).add(remainshipcharge);
                                                    contentinfo[max_finalprice_index].PACKINGCHARGESHARE2 = (Number(contentinfo[max_finalprice_index].PACKINGCHARGESHARE2)).add(remainpackcharge);

                                                    cb(null, msg);
                                                }
                                                else {
                                                    cb("unfound this order " + ordercode, null);
                                                }
                                            }
                                            else {
                                                cb(err, null);
                                            }
                                        })
                                    }, cb)
                                }
                            ], function (err, msg) {
                                if (!err) {
                                    myLogger.trace("payPrepare [groupinfo]: " + JSON.stringify(groupinfo));
                                    myLogger.trace("payPrepare [orderinfo]: " + JSON.stringify(orderinfo));
                                    myLogger.trace("payPrepare [contentinfo]: " + JSON.stringify(contentinfo));
                                    myLogger.trace("payPrepare [discountinfo]: " + JSON.stringify(discountinfo));

                                    sequelize.transaction(function (t) {
                                        async.series([
                                            function (cb) {
                                                mec_buy_offlinegroupDAO.add(groupinfo, t, cb)
                                            },
                                            function (cb) {
                                                async.forEach(orderinfo, function (order, cb) {
                                                    mec_buy_offlineorderDAO.update(order, {OFFLINEORDERCODE: order.OFFLINEORDERCODE}, t, cb);
                                                }, cb);
                                            },
                                            function (cb) {
                                                async.forEach(contentinfo, function (content, cb) {
                                                    mec_buy_offlinecontentDAO.update(content, {OFFLINECONTENTCODE: content.OFFLINECONTENTCODE}, t, cb);
                                                }, cb);
                                            },
                                            function (cb) {
                                                async.forEach(discountinfo, function (discount, cb) {
                                                    mec_audit_discountDAO.update(discount,{CONTENTCODE: discount.CONTENTCODE}, t, cb);
                                                }, cb);
                                            }
                                        ], function (err, msg) {
                                            if (!err) {
                                                var proto = {totalpay: 0, actualtotalpay: 0, orderorgroupcode: groupcode, paylists: []};
                                                for(var s=0;s<ordercodes.length;s++){
                                                    var od=ordercodes[s];

                                                }
                                                for (var k = 0; k < x.length; k++) {
                                                    var entry = {};
                                                    entry.itemcode = x[k].itemcode;
                                                    entry.amount = x[k].num;
//                                                    entry.vipdiscount = x[k].finalvipdiscount + x[k].finalvipfloor;
                                                    entry.vipdiscount = x[k].finalvipdiscount.add(x[k].finalvipfloor);
                                                    entry.handdiscount = x[k].finalmanual;
                                                    entry.promotiondiscount = x[k].finalreduce;
                                                    entry.vipcardtype = x[k].viptype;
                                                    entry.vipdiscountstr = x[k].vipdiscountrate + "";
                                                    entry.merchantdiscount = x[k].finalmerchantdiscount;
                                                    proto.paylists.push(entry);
//                                                    proto.actualtotalpay += x[k].finalprice;
//                                                    proto.totalpay += x[k].origintotalprice;
                                                    proto.actualtotalpay = proto.actualtotalpay.add(x[k].finalprice);
                                                    proto.totalpay = proto.totalpay.add(x[k].origintotalprice);
                                                }
                                                t.commit();
                                                cb(null, proto);
                                            }
                                            else {
                                                t.rollback();
                                                cb(err, null);
                                            }
                                        });
                                    });
                                }
                                else {
                                    cb(err, null);
                                }
                            })
                        }
                    ], function (err, msg) {
                        if (!err) {
                            myLogger.trace("payPrepare [proto]: " + JSON.stringify(msg));
                            cb(null, msg);
                        }
                        else {
                            myLogger.error("payPrepare [async.waterfall]: " + logErr(err));
                            cb(err, null);
                        }
                    })
                }
            }
        }
    });
}

/**
 * 记录价格分摊(原始架构)
 * @param priceshare
 * @param cb
 */
var recordPriceshare = function (priceshare, cb) {
    sequelize.transaction(function (t) {
        //添加group级别信息
        var value = {
            OFFLINEGROUPCODE: priceshare.OFFLINEGROUPCODE,
            PAYMENTMODE: 1,
            FINALPRICE: priceshare.FINALPRICE,
            FINALRULESTRING: JSON.stringify(priceshare.FINALRULESTRING)
        };
        mec_buy_offlinegroupDAO.add(value, t, function (err, msg) {
            if (!err) {
                //更新order级别信息
                var orders = priceshare.ORDERS;
                async.forEach(orders, function (order, cb) {
                    var value = {
                        OFFLINEGROUPCODE: priceshare.OFFLINEGROUPCODE,
                        FINALPRICE2: order.FINALPRICE,
                        FINALRULESTRING2: JSON.stringify(order.FINALRULESTRING)
//                        ORDERSTATE:4
                    }
                    var where = {
                        OFFLINEORDERCODE: order.OFFLINEORDERCODE,
                        ORDERSTATE: 0
                    }
                    mec_buy_offlineorderDAO.update(value, where, t, function (err, msg) {
                        if (!err) {
                            //更新content级别信息
                            var contents = order.CONTENTS;
                            async.forEach(contents, function (content, cb) {
                                var value = {
                                    FINALPRICELIST2: JSON.stringify(content.FINALPRICELIST),
                                    FINALRULELIST2: JSON.stringify(content.FINALRULELIST)
                                };
                                var where = {
                                    "OFFLINECONTENTCODE": content.OFFLINECONTENTCODE
                                };
                                mec_buy_offlinecontentDAO.update(value, where, t, cb);
                            }, cb);
                        }
                        else {
                            cb(err, null);
                        }
                    })
                }, function (err) {
                    if (!err) {
                        t.commit();
                        cb(null, "successful");
                    }
                    else {
                        t.rollback();
                        cb(err, null);
                    }
                })
            }
            else {
                t.rollback();
                cb(err, null);
            }
        })
    })
}

/**
 * 通知mis支付完成的线下单的全部信息
 * @param ordercodes
 * @returns {*}
 */
exports.notifyMisPaidOrder = function(orderOrGroupCode,cb){
    async.series([
        function(cb){
            mec_vi_paid_orderinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_contentinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_discountinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_chargeinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_payinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        }
    ],function(err,msg){
        if(!err){
            if(!msg[0]){
                myLogger.error("notifyMisPaidOrder [async.parallel]: unfound orderinfo");
                cb("unfound orderinfo",null);
            }
            else if(!msg[1]){
                myLogger.error("notifyMisPaidOrder [async.parallel]: unfound contentinfo");
                cb("unfound contentinfo",null);
            }
            else if(!msg[4]){
                myLogger.error("notifyMisPaidOrder [async.parallel]: unfound payinfo");
                cb("unfound payinfo",null);
            }
            else{
                for(var i=0;i<msg.length;i++){
                    for(var j=0;j<msg[i].length;j++){
                        delete msg[i][j].orderorgroupcode;
                    }
                }
                myLogger.trace("notifyMisPaidOrder [async.parallel.msg]: "+JSON.stringify(msg));
                async.series([
                    function(cb){
                        mis.getOrderInfo(msg[0],cb);
                    },
                    function(cb){
                        mis.getOrderItemInfo(msg[1],cb);
                    },
                    function(cb){
                        mis.getOrderDiscountInfo(msg[2],cb);
                    },
                    function(cb){
                        mis.getOrderChargeInfo(msg[3],cb);
                    },
                    function(cb){
                        mis.getOrderPayInfo(msg[4],cb);
                    }
                ],function(err,msg){
                    if(!err){
                        cb(null,"notifyMisPaidOrder successfully: "+msg);
                    }
                    else{
                        myLogger.error("notifyMisPaidOrder [async.series]: "+logErr(err));
                        cb(err,null);
                    }
                })
            }
        }
        else{
            myLogger.error("notifyMisPaidOrder [async.parallel]: "+logErr(err));
            cb(err,null);
        }
    })
}

/**
 * pos支付完成回调
 */
exports.payComplete = function (orderOrGroupCode, payData, cb) {
    //TODO 如果支付的时候订单超时，或者支付成功未通知成功订单更新状态 最终订单要从超时状态到支付成功需要重扣库存
    //TODO  如果此间隔内,网上有人下单扣了剩下的库存，就可能出现负库存或者超额负库存
    if (orderOrGroupCode && orderOrGroupCode.length == 18 && (orderOrGroupCode.charAt(0) == "1"||orderOrGroupCode.charAt(0) == "3")) {//线上订单,只允许一个订单付款
        sequelize.transaction(function (t) {
                async.waterfall([
                    function(cb){
                        checkPayingOrder(orderOrGroupCode,cb);
                    },
                    function (x,cb) {
                        //更新订单状态
                        mec_buy_onlineorderDAO.update(
                            {ORDERSTATE: (orderOrGroupCode.charAt(0) == "1" ? 2:101),PAYMENTSTATE:1},
                            {ONLINEORDERCODE: orderOrGroupCode},
                            t,
                            cb
                        );
                    },
                    function(x,cb){
                        //查询是否是退货单
                        mec_buy_onlineorderDAO.queryOne({
                            attributes: ['IFRETURN'],
                            where:{ONLINEORDERCODE: orderOrGroupCode}
                        },function(err,msg){
                            if(!err){
                                if(msg){
                                    cb(null,msg.IFRETURN);
                                }
                                else{
                                    cb("mec_buy_onlineorderDAO.queryOne unfound ordercode",null);
                                }
                            }
                            else{
                                cb(err,null);
                            }
                        })
                    },
                    function (x,cb) {
                        //记录支付数据
                        var order = {
                            PAYMENTMODE: 0,
                            PAYLOCAL: 0,
                            POSDEALNUM: payData.dealnum,
                            POSCODE: payData.poscode,
                            POSTRANSCODE: wrapPosTransCode(payData.overtime, payData.poscode, payData.dealnum),
                            CASHIER: payData.cashiercode,
                            PAYTIME: payData.overtime
                        };
                        var pays = [];
                        for (var k = 0; k < payData.paylist.length; k++) {
                            var entry = payData.paylist[k];
                            var pay = {
//                                PAYID: entry.id,
                                PAYCODE: entry.paycode,
                                GROUPCODE: null,
                                ORDERCODE: orderOrGroupCode,
                                ISONLINEORDER: 1,
                                AMT: Number(entry.amount),
                                CARDCODE: entry.extracode,
                                PORTNO: entry.creditport,
                                BANKCARDCODE: entry.bankcardcode,
                                FEERATECODE: entry.feerate,
                                IFRETURN: x
                            }
                            pays.push(pay);
                        }

                        //支付各个类型
                        var cashpay=0;//01,
                        var creditpay=0;//07
                        var cashcouponpay=0;//03
                        var itemcouponpay=0;//05
                        var ecardpay=0;//02,38,39
                        var otherpay=0;//...
                        var premiumpay=0;//17,
                        for (var k = 0; k < payData.paylist.length; k++) {
                            var entry = payData.paylist[k];
                            if(['01'].indexOf(entry.paycode)>=0){
//                                cashpay+=Number(entry.amount);
                                cashpay=cashpay.add(Number(entry.amount));
                            }
                            else if(['07'].indexOf(entry.paycode)>=0){
//                                creditpay+=Number(entry.amount);
                                creditpay=creditpay.add(Number(entry.amount));
                            }
                            else if(['03'].indexOf(entry.paycode)>=0){
//                                cashcouponpay+=Number(entry.amount);
                                cashcouponpay=cashcouponpay.add(Number(entry.amount));
                            }
                            else if(['05'].indexOf(entry.paycode)>=0){
//                                itemcouponpay+=Number(entry.amount);
                                itemcouponpay=itemcouponpay.add(Number(entry.amount));
                            }
                            else if(['02','38','39'].indexOf(entry.paycode)>=0){
//                                ecardpay+=Number(entry.amount);
                                ecardpay=ecardpay.add(Number(entry.amount));
                            }
                            else if(['17'].indexOf(entry.paycode)>=0){
//                                premiumpay+=Number(entry.amount);
                                premiumpay=premiumpay.add(Number(entry.amount));
                            }
                            else{
//                                otherpay+=Number(entry.amount);
                                otherpay=otherpay.add(Number(entry.amount));
                            }
                        }
//                        var totalpay = cashpay+creditpay+cashcouponpay+itemcouponpay+ecardpay+otherpay-premiumpay;
                        var totalpay = cashpay.add(creditpay).add(cashcouponpay).add(itemcouponpay).add(ecardpay).add(otherpay).sub(premiumpay);

                        async.parallel([
                            function(cb){//更新订单级别
                                mec_buy_onlineorderDAO.update(order,{ONLINEORDERCODE:orderOrGroupCode},t,cb);
                            },
                            function(cb){//添加支付数据
                                async.forEach(pays,function(pay,cb){
                                    mec_audit_payDAO.add(pay,t,cb);
                                },cb);
                            },
                            function(cb){//更新明细级别
                                mec_buy_onlinecontentDAO.queryAll({where:{ONLINEORDERCODE:orderOrGroupCode}},function(err,msg){
                                    if(!err){
                                        async.forEach(msg,function(content,cb){
                                            var retailamt=content.RETAILAMT;

//                                            var cashpayshare=Number(numberUtil.floor1(retailamt*cashpay/totalpay));
//                                            var creditpayshare=Number(numberUtil.floor1(retailamt*creditpay/totalpay));
//                                            var cashcouponpayshare=Number(numberUtil.floor1(retailamt*cashcouponpay/totalpay));
//                                            var itemcouponpayshare=Number(numberUtil.floor1(retailamt*itemcouponpay/totalpay));
//                                            var ecardpayshare=Number(numberUtil.floor1(retailamt*ecardpay/totalpay));
//                                            var premiumpayshare=Number(numberUtil.floor1(retailamt*premiumpay/totalpay));
//                                            var otherpayshare=totalpay
//                                                -Number(cashpay)
//                                                -Number(creditpay)
//                                                -Number(cashcouponpay)
//                                                -Number(itemcouponpay)
//                                                -Number(ecardpay)
//                                                +Number(premiumpay);

                                            var cashpayshare=Number(numberUtil.floor1(retailamt.mul(cashpay.div(totalpay))));
                                            var creditpayshare=Number(numberUtil.floor1(retailamt.mul(creditpay.div(totalpay))));
                                            var cashcouponpayshare=Number(numberUtil.floor1(retailamt.mul(cashcouponpay.div(totalpay))));
                                            var itemcouponpayshare=Number(numberUtil.floor1(retailamt.mul(itemcouponpay.div(totalpay))));
                                            var ecardpayshare=Number(numberUtil.floor1(retailamt.mul(ecardpay.div(totalpay))));
                                            var premiumpayshare=Number(numberUtil.floor1(retailamt.mul(premiumpay.div(totalpay))));
                                            var otherpayshare=totalpay
                                                .sub(Number(cashpay))
                                                .sub(Number(creditpay))
                                                .sub(Number(cashcouponpay))
                                                .sub(Number(itemcouponpay))
                                                .sub(Number(ecardpay))
                                                .add(Number(premiumpay));

                                            var value={
                                                CASHPAYSHARE:cashpayshare,
                                                CREDITPAYSHARE:creditpayshare,
                                                CASHCOUPONPAYSHARE:cashcouponpayshare,
                                                ITEMCOUPONPAYSHARE:itemcouponpayshare,
                                                ECARDPAYSHARE:ecardpayshare,
                                                PREMIUMPAYSHARE:premiumpayshare,
                                                OTHERPAYSHARE:otherpayshare
                                            };
                                            var where={
                                                ONLINECONTENTCODE:content.ONLINECONTENTCODE
                                            }

                                            mec_buy_onlinecontentDAO.update(value,where,t,cb);
                                        },cb)
                                    }
                                    else{
                                        cb(err,null);
                                    }
                                });
                            }
                        ],cb);
                    }
                ],
                    function (err, msg) {
                        if (!err) {
                            t.commit().success(function(){//https://github.com/sequelize/sequelize/issues/1533
                                myLogger.info("payComplete [async.waterfall]: payComplete successfully");
                                exhandler(function(){
                                    exports.notifyMisPaidOrder(orderOrGroupCode,function(err,msg){
                                        cb(null, "payComplete successfully and notifyMisPaidOrder "+JSON.stringify(err||""));
                                    })
                                },function(err){
                                    cb(null, "payComplete successfully and notifyMisPaidOrder "+JSON.stringify(err||""));
                                })
                            });
                        }
                        else {
                            if(err=="PAID"){//对于已经支付成功的订单(用于三方对账)
                                myLogger.warn("payComplete [async.waterfall]: " + logErr(err));
//                                t.rollback();
                                exhandler(function(){
                                    exports.notifyMisPaidOrder(orderOrGroupCode,function(err,msg){
                                        cb(null, "already paid and notifyMisPaidOrder "+JSON.stringify(err||""));
                                    })
                                },function(err){
                                    cb(null, "already paid and notifyMisPaidOrder "+JSON.stringify(err||""));
                                })
                            }
                            else{
                                myLogger.error("payComplete [async.waterfall]: " + logErr(err));
                                t.rollback();
                                cb(err, msg);
                            }
                        }
                    }
                );
            }
        )
    }
    else if (orderOrGroupCode && orderOrGroupCode.length == 18 && (orderOrGroupCode.charAt(0) == "0"||orderOrGroupCode.charAt(0) == "2")) {//线下订单,且只有一个订单付款
        sequelize.transaction(function (t) {
            async.waterfall([
                function(cb){
                    checkPayingOrder(orderOrGroupCode,cb);
                },
                function (x,cb) {
                    //更新订单状态
                    mec_buy_offlineorderDAO.update(
                        {ORDERSTATE: (orderOrGroupCode.charAt(0) == "0" ? 4:101), PAYMENTMODE: 1, OFFLINEGROUPCODE: null,PAYMENTSTATE:1},
                        {OFFLINEORDERCODE: orderOrGroupCode},
                        t,
                        cb
                    );
                },
                function(x,cb){
                    //查询是否是退货单
                    mec_buy_offlineorderDAO.queryOne({
                        attributes: ['IFRETURN'],
                        where:{OFFLINEORDERCODE: orderOrGroupCode}
                    },function(err,msg){
                        if(!err){
                            if(msg){
                                cb(null,msg.IFRETURN);
                            }
                            else{
                                cb("mec_buy_offlineorderDAO.queryOne unfound ordercode",null);
                            }
                        }
                        else{
                            cb(err,null);
                        }
                    })
                },
                function (x,cb) {
                    //记录支付数据
                    var order = {
                        PAYMENTMODE: 0,
                        PAYLOCAL: 0,
                        POSDEALNUM: payData.dealnum,
                        POSCODE: payData.poscode,
                        POSTRANSCODE: wrapPosTransCode(payData.overtime, payData.poscode, payData.dealnum),
                        CASHIER: payData.cashiercode,
                        PAYTIME: payData.overtime
                    };
                    var pays = [];
                    for (var k = 0; k < payData.paylist.length; k++) {
                        var entry = payData.paylist[k];
                        var pay = {
//                                PAYID: entry.id,
                            PAYCODE: entry.paycode,
                            GROUPCODE: null,
                            ORDERCODE: orderOrGroupCode,
                            ISONLINEORDER: 0,
                            AMT: Number(entry.amount),
                            CARDCODE: entry.extracode,
                            PORTNO: entry.creditport,
                            BANKCARDCODE: entry.bankcardcode,
                            FEERATECODE: entry.feerate,
                            IFRETURN: x
                        }
                        pays.push(pay);
                    }

                    //支付各个类型
                    var cashpay=0;//01,
                    var creditpay=0;//07
                    var cashcouponpay=0;//03
                    var itemcouponpay=0;//05
                    var ecardpay=0;//02,38,39
                    var otherpay=0;//...
                    var premiumpay=0;//17,
                    for (var k = 0; k < payData.paylist.length; k++) {
                        var entry = payData.paylist[k];
                        if(['01'].indexOf(entry.paycode)>=0){
                            cashpay=cashpay.add(Number(entry.amount));
                        }
                        else if(['07'].indexOf(entry.paycode)>=0){
                            creditpay=creditpay.add(Number(entry.amount));
                        }
                        else if(['03'].indexOf(entry.paycode)>=0){
                            cashcouponpay=cashcouponpay.add(Number(entry.amount));
                        }
                        else if(['05'].indexOf(entry.paycode)>=0){
                            itemcouponpay=itemcouponpay.add(Number(entry.amount));
                        }
                        else if(['02','38','39'].indexOf(entry.paycode)>=0){
                            ecardpay=ecardpay.add(Number(entry.amount));
                        }
                        else if(['17'].indexOf(entry.paycode)>=0){
                            premiumpay=premiumpay.add(Number(entry.amount));
                        }
                        else{
                            otherpay=otherpay.add(Number(entry.amount));
                        }
                    }
                    var totalpay = cashpay.add(creditpay).add(cashcouponpay).add(itemcouponpay).add(ecardpay).add(otherpay).sub(premiumpay);

                    async.parallel([
                        function(cb){//更新订单级别
                            mec_buy_offlineorderDAO.update(order,{OFFLINEORDERCODE:orderOrGroupCode},t,cb);
                        },
                        function(cb){//添加支付数据
                            async.forEach(pays,function(pay,cb){
                                mec_audit_payDAO.add(pay,t,cb);
                            },cb);
                        },
                        function(cb){//更新明细级别
                            mec_buy_offlinecontentDAO.queryAll({where:{OFFLINEORDERCODE:orderOrGroupCode}},function(err,msg){
                                if(!err){
                                    async.forEach(msg,function(content,cb){
                                        var retailamt=content.RETAILAMT;

                                        var cashpayshare=Number(numberUtil.floor1(retailamt.mul(cashpay.div(totalpay))));
                                        var creditpayshare=Number(numberUtil.floor1(retailamt.mul(creditpay.div(totalpay))));
                                        var cashcouponpayshare=Number(numberUtil.floor1(retailamt.mul(cashcouponpay.div(totalpay))));
                                        var itemcouponpayshare=Number(numberUtil.floor1(retailamt.mul(itemcouponpay.div(totalpay))));
                                        var ecardpayshare=Number(numberUtil.floor1(retailamt.mul(ecardpay.div(totalpay))));
                                        var premiumpayshare=Number(numberUtil.floor1(retailamt.mul(premiumpay.div(totalpay))));
                                        var otherpayshare=totalpay
                                            .sub(Number(cashpay))
                                            .sub(Number(creditpay))
                                            .sub(Number(cashcouponpay))
                                            .sub(Number(itemcouponpay))
                                            .sub(Number(ecardpay))
                                            .add(Number(premiumpay));

                                        var value={
                                            CASHPAYSHARE:cashpayshare,
                                            CREDITPAYSHARE:creditpayshare,
                                            CASHCOUPONPAYSHARE:cashcouponpayshare,
                                            ITEMCOUPONPAYSHARE:itemcouponpayshare,
                                            ECARDPAYSHARE:ecardpayshare,
                                            PREMIUMPAYSHARE:premiumpayshare,
                                            OTHERPAYSHARE:otherpayshare
                                        };
                                        var where={
                                            OFFLINECONTENTCODE:content.OFFLINECONTENTCODE
                                        }

                                        mec_buy_offlinecontentDAO.update(value,where,t,cb);
                                    },cb)
                                }
                                else{
                                    cb(err,null);
                                }
                            });
                        }
                    ],cb);
                }
            ], function (err, msg) {
                if (!err) {
                    t.commit().success(function(){//https://github.com/sequelize/sequelize/issues/1533
                        myLogger.info("payComplete [async.waterfall]: payComplete successfully");
                        exhandler(function(){
                            exports.notifyMisPaidOrder(orderOrGroupCode,function(err,msg){
                                cb(null, "payComplete successfully and notifyMisPaidOrder "+JSON.stringify(err||""));
                            })
                        },function(err){
                            cb(null, "payComplete successfully and notifyMisPaidOrder "+JSON.stringify(err||""));
                        })
                    });
                }
                else {
                    if(err=="PAID"){//三方对账时，mec状态为完成，mis无支付信息，mis要通知mec重新调用notifyMis函数
                        myLogger.warn("payComplete [async.waterfall]: " + logErr(err));
//                        t.rollback();
                        exhandler(function(){
                            exports.notifyMisPaidOrder(orderOrGroupCode,function(err,msg){
                                cb(null, "already paid and notifyMisPaidOrder "+JSON.stringify(err||""));
                            })
                        },function(err){
                            cb(null, "already paid and notifyMisPaidOrder "+JSON.stringify(err||""));
                        })
                    }
                    else{
                        myLogger.error("payComplete [async.waterfall]: " + logErr(err));
                        t.rollback();
                        cb(err, msg);
                    }
                }
            });
        })
    }
    else if (orderOrGroupCode && orderOrGroupCode.length == 20 && (orderOrGroupCode.charAt(0) == "0"||orderOrGroupCode.charAt(0) == "2")) {//多个线下订单拼单付款
        sequelize.transaction(function (t) {
            async.waterfall([
                function(cb){
                    mec_buy_offlineorderDAO.queryAll({attributes:["OFFLINEORDERCODE"],where:{OFFLINEGROUPCODE:orderOrGroupCode}},cb);
                },
                function(x,cb){
                    async.forEach(x,function(order,cb){
                        checkPayingOrder(order.OFFLINEORDERCODE,cb);
                    },function(err){
                        cb(err,null);
                    })
                },
                function (x,cb) {
                    //更新订单状态
                    mec_buy_offlineorderDAO.update(
                        {ORDERSTATE: (orderOrGroupCode.charAt(0) == "0" ? 4:101), PAYMENTMODE: 1,PAYMENTSTATE:2},
                        {OFFLINEGROUPCODE: orderOrGroupCode},
                        t,
                        cb
                    );
                },
                function (x,cb) {
                    //更新订单组状态
                    mec_buy_offlinegroupDAO.update({PAYMENTSTATE: 1}, {OFFLINEGROUPCODE: orderOrGroupCode, PAYMENTSTATE: 0}, t, cb);
                },
                function(x,cb){
                    //查询是否是退货单
                    mec_buy_offlinegroupDAO.queryOne({
                        attributes: ['IFRETURN'],
                        where:{OFFLINEGROUPCODE: orderOrGroupCode}
                    },function(err,msg){
                        if(!err){
                            if(msg){
                                cb(null,msg.IFRETURN);
                            }
                            else{
                                cb("mec_buy_offlinegroupDAO.queryOne unfound groupcode",null);
                            }
                        }
                        else{
                            cb(err,null);
                        }
                    })
                },
                function (x,cb) {
                    //记录支付数据
                    var group ={
                        PAYMENTMODE:0,
                        PAYLOCAL: 0,
                        POSDEALNUM: payData.dealnum,
                        POSCODE: payData.poscode,
                        POSTRANSCODE: wrapPosTransCode(payData.overtime, payData.poscode, payData.dealnum),
                        CASHIER: payData.cashiercode,
                        PAYTIME: payData.overtime
                    };
                    var order = {
                        PAYMENTMODE: 0,
                        PAYLOCAL: 0,
                        POSDEALNUM: payData.dealnum,
                        POSCODE: payData.poscode,
                        POSTRANSCODE: wrapPosTransCode(payData.overtime, payData.poscode, payData.dealnum),
                        CASHIER: payData.cashiercode,
                        PAYTIME: payData.overtime
                    };
                    var pays = [];
                    for (var k = 0; k < payData.paylist.length; k++) {
                        var entry = payData.paylist[k];
                        var pay = {
//                                PAYID: entry.id,
                            PAYCODE: entry.paycode,
                            GROUPCODE: orderOrGroupCode,
                            ORDERCODE: null,
                            ISONLINEORDER: 0,
                            AMT: Number(entry.amount),
                            CARDCODE: entry.extracode,
                            PORTNO: entry.creditport,
                            BANKCARDCODE: entry.bankcardcode,
                            FEERATECODE: entry.feerate,
                            IFRETURN: x
                        }
                        pays.push(pay);
                    }

                    //支付各个类型
                    var cashpay=0;//01,
                    var creditpay=0;//07
                    var cashcouponpay=0;//03
                    var itemcouponpay=0;//05
                    var ecardpay=0;//02,38,39
                    var otherpay=0;//...
                    var premiumpay=0;//17,
                    for (var k = 0; k < payData.paylist.length; k++) {
                        var entry = payData.paylist[k];
                        if(['01'].indexOf(entry.paycode)>=0){
                            cashpay=cashpay.add(Number(entry.amount));
                        }
                        else if(['07'].indexOf(entry.paycode)>=0){
                            creditpay=creditpay.add(Number(entry.amount));
                        }
                        else if(['03'].indexOf(entry.paycode)>=0){
                            cashcouponpay=cashcouponpay.add(Number(entry.amount));
                        }
                        else if(['05'].indexOf(entry.paycode)>=0){
                            itemcouponpay=itemcouponpay.add(Number(entry.amount));
                        }
                        else if(['02','38','39'].indexOf(entry.paycode)>=0){
                            ecardpay=ecardpay.add(Number(entry.amount));
                        }
                        else if(['17'].indexOf(entry.paycode)>=0){
                            premiumpay=premiumpay.add(Number(entry.amount));
                        }
                        else{
                            otherpay=otherpay.add(Number(entry.amount));
                        }
                    }
                    var totalpay = cashpay.add(creditpay).add(cashcouponpay).add(itemcouponpay).add(ecardpay).add(otherpay).sub(premiumpay);

                    console.log("***********************************");
                    console.log(cashpay);
                    console.log(creditpay);
                    console.log(cashcouponpay);
                    console.log(itemcouponpay);
                    console.log(ecardpay);
                    console.log(otherpay);
                    console.log(premiumpay);
                    console.log(totalpay);
                    console.log("***********************************");

                    async.parallel([
                        function(cb){//更新组级别
                            mec_buy_offlinegroupDAO.update(group,{OFFLINEGROUPCODE:orderOrGroupCode},t,cb);
                        },
                        function(cb){//更新订单级别
                            mec_buy_offlineorderDAO.update(order,{OFFLINEGROUPCODE:orderOrGroupCode},t,cb);
                        },
                        function(cb){//添加支付数据
                            async.forEach(pays,function(pay,cb){
                                mec_audit_payDAO.add(pay,t,cb);
                            },cb);
                        },
                        function(cb){//更新明细级别
                            mec_buy_offlineorderDAO.queryAll({attributes:["OFFLINEORDERCODE"],where:{OFFLINEGROUPCODE:orderOrGroupCode}},function(err,msg){
                                if(!err){
                                    async.forEach(msg,function(order,cb){
                                        console.log("\n\n#########################################");
                                        console.log(JSON.stringify(order));
                                        console.log("#########################################\n\n");
                                        mec_buy_offlinecontentDAO.queryAll({where:{OFFLINEORDERCODE:order["OFFLINEORDERCODE"]}},function(err,msg){
                                            if(!err){
                                                async.forEach(msg,function(content,cb){
                                                    var retailamt=content.RETAILAMT;

                                                    var cashpayshare=Number(numberUtil.floor1(retailamt.mul(cashpay.div(totalpay))));
                                                    var creditpayshare=Number(numberUtil.floor1(retailamt.mul(creditpay.div(totalpay))));
                                                    var cashcouponpayshare=Number(numberUtil.floor1(retailamt.mul(cashcouponpay.div(totalpay))));
                                                    var itemcouponpayshare=Number(numberUtil.floor1(retailamt.mul(itemcouponpay.div(totalpay))));
                                                    var ecardpayshare=Number(numberUtil.floor1(retailamt.mul(ecardpay.div(totalpay))));
                                                    var premiumpayshare=Number(numberUtil.floor1(retailamt.mul(premiumpay.div(totalpay))));
                                                    var otherpayshare=Number(numberUtil.floor1(retailamt.mul(otherpay.div(totalpay))));
                                                    var delta=retailamt
                                                        .sub(Number(cashpayshare))
                                                        .sub(Number(creditpayshare))
                                                        .sub(Number(cashcouponpayshare))
                                                        .sub(Number(itemcouponpayshare))
                                                        .sub(Number(ecardpayshare))
                                                        .sub(Number(otherpayshare))
                                                        .add(Number(premiumpayshare));
                                                    if(cashpayshare>=0) cashpayshare=cashpayshare.add(delta);
                                                    else if(creditpayshare>=0) creditpayshare=creditpayshare.add(delta);
                                                    else if(cashcouponpayshare>=0) cashcouponpayshare=cashcouponpayshare.add(delta);
                                                    else if(itemcouponpayshare>=0) itemcouponpayshare=itemcouponpayshare.add(delta);
                                                    else if(ecardpayshare>=0) ecardpayshare=ecardpayshare.add(delta);
                                                    else if(otherpayshare>=0) otherpayshare=otherpayshare.add(delta);

                                                    var value={
                                                        CASHPAYSHARE:cashpayshare,
                                                        CREDITPAYSHARE:creditpayshare,
                                                        CASHCOUPONPAYSHARE:cashcouponpayshare,
                                                        GOODSCOUPONPAYSHARE:itemcouponpayshare,
                                                        ECARDPAYSHARE:ecardpayshare,
                                                        PREMIUMPAYSHARE:premiumpayshare,
                                                        OTHERPAYSHARE:otherpayshare
                                                    };
                                                    var where={
                                                        OFFLINECONTENTCODE:content.OFFLINECONTENTCODE
                                                    }

                                                    mec_buy_offlinecontentDAO.update(value,where,t,cb);
                                                },cb)
                                            }
                                            else{
                                                cb(err,null);
                                            }
                                        });
                                    },cb);
                                }
                                else{
                                    cb(err,msg);
                                }
                            })

                        }
                    ],cb);
                }
            ], function (err, msg) {
                if (!err) {
                    t.commit().done(function(err){//https://github.com/sequelize/sequelize/issues/1533
                        myLogger.info("payComplete [async.waterfall]: payComplete successfully");
                        exhandler(function(){
                            exports.notifyMisPaidOrder(orderOrGroupCode,function(err,msg){
                                cb(null, "payComplete successfully and notifyMisPaidOrder "+JSON.stringify(err||""));
                            })
                        },function(err){
                            cb(null, "payComplete successfully and notifyMisPaidOrder "+JSON.stringify(err||""));
                        })
                    });
                }
                else {
                    if(err=="PAID"){//三方对账时，mec状态为完成，mis无支付信息，mis要通知mec重新调用notifyMis函数
                        myLogger.warn("payComplete [async.waterfall]: " + logErr(err));
//                        t.rollback();
                        exhandler(function(){
                            exports.notifyMisPaidOrder(orderOrGroupCode,function(err,msg){
                                cb(null, "already paid and notifyMisPaidOrder "+JSON.stringify(err||""));
                            })
                        },function(err){
                            cb(null, "already paid and notifyMisPaidOrder "+JSON.stringify(err||""));
                        })
                    }
                    else{
                        myLogger.error("payComplete [async.waterfall]: " + logErr(err));
                        t.rollback();
                        cb(err, msg);
                    }
                }
            });
        })
    }
    else {
        cb("illegal orderOrGroupCode", null);
    }
}

/**
 * 检查支付中的订单
 * 如果普通超时订单重新支付完成则扣除库存，如果是退货订单则添加库存
 * @param ordercode, t-事务标志
 * @param cb
 */
var checkPayingOrder = function(ordercode,cb){
    if(ordercode[0]=='0'){
        mec_buy_offlineorderDAO.queryOne({where:{OFFLINEORDERCODE:ordercode}},function(err,msg){
             if(!err){
                 if(msg){
                     var orderstate=msg.ORDERSTATE;
                     var ifreturn=msg.IFRETURN;
//                     if(orderstate==11||orderstate==0){ //初始订单或超时订单仍允许支付
//                         cb(null,null);
//                     }
//                     else{
//                         if(orderstate==4){
//                              cb("PAID",null);
//                         }
//                         myLogger.error("checkPayingOrder [check orderstate]: unsuitable state order "+ordercode);
//                         cb("unsuitable state order: "+ordercode+": "+JSON.stringify({orderstate:orderstate,ifreturn:ifreturn}),null);
//                     }
                     if(orderstate==4 || orderstate == 8){//三方对账时，mec状态为完成，mis无支付信息，mis要通知mec重新调用notifyMis函数
                         cb("PAID",null);
                     }
                     else{
                         cb(null,null);
                     }
                 }
                 else{
                     myLogger.error("checkPayingOrder [mec_buy_offlineorderDAO.queryOne]: unfound this order");
                     cb("unfound this order",null);
                 }
             }
             else{
                 myLogger.error("checkPayingOrder [mec_buy_offlineorderDAO.queryOne]: "+logErr(err));
                 cb(err,msg);
             }
        })
    }
    else if(ordercode[0]=='1'){
        mec_buy_onlineorderDAO.queryOne({where:{ONLINEORDERCODE:ordercode}},function(err,msg){
            if(!err){
                if(msg){
                    var orderstate=msg.ORDERSTATE;
                    var ifreturn=msg.IFRETURN;
//                    if(orderstate==11||orderstate==1){
//                        cb(null,null);
//                    }
//                    else{
//                        if(orderstate==2){
//                            cb("PAID",null);
//                        }
//                        myLogger.error("checkPayingOrder [check orderstate]: unsuitable state order "+ordercode);
//                        cb("unsuitable state order: "+ordercode+": "+JSON.stringify({orderstate:orderstate,ifreturn:ifreturn}),null);
//                    }
                    if(orderstate==2){
                        cb("PAID",null);
                    }
                    else{
                        cb(null,null);
                    }
                }
                else{
                    myLogger.error("checkPayingOrder [mec_buy_onlineorderDAO.queryOne]: unfound this order");
                    cb("unfound this order",null);
                }
            }
            else{
                myLogger.error("checkPayingOrder [mec_buy_onlineorderDAO.queryOne]: "+logErr(err));
                cb(err,msg);
            }
        })
    }
    else if(ordercode[0]=='2'){
        mec_buy_offlineorderDAO.queryOne({where:{OFFLINEORDERCODE:ordercode}},function(err,msg){
            if(!err){
                if(msg){
                    var orderstate=msg.ORDERSTATE;
                    var ifreturn=msg.IFRETURN;
//                    if(orderstate==100||orderstate==102){
//                        cb(null,null);
//                    }
//                    else{
//                        if(orderstate==101){
//                            cb("PAID",null);
//                        }
//                        myLogger.error("checkPayingOrder [check orderstate]: unsuitable state order "+ordercode);
//                        cb("unsuitable state order: "+ordercode+": "+JSON.stringify({orderstate:orderstate,ifreturn:ifreturn}),null);
//                    }
                    if(orderstate==101){
                        cb("PAID",null);
                    }
                    else{
                        cb(null,null);
                    }
                }
                else{
                    myLogger.error("checkPayingOrder [mec_buy_offlineorderDAO.queryOne]: unfound this order");
                    cb("unfound this order",null);
                }
            }
            else{
                myLogger.error("checkPayingOrder [mec_buy_offlineorderDAO.queryOne]: "+logErr(err));
                cb(err,msg);
            }
        })
    }
    else if(ordercode[0]=='3'){
        mec_buy_onlineorderDAO.queryOne({where:{ONLINEORDERCODE:ordercode}},function(err,msg){
            if(!err){
                if(msg){
                    var orderstate=msg.ORDERSTATE;
                    var ifreturn=msg.IFRETURN;
//                    if(orderstate==100||orderstate==102){
//                        cb(null,null);
//                    }
//                    else{
//                        if(orderstate==101){
//                            cb("PAID",null);
//                        }
//                        myLogger.error("checkPayingOrder [check orderstate]: unsuitable state order "+ordercode);
//                        cb("unsuitable state order: "+ordercode+": "+JSON.stringify({orderstate:orderstate,ifreturn:ifreturn}),null);
//                    }
                    if(orderstate==101){
                        cb("PAID",null);
                    }
                    else{
                        cb(null,null);
                    }
                }
                else{
                    myLogger.error("checkPayingOrder [mec_buy_onlineorderDAO.queryOne]: unfound this order");
                    cb("unfound this order",null);
                }
            }
            else{
                myLogger.error("checkPayingOrder [mec_buy_onlineorderDAO.queryOne]: "+logErr(err));
                cb(err,msg);
            }
        })
    }
    else {
        cb("illegal ordercode",null);
    }
}

/**
 * 手工单更新库存
 * @param entries=[{SKCCODE,COUNTERCODE,NUM]]
 */
exports.handOrderUpdateStock =function(entries,cb){
    sequelize.transaction(function(t){
        async.forEach(entries,function(entry,cb){
            entry=objectUtil.toUpperCase(entry);
            if(!entry.SKCCODE||!entry.COUNTERCODE||entry.NUM<0){
                cb("illegal params: "+JSON.stringify(entry),null);
                return;
            }
            var sql="update mec_itm_stock set AMOUNT=AMOUNT-"+entry.NUM+
                " where SKCCODE='"+entry.SKCCODE+"' and COUNTERCODE='"+entry.COUNTERCODE+"';";
            generalDAO.runSql(sql,{transaction:t},cb);
        },function(err){
            if(!err){
                t.commit();
                cb(null,entries);
            }
            else{
                myLogger.error("handOrderUpdateStock [async.forEach.err]: "+logErr(err));
                cb(err,null);
            }
        })
    })
}

/**
 * 生成拼单支付组号
 * @param ordercodes
 * @returns {*}
 */
exports.generateGroupCode = function (ordercodes) {
    var groupcode = ordercodes[0];
//    var num=ordercodes.length;
//    if(num>99) num=0;
    var num = Math.floor(Math.random() * 100);
    groupcode += stringUtil.autoComple(num, 2, '0');
    return groupcode;
}

function wrapPosTransCode(paytime, poscode, dealnum){
	var date = (typeof paytime=='string')? dateUtil.parseDate(paytime) : paytime;
    var m = stringUtil.autoComple(date.getMonth()+1,2,'0');
    var y = date.getFullYear().toString().substr(2, 2);
    var d = stringUtil.autoComple(date.getDate(), 2, '0');
    return y + m + d + poscode + stringUtil.autoComple(dealnum, 5, '0');
}



