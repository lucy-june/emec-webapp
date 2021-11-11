var hsy_agentDAO = require("../../dao/hsy_agentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsy_agentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_agentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsy_agentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsy_agentDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_agentDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsy_agentDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})