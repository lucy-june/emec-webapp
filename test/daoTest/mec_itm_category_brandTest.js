var mec_itm_category_brandDAO = require("../../dao/mec_itm_category_brandDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_category_brandDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_category_brandDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_category_brandDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_category_brandDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_category_brandDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_category_brandDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})