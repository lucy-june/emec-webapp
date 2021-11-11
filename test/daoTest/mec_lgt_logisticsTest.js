var mec_lgt_logisticsDAO = require("../../dao/mec_lgt_logisticsDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_lgt_logisticsDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_logisticsDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_logisticsDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_lgt_logisticsDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_logisticsDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_logisticsDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})