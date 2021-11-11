var mec_vi_paid_chargeinfoDAO = require("../../dao/mec_vi_paid_chargeinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_paid_chargeinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_chargeinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_chargeinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
