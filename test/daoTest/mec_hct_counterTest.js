var mec_hct_counterDAO = require("../../dao/mec_hct_counterDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_hct_counterDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_hct_counterDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_hct_counterDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_hct_counterDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_hct_counterDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_hct_counterDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})