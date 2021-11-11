var mec_vi_paid_orderinfoDAO = require("../../dao/mec_vi_paid_orderinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_paid_orderinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_orderinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_orderinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
