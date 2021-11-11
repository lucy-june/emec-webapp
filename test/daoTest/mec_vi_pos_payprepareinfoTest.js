var mec_vi_pos_payprepareinfoDAO = require("../../dao/mec_vi_pos_payprepareinfoDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_pos_payprepareinfoDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_pos_payprepareinfoDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_pos_payprepareinfoDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
