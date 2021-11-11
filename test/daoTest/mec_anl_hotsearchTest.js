var mec_anl_hotsearchDAO = require("../../dao/mec_anl_hotsearchDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_anl_hotsearchDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_anl_hotsearchDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_anl_hotsearchDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_anl_hotsearchDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_anl_hotsearchDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_anl_hotsearchDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})