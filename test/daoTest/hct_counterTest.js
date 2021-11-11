var hct_counterDAO = require("../../dao/hct_counterDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hct_counterDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hct_counterDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hct_counterDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hct_counterDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hct_counterDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hct_counterDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})