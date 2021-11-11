var mec_vi_online_selling_skc_forappDAO = require("../../dao/mec_vi_online_selling_skc_forappDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_selling_skc_forappDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_selling_skc_forappDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_selling_skc_forappDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
