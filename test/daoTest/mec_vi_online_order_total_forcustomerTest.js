var mec_vi_online_order_total_forcustomerDAO = require("../../dao/mec_vi_online_order_total_forcustomerDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_order_total_forcustomerDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_order_total_forcustomerDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_order_total_forcustomerDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
