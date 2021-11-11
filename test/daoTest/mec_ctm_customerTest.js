var mec_ctm_customerDAO = require("../../dao/mec_ctm_customerDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_ctm_customerDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_ctm_customerDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_ctm_customerDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_ctm_customerDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_ctm_customerDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_ctm_customerDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})