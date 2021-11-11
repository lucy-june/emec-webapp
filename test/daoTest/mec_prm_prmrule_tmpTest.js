var mec_prm_prmrule_tmpDAO = require("../../dao/mec_prm_prmrule_tmpDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_prm_prmrule_tmpDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_prmrule_tmpDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_prmrule_tmpDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_prm_prmrule_tmpDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_prmrule_tmpDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_prmrule_tmpDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})