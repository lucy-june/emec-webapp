var mec_vi_offline_nostock_selling_sku_totalDAO = require("../../dao/mec_vi_offline_nostock_selling_sku_totalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_offline_nostock_selling_sku_totalDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_offline_nostock_selling_sku_totalDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_offline_nostock_selling_sku_totalDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
