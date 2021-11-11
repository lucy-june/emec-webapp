var mec_app_homeDAO = require("../../dao/mec_app_homeDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_app_homeDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_app_homeDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_app_homeDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_app_homeDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_app_homeDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_app_homeDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})