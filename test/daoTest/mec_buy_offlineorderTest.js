var mec_buy_offlineorderDAO = require("../../dao/mec_buy_offlineorderDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_offlineorderDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_offlineorderDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_offlineorderDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_offlineorderDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_offlineorderDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_offlineorderDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})