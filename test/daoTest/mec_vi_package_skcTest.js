var mec_vi_package_skcDAO = require("../../dao/mec_vi_package_skcDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_package_skcDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_package_skcDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_package_skcDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
