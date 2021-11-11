/**
 * Created by lucywu on 11/21/14.
 */
var searchService   = require("../../../service/app/searchService");


//searchService.searchOnlineSellingSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//searchService.searchOnlineSellingSku("2014-07-12 07:06:17",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//searchService.searchOnlineSellingSku("152",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//searchService.searchOnlineSellingSku("时尚",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

searchService.searchOnlineSellingSku("",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
    console.log(err);
    console.log(msg);
})
