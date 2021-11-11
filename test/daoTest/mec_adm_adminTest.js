var mec_adm_adminDAO = require("../../dao/mec_adm_adminDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_adm_adminDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_adm_adminDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_adm_adminDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_adm_adminDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_adm_adminDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_adm_adminDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})