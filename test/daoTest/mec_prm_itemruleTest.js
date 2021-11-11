var mec_prm_itemruleDAO = require("../../dao/mec_prm_itemruleDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_prm_itemruleDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_itemruleDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_prm_itemruleDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_prm_itemruleDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_itemruleDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_prm_itemruleDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})