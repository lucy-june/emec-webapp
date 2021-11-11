var mec_bhv_favoriteitemDAO = require("../../dao/mec_bhv_favoriteitemDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_bhv_favoriteitemDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_favoriteitemDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_bhv_favoriteitemDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_bhv_favoriteitemDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_favoriteitemDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_bhv_favoriteitemDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})