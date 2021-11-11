var mec_sys_statepointerDAO = require("../../dao/mec_sys_statepointerDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_sys_statepointerDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_sys_statepointerDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_sys_statepointerDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_sys_statepointerDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_sys_statepointerDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_sys_statepointerDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})