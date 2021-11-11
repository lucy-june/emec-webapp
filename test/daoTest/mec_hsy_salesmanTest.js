var mec_hsy_salesmanDAO = require("../../dao/mec_hsy_salesmanDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_hsy_salesmanDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_hsy_salesmanDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_hsy_salesmanDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_hsy_salesmanDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_hsy_salesmanDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_hsy_salesmanDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})