var mec_sys_businesssettingDAO = require("../../dao/mec_sys_businesssettingDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_sys_businesssettingDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_sys_businesssettingDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_sys_businesssettingDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_sys_businesssettingDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_sys_businesssettingDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_sys_businesssettingDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})