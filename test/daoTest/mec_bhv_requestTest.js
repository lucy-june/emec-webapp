var mec_bhv_requestDAO = require("../../dao/mec_bhv_requestDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_bhv_requestDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_requestDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_requestDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_bhv_requestDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_requestDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_requestDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})