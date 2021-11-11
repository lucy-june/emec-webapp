var mec_itm_virtualstoreitemDAO = require("../../dao/mec_itm_virtualstoreitemDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_virtualstoreitemDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_virtualstoreitemDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_virtualstoreitemDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_virtualstoreitemDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_virtualstoreitemDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_virtualstoreitemDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})