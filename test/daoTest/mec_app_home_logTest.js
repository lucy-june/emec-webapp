var mec_app_home_logDAO = require("../../dao/mec_app_home_logDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_app_home_logDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_app_home_logDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_app_home_logDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_app_home_logDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_app_home_logDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_app_home_logDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})