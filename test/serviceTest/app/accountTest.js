/**
 * Created by lucywu on 11/21/14.
 */
var accountService   = require("../../../service/app/accountService");

accountService.display("gjy",function(err,msg){
    console.log(err);
    console.log(msg);
})

accountService.modify({TELEPHONE:16666666},"ooo",function(err,msg){
    console.log(err);
    console.log(msg);
})

