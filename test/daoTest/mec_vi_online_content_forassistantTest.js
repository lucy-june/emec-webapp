var mec_vi_online_content_forassistantDAO = require("../../dao/mec_vi_online_content_forassistantDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_content_forassistantDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_content_forassistantDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_content_forassistantDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
