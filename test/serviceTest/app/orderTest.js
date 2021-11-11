/**
 * Created by lucywu on 11/21/14.
 */
var orderService   = require("../../../service/app/orderService");

var cb=function(err,msg){
    console.log(err);
    console.log(JSON.stringify(msg));
}
var usercode="gjy";

//orderService.generateOrderCode(true,cb);
//for(var k=0;k<10;k++){
//    orderService.generateOrderCode(false,cb);
//    orderService.generateOrderCode(true,cb);
//}

//var orderinfo={USERCODE:"gjy",PAYMENTMODE:1,DELIVERYMODE:1,SITEID:1};
//var contentinfo=[
//    {SKCCODE:"1525233837",NUM:10},
//    {SKCCODE:"1525231853",NUM:393},
//    {SKCCODE:"1525230796",NUM:100},
//    {SKCCODE:"1525230525",NUM:133}
//];

//orderService.allocateDept(contentinfo,cb);
//orderService.allocateCounter("10202",contentinfo,cb);

//orderService.placeOnlineOrder(orderinfo,contentinfo,cb);


for(var k=0;k<10;k++){
    var orderinfo={USERCODE:"gjy",PAYMENTMODE:0,DELIVERYMODE:0,DELIVERYDEPTCODE:'10201',SITEID:1};
    var contentinfo=[
        {SKCCODE:"1525230076",NUM:10},
        {SKCCODE:"1525230262",NUM:1},
        {SKCCODE:"1525233351",NUM:2},
        {SKCCODE:"1525233837",NUM:6}
    ];
    orderService.placeOnlineOrder(orderinfo,contentinfo,cb);
}

//orderService.getOfflineOrderUnpay(usercode,{},{},cb);

//orderService.getOnlineOrderUnpay(usercode,{},{},cb);
//
//orderService.getOfflineOrderUnconfirm(usercode,{},{},cb);
//
//orderService.getOnlineOrderUnconfirm(usercode,{},{},cb);
//
//orderService.getOfflineOrder(usercode,{},{},cb);
//
//orderService.getOnlineOrder(usercode,{},{},cb);

//orderService.getOfflineContentByOrder("014112990793000726",cb);

//orderService.getOnlineContentByOrder("114113080431000207",cb);

//orderService.cancelOfflineOrder("014112990706001031",cb);

//orderService.cancelOnlineOrder("114113087020000264",cb);

//orderService.confirmOfflineOrder("",cb);
//
//orderService.confirmOnlineOrder("",cb);

//orderService.getGroupTotalPrice(["014100600653000250","014100607478000237"],cb);
//
//orderService.getGroupTotalPrice(["014100607478000237"],cb);

//orderService.cancelOnlineOrder("114113015576000299",cb);