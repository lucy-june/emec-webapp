var mec_vi_online_contentDAO = require("../../dao/mec_vi_online_contentDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_contentDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_contentDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_contentDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
