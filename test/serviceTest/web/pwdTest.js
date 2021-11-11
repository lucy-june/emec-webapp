/**
 * Created by lucywu on 11/21/14.
 */
var pwdService   = require("../../../service/web/pwdService");

pwdService.modify("lucywu","1","2",function(err,msg){
    console.log(err);
    console.log(msg);
});

pwdService.checkUser("lucywu","2",function(msg){
    console.log(msg);
})