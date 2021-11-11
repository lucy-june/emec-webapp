/**
 * Created by YuanBo on 14-8-1.
 */
var merchantDAO     = require("../../dao/hct_merchantDAO");
var brandDAO        = require("../../dao/hct_brandDAO");
var itemtypeDAO     = require("../../dao/hsy_itemtypeDAO");
var retailtypeDAO   = require("../../dao/hsy_retailtypeDAO");
var agentDAO        = require("../../dao/hsy_agentDAO");
var generalDAO      = require("../../dao/generalDAO");
var stringUtil      = require('../../util/stringUtil');

exports.queryMerchantService = function(options,res){
    var callback=function(msg){
        if(msg && msg.length>0) {
            res.send(msg);
        }
        else{
            res.send(null);
        }
    }
    var errback=function(err){
        res.send("查询供应商失败");
    }
    var qStr={where:{}};
    if(options["merchantcode"]){
        var n=6;
        qStr.where.merchantcode=stringUtil.autoComple(options["merchantcode"],n,'0');
    }
    merchantDAO.queryAll(qStr,function(err,msg){
        if(!err){
            callback(msg);
        }
        else{
            errback(err);
        }
    });
}

exports.queryBrandService = function(options,res){
    var callback=function(msg){
        if(msg && msg.length>0) {
            res.send(msg);
        }
        else{
            res.send(null);
        }
    }
    var errback=function(err){
        res.send("查询品牌失败");
    }
    var qStr={where:{}};
    if(options["brandcode"]){
        var n=6;
        qStr.where.brandcode=stringUtil.autoComple(options["brandcode"],n,'0');
    }
    brandDAO.queryAll(qStr,function(err,msg){
        if(!err){
            callback(msg);
        }
        else{
            errback(err);
        }
    });
}

exports.queryItemtypeService = function(options,res){
    var callback=function(msg){
        if(msg && msg.length>0) {
            res.send(msg);
        }
        else{
            res.send(null);
        }
    }
    var errback=function(err){
        res.send("查询商品分类失败");
    }
    var qStr={where:{}};
    if(options["itemtypecode"]){
        var n=5;
        qStr.where.itemtypecode=stringUtil.autoComple(options["itemtypecode"],n,'0');
    }
    itemtypeDAO.queryAll(qStr,function(err,msg){
        if(!err){
            callback(msg);
        }
        else{
            errback(err);
        }
    });
}

exports.queryRetailtypeService = function(options,res){
    var callback=function(msg){
        if(msg && msg.length>0) {
            res.send(msg);
        }
        else{
            res.send(null);
        }
    }
    var errback=function(err){
        res.send("查询销售分类失败");
    }
    var qStr={where:{}};
    if(options["retailtypecode"]){
        var n=3;
        qStr.where.retailtypecode=stringUtil.autoComple(options["retailtypecode"],n,'0');
    }
    retailtypeDAO.queryAll(qStr,function(err,msg){
        if(!err){
            callback(msg);
        }
        else{
            errback(err);
        }
    });
}

exports.queryAgentService = function(options,res){
    var callback=function(msg){
        if(msg && msg.length>0) {
            res.send(msg);
        }
        else{
            res.send(null);
        }
    }
    var errback=function(err){
        res.send("查询招商人员失败");
    }
    var qStr={where:{}};
    if(options["agentcode"]){
        var n=3;
        qStr.where.agentcode=stringUtil.autoComple(options["agentcode"],n,'0');
    }
    agentDAO.queryAll(qStr,function(err,msg){
        if(!err){
            callback(msg);
        }
        else{
            errback(err);
        }
    });
}