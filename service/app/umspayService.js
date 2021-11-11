/**
 * Created by lucywu on 12/19/14.
 */

var umspay  = require("../../interaction/umspay");
var payService = require("./payService");
var myLogger = require('../../logging/contextLogger')("app/umspayService");
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
 * app要支付,创建支付全部流程
 * isonlineorder是否是线上订单
 * ordercodes是订单编码的数组
 * 返回的结果为[payObj,result]
 * 其中payObj是[type,orderOrGroupCode,finalPrice,(priceshare)]
 * result是{transId,chrCode,merSign,.merId}
 */
exports.createPay = function(isonlineorder,ordercodes,cb){
    var payObj=null;
    var result=null;
    async.waterfall([
        function(cb){
            //初步支付流水准备
            payService.payPrepare(isonlineorder,ordercodes,cb);
        },
        function(x,cb){
            //注册支付流水
            payObj=x;
            var data = {
                'MerOrderId': x[1]+"",//商户订单号
                'TransAmt': x[2]+"",//交易金额
                'OrderDesc': '汇金百货购物'//订单描述
            }
            umspay.regist(data,cb);
        },
        function(x,cb){
            //进一步支付准备,写入数据库订单对应的支付流水号等信息
            result=x;//ums银联注册流水生成的数据信息
            var payType=payObj[0];//0-线下单一订单支付,1-线上单一订单支付,2-线下拼单支付
            var orderOrGroupCode=payObj[1];
            if(payType=='0'){//线下单一订单支付
                var value={OFFLINEGROUPCODE:null,TRANSID: x.transId,CHRCODE: x.chrCode};
                var where={OFFLINEORDERCODE:orderOrGroupCode,ORDERSTATE:0};
                mec_buy_offlineorderDAO.update(value,where,cb);
            }
            else if(payType=='1'){//线上单一订单支付
                var value={TRANSID: x.transId,CHRCODE: x.chrCode};
                var where={ONLINEORDERCODE:orderOrGroupCode,ORDERSTATE:1};
                mec_buy_onlineorderDAO.update(value,where,cb);
            }
            else if(payType=='2'){//线下拼单支付
                sequelize.transaction(function(t){
                    async.parallel([
                        function(cb){
                            var value={TRANSID: x.transId,CHRCODE: x.chrCode};
                            var where={OFFLINEGROUPCODE:orderOrGroupCode,PAYMENTSTATE:0};
                            mec_buy_offlinegroupDAO.update(value,where,t,cb);
                        },
                        function(cb){
                            var value={TRANSID: x.transId,CHRCODE: x.chrCode};
                            var where={OFFLINEGROUPCODE:orderOrGroupCode,ORDERSTATE:0};
                            mec_buy_offlineorderDAO.update(value,where,t,cb);
                        }
                    ],function(err,msg){
                        if(!err){
                            t.commit();
                            cb(null,msg);
                        }
                        else{
                            myLogger.error("createPay [async.parallel]: "+logErr(err));
                            t.rollback();
                            cb(err,msg);
                        }
                    })
                })
            }
            else{
                myLogger.error("createPay [error]: error payObj payType");
                cb("error payObj payType",null);
            }
        }
    ],function(err,msg){
        if(!err){
            cb(null,[payObj,result]);
        }
        else{
            myLogger.error("createPay [async.waterfall]: "+logErr(err));
            cb(err,null);
        }
    })
}

//支付完,创建支付全部流程
exports.queryPay = function(orderOrGroupCode,cb){
    //向银联查询支付结果,并做相应的数据处理
    var queryAndProcess=function(orderOrGroupCode,transId,cb){
        async.waterfall([
            function(cb){
                var data = {
                    'MerOrderId': orderOrGroupCode,//商户订单号
                    'TransId': transId,//交易流水号662014121726914660
                    'Reserve': '因回调不成功,主动查询'//备用字段
                }
                umspay.query(data,cb);
            },
            function(x,cb){
                var tranState= x.TransState;
                if(tranState==1){//支付成功
                    var payData=x;
                    //利用通知数据做帐目处理(写入订单部分,写入支付记录部分)
                    payService.payComplete(orderOrGroupCode,payData,cb);
                }
                else{//尚未支付
                    cb("unpay",null);
                }
            }
        ],function(err,msg){
            if(!err){
                cb(null,msg);
            }
            else{
                if(err=="unpay") myLogger.warn("queryPay [async.waterfall]: "+logErr(err));
                else myLogger.error("queryPay [async.waterfall]: "+logErr(err));
                cb(err,null);
            }
        })
    }

    //首先查询本地数据库获取订单是否支付完成
    if (orderOrGroupCode && orderOrGroupCode.length == 18 && orderOrGroupCode.charAt(0) == '1') {//线上订单,只允许一个订单付款
        var attributes=["ONLINEORDERCODE","ORDERSTATE","TRANSID"];
        var where={ONLINEORDERCODE:orderOrGroupCode};
        mec_buy_onlineorderDAO.queryOne({attributes:attributes,where:where},function(err,msg){
            if(!err){
                if(msg && msg.ORDERSTATE==2){ //支付成功
                    cb(null,"paid");
                }
                else if(msg && msg.ORDERSTATE!=2){ //为查询到支付成功信息,可能因为回调失败
                    queryAndProcess(orderOrGroupCode,msg.TRANSID,cb);
                }
                else{
                    myLogger.error("queryPay [mec_buy_onlineorderDAO.queryOne]: can't find this onlineordercode");
                    cb("can't find this onlineordercode", null);
                }
            }
            else{
                myLogger.error("queryPay [mec_buy_onlineorderDAO.queryOne]: "+logErr(err));
                cb(err,null);
            }
        })
    }
    else if (orderOrGroupCode && orderOrGroupCode.length == 18 && orderOrGroupCode.charAt(0) == '0') {//线下订单,且只有一个订单付款
        var attributes=["OFFLINEORDERCODE","ORDERSTATE","TRANSID"];
        var where={OFFLINEORDERCODE:orderOrGroupCode};
        mec_buy_offlineorderDAO.queryOne({attributes:attributes,where:where},function(err,msg){
            if(!err){
                if(msg && msg.ORDERSTATE==4){ //支付成功
                    cb(null,"paid");
                }
                else if(msg && msg.ORDERSTATE!=4){ //为查询到支付成功信息,可能因为回调失败
                    queryAndProcess(orderOrGroupCode,msg.TRANSID,cb);
                }
                else{
                    myLogger.error("queryPay [ mec_buy_offlineorderDAO.queryOne]: can't find this offlineordercode");
                    cb("can't find this offlineordercode", null);
                }
            }
            else{
                myLogger.error("queryPay [mec_buy_offlineorderDAO.queryOne]: "+logErr(err));
                cb(err,null);
            }
        })
    }
    else if (orderOrGroupCode && orderOrGroupCode.length == 20 && orderOrGroupCode.charAt(0) == '0') {//多个线下订单拼单付款
        var attributes=["OFFLINEGROUPCODE","PAYMENTSTATE","TRANSID"];
        var where={OFFLINEGROUPCODE:orderOrGroupCode};
        mec_buy_offlinegroupDAO.queryOne({attributes:attributes,where:where},function(err,msg){
            if(!err){
                if(msg && msg.PAYMENTSTATE==1){ //支付成功
                    cb(null,"paid");
                }
                else if(msg && msg.PAYMENTSTATE!=1){ //为查询到支付成功信息,可能因为回调失败
                    queryAndProcess(orderOrGroupCode,msg.TRANSID,cb);
                }
                else{
                    myLogger.error("queryPay [mec_buy_offlinegroupDAO.queryOne]: can't find this offlinegroupcode");
                    cb("can't find this offlinegroupcode", null);
                }
            }
            else{
                myLogger.error("queryPay [mec_buy_offlinegroupDAO.queryOne]: "+logErr(err));
                cb(err,null);
            }
        })
    }
    else {
        myLogger.error("queryPay [orderOrGroupCode]: illegal orderOrGroupCode");
        cb("illegal orderOrGroupCode", null);
    }
}

//支付完,通知后台支付完成全部流程
exports.notifyPay = function(data,cb){
    var result=null;
    async.waterfall([
        function(cb){
            //验证通知信息的真是性,并生成返回银联的数据
            umspay.notify(data,cb);
        },
        function(x,cb){
            result=x;
            var orderOrGroupCode= x.MerOrderId;
            var payData=data;
            //利用通知数据做帐目处理(写入订单部分,写入支付记录部分)
            payService.payComplete(orderOrGroupCode,payData,cb);
        }
    ],function(err,msg){
        if(!err){
            cb(null,result);
        }
        else{
            myLogger.error("notifyPay [async.waterfall]: "+logErr(err));
            cb(err,null);
        }
    })
}