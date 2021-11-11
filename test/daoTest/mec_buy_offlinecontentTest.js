var mec_buy_offlinecontentDAO = require("../../dao/mec_buy_offlinecontentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_offlinecontentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_offlinecontentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_offlinecontentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_offlinecontentDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_offlinecontentDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_offlinecontentDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})