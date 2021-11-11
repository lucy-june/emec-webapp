var mec_bhv_searchDAO = require("../../dao/mec_bhv_searchDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_bhv_searchDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_searchDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_searchDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_bhv_searchDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_searchDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_searchDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})