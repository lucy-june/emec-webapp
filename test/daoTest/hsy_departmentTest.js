var hsy_departmentDAO = require("../../dao/hsy_departmentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_departmentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_departmentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_departmentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_departmentDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_departmentDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_departmentDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})