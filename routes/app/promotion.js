/**
 * Created by lucywu on 12/17/14.
 */
var express             = require('express');
var promotionService         = require('../../service/app/promotionService');
var cartService         = require("../../service/app/cartService");
var orderService        = require("../../service/app/orderService");
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/promotionRouter");

//获取购物车所选商品的总价
router.get('/getTotalPrice', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getTotalPrice]: "+JSON.stringify(getParams));

    var entries=eval("("+getParams.ENTRIES+")");
    cartService.getTotalPrice(entries,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取拼单所选线下订单的总价
router.get('/getGroupTotalPrice', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getGroupTotalPrice]: "+JSON.stringify(getParams));

    var offlineordercodes=eval("("+getParams.OFFLINEORDERCODES+")");
    orderService.getGroupTotalPrice(offlineordercodes,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

module.exports = router;
