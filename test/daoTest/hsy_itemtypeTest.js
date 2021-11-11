var hsy_itemtypeDAO = require("../../dao/hsy_itemtypeDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_itemtypeDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_itemtypeDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_itemtypeDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_itemtypeDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_itemtypeDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_itemtypeDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})