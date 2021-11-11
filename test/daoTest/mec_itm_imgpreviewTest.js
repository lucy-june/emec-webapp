var mec_itm_imgpreviewDAO = require("../../dao/mec_itm_imgpreviewDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_imgpreviewDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_imgpreviewDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_imgpreviewDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_imgpreviewDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_imgpreviewDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_imgpreviewDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})