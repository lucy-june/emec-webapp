var mec_buy_offlinegroupDAO = require("../../dao/mec_buy_offlinegroupDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_offlinegroupDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_offlinegroupDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_offlinegroupDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_offlinegroupDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_offlinegroupDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_offlinegroupDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})