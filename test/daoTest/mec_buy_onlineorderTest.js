var mec_buy_onlineorderDAO = require("../../dao/mec_buy_onlineorderDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_onlineorderDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_onlineorderDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_onlineorderDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_onlineorderDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_onlineorderDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_onlineorderDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})