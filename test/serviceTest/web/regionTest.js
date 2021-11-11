/**
 * Created by lucywu on 11/21/14.
 */
var regionService   = require("../../../service/web/regionService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

//regionService.refreshRegionCache(function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//regionService.getRegionNameById(6,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//regionService.getRegionIdByName("男士用品区",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//
//for(var k=0;k<2;k++){
//    regionService.getReverseCategories(function(err,msg){
//        console.log(err);
//        console.log(msg);
//    });
//}
//
//regionService.getCategories(function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//
//
//regionService.getItemsByRegion("男士用品区",{page:1,rows:3,sidx:"PRICE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})


//regionService.updateRegion(6,"xxxx","test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//regionService.updateRegion(6,"女包区","test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//
//regionService.addRegion(23,"男士商务钱包","test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//regionService.queryRegion1(cb);
//regionService.querySonRegion(5,cb);
