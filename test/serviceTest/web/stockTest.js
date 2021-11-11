/**
 * Created by lucywu on 11/21/14.
 */
var stockService   = require("../../../service/web/stockService");

var itemcode="1525230";
var itemcode1="1525231";
var itemcode2="1525232";
var itemcode3="1525233";
var skccode="1525230796";
var skccode1="1525230076";
var skccode2="1525230392";
var skccode3="1525230525";
var countercode="000222";
var countercode1="000333";
var countercode2="000666";

var cb=function(err,msg){console.log(err);console.log(msg);};

//stockService.getCounterHasstockSku(countercode,{},{page:1,rows:10,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
stockService.getCounterSkcStock(countercode,itemcode,function(err,msg){
    console.log(err);
    console.log(msg);
})
//
//stockService.increaseStock(countercode,skccode,500,"testAsistant",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode1,100,"testAsistant",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode2,10,"testAsistant",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode1,skccode2,1000,"testAsistant",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode1,skccode3,3000,"testAsistant",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode1,skccode,2000,"testAsistant",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//



//stockService.increaseStock(countercode,skccode,1000,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,1,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode,1,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.decreaseStock(countercode,skccode,2,"testAsistant2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//
//stockService.increaseStock(countercode1,skccode1,200,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode1,skccode2,133,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode1,skccode3,145,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode2,skccode1,1241,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode2,skccode2,754,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode2,skccode3,144,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode1,754,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//stockService.increaseStock(countercode,skccode2,144,"testAsistant1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})


//var massStocking=function(countercode){
//    stockService.getCounterHasstockSku(countercode,{},{page:1,rows:10,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//        console.log(err);
//        console.log(msg);
//        msg.rows.forEach(function(sku){
//            var itemcode=sku.ITEMCODE;
//            stockService.getCounterSkcStock(countercode,itemcode,function(err,msg){
//                console.log(err);
//                console.log(msg);
//                msg.forEach(function(obj){
//                    var skccode=obj.SKCCODE;
//                    stockService.increaseStock(countercode,skccode,Math.floor(Math.random()*222),"testAsistant1",function(err,msg){
//                        console.log(err);
//                        console.log(msg);
//                    })
//                })
//            })
//
//        })
//    })
//};
//
//massStocking(countercode);
//massStocking(countercode1);
//massStocking(countercode2);

//stockService.getCounterSkcStock(countercode,itemcode,cb);
//stockService.getCounterSkcStock(countercode,itemcode1,cb);
//stockService.getCounterSkcStock(countercode,itemcode2,cb);
//stockService.getCounterSkcStock(countercode1,itemcode1,cb);
//stockService.getCounterSkcStock(countercode1,itemcode2,cb);
//stockService.getCounterSkcStock(countercode1,itemcode3,cb);
//stockService.getCounterSkcStock(countercode2,itemcode1,cb);
//stockService.getCounterSkcStock(countercode2,itemcode2,cb);
//stockService.getCounterSkcStock(countercode2,itemcode3,cb);
//stockService.getCounterSkcStock(countercode2,itemcode,cb);