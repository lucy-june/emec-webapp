var mec_audit_discountDAO = require("../../dao/mec_audit_discountDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_audit_discountDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_audit_discountDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_audit_discountDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_audit_discountDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_audit_discountDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_audit_discountDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})