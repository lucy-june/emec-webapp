var mec_vi_revisable_ruleDAO = require("../../dao/mec_vi_revisable_ruleDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_revisable_ruleDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_revisable_ruleDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_revisable_ruleDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
