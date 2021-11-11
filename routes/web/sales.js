/**
 * Created by lucywu on 9/17/14.
 */

var express = require('express');
var auth = require('../../security/auth');
var promotionService = require('../../service/web/promotionService');
var router = express.Router();
var myLogger  = require('../../logging/contextLogger')("web/salesRouter");

//NotUsed
//添加促销规则iframe内跳转
//router.get('/addSalesRule', auth.authority, function (req, res) {
//    res.render('sales/addSalesRule');
//});


//NotUsed
//修改促销规则iframe内跳转
//router.get('/modifySalesRule', auth.authority, function (req, res) {
//    res.render('sales/modifySalesRule');
//});

//NotUsed
//审核促销规则iframe内跳转
//router.get('/validateSalesRule', auth.authority, function (req, res) {
//    res.render('sales/validateSalesRule');
//});



//NotUsed
//router.get('/addRule', auth.authority, function (req, res) {
//    var data = require('url').parse(req.url,true).query;
//    var rulename = data.rulename;
//    var ruledescription = data.ruledescription;
//    var date_effective = data.date_effective;
//    var date_expires = data.date_expires;
//    var salience = data.salience;
//    var salestype = data.salestype;
//    var salesparam = data.salesparam;
//    var isround = "true";
//    var deptcode = data.deptcode;
//    var creator = req.session.usercode;
//    var paymentconfig = data.paymentconfig;
//    var orderconfig = data.orderconfig;
//    var itemconfig = data.itemconfig;
//
//    promotionService.addRule(rulename,ruledescription,date_effective,
//        date_expires,salience,salestype,salesparam,isround,
//        deptcode,creator,paymentconfig,orderconfig,itemconfig,function(msg){
//            res.send({status:true,data:msg});
//        },function(err){
//            res.send({status:false,data:err});
//        });
//});

//NEW-LJN
//NotUsed
//查看审核促销规则新iframe内跳转
//router.get('/newValidatePromotionWeb', auth.authority, function (req, res) {
//    var deptcode = req.session.deptcode;
//    var usercode = req.session.usercode;
//    myLogger.trace("get [/validatePromotionWeb]: " + usercode + ", " + deptcode);
//    promotionService.getValidatePromotion(usercode, deptcode, function (err, msg) {
//        if(!err) {
//            res.render('sales/viewValidatePromotion', {"ruleList": msg});
//        } else {
//            res.send("获取规则数据库失败！");
//        }
//    });
//});

//NotUsed
//查看促销规则新iframe内跳转
//router.get('/viewPromotionWeb', auth.authority, function (req, res) {
//    var deptcode = req.session.deptcode;
//    myLogger.trace("get [/viewPromotionWeb]: " + deptcode);
//    promotionService.getPromotion(deptcode, function (err, msg) {
//        if(!err) {
//            res.render('sales/viewPromotion', {"ruleList": msg});
//        } else {
//            res.send("获取规则数据库失败！");
//        }
//    });
//});

//添加促销规则iframe内跳转
router.get('/ui_addPromotion', auth.authority, function (req, res) {
    var deptcode = req.session.deptcode;
    var deptname = "";
    switch (deptcode)
    {
        case "10200":
            deptname = "线上店";
            break;
        case "10201":
            deptname = "徐汇店";
            break;
        case "10202":
            deptname = "虹桥店";
            break;
        default :
            deptname = "未知门店，请重试";
            break;
    }
    res.render('sales/addPromotion', {deptname: deptname});
});



//添加促销规则
router.post('/addPromotionService', auth.authority, function (req, res) {
    var data = req.body;
    myLogger.trace("post [/addPromotionService]: " + JSON.stringify(data));
    var rulecode = data.rulecode;
    var rulecontent = data.rulecontent;
    var dateeffective = data.dateeffective;
    var dateexpires = data.dateexpires;
    //deptcode固定为该业务员所在门店
    //var deptcode = data.deptcode;
    var deptcode = req.session.deptcode;
    var salience = data.salience;
    var state = data.state;
    var reduceconvert = data.reduceconvert;
    var reduce = data.reduce;
    var couponposaccu = data.couponposaccu;
    var couponvipgrade = data.couponvipgrade;
    var couponconvert = data.couponconvert;
    var coupon = data.coupon;
    var giftposaccu = data.giftposaccu;
    var giftvipgrade = data.giftvipgrade;
    var giftconvert = data.giftconvert;
    var gift = data.gift;
    var promotionnum = data.promotionnum;
    var creator = req.session.usercode;

    promotionService.addPromotion(rulecode, rulecontent, dateeffective, dateexpires,
        deptcode, salience, state, reduceconvert, reduce, couponposaccu, couponvipgrade,
        couponconvert, coupon, giftposaccu, giftvipgrade, giftconvert, gift,
        promotionnum, creator, function (msg) {
            res.send(msg + '');
        }
    );
});


//获取需要修改的规则
//router.get('/modifyPromotionWeb', auth.authority, function (req, res) {
//    var data = require('url').parse(req.url, true).query;
//    var ruleid = data.rid;
//    promotionService.getModifyPromotion(ruleid, function (err, msg) {
//        if(!err) {
//            res.send(msg);
//        } else {
//            res.send(err);
//        }
//    });
//
//});

//删除促销规则
router.post('/deletePromotion', auth.authority, function (req, res) {
    var data = req.body;
    var ruleid = data.rid;
    var lastoperater = req.session.usercode;
    promotionService.deletePromotion(ruleid, lastoperater, function (msg) {
        res.send(msg + '');
    });

});

//修改促销规则
router.post('/modifyPromotionService', auth.authority, function (req, res) {
    var data = req.body;
    myLogger.trace("post [/modifyPromotionService]: " + JSON.stringify(data));
    var rid = data.rid;
    var rulecode = data.rulecode;
    var rulecontent = data.rulecontent;
    var dateeffective = data.dateeffective;
    var dateexpires = data.dateexpires;
    //deptcode固定为该业务员所在门店
    //var deptcode = data.deptcode;
    var deptcode = req.session.deptcode;
    var salience = data.salience;
    var state = data.state;
    var reduceconvert = data.reduceconvert;
    var reduce = data.reduce;
    var couponposaccu = data.couponposaccu;
    var couponvipgrade = data.couponvipgrade;
    var couponconvert = data.couponconvert;
    var coupon = data.coupon;
    var giftposaccu = data.giftposaccu;
    var giftvipgrade = data.giftvipgrade;
    var giftconvert = data.giftconvert;
    var gift = data.gift;
    var promotionnum = data.promotionnum;
    var creator = req.session.usercode;

    promotionService.modifyPromotion(rid, rulecode, rulecontent, dateeffective, dateexpires,
        deptcode, salience, state, reduceconvert, reduce, couponposaccu, couponvipgrade,
        couponconvert, coupon, giftposaccu, giftvipgrade, giftconvert, gift,
        promotionnum, creator, function (msg) {
            res.send(msg + '');
        }
    );
});




//审核通过促销规则
router.post('/acceptValidatePromotion', auth.authority, function (req, res) {
    var data = req.body;
    var ruleid = data.rid;
    var afterstate = data.afterstate;
    var starttime = data.starttime;
    var endtime = data.endtime;
    var lastoperater = req.session.usercode;
    var deptcode = req.session.deptcode;

    promotionService.acceptValidatePromotion(ruleid, afterstate, starttime, endtime,lastoperater, deptcode, function (err, msg) {
        if(!err) {
            res.send({status: true, data:msg});
        } else {
            res.send({status: false, data:err});
        }
    });
});

//审核拒绝
router.post('/refuseValidatePromotion', auth.authority, function (req, res) {
    var data = req.body;
    var ruleid = data.rid;
    var lastoperater = req.session.usercode;
    promotionService.refuseValidatePromotion(ruleid, lastoperater, function (err, msg) {
        if(!err) {
            res.send({status: true, data:msg});
        } else {
            res.send({status: false, data:err});
        }
    });
});

//修改促销规则iframe内跳转
router.get('/ui_modifyPromotion', auth.authority, function (req, res) {
    res.render('sales/modifyPromotion');
});

//新查看获取可修改促销规则（JqGrid用）
router.get('/getEditablePromotion', auth.authority, function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    var startDate = getParams.startDate;
    var endDate = getParams.endDate;
    var deptCode = getParams.deptCode;
    var rows = getParams.rows;
    var page = getParams.page;
    var sidx = getParams.sidx;
    var sord = getParams.sord;

    //var deptcode = req.session.deptcode;

    myLogger.trace("get[/getEditablePromotion]: " + JSON.stringify(getParams));
    promotionService.getEditablePromotion(deptCode, startDate, endDate, {page:page, rows:rows, sidx:sidx, sord:sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows) + (msg.count%rows==0?0:1);
            var result = {total: total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({"userdata": "查询异常"});
        }
    });
});

//查看促销规则iframe内跳转
router.get('/ui_viewPromotion', auth.authority, function (req, res) {
    res.render('sales/viewPromotion');
});

//获取所有促销规则（JqGrid用）
router.get('/getCheckedPromotion', auth.authority, function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    var startDate = getParams.startDate;
    var endDate = getParams.endDate;
    var deptCode = getParams.deptCode;
    var rows = getParams.rows;
    var page = getParams.page;
    var sidx = getParams.sidx;
    var sord = getParams.sord;

  //  var deptcode = req.session.deptcode;

    myLogger.trace("get[/getCheckedPromotion]: " + JSON.stringify(getParams));
    promotionService.getCheckedPromotion(deptCode, startDate, endDate, {page:page, rows:rows, sidx:sidx, sord:sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows) + (msg.count%rows==0?0:1);
            var result = {total: total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({"userdata": "查询异常"});
        }
    });
});

//审核规则iframe内跳转
router.get('/ui_validatePromotion', auth.authority, function (req, res) {
    res.render('sales/validatePromotion');
});

//获取可审核促销规则（JqGrid用）
router.get('/getValidatePromotion', auth.authority, function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    var qry = getParams.qry;
    var rows = getParams.rows;
    var page = getParams.page;
    var sidx = getParams.sidx;
    var sord = getParams.sord;

    var usercode = req.session.usercode;
    var deptcode = req.session.deptcode;

    myLogger.trace("get[/getValidatePromotion]: " + JSON.stringify(getParams));
    promotionService.getValidatePromotionForJqgrid(usercode, deptcode, qry, {page:page, rows:rows, sidx:sidx, sord:sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows) + (msg.count%rows==0?0:1);
            var result = {total: total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({"userdata": "查询异常"});
        }
    });
});

module.exports = router;
