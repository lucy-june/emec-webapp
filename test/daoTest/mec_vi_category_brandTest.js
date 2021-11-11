var mec_vi_category_brandDAO = require("../../dao/mec_vi_category_brandDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_category_brandDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_category_brandDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_category_brandDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
