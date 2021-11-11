/**
 * Created by lucywu on 11/21/14.
 */
var cartService   = require("../../../service/app/cartService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}
var usercode="gjy";

//cartService.getCart(usercode,cb);

//cartService.mergeAndGetCart("gjy",null,cb);

//cartService.mergeAndGetCart("gjy",[{SKCCODE:"1525230262",NUM:-3},{SKCCODE:"1525233837",NUM:2}],cb);

//cartService.mergeAndGetCart("gjy",[{SKCCODE:"1525230262",NUM:-3},{SKCCODE:"1525233837",NUM:2}],cb);

//cartService.addCart(usercode,"1525231054",10,cb);

//cartService.getCart(usercode,cb);

//cartService.updateCart(30,{NUM:218},cb);

//cartService.delCart(30,cb);

//cartService.getTotalPrice([{SKCCODE:"1",NUM:1},{SKCCODE:"1525231054",NUM:10}],cb);

//cartService.delCart2("wjc","3",cb);

//cartService.updateCart2("wjc","6",6,cb);

cartService.refreshUnloginCartSkcs(["1525231372","1525230392"],cb);