/**
 * Created by YuanBo on 14-7-19.
 */
var express             = require('express');
var orderService        = require('../../service/web/orderService');
var auth                = require('../../security/auth');
var ukeyverify                = require('../../security/ukeyVerify');
var router              = express.Router();
var myLogger                    = require('../../logging/contextLogger')("web/orderRouter");
var mis = require("../../interaction/mis");

//添加线下订单iframe内跳转
router.get('/addOffline',auth.authority, function(req, res) {
    res.render('orders/addOffline',{"assistantList":req.session.assistantList || [],"counterCode":req.session.countercode,"rand":req.session.RandomCode});
});

//添加线下退货订单iframe内跳转
router.get('/addOfflineReturn',auth.authority, function(req, res) {
    res.render('orders/addOfflineReturn',{"assistantList":req.session.assistantList || [],"userCode":req.session.usercode,"rand":req.session.RandomCode});
});

//添加线下订单iframe内跳转
router.get('/acceptOnline',auth.authority, function(req, res) {
    res.render('orders/acceptOnline',{"assistantList":req.session.assistantList || [],"rand":req.session.RandomCode});
});

//本柜全部订单获取
router.get('/counterOrders',auth.authority, function(req, res) {
    res.render('orders/counterOrders',{"assistantList":req.session.assistantList || [],"countercode":req.session.countercode});
});

//获取线下全部订单
router.get('/getOfflineOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOfflineOrder]: "+JSON.stringify(getParams));
    orderService.getOfflineOrder(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取本柜全部线上订单
router.get('/getOnlineOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOnlineOrder]: "+JSON.stringify(getParams));
    orderService.getOnlineOrder(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取线下全部订单
router.get('/getOfflineRetOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOfflineRetOrder]: "+JSON.stringify(getParams));
    orderService.getOfflineRetOrder(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取柜台内用户的所有订单
router.get('/getOrderCounterUserBuy',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOrderCounterUserBuy]: "+JSON.stringify(getParams));
    orderService.getOrderCounterUserBuy(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取今日开出的线下订单
router.get('/getOfflineOrderPlacedToday',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOfflineOrderPlacedToday]: "+JSON.stringify(getParams));
    orderService.getOfflineOrderPlacedToday(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            result.userdata={};
            result.userdata.ITEMCOUNT = msg.ITEMCOUNT;
            result.userdata.AMT = msg.AMT;
            res.send(result);
        }
        else{
            res.send({"userdata":"查询异常"});
        }
    })
});

//获取今日接的线上订单
//今日的所有orderstate>3的网上订单(confirmstate肯定为1),加上订单状态为[1,2]且confirmstate=1的订单
router.get('/getOnlineOrderAcceptedToday',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOnlineOrderAcceptedToday]: "+JSON.stringify(getParams));
    orderService.getOnlineOrderAcceptedToday(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//尚未接受的线上订单
router.get('/getOnlineOrderUnaccepted',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOnlineOrderUnaccepted]: "+JSON.stringify(getParams));
    orderService.getOnlineOrderUnaccepted(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//尚未支付的线上订单
router.get('/getOnlineOrderUnpay',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOnlineOrderUnpay]: "+JSON.stringify(getParams));
    orderService.getOnlineOrderUnpay(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//已支付或者到付待确认的线上订单
router.get('/getOnlineOrderConfirmable',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOnlineOrderConfirmable]: "+JSON.stringify(getParams));
    orderService.getOnlineOrderConfirmable(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取线下订单的商品
router.get('/getOfflineContentByOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var ordercode=getParams.OFFLINEORDERCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOfflineContentByOrder]: "+JSON.stringify(getParams));
    orderService.getOfflineContentByOrder(countercode,ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线上订单在本柜的商品
router.get('/getOnlineContentByOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var ordercode=getParams.ONLINEORDERCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOnlineContentByOrder]: "+JSON.stringify(getParams));
    orderService.getOnlineContentByOrder(countercode,ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线下退货订单的商品
router.get('/getOfflineRetContentByOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var ordercode=getParams.OFFLINEORDERCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getOfflineRetContentByOrder]: "+JSON.stringify(getParams));
    orderService.getOfflineRetContentByOrder(countercode,ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//本柜线上订单拒绝
router.post('/cancelOnlineOrder',auth.authority,ukeyverify.checkukey, function(req, res) {
    var getParams= req.body.data;
    var ordercode=getParams.ONLINEORDERCODE;
    var assistantid=getParams.SALESMANCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/cancelOnlineOrder]: "+JSON.stringify(getParams));
    orderService.cancelOnlineOrder(countercode,ordercode,assistantid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//本柜线下订单拒绝
router.post('/cancelOfflineOrder',auth.authority,ukeyverify.checkukey, function(req, res) {
    var getParams= req.body.data;
    var ordercode=getParams.OFFLINEORDERCODE;
    var assistantid=getParams.SALESMANCODE||req.session.usercode;

    myLogger.trace("get [/cancelOfflineOrder]: "+JSON.stringify(getParams));
    orderService.cancelOfflineOrder(ordercode,assistantid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//退货线下订单拒绝
router.post('/cancelReturnOrder',auth.authority,function(req, res) {
    var getParams= req.body.data;
    var ordercode=getParams.OFFLINEORDERCODE;
    var assistantid=getParams.SALESMANCODE||req.session.usercode;

    myLogger.trace("get [/cancelOfflineOrder]: "+JSON.stringify(getParams));
    orderService.cancelOfflineOrder(ordercode,assistantid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//本柜线上订单确认
router.post('/confirmOnlineOrder',auth.authority,ukeyverify.checkukey, function(req, res) {
    var getParams= req.body.data;
    var ordercode=getParams.ONLINEORDERCODE;
    var assistantid=getParams.SALESMANCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/confirmOnlineOrder]: "+JSON.stringify(getParams));
    orderService.confirmOnlineOrder(countercode,ordercode,assistantid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//开单时根据itemcode和countercode获取该商品的相应信息
router.get('/getInfoByCounterSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getInfoByCounterSku]: "+JSON.stringify(getParams));
    orderService.getInfoByCounterSku(countercode,itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//开单时根据skccode和countercode获取该商品的相应信息
router.get('/getInfoByCounterSkc',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var merchantSkcCode=getParams.MERCHANTSKCCODE;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getInfoByCounterSkc]: "+JSON.stringify(getParams));
    orderService.getInfoByCounterSkc(countercode,merchantSkcCode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//开单时获取用户的账户根据用户的手机号
router.get('/getUsercodeByTelephone',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var telephone=getParams.TELEPHONE;

    myLogger.trace("get [/getUsercodeByTelephone]: "+JSON.stringify(getParams));
    orderService.getUsercodeByTelephone(telephone,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//开单时根据用户的手机号查询vipcode进而得到vipinfo
router.get('/getVipinfoByTelephone',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var telephone=getParams.TELEPHONE;

    myLogger.trace("get [/getVipinfoByTelephone]: "+JSON.stringify(getParams));
    orderService.getVipinfoByTelephone(telephone,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//查询vip信息
router.post('/getVIPInfo', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/getVIPInfo]: " + JSON.stringify(postParams));

    var postParams2=postParams.querystring;
    console.log(postParams2);

    mis.getVIPInfo(postParams2,function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });

});

//柜台营业员开线下单
router.post('/placeOfflineOrder',auth.authority,ukeyverify.checkukey, function(req, res) {
    var postParams= req.body.data;
    var orderinfo=postParams.orderinfo;
    var contentinfo=postParams.contentinfo;
    var siteinfo=postParams.siteinfo;
    var countercode=req.session.countercode;
    orderinfo.COUNTERCODE=countercode;

    myLogger.trace("post [/placeOfflineOrder]: "+JSON.stringify(postParams));
    orderService.placeOfflineOrder(orderinfo,contentinfo,siteinfo,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//模拟柜台营业员开线下单
router.post('/placeOfflineOrder2',auth.authority,ukeyverify.checkukey, function(req, res) {
    var postParams= req.body.data;
    var orderinfo=postParams.orderinfo;
    var contentinfo=postParams.contentinfo;
    var siteinfo=postParams.siteinfo;
    var countercode=req.session.countercode;
    orderinfo.COUNTERCODE=countercode;

    myLogger.trace("post [/placeOfflineOrder]: "+JSON.stringify(postParams));
    orderService.placeOfflineOrder2(orderinfo,contentinfo,siteinfo,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//模拟过促销引擎获取总价格
router.post('/getTotalPriceInCounter2',auth.authority, function(req, res) {
    var postParams= req.body;
    myLogger.trace("post [/getTotalPrice]: "+JSON.stringify(postParams));
    var entries=postParams.entries||[];
    var countercode=req.session.countercode;
    for(var k=0;k<entries.length;k++) entries[k].COUNTERCODE=countercode;
    orderService.getTotalPrice2(entries,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//过促销引擎获取总价格
router.post('/getTotalPriceInCounter',auth.authority, function(req, res) {
    var postParams= req.body;
    myLogger.trace("post [/getTotalPrice]: "+JSON.stringify(postParams));
    var entries=postParams.entries||[];
    var countercode=req.session.countercode;
    var vipcode=postParams.vipcode;

    orderService.getTotalPrice(vipcode,countercode,entries,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取订单地址信息
router.get('/getSiteInfoByOrder',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getSiteInfoByOrder]: "+JSON.stringify(getParams));
    var ordercode=getParams.OFFLINEORDERCODE||getParams.ONLINEORDERCODE;
    var isonline=!getParams.OFFLINEORDERCODE;

    orderService.getSiteInfoByOrder(isonline,ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//删除订单iframe内跳转
router.get('/cancel',auth.authority, function(req, res) {
    res.render('orders/cancel',{"assistantList":req.session.assistantList || [],"rand":req.session.RandomCode});
});

//添加线下订单及订单细节异步请求
router.get('/addOfflineService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    //data["INPUTPERSON"]=req.session.usercode;
    orderService.addOfflineService(data,res);
});

router.get('/addOfflineDetailService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    //data["INPUTPERSON"]=req.session.usercode;
    orderService.addOfflineDetailService(data,res);
});

router.get('/getOwn', function(req, res) {
//    var countercode=require('url').parse(req.url,true).query.countercode;
    var countercode = req.session.countercode;
    var datefrom=require('url').parse(req.url,true).query.datefrom;
    var dateto=require('url').parse(req.url,true).query.dateto;
    orderService.getOwn(countercode,datefrom,dateto,function(msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.send({status:true,data:msg});
    },function(err){
        res.send({status:false,data:err});
    });
});

router.post('/placeOrder', function(req, res) {
    var options=req.body.options;
    options= eval("(" + options + ")");
    orderService.placeOrder(options,function(msg){
        res.send({status:true,data:null});
    },function(err){
        res.send({status:false,data:err});
    });
});

router.post('/cancelOrder',auth.authority,ukeyverify.checkukey, function(req, res) {
    var orderid=req.body.data.orderid;
    orderService.cancelOrder(orderid,function(msg){
        res.send({status:true,data:null});
    },function(err){
        res.send({status:false,data:err});
    });
});

//添加线下订单及订单细节异步请求，传入的参数中包括订单及订单细节的所有信息，只用一个url完成
router.get('/addOfflineAllService',auth.authority, function(req, res) {
    var op = require('url').parse(req.url,true).query;

    console.log("###########");
    console.log(op);
    var options=JSON.parse(op.options);//JSON字符串转对象
    orderService.addOfflineAllService(options,res);

});

//退货时根据pos条号码搜索订单明细信息
router.get('/getOrderInfoWhenReturn',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getOrderInfoWhenReturn]: "+JSON.stringify(getParams));
    var storecode=req.session.deptcode;
    var posdealnum=getParams.POSDEALNUM;
    orderService.getOrderInfoWhenReturn(posdealnum,storecode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//退货时根据pos条号码搜索订单支付明细信息
router.get('/getPayListWhenReturn',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getPayListWhenReturn]: "+JSON.stringify(getParams));
    var storecode=req.session.deptcode;
    var posdealnum=getParams.POSDEALNUM;
    orderService.getPayListWhenReturn(posdealnum,storecode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//柜台营业员开线下退货单通过pos条
router.post('/placeOfflineReturnOrderByPos',auth.authority, function(req, res) {
    var postParams= req.body.data;
    var orderinfo=postParams.orderinfo;
    var contentinfoArray=postParams.contentinfoArray;
    var usercode=req.session.usercode;

    myLogger.trace("post [/placeOfflineReturnOrderByPos]: "+JSON.stringify(postParams));
    orderService.placeOfflineReturnOrderByPos(usercode,orderinfo,contentinfoArray,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取今日开出的线下退货单
router.get('/getOfflineReturnOrderPlacedToday',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var storecode=req.session.deptcode;

    myLogger.trace("get [/getOfflineReturnOrderPlacedToday]: "+JSON.stringify(getParams));
    orderService.getOfflineReturnOrderPlacedToday(storecode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//生成订单编码
router.get('/generateOrderCode', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var isonline=getParams.isonline;
    var isreturn=getParams.isreturn;
    isonline=isonline=="true"? true:false;
    isreturn=isreturn=="true"? true:false;

    myLogger.trace("get [/generateOrderCode]: "+JSON.stringify(getParams));
    orderService.generateOrderCode2(isonline,isreturn,function(err,msg){
        if(!err){
            res.setHeader('content-type','text/html; charset=UTF-8');
            res.end(JSON.stringify({status:true,data:msg}));
        }
        else{
            res.setHeader('content-type','text/html; charset=UTF-8');
            res.end(JSON.stringify({status:false,data:err}));
        }
    })
});



module.exports = router;

