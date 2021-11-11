var mec_itm_parameterDAO = require("../../dao/mec_itm_parameterDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_parameterDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_parameterDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_parameterDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_parameterDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_parameterDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_parameterDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})