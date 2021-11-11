var mec_vi_skc_uninitial_skuDAO = require("../../dao/mec_vi_skc_uninitial_skuDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_skc_uninitial_skuDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_skc_uninitial_skuDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_skc_uninitial_skuDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
