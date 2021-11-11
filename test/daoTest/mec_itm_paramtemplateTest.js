var mec_itm_paramtemplateDAO = require("../../dao/mec_itm_paramtemplateDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');

//mec_itm_paramtemplateDAO.queryOne({where:{}},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_paramtemplateDAO.queryAll({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_paramtemplateDAO.queryAndCount({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})

//mec_itm_paramtemplateDAO.add({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_paramtemplateDAO.del({},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})
//
//mec_itm_paramtemplateDAO.update({},{},function(err,msg){
//    if(err) console.log(err);
//    else console.log(msg);
//})


sequelize.transaction(function(t){
    mec_itm_paramtemplateDAO.add({CATEGORYID: 292, ATTRIBUTE: '男士商务钱包Key9'},t,function(err,msg){
        if(err){
            t.rollback();
            console.log(err);
        }
        else{
            t.commit().done(function(err){
                console.log("aaaaa");
                console.log(err);
                console.log("bbbbb");
            })
        }
    })
})