var mec_itm_stockDAO = require("../../dao/mec_itm_stockDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_stockDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_stockDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_stockDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_stockDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_stockDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_stockDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})