var mec_bhv_favoritebrandDAO = require("../../dao/mec_bhv_favoritebrandDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_bhv_favoritebrandDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_favoritebrandDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_favoritebrandDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_bhv_favoritebrandDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_favoritebrandDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_favoritebrandDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})