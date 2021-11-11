var mec_itm_regionDAO = require("../../dao/mec_itm_regionDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_regionDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_regionDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_regionDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_regionDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_regionDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_regionDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})