var hsy_taxrateDAO = require("../../dao/hsy_taxrateDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_taxrateDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_taxrateDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_taxrateDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_taxrateDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_taxrateDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_taxrateDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})