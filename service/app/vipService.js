/**
 * Created by lucywu on 7/11/14.
 * 会员相关服务
 */
var generalDAO = require("../../dao/generalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var myLogger = require('../../logging/contextLogger')("web/vipService");
var mis      = require('../../interaction/mis');
var mec_ctm_customerDAO = require('../../dao/mec_ctm_customerDAO');


//获取会员详细信息
exports.getVIPInfo = function(usercode,cb){
    async.waterfall([
        function(cb){
            //通过usercode 获取vipcode
            mec_ctm_customerDAO.queryOne({attributes:["VIPCODE"],where:{USERCODE:usercode}},cb)
        },
        function(x,cb){
            //调用mis接口：通过vipcode获取vip信息
            if(x){
                var args={"vipcode": x.VIPCODE};
                mis.getVIPInfo(args,cb);
            }
            else{
                cb("no vip info",null);
            }
        }
    ],function(err,msg){
        if(!err){
            myLogger.trace("getVIPInfo [async.waterfall]: "+JSON.stringify(msg));
            cb(null,msg);
        }
        else{
            myLogger.error("getVIPInfo [async.waterfall]: "+logErr(err));
            cb(err,null);
        }
    })
}

//app用户生成并绑定vip账户
exports.generateAndBindVIP = function(usercode,args,cb){
    var vipcode=null;
    async.waterfall([
        function(cb){
            //调用mis接口：创建vip账户
            mis.generateVIP(args,cb);
        },
        function(x,cb){
            //绑定vip账户和app账户
            var arr= x.split(";");
            vipcode=arr[0];
            var cardno=arr[1];
            mec_ctm_customerDAO.update({VIPCODE:vipcode},{USERCODE:usercode},cb)
        }
    ],function(err,msg){
        if(!err){
            myLogger.trace("generateAndBindVIP [async.waterfall]: "+JSON.stringify(msg));
            cb(null,vipcode);
        }
        else{
            myLogger.error("generateAndBindVIP [async.waterfall]: "+logErr(err));
            cb(err,null);
        }
    })
}

//app用户验证并绑定已有vip账户（通过vip卡）
exports.validateAndBindVIP= function(usercode,args,cb){
    var vipcode=null;
    async.waterfall([
        function(cb){
            //调用mis接口：验证vip卡对应的vip账户
            mis.validateVIP(args,cb);
        },
        function(x,cb){
            //绑定vip账户和app账户
            vipcode=x;
            mec_ctm_customerDAO.update({VIPCODE:vipcode},{USERCODE:usercode},cb)
        }
    ],function(err,msg){
        if(!err){
            myLogger.trace("validateAndBindVIP [async.waterfall]: "+JSON.stringify(msg));
            cb(null,vipcode);
        }
        else{
            myLogger.error("validateAndBindVIP [async.waterfall]: "+logErr(err));
            cb(err,null);
        }
    })
}