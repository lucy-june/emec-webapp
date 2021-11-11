var mec_vip_merchantcardDAO = require("../../dao/mec_vip_merchantcardDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vip_merchantcardDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vip_merchantcardDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vip_merchantcardDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_vip_merchantcardDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_vip_merchantcardDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_vip_merchantcardDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})