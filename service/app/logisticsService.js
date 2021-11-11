/**
 * Created by lucywu on 10/21/14.
 */
var myLogger = require('../../logging/contextLogger')("app/logisticsService");
var async                       = require('async');
var sequelize                   = require('../../dao/_sequelize');
var generalDAO                  = require('../../dao/generalDAO');
var stringUtil                  = require("../../util/stringUtil");
var mec_lgt_logisticsDAO             = require("../../dao/mec_lgt_logisticsDAO");
var mec_vi_lgt_pickinfo_forappDAO   = require("../../dao/mec_vi_lgt_pickinfo_forappDAO");
var mec_vi_offline_content_totalDAO = require('../../dao/mec_vi_offline_content_totalDAO');
var mec_vi_online_content_total_forpickDAO = require('../../dao/mec_vi_online_content_total_forpickDAO');
var kuaidi = require("../../interaction/kuaidi");

//获取订单的运单编号,以及物流信息
exports.getOrderExpressInfo=function(ordercode,cb){
    var typeMap={
        "顺丰速运":"shunfeng",
        "申通快递":"shentong",
        "中通快递":"zhongtong",
        "韵达快递":"yunda",
        "圆通速递":"yuantong"
    }

    mec_lgt_logisticsDAO.queryOne({
        attributes:["ID","ORDERCODE","ISONLINEORDER","LGTCOMPANY","LGTNUMBER","LGTSTATE","DEPTCODE"],
        where:{ORDERCODE:ordercode}
    },function(err,msg){
        if(!err){
            if(msg){
                var type=typeMap[msg.LGTCOMPANY];
                var postid=msg.LGTNUMBER;
                kuaidi.queryExpress(type,postid,function(err,expressinfo){
                    if(!err){
                        var result=msg;
                        result.EXPRESSINFO=expressinfo;
                        cb(null,result);
                    }
                    else{
                        myLogger.error("getOrderExpressInfo [kuaidi.queryExpress]: "+logErr(err));
                        cb(err,null);
                    }
                })
            }
            else{
                myLogger.error("getOrderExpressInfo [mec_lgt_logisticsDAO.queryOne]: unfound lgtnumber of ordercode");
                cb("unfound lgtnumber of ordercode",null);
            }
        }
        else{
            myLogger.error("getOrderExpressInfo [mec_lgt_logisticsDAO.queryOne]: "+logErr(err));
            cb(err,null);
        }
    })
}

//获取订单的提货信息
exports.getOrderPickInfo=function(ordercode,cb){
    mec_vi_lgt_pickinfo_forappDAO.queryAll({where:{ORDERCODE:ordercode}},function(err,msg){
        if(!err){
            async.forEach(msg,function(pick,cb){
                if(ordercode.charAt(0)=='0'){//线下订单
                    mec_vi_offline_content_totalDAO.queryAll({where:{OFFLINEORDERCODE:ordercode}},function(err,contents){
                        if(!err) pick.CONTENTS=contents;
                        cb(err,msg);
                    })
                }
                else if(!pick.COUNTERCODE){//线上订单到门店自提
                    mec_vi_online_content_total_forpickDAO.queryAll({where:{ONLINEORDERCODE:ordercode}},function(err,contents){
                        if(!err) pick.CONTENTS=contents;
                        cb(err,msg);
                    })
                }
                else{//线上订单到柜台自提
                    mec_vi_online_content_total_forpickDAO.queryAll({
                        where:{ONLINEORDERCODE:ordercode,COUNTERCODE:pick.COUNTERCODE}
                    },function(err,contents){
                        if(!err) pick.CONTENTS=contents;
                        cb(err,msg);
                    })
                }
            },function(err){
                if(!err){
                    cb(null,msg);
                }
                else{
                    myLogger.error("getOrderPickInfo [forEach.err]: "+logErr(err));
                    cb(err,null);
                }
            })
        }
        else{
            myLogger.error("getOrderPickInfo [mec_vi_lgt_pickinfo_forappDAO.queryAll]: "+logErr(err));
            cb(err,null);
        }
    });
}