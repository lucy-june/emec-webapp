var mec_itm_imgdetail_logDAO = require("../../dao/mec_itm_imgdetail_logDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_imgdetail_logDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_imgdetail_logDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_imgdetail_logDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_imgdetail_logDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_imgdetail_logDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_imgdetail_logDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})