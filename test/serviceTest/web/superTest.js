/**
 * Created by lucywu on 11/21/14.
 */
var superService   = require("../../../service/web/superService");

var cb = function (err, msg) {
    console.log(err);
    console.log(msg);
}

//superService.getAccounts({},{page:1,rows:3,sidx:"USERCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.getAccounts("2014-07",{page:1,rows:3,sidx:"USERCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.getAccount("lucywu",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.addAccount({"USERCODE":"hedy","ROLE":0,PWD:"2"},"superadmin",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.modifyAccount("hedy",{PWD:"1"},"super",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.delAccount("hedy","system",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.queryCounterAssistants("000904",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//superService.addAssistant({"COUNTERCODE":"000904","SALESMANNAME":"hedy"},"super",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//superService.modifyAssistant(8,{"COUNTERCODE":"000904","SALESMANNAME":"hady"},"superadmin",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//superService.delAssistant(8,"superadmin",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});

//superService.rollbackPaid("015040156842000003",cb);

superService.modifyBusinessSetting("paymentExpireTime","2.5",function(err,msg){
    console.log(err);
    console.log(msg);
});

