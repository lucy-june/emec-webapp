var mec_anl_hotbuyDAO = require("../../dao/mec_anl_hotbuyDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_anl_hotbuyDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_anl_hotbuyDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_anl_hotbuyDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_anl_hotbuyDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_anl_hotbuyDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_anl_hotbuyDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})