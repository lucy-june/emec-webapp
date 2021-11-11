var mec_prm_ruleDAO = require("../../dao/mec_prm_ruleDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_prm_ruleDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_ruleDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_ruleDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_prm_ruleDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_ruleDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_ruleDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})