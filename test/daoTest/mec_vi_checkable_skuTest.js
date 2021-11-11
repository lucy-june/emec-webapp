var mec_vi_checkable_skuDAO = require("../../dao/mec_vi_checkable_skuDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_checkable_skuDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_checkable_skuDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_checkable_skuDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
