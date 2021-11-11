/**
 * Created by lucywu on 11/20/14.
 */

exports.paymentExpireTime=60; //单位小时，订单超时时间60分钟

var superService = require('../service/web/superService');

//var interval=5000;
var interval=1800000;

var setpaymentExpireTime=function(){
    var key="paymentExpireTime";
    superService.getBusinessSetting(key,function(err,msg){
        if(!err){
            var value=msg.VALUE;
            exports.paymentExpireTime=Number(value);
//            console.log(exports.paymentExpireTime);
        }else{
            console.log(err);
        }
    });
}

setpaymentExpireTime();
setInterval(setpaymentExpireTime, interval);

