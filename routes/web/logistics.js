/**
 * Created by lucywu on 10/21/14.
 */
var express             = require('express');
var router              = express.Router();
var auth                = require('../../security/auth');
var logisticsService        = require('../../service/web/logisticsService');
var myLogger                    = require('../../logging/contextLogger')("web/logisticsRouter");
var kuaidi              = require("../../interaction/kuaidi");

//添加物流备货iframe内跳转
router.get('/prepare', auth.authority, function (req, res) {
    res.render('logistics/prepare',{"assistantList":req.session.assistantList || []});
});

//添加物流管理iframe内跳转
router.get('/management', auth.authority, function (req, res) {
    res.render('logistics/management');
});

//添加物流跟踪iframe内跳转
router.get('/tracing', auth.authority, function (req, res) {
    res.render('logistics/tracing');
});

//跳转到发货页面
router.get('/addDelivery', auth.authority, function (req, res) {
    res.render('logistics/addDelivery');
});

//跳转到物流查询页面
router.get('/queryDelivery', auth.authority, function (req, res) {
    res.render('logistics/queryDelivery');
});

//跳转到柜台自提页面
router.get('/pickCounter', auth.authority, function (req, res) {
    res.render('logistics/pickCounter',{"assistantList":req.session.assistantList || []});
});

//跳转到全部包裹查询页面
router.get('/totalPackage', auth.authority, function (req, res) {
    res.render('logistics/totalPackage');
});

//跳转到收包裹页面
router.get('/collectPackage', auth.authority, function (req, res) {
    res.render('logistics/collectPackage');
});

//跳转到调送包裹页面
router.get('/transferPackage', auth.authority, function (req, res) {
    res.render('logistics/transferPackage');
});

//跳转到打包订单页面
router.get('/packOrder', auth.authority, function (req, res) {
    res.render('logistics/packOrder');
});

//跳转到发快递页面
router.get('/sendExpress', auth.authority, function (req, res) {
    res.render('logistics/sendExpress');
});

//跳转到顾客提货页面
router.get('/pickDept', auth.authority, function (req, res) {
    res.render('logistics/pickDept');
});






//获取不同状态的包裹信息
router.post('/getPackageLevel',auth.authority,  function (req, res) {
    var options=req.body;
    var datefrom=options.datefrom;
    var dateto=options.dateto;
    delete options.datefrom;
    delete options.dateto;
    logisticsService.getPackageLevel(options,datefrom,dateto,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
//            res.send({status:false,data:err});
            res.setHeader('content-type','text/html; charset=UTF-8');
            res.end(JSON.stringify({status:false,data:err}));
        }
    });
});

//获取不同状态的包裹信息
router.post('/getCounterOwnPackageLevel',auth.authority,  function (req, res) {
    var options=req.body;
    var datefrom=options.datefrom;
    var dateto=options.dateto;
    delete options.datefrom;
    delete options.dateto;
    options.COUNTERCODE=req.session.countercode;
    logisticsService.getPackageLevel(options,datefrom,dateto,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            //        res.send({status:false,data:err});
            res.setHeader('content-type','text/html; charset=UTF-8');
            res.end(JSON.stringify({status:false,data:err}));
        }
    });
});

//获取本门店需要关注的不同状态的包裹信息
router.post('/getRelatedPackageLevel',auth.authority,  function (req, res) {
    var options=req.body;
    var datefrom=options.datefrom;
    var dateto=options.dateto;
    delete options.datefrom;
    delete options.dateto;

    var deptcode=req.session.deptcode;

    logisticsService.getRelatedPackageLevel(options,datefrom,dateto,deptcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            //        res.send({status:false,data:err});
            res.setHeader('content-type','text/html; charset=UTF-8');
            res.end(JSON.stringify({status:false,data:err}));
        }
    });
});

//获取不同状态的订单信息
router.post('/getOrderLevel', auth.authority, function (req, res) {
    var options=req.body;
    var datefrom=options.datefrom;
    var dateto=options.dateto;
    delete options.datefrom;
    delete options.dateto;
    logisticsService.getOrderLevel(options,datefrom,dateto,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//获取不同状态的订单信息
router.post('/getOwnOrderLevel', auth.authority, function (req, res) {
    var options=req.body;
    var datefrom=options.datefrom;
    var dateto=options.dateto;
    delete options.datefrom;
    delete options.dateto;

    options.DEPTCODE=req.session.deptcode;

    logisticsService.getOrderLevel(options,datefrom,dateto,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});


//获取本门店需要关注的不同状态的订单信息
router.post('/getRelatedOrderLevel', auth.authority, function (req, res) {
//    var options = require('url').parse(req.url,true).query;
    var options=req.body;
    var datefrom=options.datefrom;
    var dateto=options.dateto;
    delete options.datefrom;
    delete options.dateto;

    var deptcode=req.session.deptcode;

    logisticsService.getRelatedOrderLevel(options,datefrom,dateto,deptcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//获取不同状态的包裹内商品信息
router.post('/getDetailLevel', auth.authority, function (req, res) {
    var options=req.body;
    logisticsService.getDetailLevel(options,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//更新包裹状态
router.post('/updatePackageState', auth.authority, function (req, res) {
    var options=req.body;
    var packagecodes=options.packagecodes;
    var oldstate=options.oldstate;
    var newstate=options.newstate;
    var oldposition=options.oldposition;
    var newposition=options.newposition;
    var operateperson=req.session.usercode;
    if(!operateperson) operateperson="";

    logisticsService.updatePackageState(packagecodes,oldstate,newstate,oldposition,newposition,operateperson,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//单个包裹的集货区位置建议
router.get('/getSuggestPosition', auth.authority, function (req, res) {
    var options = require('url').parse(req.url,true).query;
    var packagecode=options.packagecode;
    var deptcode=req.session.deptcode;

    logisticsService.getSuggestPosition(packagecode,deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取多个包裹的集货区位置建议
router.post('/getSuggestPositions', auth.authority, function (req, res) {
    var options=req.body;
    var packagecodes=options.packagecodes;
    var deptcode=req.session.deptcode;

    logisticsService.getSuggestPositions(packagecodes,deptcode,function(msg){
        res.send(msg);
    });
});

//获取待备货的包裹
router.get('/getPreparingPackage', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getPreparingPackage]: "+JSON.stringify(getParams));

    var countercode=req.session.countercode;
    var qry=getParams.qry;

    logisticsService.getPreparingPackage(countercode,qry,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//备货完成
router.post('/preparePackage', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/preparePackage]: "+JSON.stringify(postParams));
    var packagecode=postParams.PACKAGECODE;
    var assistantid=postParams.SALESMANCODE;

    logisticsService.preparePackage(packagecode,assistantid,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取等待收包裹
router.get('/getCollectingPackage', auth.authority, function (req, res) {
    var deptcode=req.session.deptcode;

    logisticsService.getCollectingPackage(deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//收包裹,从营业员到集货区
router.post('/collectPackage1', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/collectPackage1]: "+JSON.stringify(postParams));
    var packagecode=postParams.PACKAGECODE;
    var positioncode=postParams.POSITIONCODE;
    var usercode=req.session.usercode;

    logisticsService.collectPackage1(packagecode,positioncode,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//收包裹,从营业员到调货区
router.post('/collectPackage2', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/collectPackage2]: "+JSON.stringify(postParams));
    var packagecode=postParams.PACKAGECODE;
    var positioncode=postParams.POSITIONCODE;
    var usercode=req.session.usercode;

    logisticsService.collectPackage2(packagecode,positioncode,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//收包裹,从调货员到集货区
router.post('/collectPackage3', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/collectPackage3]: "+JSON.stringify(postParams));
    var packagecode=postParams.PACKAGECODE;
    var positioncode=postParams.POSITIONCODE;
    var usercode=req.session.usercode;

    logisticsService.collectPackage3(packagecode,positioncode,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取需要调货的包裹
router.get('/getTransferablePackage', auth.authority, function (req, res) {
    var deptcode=req.session.deptcode;

    logisticsService.getTransferablePackage(deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//门店调货包裹
router.post('/transferPackage', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/transferPackage]: "+JSON.stringify(postParams));
    var packagecode=postParams.PACKAGECODE;
    var usercode=req.session.usercode;

    logisticsService.transferPackage(packagecode,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取需要打包的订单
router.get('/getPackableOrder', auth.authority, function (req, res) {
    var deptcode=req.session.deptcode;

    logisticsService.getPackableOrder(deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//打包订单
router.post('/packOrder', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/packOrder]: "+JSON.stringify(postParams));
    var ordercode=postParams.ORDERCODE;
    var positioncode=postParams.POSITIONCODE;
    var usercode=req.session.usercode;

    logisticsService.packOrder(ordercode,positioncode,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取待发快递的订单信息
router.get('/getDeliverableOrders', auth.authority, function (req, res) {
    var deptcode=req.session.deptcode;

    logisticsService.getDeliverableOrders(deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//发快递
router.post('/sendExpress', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/sendExpress]: "+JSON.stringify(postParams));
    var ordercode=postParams.ORDERCODE;
    var lgtcompany=postParams.LGTCOMPANY;
    var lgtnumber=postParams.LGTNUMBER;
    var usercode=req.session.usercode;

    logisticsService.sendExpress(ordercode,lgtcompany,lgtnumber,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取已经发快递,未确认收货的订单信息
router.get('/getDeliveringOrders', auth.authority, function (req, res) {
    var deptcode=req.session.deptcode;

    logisticsService.getDeliveringOrders(deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//查询快递
router.get('/queryExpress', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/queryExpress]: "+JSON.stringify(getParams));

    var type=getParams.type;
    var postid=getParams.postid;

    kuaidi.queryExpress(type,postid,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//查看门店提货包裹
router.get('/getPickDeptOrders', auth.authority, function (req, res) {
    var deptcode=req.session.deptcode;

    logisticsService.getPickDeptOrders(deptcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//门店提货
router.post('/pickDeptOrder', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/pickDeptOrder]: "+JSON.stringify(postParams));
    var ordercode=postParams.ORDERCODE;
    var pickcode=postParams.PICKCODE;
    var usercode=req.session.usercode;

    logisticsService.pickDeptOrder(ordercode,pickcode,usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//查看柜台自提包裹
router.get('/getPickCounterOrders', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getPickCounterOrders]: "+JSON.stringify(getParams));

    var countercode=req.session.countercode;
    var qry=getParams.qry;

    logisticsService.getPickCounterOrders(countercode,qry,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//柜台提货
router.post('/pickCounterOrder', auth.authority, function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/pickCounterOrder]: "+JSON.stringify(postParams));
    var ordercode=postParams.ORDERCODE;
    var pickcode=postParams.PICKCODE;
    var assistantid=postParams.SALESMANCODE;
    var countercode=req.session.countercode;

    logisticsService.pickCounterOrder(ordercode,countercode,pickcode,assistantid,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

//获取线下全部订单
router.get('/searchTotalPackage',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/searchTotalPackage]: "+JSON.stringify(getParams));
    logisticsService.searchTotalPackage(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send(result);
        }
        else{
            res.send({"userdata":"查询异常"});
        }
    })
});

module.exports = router;
