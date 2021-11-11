var mec_ctm_bankcardDAO = require("../../dao/mec_ctm_bankcardDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_ctm_bankcardDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_ctm_bankcardDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_ctm_bankcardDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_ctm_bankcardDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_ctm_bankcardDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_ctm_bankcardDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})