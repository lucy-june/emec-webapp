var mec_vi_online_content_forpickDAO = require("../../dao/mec_vi_online_content_forpickDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_content_forpickDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_content_forpickDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_content_forpickDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
