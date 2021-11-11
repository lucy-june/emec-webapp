var mec_app_activityDAO = require("../../dao/mec_app_activityDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_app_activityDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_app_activityDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_app_activityDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_app_activityDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_app_activityDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_app_activityDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})