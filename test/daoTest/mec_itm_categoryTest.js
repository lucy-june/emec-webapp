var mec_itm_categoryDAO = require("../../dao/mec_itm_categoryDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_categoryDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_categoryDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_categoryDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_categoryDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_categoryDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_categoryDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})