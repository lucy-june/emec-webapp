/**
 * Created by lucywu on 12/11/14.
 */
var node_env = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var umspayConfig = require('../config/umspayConfig.json')[node_env];
var myLogger = require('../logging/contextLogger')("interaction/umspay");
var fs = require("fs");
var objectUtil = require("../util/objectUtil");
var dateUtil = require("../util/dateUtil");
var crypto = require('crypto');
var httpsRequest = require('../util/httpsRequest');
var urlencode = require('urlencode');
var privateKey = fs.readFileSync('../security/paymentKeys/private.pem'); //商户测试私钥
var publicKey = fs.readFileSync('../security/paymentKeys/public.pem'); //银联测试公钥

//签名,返回16进制签名字符串
var sign = function (privateKey, data) {
    var data = new Buffer(data + "");
    var sign = crypto.createSign("RSA-SHA1");
    sign.update(data);
    return sign.sign(privateKey, "hex");
}
exports.sign=sign;

//验签,返回true/false
var verify = function (publicKey, data, signature) {
    var data = new Buffer(data + "");
    var verifier = crypto.createVerify("RSA-SHA1");
    verifier.update(data);
    return verifier.verify(publicKey, signature, "hex");
}
exports.verify=verify;

//注册支付流水号
exports.regist = function (data, cb) {
    data.MerId = data.MerId || umspayConfig.merid;//商户号
    data.MerTermId = data.MerTermId || umspayConfig.mertermid;//终端号
    data.NotifyUrl = data.NotifyUrl || umspayConfig.notify;//回调地址
    data.TransCode = data.TransCode || '201201';//交易代码const value
    data.EffectiveTime = data.EffectiveTime || '0';//订单有效期
    data.TransType = data.TransType || 'NoticePay';//交易类型NoticePay or Pay
    data.OrderTime = data.OrderTime || dateUtil.getNowSimpleTimeStr();//订单时间date hhmmss
    data.OrderDate = data.OrderDate || dateUtil.getNowSimpleDateStr();//订单日期yyyymmdd

    //签名
    data.MerSign = "";
    data.MerSign += data.OrderTime || "";//订单时间
    data.MerSign += data.EffectiveTime || "";//订单有效期
    data.MerSign += data.OrderDate || "";//订单日期
    data.MerSign += data.MerOrderId || "";//商户订单号
    data.MerSign += data.TransType || "";//交易类型
    data.MerSign += data.TransAmt || "";//交易金额
    data.MerSign += data.MerId || "";//商户号
    data.MerSign += data.MerTermId || "";//终端号
    data.MerSign += data.NotifyUrl || "";//通知url
    data.MerSign += data.OrderDesc || "";//订单描述
    data.MerSign = sign(privateKey, data.MerSign);
    myLogger.trace("create [data.MerSign]: " + data.MerSign);

    //请求参数
    var options = objectUtil.clone(umspayConfig.regist);
    options.post_data = "jsonString=" + urlencode(JSON.stringify(data));
    options.headers = {
        "Content-Type": 'application/x-www-form-urlencoded',
        "Content-Length": options.post_data.length
    };
    myLogger.trace("create [request options]: " + JSON.stringify(options));

    //请求银联
    httpsRequest(options, function (err, msg) {
            if (!err) {
                myLogger.trace("create [httpsRequest.msg]: " + msg);
                msg = eval("(" + msg + ")");

                //验签
                var verifyStr = '';
                verifyStr += msg.MerOrderId || "";//商户订单号
                verifyStr += msg.ChrCode || "";//订单特征码
                verifyStr += msg.TransId || "";//交易流水号
                verifyStr += msg.Reserve || "";//备用字段
                verifyStr += msg.RespCode || "";//响应码
                verifyStr += msg.RespMsg || "";//响应码描述
                myLogger.trace("create [verifyStr]: " + verifyStr);
                myLogger.trace("create [signature]: " + msg.Signature);

                if (!msg.Signature || !verify(publicKey, verifyStr, msg.Signature)) {//验签失败
                    myLogger.error("create [verify signature]: failed");
                    cb("verify signature failed", null);
                }
                if (msg.RespCode == null || typeof(msg.RespCode) == "number") {//下单失败
                    myLogger.error("create [respcode]: failed order");
                    cb("failed order", null);
                }

                //创建支付流水号成功
                var result = {};
                result.transId = msg.TransId;//交易流水号
                result.chrCode = msg.ChrCode;//订单特征码
                result.merSign = sign(privateKey, msg.TransId + msg.ChrCode);
                result.merId = umspayConfig.merid;//商户号
                myLogger.trace("create [result]: " + JSON.stringify(result));
                cb(null, result);
            }
            else {
                myLogger.error("create [request umspay err]: " + logErr(err));
                cb(err, null);
            }
        }
    )
}

//支付查询
exports.query = function (data, cb) {
    data.MerId = data.MerId || umspayConfig.merid;//商户号
    data.MerTermId = data.MerTermId || umspayConfig.mertermid;//终端号
    data.TransCode = data.TransCode || '201203';//交易代码const value
    data.ReqTime = data.ReqTime || dateUtil.getNowSimpleStr();//请求时间date yyyymmddhhmmss
    data.OrderDate = data.OrderDate || dateUtil.getNowSimpleDateStr();//订单日期yyyymmdd

    //签名
    data.MerSign = "";
    data.MerSign += data.ReqTime || "";//请求时间
    data.MerSign += data.OrderDate || "";//订单日期
    data.MerSign += data.MerOrderId || "";//商户订单号
    data.MerSign += data.TransId || "";//交易流水
    data.MerSign += data.MerId || "";//商户号
    data.MerSign += data.MerTermId || "";//终端号
    data.MerSign += data.Reserve || "";//备用字段
    data.MerSign = sign(privateKey, data.MerSign);
    myLogger.trace("query [data.MerSign]: " + data.MerSign);

    //请求参数
    var options = objectUtil.clone(umspayConfig.query);
    options.post_data = "jsonString=" + urlencode(JSON.stringify(data));
    options.headers = {
        "Content-Type": 'application/x-www-form-urlencoded',
        "Content-Length": options.post_data.length
    };
    myLogger.trace("query [request options]: " + JSON.stringify(options));

    //请求银联
    httpsRequest(options, function (err, msg) {
            myLogger.trace("query [httpsRequest.msg]: " + msg);
            msg = eval("(" + msg + ")");

            //验签
            var verifyStr = '';
            verifyStr += msg.OrderTime || "";//订单时间
            verifyStr += msg.OrderDate || "";//订单日期
            verifyStr += msg.MerOrderId || "";//商户订单号
            verifyStr += msg.TransType || "";//交易类型
            verifyStr += msg.TransAmt || "";//交易金额
            verifyStr += msg.MerId || "";//商户号
            verifyStr += msg.MerTermId || "";//终端号
            verifyStr += msg.TransId || "";//交易流水
            verifyStr += msg.TransState || "";//交易状态
            verifyStr += msg.RefId || "";//系统检索号
            verifyStr += msg.Reserve || "";//备用字段
            verifyStr += msg.RespCode || "";//响应码
            verifyStr += msg.RespMsg || "";//响应码描述
            myLogger.trace("query [verifyStr]: " + verifyStr);
            myLogger.trace("query [signature]: " + msg.Signature);

            if (!msg.Signature || !verify(publicKey, verifyStr, msg.Signature)) {//验签失败
                myLogger.error("query [verify signature]: failed");
                cb("verify signature failed", null);
            }
            if (msg.RespCode == null || typeof(msg.RespCode) == "number") {//下单失败
                myLogger.error("query [respcode]: failed order");
                cb("failed order", null);
            }

            //请求和验签成功
            myLogger.info("query [response and verify]: success")
            cb(null, msg);
        }
    )
}

//响应回调
exports.notify = function (data, cb) {
    //验签
    var verifyStr = '';
    verifyStr += data.OrderTime || "";//订单时间
    verifyStr += data.OrderDate || "";//订单日期
    verifyStr += data.MerOrderId || "";//商户订单号
    verifyStr += data.TransType || "";//交易类型
    verifyStr += data.TransAmt || "";//交易金额
    verifyStr += data.MerId || "";//商户号
    verifyStr += data.MerTermId || "";//终端号
    verifyStr += data.TransId || "";//交易流水
    verifyStr += data.TransState || "";//交易状态
    verifyStr += data.RefId || "";//系统检索号
    verifyStr += data.Account || "";//支付卡号
    verifyStr += data.TransDesc || "";//交易描述
    verifyStr += data.Reserve || "";//备用字段
    myLogger.trace("notify [verifyStr]: " + verifyStr);
    myLogger.trace("notify [signature]: " + data.Signature);

    if (!data.Signature || !verify(publicKey, verifyStr, data.Signature)) {//验签失败
        myLogger.error("notify [verify signature]: failed");
        cb("verify signature failed", null);
    }

    //构造返回数据
    var result = {
        'TransCode': '201202',
        'MerOrderId': data['MerOrderId'],
        'TransType': 'NoticePay',
        'MerId': data['MerId'],
        'MerTermId': data['MerTermId'],
        'TransId': data['TransId'],
        'MerPlatTime': dateUtil.getNowSimpleStr(),
        'MerOrderState': '00',
        'Reserve': ''
    };

    //签名
    result.MerSign = "";
    result.MerSign += result.MerOrderId || "";//商户订单号
    result.MerSign += result.TransType || "";//交易类型
    result.MerSign += result.MerId || "";//商户号
    result.MerSign += result.MerTermId || "";//终端号
    result.MerSign += result.TransId || "";//交易流水
    result.MerSign += result.MerPlatTime || "";//处理时间
    result.MerSign += result.MerOrderState || "";//处理状态
    result.MerSign += result.Reserve || "";//备用字段
    result.MerSign = sign(privateKey, result.MerSign);

    cb(null,result);
}



