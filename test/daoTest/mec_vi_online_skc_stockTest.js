var mec_vi_online_skc_stockDAO = require("../../dao/mec_vi_online_skc_stockDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_online_skc_stockDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_skc_stockDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_skc_stockDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
