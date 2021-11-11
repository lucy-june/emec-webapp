/**
 * Created by lucywu on 11/21/14.
 */
var siteService   = require("../../../service/app/siteService");

//siteService.getAllSites("gjy",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//siteService.getDefaultSite("gjy",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//siteService.getCertainSite(10,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//非默认地址
siteService.addSite({"USERCODE":"nnn",PERSON:"y7yyyyyy",TELEPHONE:1666766,DETAIL:"#$^&$#&"},function(err,msg){
    console.log(err);
    console.log(msg);
})
////默认地址
//siteService.addSite({"ISDEFAULT":1,"USERCODE":"mmmmmm",PERSON:"yyyyy",TELEPHONE:166666,DETAIL:"#$^&$#&"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//siteService.deleteSite(66,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//siteService.deleteSite(70,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//siteService.modifySite(68,{"PERSON":"xxx"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//siteService.setDefaultSite(1,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})