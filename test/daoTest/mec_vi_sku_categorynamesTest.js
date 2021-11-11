var mec_vi_sku_categorynamesDAO = require("../../dao/mec_vi_sku_categorynamesDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_sku_categorynamesDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_categorynamesDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_categorynamesDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
