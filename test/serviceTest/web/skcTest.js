/**
 * Created by lucywu on 11/21/14.
 */
var skcService   = require("../../../service/web/skcService");

var itemcode="1525230";
var skcs=[
    {ITEMCODE:"1525230",MERCHANTSKCCODE:"3245234",COLOR:"紫色",SIZE:"XL"},
    {ITEMCODE:"1525230",COLOR:"红色",SIZE:"XXL"},
    {ITEMCODE:"1525230",COLOR:"淡蓝色",SIZE:"XXL"}
];
var skcs2=[
    {SKCCODE:"1525230796",ITEMCODE:"1525230",MERCHANTSKCCODE:"3289734",COLOR:"紫色",SIZE:"XL(175cm)"},
    {ITEMCODE:"1525230",COLOR:"黑色",SIZE:"XXL"},
    {ITEMCODE:"1525230",COLOR:"淡蓝色",SIZE:"XXL"},
    {ITEMCODE:"1525230",COLOR:"花色",SIZE:"XXXL"}
];

var cb=function(err,msg){console.log(err);console.log(msg);};

//skcService.generateSkccodes(itemcode,skcs);
//console.log(skcs);

//skcService.getSkcUninitialSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skcService.initialSkc(itemcode,skcs,"tester1",function(err,msg){
//   console.log(err);
//   console.log(msg);
//});
//
//skcService.getSkcRenewableSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//   console.log(msg);
//});
//
//skcService.getRenewableSkcBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//});

//skcService.getApprovedSkcBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.updateSkc(itemcode,[],"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.approveSkc(itemcode,"test3",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.updateSkc(itemcode,[],"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.updateSkc(itemcode,skcs,"test5",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.updateSkc(itemcode,skcs2,"test5",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.approveSkc(itemcode,"test6",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.updateSkc(itemcode,skcs,"test8",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.approveSkc(itemcode,"test9",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.updateSkc(itemcode,[],"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.approveSkc(itemcode,"test9",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skcService.getSkcCheckableSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skcService.getCheckableSkcBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skcService.invalidSkc(itemcode,"test8",function(err,msg){
//  console.log(err);
//  console.log(msg);
//})


//var itemcode3="1525231";
//var itemcode4="1525232";
//var itemcode5="1525233";
//
//var skcs3=[
//    {ITEMCODE:"1525231",COLOR:"浅紫色",SIZE:"XL"},
//    {ITEMCODE:"1525231",COLOR:"红色",SIZE:"XXL"},
//    {ITEMCODE:"1525231",COLOR:"橙色",SIZE:"XXL"}
//];
//var skcs4=[
//    {ITEMCODE:"1525232",COLOR:"金色",SIZE:"22"},
//    {ITEMCODE:"1525232",COLOR:"褐色",SIZE:"22"},
//    {ITEMCODE:"1525232",COLOR:"黑色",SIZE:"21"},
//    {ITEMCODE:"1525232",COLOR:"白色",SIZE:"22"}
//];
//
//var skcs5=[
//    {ITEMCODE:"1525233",COLOR:"黑色",SIZE:null},
//    {ITEMCODE:"1525233",COLOR:"深蓝色",SIZE:null},
//    {ITEMCODE:"1525233",COLOR:"菜色",SIZE:null}
//];

//skcService.initialSkc(itemcode3,skcs3,"tester1",cb);
//skcService.initialSkc(itemcode4,skcs4,"tester1",cb);
//skcService.initialSkc(itemcode5,skcs5,"tester1",cb);

//skcService.approveSkc(itemcode3,"test6",cb);
//skcService.approveSkc(itemcode4,"test6",cb);
//skcService.approveSkc(itemcode5,"test6",cb);

//skcService.updateSkc(itemcode3,skcs3,"tester1",cb);
//skcService.updateSkc(itemcode4,skcs4,"tester1",cb);
//skcService.updateSkc(itemcode5,skcs5,"tester1",cb);

//skcService.invalidSkc(itemcode3,"test6",cb);
//skcService.invalidSkc(itemcode4,"test6",cb);
//skcService.invalidSkc(itemcode5,"test6",cb);
