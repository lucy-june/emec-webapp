var mec_bhv_commentDAO = require("../../dao/mec_bhv_commentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_bhv_commentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_commentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_commentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_bhv_commentDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_commentDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_commentDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})