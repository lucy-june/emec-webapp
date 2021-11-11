var mec_vi_counter_skc_stock_rawDAO = require("../../dao/mec_vi_counter_skc_stock_rawDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_counter_skc_stock_rawDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_counter_skc_stock_rawDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_counter_skc_stock_rawDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
