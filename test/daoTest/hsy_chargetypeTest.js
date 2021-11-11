var hsy_chargetypeDAO = require("../../dao/hsy_chargetypeDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_chargetypeDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_chargetypeDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_chargetypeDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_chargetypeDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_chargetypeDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_chargetypeDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})