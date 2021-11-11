var mec_itm_item_log1DAO = require("../../dao/mec_itm_item_log1DAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_item_log1DAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_item_log1DAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_item_log1DAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_item_log1DAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_item_log1DAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_item_log1DAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})