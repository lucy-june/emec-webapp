var mec_itm_itemregion_tmpDAO = require("../../dao/mec_itm_itemregion_tmpDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_itemregion_tmpDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemregion_tmpDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemregion_tmpDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_itemregion_tmpDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemregion_tmpDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemregion_tmpDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})