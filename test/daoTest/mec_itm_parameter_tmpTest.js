var mec_itm_parameter_tmpDAO = require("../../dao/mec_itm_parameter_tmpDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_parameter_tmpDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_parameter_tmpDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_parameter_tmpDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_parameter_tmpDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_parameter_tmpDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_parameter_tmpDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})