var mec_lgt_pickdeptDAO = require("../../dao/mec_lgt_pickdeptDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_lgt_pickdeptDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_pickdeptDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_pickdeptDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_lgt_pickdeptDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_pickdeptDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_pickdeptDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})