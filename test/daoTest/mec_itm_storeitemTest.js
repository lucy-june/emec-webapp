var mec_itm_storeitemDAO = require("../../dao/mec_itm_storeitemDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_storeitemDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_storeitemDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_storeitemDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_storeitemDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_storeitemDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_storeitemDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})