var hsl_promotionDAO = require("../../dao/hsl_promotionDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

hsl_promotionDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsl_promotionDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

hsl_promotionDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

//hsl_promotionDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsl_promotionDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//hsl_promotionDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})