var mec_adm_assistantDAO = require("../../dao/mec_adm_assistantDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_adm_assistantDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_adm_assistantDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_adm_assistantDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_adm_assistantDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_adm_assistantDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_adm_assistantDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})