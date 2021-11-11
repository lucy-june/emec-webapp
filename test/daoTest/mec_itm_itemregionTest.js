var mec_itm_itemregionDAO = require("../../dao/mec_itm_itemregionDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_itm_itemregionDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemregionDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_itm_itemregionDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_itm_itemregionDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemregionDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_itemregionDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})