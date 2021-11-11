/**
 * Created by lucywu on 11/21/14.
 */
var posService   = require("../../../service/web/posService");

var cb=function(err,msg){
    console.log(err);
    console.log(JSON.stringify(msg));
}
var usercode="gjy";

//posService.getOrderInfo("015032111666000006",cb);
//posService.getOrderInfo("015032104832000007",cb);
//posService.getOrderInfo("015032191607000008",cb);

//posService.getOrderInfo("015032705387000001",cb);
//posService.getOrderInfo("015032792059000002",cb);
//posService.getOrderInfo("015040173113000014",cb);

//posService.getOrderInfo("015040105801000023",cb);

//posService.payPrepare(true,["015033121852000015"],cb);

//posService.payPrepare(false,["014112994683000546"],cb);
//
//posService.payPrepare(false,["014112994359000157","014112993672000880"],cb);

//posService.payPrepare(null,["014112994359000157"],cb);

//posService.payPrepare(false,["014112994359000157","014112993672000880"],function(err,msg){
//    console.log(msg);
//});

//posService.payPrepare("00073374",["015032132540000005","015032111666000006","015032191607000008"],cb);
//posService.payPrepare2("66666666",["015032111666000006"],cb);
//posService.payPrepare2(null,["015032104832000007","015032197900000004"],cb);
//posService.payPrepare2(null,["015032197900000004"],cb);

//posService.payComplete("015033199859000006",[],cb);

//posService.handOrderUpdateStock([{skccode:'1',countercode:'000430',num:2}],cb);

//posService.notifyMisPaidOrder("015032184571000002",cb);

//posService.payComplete(
//    "015033121852000015",
//    {
//    "storecode":"10501",
//    "poscode":"06102",
//    "dealnum":"152",
//    "cashiercode":"000001",
//    "overtime":"2015-3-31 13:35:28",
//    "paylist":[{
//        "id":0,
//        "paycode":"01",
//        "amount":888,
//        "extracode":"",
//        "creditport":"",
//        "bankcardcode":"",
//        "feerate":"0"}]
//    },
//    cb
//);

posService.notifyMisPaidOrder("215052576425000018",cb);








