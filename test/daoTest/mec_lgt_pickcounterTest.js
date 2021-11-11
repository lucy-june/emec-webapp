var mec_lgt_pickcounterDAO = require("../../dao/mec_lgt_pickcounterDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_lgt_pickcounterDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_pickcounterDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_pickcounterDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_lgt_pickcounterDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_pickcounterDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_pickcounterDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})