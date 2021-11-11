var mec_lgt_packageDAO = require("../../dao/mec_lgt_packageDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_lgt_packageDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_packageDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_packageDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_lgt_packageDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_packageDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_packageDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})