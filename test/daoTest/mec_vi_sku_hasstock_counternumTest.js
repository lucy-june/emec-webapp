var mec_vi_sku_hasstock_counternumDAO = require("../../dao/mec_vi_sku_hasstock_counternumDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_sku_hasstock_counternumDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_hasstock_counternumDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_hasstock_counternumDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
