var mec_vi_paid_discountinfoDAO = require("../../dao/mec_vi_paid_discountinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_paid_discountinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_discountinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_paid_discountinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
