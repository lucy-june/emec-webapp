var mec_buy_onlinecontentDAO = require("../../dao/mec_buy_onlinecontentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_onlinecontentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_onlinecontentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_onlinecontentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_onlinecontentDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_onlinecontentDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_onlinecontentDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})