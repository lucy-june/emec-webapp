var mec_prm_prmruleDAO = require("../../dao/mec_prm_prmruleDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_prm_prmruleDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_prmruleDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_prmruleDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_prm_prmruleDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_prmruleDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_prmruleDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})