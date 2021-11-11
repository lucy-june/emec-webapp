var mec_vi_ret_returnable_contentinfoDAO = require("../../dao/mec_vi_ret_returnable_contentinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_ret_returnable_contentinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_ret_returnable_contentinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_ret_returnable_contentinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
