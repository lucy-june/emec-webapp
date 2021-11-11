/**
 * Created by lucywu on 11/21/14.
 */
var regionService   = require("../../../service/app/regionService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

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

regionService.getRawRegions(cb);