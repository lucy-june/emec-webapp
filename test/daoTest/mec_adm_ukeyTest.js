var mec_adm_ukeyDAO = require("../../dao/mec_adm_ukeyDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_adm_ukeyDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_adm_ukeyDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_adm_ukeyDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_adm_ukeyDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_adm_ukeyDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_adm_ukeyDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})