var hct_brandDAO = require("../../dao/hct_brandDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hct_brandDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hct_brandDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hct_brandDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hct_brandDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hct_brandDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hct_brandDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})