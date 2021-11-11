var mec_anl_hotbrandDAO = require("../../dao/mec_anl_hotbrandDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_anl_hotbrandDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_anl_hotbrandDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_anl_hotbrandDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_anl_hotbrandDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_anl_hotbrandDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_anl_hotbrandDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})