/**
 * Created by lucywu on 11/21/14.
 */
var categoryService   = require("../../../service/app/categoryService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

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
//categoryService.getItemsByCategory("女式钱包",{page:1,rows:3,sidx:"PRICE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})


categoryService.getRawCategories(cb);