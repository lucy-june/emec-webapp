var express             = require('express');
var searchService        = require('../../service/web/searchService');
var skcService        = require('../../service/web/skcService');
var skuService        = require('../../service/web/skuService');
var onlineService        = require('../../service/web/onlineService');
var categoryService       = require('../../service/web/categoryService');
var regionService       = require('../../service/web/regionService');
var imgserver           = require('../../interaction/imgserver');
var stockService        = require('../../service/web/stockService');
//var itemsService        = require('../../service/web/itemsService');
var auth                = require('../../security/auth');
var ukeyverify                = require('../../security/ukeyVerify');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("web/itemRouter");
var async = require('async');
var importStock =require('../../service/web/importStock');
var multiparty = require('multiparty');
var fs = require('fs');

router.get('/',auth.authority, function(req, res) {
    res.render('items/add');
});

//添加商品iframe内跳转
router.get('/add',auth.authority, function(req, res) {
    res.render('items/add');
});

//完善添加Skc信息iframe内跳转
router.get('/addSkc',auth.authority, function(req, res) {
    res.render('items/addSkc');
});

//更新修改Skc信息iframe内跳转
router.get('/modifySkc',auth.authority, function(req, res) {
    res.render('items/modifySkc');
});

//审核Skc信息iframe内跳转
router.get('/validateSkc',auth.authority, function(req, res) {
    res.render('items/validateSkc');
});

//添加online商品iframe内跳转
router.get('/addOnline',auth.authority, function(req, res) {
    async.parallel([
        function(cb){
            categoryService.queryCategory1(cb);
        },
        function(cb){
            regionService.queryRegion1(cb);
        }
    ],function(err,msg){
        if(!err){
            if(msg){
                res.render('items/addOnline',{
                    "category1":msg[0].category1,
                    "category1id":msg[0].category1id,
                    "region1":msg[1].region1,
                    "region1id":msg[1].region1id
                });
            }
            else{
                res.render('items/addOnline',{"category1":[], "category1id":[],"region1":[], "region1id":[]});
            }
        }
        else{
            res.render('items/addOnline',{"category1":[], "category1id":[],"region1":[], "region1id":[]});
        }
    })
});

//审核商品信息iframe内跳转
router.get('/validate',auth.authority, function(req, res) {
    res.render('items/validate');
});

//审核online商品iframe内跳转
router.get('/validateOnline',auth.authority, function(req, res) {
    async.parallel([
        function(cb){
            categoryService.queryCategory1(cb);
        },
        function(cb){
            regionService.queryRegion1(cb);
        }
    ],function(err,msg){
        if(!err){
            if(msg){
                res.render('items/validateOnline',{
                    "category1":msg[0].category1,
                    "category1id":msg[0].category1id,
                    "region1":msg[1].region1,
                    "region1id":msg[1].region1id
                });
            }
            else{
                res.render('items/validateOnline',{"category1":[], "category1id":[],"region1":[], "region1id":[]});
            }
        }
        else{
            res.render('items/validateOnline',{"category1":[], "category1id":[],"region1":[], "region1id":[]});
        }
    })
});

//查询商品iframe内跳转
router.get('/query',auth.authority, function(req, res) {
    res.render('items/query');
});

//查询本柜商品iframe内跳转
router.get('/queryCounter',auth.authority, function(req, res) {
    res.render('items/queryCounter');
});

//skuskc导入信息iframe内跳转
router.get('/skuskcImport',auth.authority, function(req, res) {
    res.render('items/skuskcImport');
});

//商品上下线iframe内跳转
router.get('/onoffLine',auth.authority, function(req, res) {
    res.render('items/onoffLine');
});

router.get('/searchall',function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/searchall]: "+JSON.stringify(getParams));

    searchService.searchSku(0,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
//            res.send({status:true,data:msg})
            res.send(result);
        }
        else{
            res.send({"userdata":"查询异常"});
        }
    })
})

//搜索柜内所有商品
router.get('/searchCounterAll',function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/searchCounterAll]: "+JSON.stringify(getParams));

    searchService.searchCounterSku(0,countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
        if(!err){
            var total=Math.floor(msg.count/rows)+(msg.count%rows==0?0:1);
            var result={total:total,records:msg.count,page:page};
            result.rows=msg.rows;
//            res.send({status:true,data:msg})
            res.send(result);
        }
        else{
            res.send({"userdata":"查询异常"});
        }
    })
})

//添加商品SKU异步请求
router.get('/addService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    myLogger.trace("get [/addService]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    skuService.addSku(data,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取可以修改的sku信息
router.get('/getRevisableSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getRevisableSku]: "+JSON.stringify(getParams));
    skuService.getRevisableSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要审核的sku信息
router.get('/getCheckableSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getCheckableSku]: "+JSON.stringify(getParams));
    skuService.getCheckableSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//更新sku信息服务
router.get('/updateService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    myLogger.trace("get [/updateService]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var id=data.ID;
    delete data.ID;
    skuService.reviseSku(id,data,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//审核通过sku
router.get('/approveSku',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    myLogger.trace("get [/approveSku]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var id=data.ID;
    skuService.approveSku(id,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//作废待审的sku
router.get('/invalidSku',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    myLogger.trace("get [/invalidSku]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var id=data.ID;
    skuService.invalidSku(id,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取需要完善skc信息的sku
router.get('/getSkcUninitialSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getSkcUninitialSku]: "+JSON.stringify(getParams));
    skcService.getSkcUninitialSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要完善skc信息的sku
router.get('/getSkcRenewableSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getSkcRenewableSku]: "+JSON.stringify(getParams));
    skcService.getSkcRenewableSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要审核的skc信息的sku
router.get('/getSkcCheckableSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getSkcCheckableSku]: "+JSON.stringify(getParams));
    skcService.getSkcCheckableSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要完善online信息的sku
router.get('/getOnlineUninitialSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getOnlineUninitialSku]: "+JSON.stringify(getParams));
    onlineService.getOnlineUninitialSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要完善skc信息的sku
router.get('/getOnlineRenewableSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getOnlineRenewableSku]: "+JSON.stringify(getParams));
    onlineService.getOnlineRenewableSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要完善skc信息的sku
router.get('/getOnlineCheckableSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getOnlineCheckableSku]: "+JSON.stringify(getParams));
    onlineService.getOnlineCheckableSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取需要完善的skc信息
router.get('/getRenewableSkcBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    myLogger.trace("get [/getRenewableSkcBySku]: "+JSON.stringify(getParams));
    skcService.getRenewableSkcBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});


//获取需要审核skc信息
router.get('/getCheckableSkcBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    myLogger.trace("get [/getCheckableSkcBySku]: "+JSON.stringify(getParams));
    skcService.getCheckableSkcBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取需要完善的online信息
router.get('/getRenewableOnlineBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    myLogger.trace("get [/getRenewableOnlineBySku]: "+JSON.stringify(getParams));
    onlineService.getRenewableOnlineBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});


//获取需要审核online信息
router.get('/getCheckableOnlineBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    myLogger.trace("get [/getCheckableOnlineBySku]: "+JSON.stringify(getParams));
    onlineService.getCheckableOnlineBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//完善skc信息
router.post('/initialSkc',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/initialSkc]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    var skcs=data.SKCS;
    skcService.initialSkc(itemcode,skcs,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//更新skc信息
router.post('/updateSkc',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/updateSkc]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    var skcs=data.SKCS;
    skcService.updateSkc(itemcode,skcs,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//批准skc信息
router.post('/approveSkc',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/approveSkc]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    skcService.approveSkc(itemcode,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//作废对skc的修改
router.post('/invalidSkc',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/invalidSkc]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    skcService.invalidSkc(itemcode,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

router.get('/querySonCategoryService', auth.authority, function (req, res) {
    var categoryid=require('url').parse(req.url,true).query.CATEGORYID;
     categoryService.querySonCategory(categoryid,function(err,msg){
         if(!err){
             res.send({status:true,data:msg});
         }
         else{
             res.send({status:false,data:err});
         }
     })
});

router.get('/queryCategoryKeysService', auth.authority, function (req, res) {
    categoryService.queryCategory1(function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/querySonRegionService', auth.authority, function (req, res) {
    var regionid=require('url').parse(req.url,true).query.REGIONID;
    regionService.querySonRegion(regionid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/queryRegionKeysService', auth.authority, function (req, res) {
    regionService.queryRegion1(function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/getCategoryParamTemplate', auth.authority, function (req, res) {
    var categoryid=require('url').parse(req.url,true).query.CATEGORYID;
    categoryService.getCategoryParamTemplate(categoryid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/getImgpreviewsStored', auth.authority, function (req, res) {
    myLogger.trace("get [/getImgpreviewsStored]: "+ JSON.stringify(require('url').parse(req.url,true).query));
    var itemcode=require('url').parse(req.url,true).query.ITEMCODE;
    imgserver.getImgpreviewsStored(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

router.get('/getImgdetailsStored', auth.authority, function (req, res) {
    myLogger.trace("get [/getImgdetailsStored]: "+ JSON.stringify(require('url').parse(req.url,true).query));
    var itemcode=require('url').parse(req.url,true).query.ITEMCODE;
    imgserver.getImgdetailsStored(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//完善online信息
router.post('/initialOnline',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/initialOnline]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    var onlines=eval("("+data.ONLINES+")");
    onlineService.initialOnline(itemcode,onlines,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//更新online信息
router.post('/updateOnline',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/updateOnline]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    var onlines=eval("("+data.ONLINES+")");
    onlineService.updateOnline(itemcode,onlines,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//批准online信息
router.post('/approveOnline',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/approveOnline]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    onlineService.approveOnline(itemcode,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})

//作废对online的修改
router.post('/invalidOnline',auth.authority, function(req, res) {
    var data = req.body;
    myLogger.trace("get [/invalidOnline]: "+JSON.stringify(data));
    var usercode=req.session.usercode;
    var itemcode=data.ITEMCODE;
    onlineService.invalidOnline(itemcode,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
})


//线下开单
router.get('/orderOffline',auth.authority, function(req, res) {
    res.render('items/orderOffline');
});

//修改商品iframe内跳转
router.get('/modify',auth.authority, function(req, res) {
    res.render('items/modify');
});

//修改商品iframe内跳转
router.get('/modifyOnline',auth.authority, function(req, res) {
    async.parallel([
        function(cb){
            categoryService.queryCategory1(cb);
        },
        function(cb){
            regionService.queryRegion1(cb);
        }
    ],function(err,msg){
        if(!err){
            if(msg){
                res.render('items/modifyOnline',{
                    "category1":msg[0].category1,
                    "category1id":msg[0].category1id,
                    "region1":msg[1].region1,
                    "region1id":msg[1].region1id
                });
            }
            else{
                res.render('items/modifyOnline',{"category1":[], "category1id":[],"region1":[], "region1id":[]});
            }
        }
        else{
            res.render('items/modifyOnline',{"category1":[], "category1id":[],"region1":[], "region1id":[]});
        }
    })
});

//获取已批准的skc信息
router.get('/getApprovedSkcBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    myLogger.trace("get [/getApprovedSkcBySku]: "+JSON.stringify(getParams));
    skcService.getApprovedSkcBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//获取已批准的online信息
router.get('/getApprovedOnlineBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    myLogger.trace("get [/getApprovedOnlineBySku]: "+JSON.stringify(getParams));
    onlineService.getApprovedOnlineBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

//进货iframe内跳转
router.get('/increaseStock',auth.authority, function(req, res) {
    res.render('items/increaseStock',{"assistantList":req.session.assistantList || [],"rand":req.session.RandomCode});
});

//退货iframe内跳转
router.get('/decreaseStock',auth.authority, function(req, res) {
    res.render('items/decreaseStock',{"assistantList":req.session.assistantList || [],"rand":req.session.RandomCode});
});

//获取到柜的可以进退货的商品
router.get('/getCounterHasstockSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;
    var countercode=req.session.countercode;

    myLogger.trace("get [/getCounterHasstockSku]: "+JSON.stringify(getParams));
    stockService.getCounterHasstockSku(countercode,qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取某柜某商品的skc库存信息
router.get('/getCounterSkcStock',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;
    var countercode=req.session.countercode;
    stockService.getCounterSkcStock(countercode,itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//获取更新某商品的skc信息
router.get('/refreshSkc',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;

    skcService.refreshSkc(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//进货
router.post('/increaseStockService',auth.authority,ukeyverify.checkukey, function(req, res) {
    var postParams=req.body.data;
    myLogger.trace("post [/increaseStockService]: "+JSON.stringify(postParams));

    var skccode=postParams.SKCCODE;
    var num=postParams.NUM;
    var reg=new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    if(!reg.test(num)){
        res.send({status:false,data:"num error"});
        return;
    }
    if(typeof(num)!="number") num=Number(num);//必须保证是整数不能是字符串
    if(!num || num<0) {
        res.send({status:false,data:"num error"});
        return;
    }
    var assistantid=postParams.SALESMANCODE;
    var countercode=req.session.countercode;

    stockService.increaseStock(countercode,skccode,num,assistantid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//退货
router.post('/decreaseStockService',auth.authority,ukeyverify.checkukey, function(req, res) {
    var postParams=req.body.data;
    myLogger.trace("post [/decreaseStockService]: "+JSON.stringify(postParams));

    var skccode=postParams.SKCCODE;
    var num=postParams.NUM;
    var reg=new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    if(!reg.test(num)){
        res.send({status:false,data:"num error"});
        return;
    }
    if(typeof(num)!="number") num=Number(num);//必须保证是整数不能是字符串
    if(!num || num<0) {
        res.send({status:false,data:"num error"});
        return;
    }
    var assistantid=postParams.SALESMANCODE;
    var countercode=req.session.countercode;

    stockService.decreaseStock(countercode,skccode,num,assistantid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//设置负库存
router.post('/setNegativeStockService',auth.authority,ukeyverify.checkukey, function(req, res) {
    var postParams=req.body.data;
    myLogger.trace("post [/setNegativeStockService]: "+JSON.stringify(postParams));

    var countercode=req.session.countercode;
    var options=postParams;

    stockService.setNegativeStock(countercode,options,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//获取上线信息准备好,且柜台已经进货了,可以上下线的sku
router.get('/getOnlinePreparedSku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var qry=getParams.qry;
    var rows=getParams.rows;
    var page=getParams.page;
    var sidx=getParams.sidx;
    var sord=getParams.sord;

    myLogger.trace("get [/getOnlinePreparedSku]: "+JSON.stringify(getParams));
    onlineService.getOnlinePreparedSku(qry,{page:page,rows:rows,sidx:sidx,sord:sord},function(err,msg){
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

//获取某sku可以上线/下线的门店
router.get('/getPreparedCounterBySku',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var itemcode=getParams.ITEMCODE;
    onlineService.getPreparedCounterBySku(itemcode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//上线某商品到某个柜
router.post('/performOnline',auth.authority, function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/performOnline]: "+JSON.stringify(postParams));

    var itemcode=postParams.ITEMCODE;
    var countercode=postParams.COUNTERCODE;

    onlineService.performOnline(itemcode,countercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

//下线某商品从某个柜
router.post('/performOffline',auth.authority, function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/performOffline]: "+JSON.stringify(postParams));

    var itemcode=postParams.ITEMCODE;
    var countercode=postParams.COUNTERCODE;

    onlineService.performOffline(itemcode,countercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});











//查询商品异步请求
router.get('/queryService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
//    itemsService.queryService(data,res);
});

//查询本柜商品异步请求
router.get('/queryCounterService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    data.countercode=req.session.countercode;
//    itemsService.queryCounterService(data,res);
});

//线下开单异步请求
router.get('/queryForOrderService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
//    itemsService.queryForOrderService(data,res);
});


//向mis系统推送商品异步请求
router.post('/pushService',auth.authority, function(req, res) {
//    itemsService.pushService(req,res);
});

//补充录入上线信息服务
router.get('/addOnlineService',auth.authority, function(req, res) {
//    itemsService.addOnlineService(req,res);
});

//添加skc信息服务
router.get('/addSKCService',auth.authority, function(req, res) {
//    itemsService.addSKCService(req,res);
});
//查询skc信息服务（对线上订单）
router.get('/querySKCService',auth.authority, function(req, res) {
    var options = require('url').parse(req.url,true).query;
//    itemsService.querySKCService(options,res);
});
//查询skc信息服务（对线下订单）
router.get('/queryCounterSKCService',auth.authority, function(req, res) {
    var options = require('url').parse(req.url,true).query;
//    itemsService.queryCounterSKCService(options,res);
});

//添加图片信息服务
router.get('/addPicService',auth.authority, function(req, res) {
    var options = require('url').parse(req.url,true).query;
//    itemsService.addPicService(options,res);
});

//获取特定商品的全部上线信息
router.get('/getCertainOnlineAll',auth.authority, function(req, res) {
    var itemcode= require('url').parse(req.url,true).query.itemcode;
//    itemsService.getCertainOnlineAll(itemcode,function(msg){
//        res.send({status:true,data:msg});
//    },function(err){
//        res.send({status:false,data:err});
//    })
});

//通过商品编号查询商品类别得到商品对应的属性
router.get('/queryCodeService', auth.authority, function (req, res) {
//    itemsService.queryCodeService(req, res);
});

//将商品属性信息保存到数据库
router.get('/addKeyValueService', auth.authority, function (req, res) {
//    itemsService.addKeyValueService(req, res);
});

router.get('/importStock',auth.authority, function(req, res) {
    res.render('items/stockImport',{"assistantList":req.session.assistantList,"rand":req.session.RandomCode});
});

//负库存设置iframe内跳转
router.get('/negativeStock',auth.authority, function(req, res) {
    res.render('items/negativeStock',{"assistantList":req.session.assistantList || [],"rand":req.session.RandomCode});
});

router.post('/importStocks', auth.authority, function (req, res) {
    //生成multiparty对象，并配置下载目标路径
    console.log("I am IN");
    var form = new multiparty.Form({uploadDir: '../excelfiles/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if(err){
            console.log('parse error: ' + err);
            res.send({status:false,msg:"处理上传文件出错！"});
        } else {
            //检测是否存在了
            var countercode=req.session.countercode;
            var assistantid=fields.selAssistant[0];
            var inputFile = files.EXCELFILE[0];
            var uploadedPath = inputFile.path;
            var ofilename=inputFile.originalFilename;
            var brandcode=ofilename.substring(0,6);
            var re = /\d*/i;
            var r = brandcode.match(re);
            if(brandcode.length!=6||r!=brandcode){
                res.send({status:false,msg:"文件名应该以六位品牌编号开始！"});
                return;
            }
            var mydate = new Date();
            var filepath=ofilename;
            var dstPath = '../excelfiles/' + filepath;
            //判断目标文件是否存在了
            var exists=fs.existsSync(dstPath);
            if(exists){
                console.log("删除已存在文件");
                fs.unlinkSync(dstPath);
            }
            //重命名为真实文件名
            fs.rename(uploadedPath, dstPath, function(err) {
                if(err){
                    console.log('rename error: ' + err);
                    res.send({status:false,msg:"上传文件重命名出错！"});
                } else {
                    console.log('rename ok');
                    //开始处理文件
                    importStock.importStock(filepath,brandcode,countercode,assistantid,function(err,msg){
                        if(err){
                            res.send({status:false,msg:err});
                        }else{
                            res.send({status:true,msg:msg});
                        }
                    });
                    /*
                    importService.fileParser(filepath,brandcode,batchnumber,usercode,function(err,data){
                        if(!err){
                            res.send({status:true,msg:{BATCHNUMBER:batchnumber,SKU:data.SKU,SKC:data.SKC}});
                        }else{
                            res.send({status:false,msg:err});
                        }
                    })
                    */
                }
            });
        }
        // res.send({status:true,msg:"OK"});
    });
});


module.exports = router;
