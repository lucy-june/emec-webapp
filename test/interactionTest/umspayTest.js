/**
 * Created by lucywu on 12/19/14.
 */

var umspay = require("../../interaction/umspay");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}


////测试签名解签
//var testCrypto = function () {
//    //本地生成的一对公私钥
//    var fs = require("fs");
//    var privateKeySSL = fs.readFileSync('../security/keys/privatekey.pem');
//    var publicKeySSL = fs.readFileSync('../security/keys/certificate.pem');
//    var data = "123456";
//    var s = umspay.sign(privateKeySSL, data);
//    var v = umspay.verify(publicKeySSL, data, s);
//    console.log(s);
//    console.log(v)
//}
//testCrypto();
//
//
//
////测试https请求
//var testHttps = function () {
//    var httpsRequest = require('../../util/httpsRequest');
//    httpsRequest({
//        hostname: "bbs.ecnu.edu.cn",
//        port: "443",
//        method: "get",
//        path: "/file/bbs/index/index.htm"
//    }, function (err,msg) {
//        console.log(err);
//        console.log(msg);
//    });
//}
//testHttps();


var data = {
    'MerOrderId': '12345678',//商户订单号
    'TransAmt': '222',//交易金额
    'OrderDesc': '这是个重要的订单'//订单描述
}
umspay.regist(data,cb); //pay 6222021001144131239 15216711947


var data = {
    'MerOrderId': '12345678',//商户订单号
    'TransId': '662014121926916983',//交易流水号662014121726914660
    'Reserve': '我来查一查'//备用字段
}
umspay.query(data,cb);


var data={
    OrderTime: '190815',
    LiqDate: '20141219',
    memo: '这是个重要的订单',
    IsNew: 'N',
    MerTermId: '99999999',
    Account: '6222021001144131239',
    RespMsg: '订单查询成功',
    MerName: 'Pem文件全民捷付测试商户',
    Signature: '344D1391610B35A1F90C436B69AB9BEF012038090C95CB29D8DA3DB02A860BE5FDF7EDE14BBBDE0F3373A714E0DEB6B290E353CD0BC4491B876D7BC0AE16602BE19101DC4AC0344992ECEBC4BFE1B93EB8F575CEECD6538A81391DFF177400056416CEE9E13A70FD268EBAE68E565284510DC9768A63AB2B3FDF46B615215E51',
    RespCode: '00000',
    RefId: '191121291095',
    TransId: '662014121926917320',
    TransState: '1',
    TransType: 'NoticePay',
    PayState: '1',
    Reserve: '',
    TransDesc: '交易成功',
    TransAmt: '222',
    OrderDate: '20141219',
    MerOrderId: '12345678',
    TransCode: '201202',
    NotifyUrl: 'http://202.120.40.97:2004/',
    payType: '1',
    MerId: '898000093990002' };
umspay.notify(data,cb);