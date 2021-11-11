var mec_ctm_siteDAO = require("../../dao/mec_ctm_siteDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_ctm_siteDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_ctm_siteDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_ctm_siteDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_ctm_siteDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_ctm_siteDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_ctm_siteDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})