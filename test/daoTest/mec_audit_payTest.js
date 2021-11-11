var mec_audit_payDAO = require("../../dao/mec_audit_payDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_audit_payDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_audit_payDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_audit_payDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_audit_payDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_audit_payDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_audit_payDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})