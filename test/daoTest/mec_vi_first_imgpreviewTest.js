var mec_vi_first_imgpreviewDAO = require("../../dao/mec_vi_first_imgpreviewDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_first_imgpreviewDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_first_imgpreviewDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_first_imgpreviewDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
