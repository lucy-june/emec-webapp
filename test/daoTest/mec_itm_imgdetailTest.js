var mec_itm_imgdetailDAO = require("../../dao/mec_itm_imgdetailDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_imgdetailDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_imgdetailDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_imgdetailDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_imgdetailDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_imgdetailDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_imgdetailDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})