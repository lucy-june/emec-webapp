var mec_buy_onlineorder_logDAO = require("../../dao/mec_buy_onlineorder_logDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_onlineorder_logDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_onlineorder_logDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_onlineorder_logDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_onlineorder_logDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_onlineorder_logDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_onlineorder_logDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})