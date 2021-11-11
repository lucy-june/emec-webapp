var mec_itm_skcDAO = require("../../dao/mec_itm_skcDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_skcDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_skcDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_skcDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_skcDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_skcDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_skcDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})