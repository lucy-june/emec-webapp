var mec_vi_package_skc_rawDAO = require("../../dao/mec_vi_package_skc_rawDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_package_skc_rawDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_package_skc_rawDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_package_skc_rawDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
