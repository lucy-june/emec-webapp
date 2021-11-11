var itm_itemDAO = require("../../dao/itm_itemDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

itm_itemDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

itm_itemDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

itm_itemDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//itm_itemDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//itm_itemDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//itm_itemDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})