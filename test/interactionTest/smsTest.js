//var soap = require('soap');
//
//var sms_url = 'http://www.wemediacn.net/webservice/smsservice.asmx?wsdl';
//
//var args={
//    mobile:"15216711947",
//    FormatID: 8,
//    Content: "测试123456 XJH",
//    ScheduleDate: new Date(),
//    TokenID:"7100105830590823"
//};
//
//soap.createClient(sms_url, function (err, client1) {
//    if (!err) {
////        client1.setSOAPAction("http://www.wemediacn.net/webservice/smsservice.asmx/SendSMS");
//        client1.SendSMS(args, function (err, result) {
//            console.log(err);
//            console.log(result);
//        });
//    } else {
//        console.log(err);
//    }
//});

var sms = require("../../interaction/sms");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

sms.sendSMS("18801971089","8","尊敬的袁博：由于今天汇金金钱豹餐厅用餐人数太多，我们另改时间邀请！给您带来不便敬请谅解","2015-1-1",cb);
