var mec_vi_ret_returnable_paylistDAO = require("../../dao/mec_vi_ret_returnable_paylistDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_ret_returnable_paylistDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_ret_returnable_paylistDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_ret_returnable_paylistDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
