var mec_itm_itemcategory_tmpDAO = require("../../dao/mec_itm_itemcategory_tmpDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_itemcategory_tmpDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemcategory_tmpDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemcategory_tmpDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_itemcategory_tmpDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemcategory_tmpDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemcategory_tmpDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})