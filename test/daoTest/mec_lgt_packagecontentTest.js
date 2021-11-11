var mec_lgt_packagecontentDAO = require("../../dao/mec_lgt_packagecontentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_lgt_packagecontentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_packagecontentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_packagecontentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_lgt_packagecontentDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_packagecontentDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_packagecontentDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})