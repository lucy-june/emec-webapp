var mec_audit_chargeDAO = require("../../dao/mec_audit_chargeDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_audit_chargeDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_audit_chargeDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_audit_chargeDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_audit_chargeDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_audit_chargeDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_audit_chargeDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})