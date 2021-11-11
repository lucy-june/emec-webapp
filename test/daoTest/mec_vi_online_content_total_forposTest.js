var mec_vi_online_content_total_forposDAO = require("../../dao/mec_vi_online_content_total_forposDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_content_total_forposDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_content_total_forposDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_content_total_forposDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
