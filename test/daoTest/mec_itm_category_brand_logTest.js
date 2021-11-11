var mec_itm_category_brand_logDAO = require("../../dao/mec_itm_category_brand_logDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_category_brand_logDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_category_brand_logDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_category_brand_logDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_category_brand_logDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_category_brand_logDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_category_brand_logDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})