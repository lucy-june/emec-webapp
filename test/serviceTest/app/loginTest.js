/**
 * Created by lucywu on 11/21/14.
 */
var loginService   = require("../../../service/app/loginService");

loginService.dologin("gjy","2","1safff","1safff",function(err,user){
    console.log(err);
    console.log(user);
})

//loginService.checkUser("gjy","2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})