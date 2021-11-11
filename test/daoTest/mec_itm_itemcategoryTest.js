var mec_itm_itemcategoryDAO = require("../../dao/mec_itm_itemcategoryDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_itemcategoryDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemcategoryDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemcategoryDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_itemcategoryDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemcategoryDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemcategoryDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})