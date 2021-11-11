/**
 * Created by lucywu on 11/21/14.
 */
var orderService = require("../../../service/web/orderService");
var protoBufUtil = require("../../../util/protoBufUtil");

var cb = function (err, msg) {
    console.log(err);
    console.log(msg);
}
var countercode = "000222";

//orderService.generateOrderCode(false,cb);
//for(var k=0;k<10;k++){
//    orderService.generateOrderCode(false,cb);
//    orderService.generateOrderCode(true,cb);
//}

//for(var k=0;k<10;k++){
//    //不能将这些对象放在外层,否则多个订单共享同一个info对象会出问题!!
//    var orderinfo={USERCODE:"gjy",DELIVERYMODE:1,COUNTERCODE:"000222",SALESMANCODE:66};
//    var contentinfo=[
//        {ITEMCODE:"1518506",NUM:1},
//        {ITEMCODE:"1518511",NUM:3},
//    ];
//    var siteinfo={PERSON:"王进城",TELEPHONE:"1888888",POSTCODE:"200240",DETAIL:"上海一所大学",PROVINCE:"上海",CITY:"上海",DISTRICT:"闵行区"};
//
//    orderService.placeOfflineOrder(orderinfo,contentinfo,siteinfo,cb);
//}

//orderService.getOfflineOrder(countercode,{},{sidx:"createdAt",sord:"desc"},cb);

//orderService.getOfflineOrderPlacedToday(countercode,{},{},cb);

//orderService.getOnlineOrder(countercode,{},{},cb);

//orderService.getOnlineOrderAcceptedToday(countercode,{},{},cb);

//orderService.getOnlineOrderUnaccepted(countercode,{},{},cb);

//orderService.getOfflineOrderWaiting(countercode,{},{},cb);

//orderService.getOnlineOrderWaiting(countercode,{},{},cb);

//orderService.getOfflineOrderDealed(countercode,{},{},cb);

//orderService.getOnlineOrderDealed(countercode,{},{},cb);

//orderService.getOfflineContentByOrder("000222","014112997105000991",cb);
//
//orderService.getOnlineContentByOrder("000222","114113093362000322",cb);

//orderService.getOnlineContentByOrder(null,"114113093362000322",cb);

//orderService.cancelOfflineOrder("014112992377000089",123,cb);

//orderService.cancelOnlineOrder("000222","114113093362000322",123,cb);

//orderService.getOnlineOrderUnpay("000222",{},{},cb);

//orderService.getOnlineOrderConfirmable("000222",{},{},cb);

//orderService.confirmOnlineOrder("000222","114113061610000319",123,cb);
//orderService.confirmOnlineOrder("000333","114113076992000321",123,cb);
//orderService.confirmOnlineOrder("000666","114113076992000321",123,cb);

//var entries=[
//        {ITEMCODE:"1518506",NUM:2,COUNTERCODE:"000222"},
//        {SKCCODE:"1525233837",NUM:1,COUNTERCODE:"000222"},
//        {SKCCODE:"1525230525",NUM:1,COUNTERCODE:"000222"}
//    ];
//orderService.getTotalPrice(entries,cb);

//var vipcode="66666666";
//var countercode="000222";
//var entries=[
//    {'itemcode': '1518506', 'num': 1},
//    {'itemcode': '1525233', 'num': 2},
//    {'itemcode': '1525232', 'num': 3},
//    {'itemcode': '1525231', 'num': 1},
//    {'skccode': '1525230392', 'num': 5},
//    {'itemcode': '1518511', 'num': 3},
//    {'itemcode': '1525245', 'num': 7},
//    {'itemcode': '1525207', 'num': 1, originprice:225}];
//orderService.getTotalPrice2(vipcode,countercode,entries,cb);


//var orderinfo = {USERCODE: "gjy", DELIVERYMODE: 1, COUNTERCODE: "000222", SALESMANCODE: 66,VIPCODE:"66666666",TEMPDISTRIBUTIONMARK:0,SHIPPRICE:10,REALSHIPPRICE:5,PACKING:5,REALPACKING:2};
//var contentinfo = [
//    {'ITEMCODE': '1518506', 'NUM': 1},
//    {'ITEMCODE': '1525233', 'NUM': 2},
//    {'ITEMCODE': '1525232', 'NUM': 3},
//    {'ITEMCODE': '1525231', 'NUM': 1},
//    {'SKCCODE': '1525230392', 'NUM': 5},
//    {'ITEMCODE': '1518511', 'NUM': 3},
//    {'ITEMCODE': '1525245', 'NUM': 7},
//    {'ITEMCODE': '1525207', 'NUM': 1, ORIGINPRICE:225}];
//var siteinfo = {PERSON: "王进城", TELEPHONE: "1888888", POSTCODE: "200240", DETAIL: "上海一所大学", PROVINCE: "上海", CITY: "上海", DISTRICT: "闵行区"};

//orderService.placeOfflineOrder2(orderinfo, contentinfo, siteinfo, cb);
//orderService.getVipinfoByTelephone("12222222222",cb);
//orderService.getOrderInfoWhenReturn("152","10201",cb);

//orderService.getInfoByCounterSkc("000222","1525233273",cb);
//orderService.getInfoByCounterSku("000222","1525233",cb);

//orderService.getInfoByCounterSku("000222","1518506",cb);

//orderService.getUsercodeByTelephone("16612345678",cb);

//orderService.updateOfflineOrderOverdue(cb);

//orderService.updateOnlineOrderOverdue(cb);

//orderService.getSiteInfoByOrder(false,"014120796528000060",cb);

//orderService.getSiteInfoByOrder(true,"114113093362000322",cb);

//var ordercode="015031267593000010";
//orderService.getOfflineContentByOrder(null,ordercode,function(err,msg){
//    var protoContent = {};
//
//    var order1="014112997105000991";
//    var order2="015030299587000030";
//    var order3="015030297742000053";
//    var order4="014112952203000419";
//    var order5="014112955899000283";
//
//    protoContent.salemancode=123456;//营业员编码
//    protoContent.salemanname="营业员haha";//营业员名字
//    if(ordercode==order1) protoContent.vipcode = "";
//    else if(ordercode==order2) protoContent.vipcode = "666666";
//    else if(ordercode==order3) protoContent.vipcode = "666666";
//    else if(ordercode==order4) protoContent.vipcode = "666666";
//    else if(ordercode==order5) protoContent.vipcode = "666111";
//    else protoContent.vipcode = "666000";
//
//    if(ordercode==order1) protoContent.ifreturn = 0;//是否是普通订单
//    else if(ordercode==order2) protoContent.ifreturn = 0;
//    else if(ordercode==order3) protoContent.ifreturn = 0;
//    else if(ordercode==order4) protoContent.ifreturn = 1;
//    else if(ordercode==order5) protoContent.ifreturn = 1;
//    else if(ordercode=="014100612845000240") protoContent.ifreturn = 1;
//    else if(ordercode=="014100617777000256") protoContent.ifreturn = 1;
//    else protoContent.ifreturn = 0;
//
//    protoContent.items=[];
//    for(var k=0;k<msg.length;k++){
//        var item={};
//        item.itemcode=parseInt(msg[k].ITEMCODE);
//        item.cabinet="000222";
//        item.unit=msg[k].UNIT;
//        item.promotioncode=msg[k].PROMOTIONMARK;
//        item.itemname=msg[k].ITEMNAME;
//        item.count=msg[k].NUM;
//        item.oriprice=msg[k].PRICE;
//        if(ordercode==order1) item.discountprice=msg[k].PRICE;
//        else if(ordercode==order2) item.discountprice=msg[k].PRICE*0.85;
//        else if(ordercode==order3) item.discountprice=msg[k].PRICE*0.85;
//        else if(ordercode==order4) item.discountprice=msg[k].PRICE*0.85;
//        else if(ordercode==order5) item.discountprice=msg[k].PRICE*0.90;
//        else item.discountprice=msg[k].PRICE*0.88;
//
//        if(ordercode==order1) item.discount="100";
//        else if(ordercode==order2) item.discount="85";
//        else if(ordercode==order3) item.discount="85";
//        else if(ordercode==order4) item.discount="85";
//        else if(ordercode==order5) item.discount="90";
//        else item.discount="88";
//
//        item.actualprice=msg[k].NUM * item.discountprice;
//        protoContent.items.push(item);
//    }
//
//    console.log(protoContent);
//    var buf = protoBufUtil.generate(null, null, "sale", "order", "sale.order.proto", protoContent);
//    console.log(buf);
//});

//orderService.getOnlineContentByOrder("000222","114113093362000322",function(err,msg){
//    var protoContent={};
//
//    protoContent.salemancode=123456;//
//    protoContent.salemanname="haha";//
//
//    protoContent.items=[];
//    for(var k=0;k<msg.length;k++){
//        var item={};
//        item.itemcode=msg[k].ITEMCODE;
//        item.cabinet=msg[k].COUNTERCODE;
//        item.unit=msg[k].UNIT;
//        item.promotioncode="X";
//        item.itemname=msg[k].ITEMNAME;
//        item.count=msg[k].NUM;
//        item.oriprice=msg[k].PRICE;
//        item.discountprice=12.45;
//        item.discount="85";
//        item.actualprice=msg[k].NUM * 12.45;
//        protoContent.items.push(item);
//    }
//
//    console.log(protoContent);
//    var buf=protoBufUtil.generate(null,null,"sale","order","sale.order.proto",protoContent);
//    console.log(buf);
//});

orderService.generateOrderCode3(1,1,cb);
orderService.generateOrderCode3(1,1,cb);
orderService.generateOrderCode3(1,1,cb);