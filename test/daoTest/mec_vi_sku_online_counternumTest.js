var mec_vi_sku_online_counternumDAO = require("../../dao/mec_vi_sku_online_counternumDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_sku_online_counternumDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_online_counternumDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_sku_online_counternumDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
