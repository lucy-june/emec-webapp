var hsy_retailtypeDAO = require("../../dao/hsy_retailtypeDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_retailtypeDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_retailtypeDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_retailtypeDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_retailtypeDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_retailtypeDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_retailtypeDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})