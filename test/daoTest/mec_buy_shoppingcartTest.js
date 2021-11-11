var mec_buy_shoppingcartDAO = require("../../dao/mec_buy_shoppingcartDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

mec_buy_shoppingcartDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_shoppingcartDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_buy_shoppingcartDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//mec_buy_shoppingcartDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_shoppingcartDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_buy_shoppingcartDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})