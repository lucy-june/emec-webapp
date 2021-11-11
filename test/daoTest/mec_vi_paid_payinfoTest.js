var mec_vi_paid_payinfoDAO = require("../../dao/mec_vi_paid_payinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_paid_payinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_payinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_payinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
