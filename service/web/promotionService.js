/**
 * Created by lucywu on 11/29/14.
 * 促销相关服务
 */

var myLogger = require('../../logging/contextLogger')("web/promotionService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var mec_itm_itemDAO = require("../../dao/mec_itm_itemDAO");
var mec_itm_storeitemDAO = require("../../dao/mec_itm_storeitemDAO");
var mec_prm_prmrule_tmpDAO = require("../../dao/mec_prm_prmrule_tmpDAO");
var mec_prm_prmruleDAO = require("../../dao/mec_prm_prmruleDAO");
var ruleStringTemplate = require("../../global/ruleStringTemplate.js");
var mec_itm_skcDAO = require('../../dao/mec_itm_skcDAO');
var mec_hct_counterDAO = require('../../dao/mec_hct_counterDAO');
var engine = require("../../interaction/engine");
var mis = require("../../interaction/mis");
var exhandler = require('../../exception/exhandler.js');
var dateUtil = require("../../util/dateUtil");

//获取当前生效的规则
exports.getRevisableRule=function(cb){

}

//获取当前待审核的规则
exports.getCheckableRule=function(cb){

}

//添加规则
exports.addRule=function(cb){

}

//修改规则
exports.reviseRule=function(cb){

}

//审核通过规则
exports.approveRule=function(cb){

}

//审核作废规则
exports.invalidRule=function(cb){

}

//刷新促销引擎
//exports.refreshEngine=function(cb){
//
//}


//过促销引擎(原过促销)
//isonline是判断线上或者线下订单
//options是[itemcode,num,countercode]的数组,线下涉及到价格必须包含countercode
exports.process2=function(isonline,options,cb){
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
        });
    }
}

//过促销引擎(新过促销)
//初始参数vipcode+entries:[{itemcode/skccode,num,originprice(如果经销B),finalmanual}]
//entries的结构是:[{itemcode,countercode,num,^^^deptcode,^^^originprice,^^^promotionmark,###viptype,###vipdiscountrate,finalmanual}...]
exports.process = function(vipcode,countercode,entries,cb){
    var _entries=[]
    for (var i=0;i<entries.length;i++){
        var obj=entries[i];
        var newentry={};
        for(var attr in obj){
            if(attr=="itemcode"||attr=="skccode"||attr=="num"||attr=="originprice"||attr=="finalmanual") newentry[attr]=obj[attr];
        }
        _entries.push(newentry);
    }
    entries=_entries;
    async.forEach(entries,function(entry,cb) {
        entry.countercode=countercode;

        async.series([
            function(cb){
                if(entry.skccode){
                    mec_itm_skcDAO.queryOne({attributes:["ITEMCODE"],where:{SKCCODE:entry.skccode}},function(err,msg){
                        if(!err){
                            if(msg){
                                entry.itemcode=msg.ITEMCODE;
                                cb(null,msg);
                            }
                            else{
                                cb("unfound itemcode of the skccode "+entry.skccode,null);
                            }
                        }
                        else{
                            cb("fail to query itemcode of skccode "+entry.skccode,null);
                        }
                    })
                }
                else if(entry.itemcode){
                    cb(null,null);
                }
                else{
                    cb("no item info",null);
                }
            },
            function(cb){
                async.parallel([
                    function (cb) {
                        //获取deptcode
                        mec_hct_counterDAO.queryOne({attributes: ["STORECODE"], where: {COUNTERCODE: countercode}}, function (err, msg) {
                            if (!err) {
                                if (msg) {
                                    entry.deptcode = msg.STORECODE;
                                }
                                cb(null, msg);
                            }
                            else {
                                cb(err, null);
                            }
                        })
                    },
                    function (cb) {
                        //获取originprice和promotionmark
                        mec_itm_storeitemDAO.queryOne({
                            attributes: ["STORETEMPPRICE", "PROMOTIONMARK"],
                            where: {ITEMCODE: entry.itemcode, COUNTERCODE: entry.countercode}
                        }, function (err, res) {
                            if (!err) {
                                mec_itm_itemDAO.queryOne({attributes:["ITEMCODETYPE"],where:{ITEMCODE:entry.itemcode}},function(err,msg){
                                    if(!err){
                                        if(msg){
                                            if(msg.ITEMCODETYPE==0){
                                                if (res) {
                                                    entry.originprice = res.STORETEMPPRICE;
                                                    entry.promotionmark = res.PROMOTIONMARK;
                                                    cb(null, entries);
                                                }
                                                else{
                                                    cb("unfound itemcode-countercode",null);
                                                }
                                            }
                                            else{
                                                if (res) {
                                                    entry.promotionmark = res.PROMOTIONMARK;
                                                    if(entry.originprice){
                                                        cb(null,entries);
                                                    }
                                                    else{
                                                        cb("unfound price",null);
                                                    }
                                                }
                                                else{
                                                    cb("unfound itemcode-countercode",null);
                                                }
                                            }
                                        }
                                        else{
                                            cb("unknown itemcode",null);
                                        }
                                    }
                                    else{
                                        cb(err,null);
                                    }
                                })
                            }
                            else {
                                cb(err, null);
                            }
                        })
                    },
                    function (cb) {
                        //获取vip相关信息
                        mis.getVIPDiscount(entry.itemcode,entry.countercode,vipcode,function(err,msg){
                            if(!err){
                                if(msg){
                                    entry.viptype=msg.cardtype;
                                    entry.vipdiscountrate=msg.discount;
                                    cb(null,msg);
                                }
                                else{
                                    entry.viptype='00';
                                    entry.vipdiscountrate=100;
                                    cb(null,null);
                                }
                            }
                            else{
                                entry.viptype='00';
                                entry.vipdiscountrate=100;
                                cb(null,null);
                            }
                        })
                    }
                ],cb);
            }
        ],cb);
    },function(err){
        if (!err) {
            var attrs = [
                "ordercode",
                "contentcode",
                "itemcode",
                "countercode",
                "deptcode",
                "num",
                "originprice",
                "finalprice",
                "promotionmark",
                "viptype",
                "vipdiscountrate",
                "flag",
                "skccode",
                "pos"
            ];
            for (var k = 0; k < entries.length; k++) {
                var entry = entries[k];

                for (var n = 0; n < attrs.length; n++) {
                    if (!entry[attrs[n]]) {
                        if (attrs[n] == "finalprice") entry["finalprice"] = 0;
                        else if (attrs[n] == "flag") entry["flag"] = 1;
                        else if (attrs[n] == "viptype") entry["viptype"] = "00";
                        else if (attrs[n] == "vipdiscountrate") entry["vipdiscountrate"] = 100;
                        else if (attrs[n] == "promotionmark") entry["promotionmark"] = "X";
                        else entry[attrs[n]] = null;
                    }
                }
            }
            myLogger.trace("process [handled entries]: " + JSON.stringify(entries));
            engine.process(JSON.stringify(entries), cb);
        }
        else {
            myLogger.error("process [async.foreach]: " + logErr(err));
            cb(err,null);
        }
    });

}


//NEW-LJN
//生成规则脚本，添加到数据库
exports.addPromotion =
    function(rulecode, rulecontent, dateeffective, dateexpires, deptcode, salience, state,
             reduceconvert, reduce, couponposaccu, couponvipgrade, couponconvert, coupon,
             giftposaccu, giftvipgrade, giftconvert, gift, promotionnum, creator, cb) {

         //添加数据到数据库(tmp表)
         var data = {};
         data.RULECODE = rulecode;
         data.RULECONTENT = rulecontent;
         data.DATEEFFECTIVE = dateeffective;
         data.DATEEXPIRES = dateexpires;
         data.DEPTCODE = deptcode;
         data.STATE = state;
         data.TMPSTATE = 0;
         data.LASTOPERATEPERSON = creator;
         data.VIPSALIENCE = salience;
         data.COUPONVIPGRADE = couponvipgrade;
         data.COUPONPOSACCU = couponposaccu;
         data.GIFTVIPGRADE = giftvipgrade;
         data.GIFTPOSACCU = giftposaccu;

         //生成规则脚本
         var drlstring = "";
         var salience0 = 600;
         var salience1 = 601;
         if(salience == 0) {
             salience0 = 800;
             salience1 = 801;
         }

        //promotionnum用来标记活动中有多少条规则
        if (promotionnum == 111) {
            drlstring = ruleStringTemplate.rule111Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        } else if (promotionnum == 110) {
            drlstring = ruleStringTemplate.rule110Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = "";
            data.GIFT = "";
        } else if (promotionnum == 101) {
            drlstring = ruleStringTemplate.rule101Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = "";
            data.COUPON = "";
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        } else if (promotionnum == 100) {
            drlstring = ruleStringTemplate.rule100Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = "";
            data.COUPON = "";
            data.GIFTCONVERT = "";
            data.GIFT = "";
        } else if (promotionnum == 11) {
            drlstring = ruleStringTemplate.rule011Template;

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = "";
            data.REDUCE = "";
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        } else if (promotionnum == 10) {
            drlstring = ruleStringTemplate.rule010Template;

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            data.REDUCECONVERT = "";
            data.REDUCE = "";
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = "";
            data.GIFT = "";
        } else if (promotionnum == 1) {
            drlstring = ruleStringTemplate.rule001Template;

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = "";
            data.REDUCE = "";
            data.COUPONCONVERT = "";
            data.COUPON = "";
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        }
        //用当前时间的毫秒值来做标记解决规则同名问题
        var inttime = new Date().getTime();
        //规则脚本里的全局变量，时间，门店等
        //INTTIME-用当前时间毫秒数来解决规则同名问题
        drlstring = drlstring.replace(/\$INTTIME\$/g, inttime);
        dateeffective = '"' + dateeffective + '"';
        dateexpires = '"' + dateexpires + '"';
        drlstring = drlstring.replace(/\$DATEEFFECTIVE\$/g, dateeffective);
        drlstring = drlstring.replace(/\$DATEEXPIRES\$/g, dateexpires);
        deptcode = '"' + deptcode + '"';
        drlstring = drlstring.replace(/\$DEPTCODE\$/g, deptcode);

        console.log(drlstring);

        data.RULESCRIPT = drlstring;

        mec_prm_prmrule_tmpDAO.add(data, function (err, msg) {
            if (!err) {
                myLogger.trace("addPromotion [mec_prm_prmrule_tmpDAO.add]: " + JSON.stringify(msg));
                console.log(msg);
                cb(0);
            } else {
                myLogger.error("addPromotion [mec_prm_prmrule_tmpDAO.add]: " + logErr(err));
                console.log(err);
                cb(9);
            }
        });

    };

//获取tmp表中当前时间之后的规则(可修改的规则)(删除审核通过的规则不可修改)
exports.getPromotion = function(deptcode, cb) {
    myLogger.trace("getPromotion [deptcode]: " + deptcode);
    var sql = "SELECT * FROM mec_prm_prmrule_tmp WHERE NOW() <= DATEEXPIRES AND TMPSTATE != 4 AND DEPTCODE = " + deptcode;
    generalDAO.runSql(sql, function (err, msg) {
        if(!err) {
            myLogger.trace("getPromotion [generalDAO.select]: " + JSON.stringify(msg));
            console.log(msg);
            cb(null, msg);
        } else {
            myLogger.error("getPromotion [generalDAO.select]: " + logErr(err));
            console.log(err);
            cb(err, null);
        }
    });
};

//获取需要修改的规则
exports.getModifyPromotion = function (rid, cb) {
    myLogger.trace("getModifyPromotion [rid]: " + rid);
    var sql = "SELECT * FROM mec_prm_prmrule_tmp WHERE ID = " + rid + " limit 1";
    generalDAO.runSql(sql, function (err, msg) {
        if(!err) {
            myLogger.trace("getModifyPromotion [generalDAO.select]: " + JSON.stringify(msg));
            cb(null, msg);
        } else {
            myLogger.error("getModifyPromotion [generalDAO.select]: " + logErr(err));
            console.error(err);;
            cb(err, null);
        }
    });
};

//删除规则
exports.deletePromotion = function (rid, lastoperater, cb) {
    myLogger.trace("deletePromotion [rid]: " + rid);
    //删除实际为将TMPSTATE位设置为删除待审核
    mec_prm_prmrule_tmpDAO.update({"TMPSTATE": 1, "LASTOPERATEPERSON": lastoperater}, {"ID": rid}, function (err, msg) {
        if(!err) {
            myLogger.trace("deletePromotion [mec_prm_prmrule_tmpDAO.update]: " + JSON.stringify(msg));
            cb(9);
        } else {
            myLogger.error("deletePromotion [mec_prm_prmrule_tmpDAO.update]: " + logErr(err));
            cb(0);
        }
    });
};


//修改规则，生成规则脚本，更新到数据库
exports.modifyPromotion =
    function(rid, rulecode, rulecontent, dateeffective, dateexpires, deptcode, salience,
             state, reduceconvert, reduce, couponposaccu, couponvipgrade, couponconvert,
             coupon, giftposaccu, giftvipgrade, giftconvert, gift, promotionnum, creator, cb) {

        var data = {};
        data.RULECODE = rulecode;
        data.RULECONTENT = rulecontent;
        data.DATEEFFECTIVE = dateeffective;
        data.DATEEXPIRES = dateexpires;
        data.DEPTCODE = deptcode;
        data.STATE = state;
        data.TMPSTATE = 2;
        data.LASTOPERATEPERSON = creator;
        data.VIPSALIENCE = salience;
        data.COUPONVIPGRADE = couponvipgrade;
        data.COUPONPOSACCU = couponposaccu;

        data.GIFTVIPGRADE = giftvipgrade;
        data.GIFTPOSACCU = giftposaccu;

        //生成规则脚本
        var drlstring = "";
        var salience0 = 600;
        var salience1 = 601;
        if(salience == 0) {
            salience0 = 800;
            salience1 = 801;
        }

        //promotionnum用来标记活动中有多少条规则
        if (promotionnum == 111) {
            drlstring = ruleStringTemplate.rule111Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        } else if (promotionnum == 110) {
            drlstring = ruleStringTemplate.rule110Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = "";
            data.GIFT = "";
        } else if (promotionnum == 101) {
            drlstring = ruleStringTemplate.rule101Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = "";
            data.COUPON = "";
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        } else if (promotionnum == 100) {
            drlstring = ruleStringTemplate.rule100Template;

            drlstring = drlstring.replace(/\$SALIENCE1\$/g, salience1);
            drlstring = drlstring.replace(/\$SALIENCE0\$/g, salience0);
            var reduceconvertstring = reduceconvert.replace(/\"/g, "'");
            reduceconvertstring = '"' + reduceconvertstring + '"';
            var reducestring = reduce.replace(/\"/g, "'");
            reducestring = '"' + reducestring + '"';
            drlstring = drlstring.replace(/\$REDUCECONVERT\$/g, reduceconvertstring);
            drlstring = drlstring.replace(/\$REDUCECONFIG\$/g, reducestring);

            data.REDUCECONVERT = reduceconvert;
            data.REDUCE = reduce;
            data.COUPONCONVERT = "";
            data.COUPON = "";
            data.GIFTCONVERT = "";
            data.GIFT = "";
        } else if (promotionnum == 11) {
            drlstring = ruleStringTemplate.rule011Template;

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = "";
            data.REDUCE = "";
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        } else if (promotionnum == 10) {
            drlstring = ruleStringTemplate.rule010Template;

            var couponconvertstring = couponconvert.replace(/\"/g, "'");
            couponconvertstring = '"' + couponconvertstring + '"';
            var couponstring = coupon.replace(/\"/g, "'");
            couponstring = '"' + couponstring + '"';
            drlstring = drlstring.replace(/\$COUPONVIPGRADE\$/g, couponvipgrade);
            drlstring = drlstring.replace(/\$COUPONCONVERT\$/g, couponconvertstring);
            drlstring = drlstring.replace(/\$COUPONPOSACCU\$/g, couponposaccu);
            drlstring = drlstring.replace(/\$COUPPONCONFIG\$/g, couponstring);

            data.REDUCECONVERT = "";
            data.REDUCE = "";
            data.COUPONCONVERT = couponconvert;
            data.COUPON = coupon;
            data.GIFTCONVERT = "";
            data.GIFT = "";
        } else if (promotionnum == 1) {
            drlstring = ruleStringTemplate.rule001Template;

            var giftconvertstring = giftconvert.replace(/\"/g, "'");
            giftconvertstring = '"' + giftconvertstring + '"';
            var giftstring = gift.replace(/\"/g, "'");
            giftstring = '"' + giftstring + '"';
            drlstring = drlstring.replace(/\$GIFTVIPGRADE\$/g, giftvipgrade);
            drlstring = drlstring.replace(/\$GIFTCONVERT\$/g, giftconvertstring);
            drlstring = drlstring.replace(/\$GIFTPOSACCU\$/g, giftposaccu);
            drlstring = drlstring.replace(/\$GIFTCONFIG\$/g, giftstring);

            data.REDUCECONVERT = "";
            data.REDUCE = "";
            data.COUPONCONVERT = "";
            data.COUPON = "";
            data.GIFTCONVERT = giftconvert;
            data.GIFT = gift;
        }
        //用当前时间的毫秒值来做标记解决规则同名问题
        var inttime = new Date().getTime();
        //规则脚本里的全局变量，时间，门店等
        //INTTIME-用当前时间毫秒数来解决规则同名问题
        drlstring = drlstring.replace(/\$INTTIME\$/g, inttime);
        dateeffective = '"' + dateeffective + '"';
        dateexpires = '"' + dateexpires + '"';
        drlstring = drlstring.replace(/\$DATEEFFECTIVE\$/g, dateeffective);
        drlstring = drlstring.replace(/\$DATEEXPIRES\$/g, dateexpires);
        deptcode = '"' + deptcode + '"';
        drlstring = drlstring.replace(/\$DEPTCODE\$/g, deptcode);

        data.RULESCRIPT = drlstring;

        mec_prm_prmrule_tmpDAO.update(data, {"ID": rid}, function (err, msg) {
            if (!err) {
                myLogger.trace("modifyPromotion [mec_prm_prmrule_tmpDAO.update]: " + JSON.stringify(msg));
                cb(9);
            } else {
                myLogger.error("modifyPromotion [mec_prm_prmrule_tmpDAO.update]: " + logErr(err));
                console.log(err);
                cb(0);
            }
        });

    };

//获取tmp表中该业务员可以审核的规则
exports.getValidatePromotion = function(usercode, deptcode, cb) {
    myLogger.trace("getValidatePromotion [usercode, deptcode]: " + usercode + ", " + deptcode);
    var sql = "SELECT * FROM mec_prm_prmrule_tmp WHERE NOW() <= DATEEXPIRES AND DEPTCODE = " + deptcode + " AND TMPSTATE < 3 AND LASTOPERATEPERSON != '" + usercode + "'";
    generalDAO.runSql(sql, function (err, msg) {
        if(!err) {
            myLogger.trace("getPromotion [generalDAO.select]: " + JSON.stringify(msg));
            cb(null, msg);
        } else {
            myLogger.error("getPromotion [generalDAO.select]: " + logErr(err));
            console.log(err);
            cb(err, null);
        }
    });
};


//审核通过规则
exports.acceptValidatePromotion = function (rid, afterstate, starttime, endtime, lastoperater, deptcode, cb) {
    myLogger.trace("acceptValidatePromotion [rid, afterstate, lastoperater]: " + rid + ", " + afterstate + ", " + lastoperater);
    var startdate = Math.round(new Date(starttime).getTime()/1000);
    var enddate = Math.round(new Date(endtime).getTime()/1000);

    if(afterstate == 4) {
        //说明是删除审核通过
        var sql = "DELETE FROM mec_prm_prmrule WHERE ID = " + rid;
        sequelize.transaction({
            autocommit: false
        }, function (t) {
            async.parallel([
                function(cb) {
                    generalDAO.runSql(sql, {transaction: t}, cb);
                },
                function(cb) {
                    mec_prm_prmrule_tmpDAO.update({"TMPSTATE": afterstate, "LASTOPERATER": lastoperater}, {"ID": rid}, {transaction: t}, cb);
                }
            ], function (err, msg) {
                if(!err) {
                    exhandler(function () {
                        engine.refresh(function (err, msg) {
                            if(!err && msg == 1) {
                                t.commit();
                                cb(null, afterstate);
                            } else {
                                t.rollback();
                                myLogger.error("acceptValidatePromotion [exhandler]: " + logErr(err));
                                cb("error in refresh engine", null);
                            }
                        })
                    }, function (err) {
                        t.rollback();
                        myLogger.error("acceptValidatePromotion [exhandler]: " + logErr(err));
                        cb("error in refresh engine", null);
                    });
                } else {
                    myLogger.error("acceptValidatePromotion [parallel]: " + logErr(err));
                    console.log(err);
                    cb("error in delete!", null);
                }
            });
        });
    } else {
        //说明是增加或修改通过
        //判断时间上是否冲突
        var sql = "SELECT * FROM mec_prm_prmrule WHERE STATE = 1 AND DEPTCODE = " + deptcode + " AND ID != " + rid + " AND UNIX_TIMESTAMP(DATEEXPIRES) > " + startdate + " AND UNIX_TIMESTAMP(DATEEFFECTIVE) < " + enddate;
        generalDAO.runSql(sql, function (err, msg) {
            if(!err) {
                if(msg.length > 0) {
                    //说明时间冲突
                    myLogger.trace("acceptValidatePromotion [select]: " + JSON.stringify(msg));
                    cb(null, 9);
                } else {
                    //时间不冲突
                    sequelize.transaction({
                        autocommit: false
                    }, function (t) {
                        async.waterfall([
                            function (cb) {
                                var sql = "SELECT * FROM mec_prm_prmrule_tmp WHERE ID = " + rid + " limit 1 FOR UPDATE";
                                generalDAO.runSql(sql, {transaction: t}, cb);
                            },
                            function (n, cb) {
                                myLogger.trace("acceptValidatePromotion [select]: " + JSON.stringify(msg));
                                var sql = "REPLACE INTO mec_prm_prmrule(ID, RULECODE, RULECONTENT, DATEEFFECTIVE, DATEEXPIRES, DEPTCODE, STATE, REDUCECONVERT, REDUCE, COUPONCONVERT, COUPON, GIFTCONVERT, GIFT, RULESCRIPT, VIPSALIENCE, COUPONVIPGRADE, COUPONPOSACCU, COUPONVIPMORE, COUPONALLOWERROR, GIFTVIPGRADE, GIFTPOSACCU, GIFTVIPMORE, GIFTALLOWERROR) SELECT ID, RULECODE, RULECONTENT, DATEEFFECTIVE, DATEEXPIRES, DEPTCODE, STATE, REDUCECONVERT, REDUCE, COUPONCONVERT, COUPON, GIFTCONVERT, GIFT, RULESCRIPT, VIPSALIENCE, COUPONVIPGRADE, COUPONPOSACCU, COUPONVIPMORE, COUPONALLOWERROR, GIFTVIPGRADE, GIFTPOSACCU, GIFTVIPMORE, GIFTALLOWERROR FROM mec_prm_prmrule_tmp WHERE ID = " + rid;
                                generalDAO.runSql(sql, cb);
                            },
                            function (n, cb) {
                                myLogger.trace("acceptValidatePromotion [select]: " + JSON.stringify(msg));
                                mec_prm_prmrule_tmpDAO.update({"TMPSTATE": afterstate, "LASTOPERATEPERSON": lastoperater}, {"ID": rid}, {transaction: t}, cb);
                            }
                        ], function (err, msg) {
                            if(!err) {
                                exhandler(function () {
                                    engine.refresh(function (err, msg) {
                                        if(!err && msg == 1) {
                                            t.commit();
                                            cb(null, afterstate);
                                        } else {
                                            t.rollback();
                                            myLogger.error("acceptValidatePromotion [exhandler]: " + logErr(err));
                                            cb("error in refresh engine", null);
                                        }
                                    })
                                }, function (err) {
                                    t.rollback();
                                    myLogger.error("acceptValidatePromotion [exhandler]: " + logErr(err));
                                    cb("error in refresh engine", null);
                                });
                            } else {
                                myLogger.error("acceptValidatePromotion [waterfall]: " + JSON.stringify(err))
                                console.log(err);
                                cb("error in modify!", null);
                            }
                        })
                    })
                }
            } else {
                myLogger.error("acceptValidatePromotion [select]: " + logErr(err));
                console.log(err);
                cb("error in select time", null);
            }
        })
    }
};

//审核拒绝
exports.refuseValidatePromotion = function (rid, lastoperater, cb) {
    myLogger.trace("refuseValidatePromotion [rid, lastoperater]: " + rid + ", " + lastoperater);
    //将TMPSTATE设置为6
    mec_prm_prmrule_tmpDAO.update({"TMPSTATE": 6, "LASTOPERATEPERSON": lastoperater}, {"ID": rid}, function (err, msg) {
        if(!err) {
            myLogger.trace("refuseValidatePromotion [mec_prm_prmrule_tmpDAO.update]: " + JSON.stringify(msg));
            cb(9);
        } else {
            myLogger.error("refuseValidatePromotion [mec_prm_prmrule_tmpDAO.update]: " + logErr(err));
            cb(0);
        }
    });
};


//查看规则到jqGrid，添加分页等
exports.getCheckedPromotion = function (deptcode, startDate, endDate, option, cb) {
    var page = option.page || 1;
    var rows = option.rows || 20;
    var sidx = option.sidx;
    var sord = option.sord || 'asc';

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);


    var qry = {};
    if(deptcode){
        qry.DEPTCODE = deptcode;
    }
    if(startDate){
        qry.DATEEFFECTIVE = {gte:startDate}
    }
    if(endDate){
        qry.DATEEXPIRES = {lte:endDate};
    }


        mec_prm_prmruleDAO.queryAndCount({"where":qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if(!err) {
                myLogger.trace("getViewPromotion[mec_prm_prmruleDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getViewPromotion[mec_prm_prmruleDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
};

//获取可修改的规则到jqGrid，添加分页等
exports.getEditablePromotion = function (deptcode, startDate, endDate, option, cb) {
    var page = option.page || 1;
    var rows = option.rows || 20;
    var sidx = option.sidx;
    var sord = option.sord || 'asc';

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);


    var qry = {};
    if(deptcode){
        qry.DEPTCODE = deptcode;
    }
    if(startDate){
        qry.DATEEFFECTIVE = startDate;
    }
    if(endDate){
        qry.DATEEXPIRES = endDate;
    }


    mec_prm_prmrule_tmpDAO.queryAndCount({"where":qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
        if(!err) {
            myLogger.trace("getViewPromotion[mec_prm_prmrule_tmpDAO.queryAndCount]: " + (msg && msg.count));
            cb(null, msg);
        } else {
            myLogger.error("getViewPromotion[mec_prm_prmrule_tmpDAO.queryAndCount]: " + logErr(err));
            cb(err, null);
        }
    });

};


//新查看审核规则到jqGrid，添加分页等
exports.getValidatePromotionForJqgrid = function (usercode, deptcode, qry, option, cb) {
    var page = option.page || 1;
    var rows = option.rows || 20;
    var sidx = option.sidx;
    var sord = option.sord || 'asc';

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);


    var qryLimition = {DATEEXPIRES:{gte: dateUtil.getNowSimpleStr()}, TMPSTATE:{lt: 3}, LASTOPERATEPERSON:{ne: usercode}, DEPTCODE: deptcode};

    if(!qry && typeof(qry)!='number') {
        mec_prm_prmrule_tmpDAO.queryAndCount({"where":qryLimition, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if(!err) {
                myLogger.trace("getValidatePromotion[mec_prm_prmrule_tmpDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getValidatePromotion[mec_prm_prmrule_tmpDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    } else if (typeof(qry) == 'object') {
        mec_prm_prmrule_tmpDAO.queryAndCount({"where": Sequelize.and(qryLimition, qry), "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if(!err) {
                myLogger.trace("getValidatePromotion[mec_prm_prmrule_tmpDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getValidatePromotion[mec_prm_prmrule_tmpDAP.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    } else {
        //模糊查询
        var qryFields = [
            "RULECODE",
            "RULECONTENT",
            "LASTOPERATEPERSON"
        ];
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for(var i = 1; i < qryFields.length; i++) {
            var tmp = {};
            tmp[qryFields[i]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        console.log("4");
        mec_prm_prmrule_tmpDAO.queryAndCount({"where": sequelize.and(qryLimition, qryOptions), "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if(!err) {
                myLogger.trace("getValidatePromotion[mec_prm_prmrule_tmpDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getValidatePromotion[mec_prm_prmrule_tmpDAP.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
};