/**
 * Created by lucywu on 11/21/14.
 */
var accountService   = require("../../../service/web/accountService");

accountService.display("lucywu",function(err,msg){
    console.log(err);
    console.log(msg);
})

accountService.modify({TELEPHONE:16666666},"lucywu",function(err,msg){
    console.log(err);
    console.log(msg);
})