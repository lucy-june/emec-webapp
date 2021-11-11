/**
 * Created by lucywu on 11/21/14.
 */
var itemService   = require("../../../service/app/itemService");

var itemcode="1525230";
var cb=function(err,msg){console.log(err);console.log(msg);};


itemService.getSkcStock("1525230796",cb);

itemService.getOnlineSellingSkuForApp(itemcode,cb);