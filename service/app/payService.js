/**
 * Created by lucywu on 12/1/14.
 * 支付相关服务(!!!安全性!!!)
 */

var myLogger = require('../../logging/contextLogger')("app/payService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var promotionService = require('./promotionService');
var mec_buy_onlineorderDAO = require('../../dao/mec_buy_onlineorderDAO');
var mec_buy_offlinegroupDAO = require('../../dao/mec_buy_offlinegroupDAO');
var mec_buy_offlineorderDAO = require('../../dao/mec_buy_offlineorderDAO');
var mec_buy_offlinecontentDAO = require('../../dao/mec_buy_offlinecontentDAO');
var stringUtil = require('../../util/stringUtil');

/**
 * 支付前预处理
 * isonlineorder是否是线上订单
 * ordercodes是订单编码的数组
 * 其中的priceshare结构为:{OFFLINEGROUPCODE:?,FINALPRICE:?,FINALRULESTRING:?,ORDERS:?}
 * 其中ORDERS结构为:[{OFFLINEORDERCODE:?,FINALPRICE:?,FINALRULESTRING:?,CONTENTS:?},{},{}...]
 * 其中CONTENTS结构为:[{OFFLINECONTENTCODE:?,FINALPRICELIST:?,FINALRULELIST:?},{},{}...]
 * 返回的结果为:[type,ordercode/groupcode,finalprice,(priceshare)]
 * type=1单一线上单付款 type=0单一线下单付款 type=2线下单拼单付款
 */
exports.payPrepare = function (isonlineorder, ordercodes, cb) {
    if (isonlineorder) {//线上订单,只能单一订单付款,价格在下订单时已确定
        var ordercode = ordercodes[0];
        mec_buy_onlineorderDAO.queryOne({attributes: ["FINALPRICE"], where: {ONLINEORDERCODE: ordercode}}, function (err, msg) {
            if (!err) {
                if (msg) { s
                    myLogger.trace("payPrepare [FINALPRICE]: " + msg.FINALPRICE);
                    cb(null, ['1', ordercode, msg.FINALPRICE]);
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
                    cb(null, ['0', ordercode, msg.FINALPRICE]);
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
                        //将上一步得到的countercode加入到查询结果中
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
                promotionService.process(false, x, function (err, msg) {
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
                                finalprice += _price * _num;
                            }

                            //构建finalrulestring
                            var itemcode = x[k].ITEMCODE;
                            for (var j = 0; j < finalrulelist.length; j++) {
                                var _rule = finalrulelist[j]["RULE"];
                                var _num = finalrulelist[j].NUM;
                                if (!finalrulestring[_rule]) finalrulestring[_rule] = {};
                                if (!finalrulestring[_rule][itemcode]) finalrulestring[_rule][itemcode] = 0;
                                finalrulestring[_rule][itemcode] = finalrulestring[_rule][itemcode] + _num;
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
                                    finalprice += _price * _num;
                                }

                                //构建finalrulestring
                                var itemcode = x[index].ITEMCODE;
                                for (var j = 0; j < finalrulelist.length; j++) {
                                    var _rule = finalrulelist[j]["RULE"];
                                    var _num = finalrulelist[j].NUM;
                                    if (!finalrulestring[_rule]) finalrulestring[_rule] = {};
                                    if (!finalrulestring[_rule][itemcode]) finalrulestring[_rule][itemcode] = 0;
                                    finalrulestring[_rule][itemcode] = finalrulestring[_rule][itemcode] + _num;
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
 * 在线支付完成回调
 */
exports.payComplete = function (orderOrGroupCode, payData, cb) {
    if (orderOrGroupCode && orderOrGroupCode.length == 18 && orderOrGroupCode.charAt(0) == '1') {//线上订单,只允许一个订单付款
        sequelize.transaction(function (t) {
            async.parallel([
                function (cb) {
                    //更新订单状态
                    mec_buy_onlineorderDAO.update(
                        {ORDERSTATE: 2},
                        {ONLINEORDERCODE: orderOrGroupCode, ORDERSTATE: 1},
                        t,
                        cb
                    );
                },
                function (cb) {
                    //记录支付数据
                    cb(null, null);
                }
            ], function (err, msg) {
                if (!err) {
                    t.commit();
                    cb(null, msg);
                }
                else {
                    myLogger.error("payComplete [async.parallel]: " + logErr(err));
                    t.rollback();
                    cb(err, msg);
                }
            });
        })
    }
    else if (orderOrGroupCode && orderOrGroupCode.length == 18 && orderOrGroupCode.charAt(0) == '0') {//线下订单,且只有一个订单付款
        sequelize.transaction(function (t) {
            async.parallel([
                function (cb) {
                    //更新订单状态
                    mec_buy_offlineorderDAO.update(
                        {ORDERSTATE: 4, PAYMENTMODE: 1, OFFLINEGROUPCODE: null},
                        {OFFLINEORDERCODE: orderOrGroupCode, ORDERSTATE: 0},
                        t,
                        cb
                    );
                },
                function (cb) {
                    //记录支付数据
                    cb(null, null);
                }
            ], function (err, msg) {
                if (!err) {
                    t.commit();
                    cb(null, msg);
                }
                else {
                    myLogger.error("payComplete [async.parallel]: " + logErr(err));
                    t.rollback();
                    cb(err, msg);
                }
            });
        })
    }
    else if (orderOrGroupCode && orderOrGroupCode.length == 20 && orderOrGroupCode.charAt(0) == '0') {//多个线下订单拼单付款
        sequelize.transaction(function (t) {
            async.parallel([
                function (cb) {
                    //更新订单状态
                    mec_buy_offlineorderDAO.update(
                        {ORDERSTATE: 4, PAYMENTMODE: 1},
                        {OFFLINEGROUPCODE: orderOrGroupCode, ORDERSTATE: 0},
                        t,
                        cb
                    );
                },
                function (cb) {
                    //更新订单组状态
                    mec_buy_offlinegroupDAO.update({PAYMENTSTATE: 1}, {OFFLINEGROUPCODE: orderOrGroupCode, PAYMENTSTATE: 0}, t, cb);
                },
                function (cb) {
                    //记录支付数据
                    cb(null, null);
                }
            ], function (err, msg) {
                if (!err) {
                    t.commit();
                    cb(null, msg);
                }
                else {
                    myLogger.error("payComplete [async.parallel]: " + logErr(err));
                    t.rollback();
                    cb(err, msg);
                }
            });
        })
    }
    else {
        cb("error orderOrGroupCode", null);
    }
}

exports.generateGroupCode = function (ordercodes) {
    var groupcode = ordercodes[0];
//    var num=ordercodes.length;
//    if(num>99) num=0;
    var num = Math.floor(Math.random() * 100);
    groupcode += stringUtil.autoComple(num, 2, '0');
    return groupcode;
}