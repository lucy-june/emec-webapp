var mec_vi_sku_regionnamesDAO = require("../../dao/mec_vi_sku_regionnamesDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_sku_regionnamesDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_regionnamesDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_regionnamesDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
