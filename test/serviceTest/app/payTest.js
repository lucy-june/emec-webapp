/**
 * Created by lucywu on 11/21/14.
 */
var payService   = require("../../../service/app/payService");

var cb=function(err,msg){
    console.log(err);
    console.log(JSON.stringify(msg));
}
var usercode="gjy";

//payService.payPrepare(true,["114113072283000277"],cb);
//
//payService.payPrepare(false,["014112994683000546"],cb);
//
//payService.payPrepare(false,["014112994359000157","014112993672000880"],cb);

//payService.payPrepare(false,["014112994359000157","014112993672000880"],function(err,msg){
//    console.log(msg);
//
//});

payService.payComplete("114113072283000277",null,cb);