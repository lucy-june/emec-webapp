var mec_vi_ret_offlineorder_total_rawDAO = require("../../dao/mec_vi_ret_offlineorder_total_rawDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_ret_offlineorder_total_rawDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_ret_offlineorder_total_rawDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_ret_offlineorder_total_rawDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
