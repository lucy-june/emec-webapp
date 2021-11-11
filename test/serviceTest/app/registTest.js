/**
 * Created by lucywu on 11/21/14.
 */
var registService   = require("../../../service/app/registService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

registService.regist({USERCODE:"dfgsd","TELEPHONE":132454555,"PASSWORD":"2"},function(err,msg){
    console.log(err);
    console.log(msg);
})

registService.sendTelCode("15216711947",cb);