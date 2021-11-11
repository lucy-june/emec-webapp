/**
 * Created by lucywu on 7/23/14.
 */

var express             = require('express');
var orderService       = require('../../service/app/orderService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/orderRouter");
var async               = require('async');

//下单
router.post('/placeOnlineOrder', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/placeOnlineOrder]: "+JSON.stringify(postParams));

    var orderinfo=eval("("+postParams.orderinfo+")");
    var contentinfo=eval("("+postParams.contentinfo+")");
    myLogger.trace("post [/placeOnlineOrder.orderinfo]: "+JSON.stringify(orderinfo));
    myLogger.trace("post [/placeOnlineOrder.contentinfo]: "+JSON.stringify(contentinfo));

    orderService.placeOnlineOrder(orderinfo,contentinfo,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线上订单信息
router.get('/getOnlineOrder', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOnlineOrder]: "+JSON.stringify(getParams));

    orderService.getOnlineOrder(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send({status:true,data:result});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线上订单信息和明细信息
router.get('/getOnlineOrderWithContent', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOnlineOrderWithContent]: "+JSON.stringify(getParams));

    orderService.getOnlineOrder(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            async.forEach(result.rows,function(row,cb){
                orderService.getOnlineContentByOrder(row.ONLINEORDERCODE,function(err,msg){
                    if(!err) row.ONLINECONTENTS=msg;
                    cb(err,msg);
                })
            },function(err){
                if(err) res.send({status:false,data:err});
                else res.send({status:true,data:result});
            })
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线下订单信息
router.get('/getOfflineOrder', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOfflineOrder]: "+JSON.stringify(getParams));

    orderService.getOfflineOrder(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send({status:true,data:result});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线下订单信息和明细信息
router.get('/getOfflineOrderWithContent', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOfflineOrderWithContent]: "+JSON.stringify(getParams));

    orderService.getOfflineOrder(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            async.forEach(result.rows,function(row,cb){
                orderService.getOfflineContentByOrder(row.OFFLINEORDERCODE,function(err,msg){
                    if(!err) row.OFFLINECONTENTS=msg;
                    cb(err,msg);
                })
            },function(err){
                if(err) res.send({status:false,data:err});
                else res.send({status:true,data:result});
            })
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待付款的线上订单信息
router.get('/getOnlineOrderUnpay', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOnlineOrderUnpay]: "+JSON.stringify(getParams));

    orderService.getOnlineOrderUnpay(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send({status:true,data:result});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待付款的线上订单信息和明细信息
router.get('/getOnlineOrderWithContentUnpay', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOnlineOrderWithContentUnpay]: "+JSON.stringify(getParams));

    orderService.getOnlineOrderUnpay(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            async.forEach(result.rows,function(row,cb){
                orderService.getOnlineContentByOrder(row.ONLINEORDERCODE,function(err,msg){
                    if(!err) row.ONLINECONTENTS=msg;
                    cb(err,msg);
                })
            },function(err){
                if(err) res.send({status:false,data:err});
                else res.send({status:true,data:result});
            })
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待付款线下订单信息
router.get('/getOfflineOrderUnpay', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOfflineOrderUnpay]: "+JSON.stringify(getParams));

    orderService.getOfflineOrderUnpay(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send({status:true,data:result});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待付款线下订单信息和明细信息
router.get('/getOfflineOrderWithContentUnpay', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOfflineOrderWithContentUnpay]: "+JSON.stringify(getParams));

    orderService.getOfflineOrderUnpay(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            async.forEach(result.rows,function(row,cb){
                orderService.getOfflineContentByOrder(row.OFFLINEORDERCODE,function(err,msg){
                    if(!err) row.OFFLINECONTENTS=msg;
                    cb(err,msg);
                })
            },function(err){
                if(err) res.send({status:false,data:err});
                else res.send({status:true,data:result});
            })
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待收货的线上订单信息
router.get('/getOnlineOrderUnconfirm', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOnlineOrderUnconfirm]: "+JSON.stringify(getParams));

    orderService.getOnlineOrderUnconfirm(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send({status:true,data:result});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待收货的线上订单信息和明细信息
router.get('/getOnlineOrderWithContentUnconfirm', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOnlineOrderWithContentUnconfirm]: "+JSON.stringify(getParams));

    orderService.getOnlineOrderUnconfirm(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            async.forEach(result.rows,function(row,cb){
                orderService.getOnlineContentByOrder(row.ONLINEORDERCODE,function(err,msg){
                    if(!err) row.ONLINECONTENTS=msg;
                    cb(err,msg);
                })
            },function(err){
                if(err) res.send({status:false,data:err});
                else res.send({status:true,data:result});
            })
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待收货线下订单信息
router.get('/getOfflineOrderUnconfirm', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOfflineOrderUnconfirm]: "+JSON.stringify(getParams));

    orderService.getOfflineOrderUnconfirm(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            res.send({status:true,data:result});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取待收货线下订单信息和明细信息
router.get('/getOfflineOrderWithContentUnconfirm', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var usercode=getParams.usercode;

    myLogger.trace("get [/getOfflineOrderWithContentUnconfirm]: "+JSON.stringify(getParams));

    orderService.getOfflineOrderUnconfirm(usercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
            async.forEach(result.rows,function(row,cb){
                orderService.getOfflineContentByOrder(row.OFFLINEORDERCODE,function(err,msg){
                    if(!err) row.OFFLINECONTENTS=msg;
                    cb(err,msg);
                })
            },function(err){
                if(err) res.send({status:false,data:err});
                else res.send({status:true,data:result});
            })
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线下订单内的商品信息
router.get('/getOfflineContentByOrder', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getOfflineContentByOrder]: "+JSON.stringify(getParams));

    var ordercode=getParams.OFFLINEORDERCODE;

    orderService.getOfflineContentByOrder(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取线上订单的商品信息
router.get('/getOnlineContentByOrder', function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getOnlineContentByOrder]: "+JSON.stringify(getParams));

    var ordercode=getParams.ONLINEORDERCODE;

    orderService.getOnlineContentByOrder(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//线下订单拒绝
router.post('/cancelOfflineOrder',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/cancelOfflineOrder}: "+JSON.stringify(postParams));

    var ordercode=postParams.OFFLINEORDERCODE;

    orderService.cancelOfflineOrder(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//线上订单拒绝
router.post('/cancelOnlineOrder',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/cancelOnlineOrder}: "+JSON.stringify(postParams));

    var ordercode=postParams.ONLINEORDERCODE;

    orderService.cancelOnlineOrder(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//线下订单确认收获
router.post('/confirmOfflineOrder',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/confirmOfflineOrder}: "+JSON.stringify(postParams));

    var ordercode=postParams.OFFLINEORDERCODE;

    orderService.confirmOfflineOrder(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//线上订单确认收获
router.post('/confirmOnlineOrder',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/confirmOnlineOrder}: "+JSON.stringify(postParams));

    var ordercode=postParams.ONLINEORDERCODE;

    orderService.confirmOnlineOrder(ordercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//获取订单物流信息


//获取订单提货码信息


module.exports = router;
