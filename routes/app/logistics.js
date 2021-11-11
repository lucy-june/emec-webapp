/**
 * Created by lucywu on 12/17/14.
 */
var express             = require('express');
var logisticsService         = require('../../service/app/logisticsService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/logisticsRouter");

//获取订单的运单信息和物流信息
router.get('/getOrderExpressInfo', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getOrderExpressInfo]: "+JSON.stringify(getParams));

    var ordercode=getParams.ORDERCODE;
    logisticsService.getOrderExpressInfo(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取订单的全部到柜自提信息或者到门店自提信息
router.get('/getOrderPickInfo', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getOrderPickInfo]: "+JSON.stringify(getParams));

    var ordercode=getParams.ORDERCODE;
    logisticsService.getOrderPickInfo(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

module.exports = router;
