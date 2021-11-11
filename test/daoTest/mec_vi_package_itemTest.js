var mec_vi_package_itemDAO = require("../../dao/mec_vi_package_itemDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_package_itemDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_package_itemDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_package_itemDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
