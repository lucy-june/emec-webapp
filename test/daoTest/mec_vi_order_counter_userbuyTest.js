var mec_vi_order_counter_userbuyDAO = require("../../dao/mec_vi_order_counter_userbuyDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_vi_order_counter_userbuyDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_order_counter_userbuyDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_order_counter_userbuyDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
