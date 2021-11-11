/**
 * Created by lucywu on 7/9/14.
 */
var express             = require('express');
var payService          = require('../../service/app/payService');
var umspayService       = require('../../service/app/umspayService');
var myLogger            = require('../../logging/contextLogger')("app/payRouter");
var router              = express.Router();

router.post('/createPay', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/createPay]: "+JSON.stringify(postParams));

    var ordercodes=eval("("+postParams.ORDERCODES+")");
    var isonlineorder=ordercodes[0].charAt(0)=='1';

    umspayService.createPay(isonlineorder,ordercodes,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

router.post('/queryPay', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/queryPay]: "+JSON.stringify(postParams));

    var orderOrGroupCode=postParams.ORDERORGROUPCODE;

    umspayService.queryPay(orderOrGroupCode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

router.post('/notifyPay', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/notifyPay]: "+JSON.stringify(postParams));

    umspayService.notifyPay(postParams,function(err,msg){
        if(!err) res.send(msg);
    });
});

router.get('/notifyPay', function(req, res) {
    var getParams = require('url').parse(req.url,true).query;
    myLogger.trace("get [/notifyPay]: "+JSON.stringify(getParams));

    umspayService.notifyPay(getParams,function(err,msg){
        if(!err) res.send(msg);
    });
});


module.exports = router;
