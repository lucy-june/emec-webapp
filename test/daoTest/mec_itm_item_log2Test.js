var mec_itm_item_log2DAO = require("../../dao/mec_itm_item_log2DAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_item_log2DAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_item_log2DAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_item_log2DAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_item_log2DAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_item_log2DAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_item_log2DAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})