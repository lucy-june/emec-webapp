var hct_merchantDAO = require("../../dao/hct_merchantDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hct_merchantDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hct_merchantDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hct_merchantDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hct_merchantDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hct_merchantDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hct_merchantDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})