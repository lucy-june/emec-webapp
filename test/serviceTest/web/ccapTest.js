/**
 * Created by lucywu on 11/21/14.
 */
var ccapService    = require("../../../service/web/ccapService");

ccapService.generateCcap(function(txt,buf){
    console.log(txt);
    console.log(buf);
})

ccapService.ccapHash("3327h2",function(msg){
    console.log(msg);
})