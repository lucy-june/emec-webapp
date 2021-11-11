var mec_vi_lgt_pickcounter_totalDAO = require("../../dao/mec_vi_lgt_pickcounter_totalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_lgt_pickcounter_totalDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_lgt_pickcounter_totalDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_lgt_pickcounter_totalDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
