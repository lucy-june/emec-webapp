/**
 * Created by lucywu on 11/21/14.
 */
var pwdService   = require("../../../service/app/pwdService");

pwdService.modify("gjy","1","2",function(err,msg){
    console.log(err);
    console.log(msg);
});

pwdService.checkUser("gjy","2",function(msg){
    console.log(msg);
})