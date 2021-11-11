var mec_lgt_positionDAO = require("../../dao/mec_lgt_positionDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_lgt_positionDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_positionDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_lgt_positionDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_lgt_positionDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_positionDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_lgt_positionDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})