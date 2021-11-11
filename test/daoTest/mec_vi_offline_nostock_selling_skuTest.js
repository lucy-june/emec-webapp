var mec_vi_offline_nostock_selling_skuDAO = require("../../dao/mec_vi_offline_nostock_selling_skuDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_offline_nostock_selling_skuDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_offline_nostock_selling_skuDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_offline_nostock_selling_skuDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
