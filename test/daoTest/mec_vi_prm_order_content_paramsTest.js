var mec_vi_prm_order_content_paramsDAO = require("../../dao/mec_vi_prm_order_content_paramsDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_prm_order_content_paramsDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_prm_order_content_paramsDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_prm_order_content_paramsDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
