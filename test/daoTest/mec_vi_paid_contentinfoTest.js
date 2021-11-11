var mec_vi_paid_contentinfoDAO = require("../../dao/mec_vi_paid_contentinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_paid_contentinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_contentinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_contentinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
