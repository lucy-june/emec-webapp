var hsy_paymodeDAO = require("../../dao/hsy_paymodeDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_paymodeDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_paymodeDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_paymodeDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_paymodeDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_paymodeDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_paymodeDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})