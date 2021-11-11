var mec_vi_order_tagsDAO = require("../../dao/mec_vi_order_tagsDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_order_tagsDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_order_tagsDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_order_tagsDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
