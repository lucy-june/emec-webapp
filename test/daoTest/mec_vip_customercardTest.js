var mec_vip_customercardDAO = require("../../dao/mec_vip_customercardDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vip_customercardDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vip_customercardDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vip_customercardDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_vip_customercardDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_vip_customercardDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_vip_customercardDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})