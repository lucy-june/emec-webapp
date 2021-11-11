/**
 * Created by lucywu on 11/21/14.
 */
var categoryService   = require("../../../service/web/categoryService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

//categoryService.refreshCategoryCache(function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//categoryService.getCategoryNameById(143,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//categoryService.getCategoryIdByName("男式保暖",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//
//for(var k=0;k<2;k++){
//    categoryService.getReverseCategories(function(err,msg){
//        console.log(err);
//        console.log(msg);
//    });
//}
//
//categoryService.getCategories(function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//
//
//categoryService.getItemsByCategory("男式钱包",{page:1,rows:3,sidx:"PRICE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})


//categoryService.updateCategory(173,"xxxx","test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//categoryService.updateCategory(173,"男士钱包","test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//
//categoryService.addCategory(173,"男士商务钱包","test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//categoryService.getCategoryParamTemplate(143,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//categoryService.renewCategoryParamTemplate("135",["材质","代言人","款式","季节","人群"],"test1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//categoryService.queryCategory1(cb);
//
//categoryService.querySonCategory(8,cb);
