/**
 * Created by lucywu on 10/22/14.
 */
var logisticsService    = require("../../../service/web/logisticsService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

//logisticsService.getOrderLevel({PACKAGESTATE:[0,1,3,4,5,6,7,8,9,11]},null,null,cb);

//logisticsService.getRelatedOrderLevel({PACKAGESTATE:[0,1,3,4,5,6,7,8,9,11]},null,null,"10201",cb);

//logisticsService.getPackageLevel({PACKAGESTATE:[0,1,3,4,5,6,7,8,9,11]},null,null,cb);

//logisticsService.getPackageLevel({ORDERCODE:"114091637883000000"},null,null,cb);

//logisticsService.getRelatedPackageLevel({PACKAGESTATE:[0,1,3,4,5,6,7,8,9,11]},null,null,"10201",cb);

//logisticsService.getDetailLevel({where:{PACKAGECODE:"114080197622000000-000086"}},cb);

//logisticsService.updatePackageState(["114091688511000000-000611","114091688511000000-000430"],0,1,"","","wuliu1",function(err){console.log(err);})
//logisticsService.updatePackageState(["114080197622000000-000034"],5,2,"","","wuliu1",function(err){console.log(err);});
//logisticsService.updatePackageState(["114091688511000000-000106"],1,2,"","A2","wuliu1",function(err){console.log(err);});

//logisticsService.isToOtherDept("114080197622000000-000086",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//logisticsService.getSuggestPosition("114091688511000000-000430","10201",function(err,msg){
//    console.log("!!!"+err);
//    console.log("####"+msg);
//})

//logisticsService.getSuggestPositions(["114091688511000000-000430","114080197622000000-000430","114091637883000000-000430"],"10201",function(msg){
//    console.log("#########"+JSON.stringify(msg));
//})

//logisticsService.searchTotalPackage("0141129936720008",{},cb);

logisticsService.getPreparingPackage("000222",cb);

//logisticsService.preparePackage("014112993672000880-000222",12,cb);

//logisticsService.getCollectingPackage("10201",cb);

//logisticsService.collectPackage1("114091621823000001-000430","A2","testwuliu",cb);

//logisticsService.collectPackage2("114080197622000000-000034","B2","testwuliu",cb);

//logisticsService.getTransferablePackage("10202",cb);

//logisticsService.transferPackage('114080197622000000-000034','test',cb);

//logisticsService.collectPackage3('114080197622000000-000034',"A6","test",cb);

//logisticsService.collectPackage2('114080197622000000-000106',"B3","testa",cb);

//logisticsService.transferPackage('114080197622000000-000106','testb',cb);

//logisticsService.collectPackage3('114080197622000000-000106',"A3",'testd',cb);

//logisticsService.getPackableOrder("10202",cb);

//logisticsService.packOrder("014112993672000880","C5","testA",cb);

//logisticsService.getDeliverableOrders("10201",cb);

//logisticsService.getDeliveringOrders("10201",cb);

//logisticsService.sendExpress('014112993672000880',"顺丰","588426068483","testUser",cb);

//logisticsService.getPickDeptOrders("10201",cb);

//logisticsService.pickDeptOrder("114080197622000000","679950","testwuliu",cb);

//logisticsService.getPickCounterOrders("000222",cb);

//logisticsService.pickCounterOrder('014110172994000000','000676','487117','test',cb);