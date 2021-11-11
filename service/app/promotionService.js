/**
 * Created by lucywu on 11/29/14.
 * 促销相关服务
 */

var myLogger = require('../../logging/contextLogger')("app/promotionService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var mec_itm_itemDAO= require("../../dao/mec_itm_itemDAO");
var mec_itm_storeitemDAO= require("../../dao/mec_itm_storeitemDAO");


//过促销引擎
//isonline是判断线上或者线下订单
//options是[itemcode,num,countercode]的数组,线下涉及到价格必须包含countercode
exports.process=function(isonline,options,cb){
    if(isonline){
        async.forEach(options,function(option,cb){
            mec_itm_itemDAO.queryOne({
                attributes:["PRICE"],
                where:{ITEMCODE:option.ITEMCODE}
            },function(err,msg){
                if(!err){
                    if(msg){
                        option["PRICE"]=msg.PRICE;
                        cb(null,msg);
                    }
                    else{
                        cb("unfound itemcode",null);
                    }
                }
                else{
                    cb(err,null);
                }
            })
        },function(err){
            if(!err){
                myLogger.trace("process [options]: "+JSON.stringify(options));
                //生成finalPriceList,finalRuleList
                var results=[]
                for(var k=0;k<options.length;k++){
                    var option=options[k];
                    var result={};
                    result["FINALPRICELIST"]=[{PRICE:option.PRICE,NUM:option.NUM}];
                    result["FINALRULELIST"]=[];
                    results.push(result);
                }
                cb(null,results);
            }
            else{
                cb(err,null);
            }
        })
    }
    else{
        async.forEach(options,function(option,cb){
            mec_itm_storeitemDAO.queryOne({
                attributes:["STORECHECKEDPRICE"],
                where:{ITEMCODE:option.ITEMCODE,COUNTERCODE:option.COUNTERCODE}
            },function(err,msg){
                if(!err){
                    if(msg){
                        option["PRICE"]=msg["STORECHECKEDPRICE"];
                        cb(null,msg);
                    }
                    else{
                        var obj={ITEMCODE:option.ITEMCODE,COUNTERCODE:option.COUNTERCODE};
                        cb("unfound itemcode in the counter: "+JSON.stringify(obj) ,null);
                    }
                }
                else{
                    cb(err,null);
                }
            })
        },function(err){
            if(!err){
                myLogger.trace("process [options]: "+JSON.stringify(options));
                //生成finalPriceList,finalRuleList
                var results=[]
                for(var k=0;k<options.length;k++){
                    var option=options[k];
                    var result={};
                    result["FINALPRICELIST"]=[{PRICE:option.PRICE,NUM:option.NUM}];
                    result["FINALRULELIST"]=[];
                    results.push(result);
                }
                cb(null,results);
            }
            else{
                cb(err,null);
            }
        });
    }
}