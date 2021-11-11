/**
 * Created by lucywu on 14-11-29.
 */
var express = require('express');
var auth = require('../../security/auth');
var skuService = require('../../service/web/skuService');
var posService = require('../../service/web/posService');
var orderService = require('../../service/web/orderService');
var router = express.Router();
var protoBufUtil = require("../../util/protoBufUtil");
var myLogger = require('../../logging/contextLogger')("web/formisRouter");
var async = require('async');
var mis = require("../../interaction/mis");
var dateUtil = require("../../util/dateUtil");

//mis向mec创建商品
router.post('/createSku', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/createSku]: " + JSON.stringify(postParams));

    var skuinfo=eval("("+postParams.skuinfo+")");
    console.log(skuinfo);

    skuService.createSku(skuinfo, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//mis向mec更新商品
router.post('/updateSku', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/updateSku]: " + JSON.stringify(postParams));

    var skuinfo=eval("("+postParams.skuinfo+")");

    skuService.updateSku(skuinfo, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//到柜
router.post('/toCounter', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/toCounter]: " + JSON.stringify(postParams));

    var args = eval("(" + postParams.storeitems + ")");
    console.log(args.length);

    skuService.toCounter(args, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//商品调价
router.post('/adjustPrice', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustPrice]: " + JSON.stringify(postParams));

    var itemcode = postParams.itemcode;
    var price = postParams.price;
    var tempprice = postParams.tempprice;

    skuService.adjustPrice(itemcode, price, tempprice, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//柜台商品调价
router.post('/adjustCounterPrice', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustCounterPrice]: " + JSON.stringify(postParams));

    var itemcode = postParams.itemcode;
    var countercode = postParams.countercode;
    var storecheckedprice = postParams.storecheckedprice;
    var storetempprice = postParams.storetempprice;

    skuService.adjustCounterPrice(itemcode, countercode, storecheckedprice, storetempprice, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//商品批量调价
router.post('/adjustPriceBatch', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustPriceBatch]: " + JSON.stringify(postParams));

    var args = eval("(" + postParams.jsonStr + ")");
    console.log(args.length);

    var failList = [];
    var totalNum=args.length;
    var currNum=0;

    for(var k=0;k<args.length;k++){
        var arg=args[k];

        var run=function(arg){
            var itemcode = arg.itemcode;
            var price = arg.price;
            var tempprice = arg.tempprice;

            skuService.adjustPrice(itemcode, price, tempprice, function (err, msg) {
                if (err) failList.push(arg);
                currNum++;

                if(currNum==totalNum){
                    if(failList.length==0){
                        res.send({status: true, data: "adjust price success"});
                    }
                    else{
                        res.send({status: false, data: JSON.stringify(failList)});
                    }
                }
            });
        }
        run(arg);
    }
});

//柜台商品批量调价
router.post('/adjustCounterPriceBatch', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustCounterPriceBatch]: " + JSON.stringify(postParams));

    var args = eval("(" + postParams.jsonStr + ")");
    console.log(args.length);

    var failList = [];
    var totalNum=args.length;
    var currNum=0;

    for(var k=0;k<args.length;k++){
        var arg=args[k];

        var run=function(arg){
            var itemcode = arg.itemcode;
            var countercode = arg.countercode;
            var storecheckedprice = arg.storecheckedprice;
            var storetempprice = arg.storetempprice;

            skuService.adjustCounterPrice(itemcode, countercode, storecheckedprice, storetempprice, function (err, msg) {
                if (err) failList.push(arg);
                currNum++;
                if(currNum==totalNum){
                    if(failList.length==0){
                        res.send({status: true, data: "adjust counter price success"});
                    }
                    else{
                        res.send({status: false, data: JSON.stringify(failList)});
                    }
                }
            });
        }
        run(arg);
    }
});

//柜台商品调整促销标志
router.post('/adjustPromotionMark', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustPromotionMark]: " + JSON.stringify(postParams));

    var itemcode = postParams.itemcode;
    var countercode = postParams.countercode;
    var promotionmark = postParams.promotionmark;

    skuService.adjustPromotionMark(itemcode, countercode, promotionmark, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//柜台商品批量调整促销标志
router.post('/adjustPromotionMarkBatch', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustPromotionMarkBatch]: " + JSON.stringify(postParams));

    var args = eval("(" + postParams.jsonStr + ")");
    console.log(args.length);

    var failList = [];
    var totalNum=args.length;
    var currNum=0;

    for(var k=0;k<args.length;k++){
        var arg=args[k];
        var run=function(arg){
            var itemcode = arg.itemcode;
            var countercode = arg.countercode;
            var promotionmark = arg.promotionmark;

            skuService.adjustPromotionMark(itemcode, countercode, promotionmark, function (err, msg) {
                if (err) failList.push(arg);
                currNum++;

                if(currNum==totalNum){
                    if(failList.length==0){
                        res.send({status: true, data: "adjust promotion mark success"});
                    }
                    else{
                        res.send({status: false, data: JSON.stringify(failList)});
                    }
                }
            });
        }
        run(arg);
    }
});

//柜台商品调整促销标志
router.post('/adjustStoreSaleState', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustStoreSaleState]: " + JSON.stringify(postParams));

    var itemcode = postParams.itemcode;
    var countercode = postParams.countercode;
    var storesalestate = postParams.storesalestate;

    skuService.adjustStoreSaleState(itemcode, countercode, storesalestate, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    });
});

//柜台商品批量调整促销标志
router.post('/adjustStoreSaleStateBatch', function (req, res) {
    var postParams = req.body;
    myLogger.trace("post [/adjustStoreSaleStateBatch]: " + JSON.stringify(postParams));

    var args = eval("(" + postParams.jsonStr + ")");
    console.log(args.length);

    var failList = [];
    var totalNum=args.length;
    var currNum=0;

    for(var k=0;k<args.length;k++){
        var arg=args[k];
        var run=function(arg){
            var itemcode = arg.itemcode;
            var countercode = arg.countercode;
            var storesalestate = arg.storesalestate;

            skuService.adjustStoreSaleState(itemcode, countercode, storesalestate, function (err, msg) {
                if (err) failList.push(arg);
                currNum++;

                if(currNum==totalNum){
                    if(failList.length==0){
                        res.send({status: true, data: "adjust storesalestate success"});
                    }
                    else{
                        res.send({status: false, data: JSON.stringify(failList)});
                    }
                }
            });
        }
        run(arg);
    }
});




//获取订单详情
router.get('/getOrderInfo', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getOrderInfo]: " + JSON.stringify(getParams));

    var ordercode = getParams.ordercode;

    posService.getOrderInfo(ordercode,function(err,msg){
        if(!err){
            myLogger.trace("/getOrderInfo [posService.getOrderInfo.msg]: "+JSON.stringify(msg));
            var buf = protoBufUtil.generate(null, null, "sale", "order", "sale.order.proto", msg);
            console.log(buf);

            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
            res.write(buf, "binary");
            res.end();
        }
        else{
            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
            res.write('', "binary");
            res.end();
        }
    })
});

////模拟获取订单详情
//router.get('/getOrderInfo2', function (req, res) {
//    var getParams = require('url').parse(req.url, true).query;
//    myLogger.trace("get [/getOrderInfo]: " + JSON.stringify(getParams));
//
//    var ordercode = getParams.ordercode;
//
//    if (ordercode && ordercode.charAt(0) == '0') {
//        orderService.getOfflineContentByOrder(null, ordercode, function (err, msg) {
//            if (!err && msg && msg.length > 0) {
//                var protoContent = {};
//
//                var order1="014112997105000991";
//                var order2="015030299587000030";
//                var order3="015030297742000053";
//                var order4="014112952203000419";
//                var order5="014112955899000283";
//                var order6="015031267593000010";
//                var order7="015031269775000013";
//                var order8="015031247792000018";
//
//                protoContent.salemancode=123456;//营业员编码
//                protoContent.salemanname="haha";//营业员名字
//                if(ordercode==order1||ordercode==order6||ordercode==order7||ordercode==order8) protoContent.vipcode = "";
//                else if(ordercode==order2) protoContent.vipcode = "666666";
//                else if(ordercode==order3) protoContent.vipcode = "666666";
//                else if(ordercode==order4) protoContent.vipcode = "666666";
//                else if(ordercode==order5) protoContent.vipcode = "666111";
//                else protoContent.vipcode = "666000";
//
//
//                if(ordercode==order1) protoContent.ifreturn = 0;//是否是普通订单
//                else if(ordercode==order2) protoContent.ifreturn = 0;
//                else if(ordercode==order3) protoContent.ifreturn = 0;
//                else if(ordercode==order4) protoContent.ifreturn = 1;
//                else if(ordercode==order5) protoContent.ifreturn = 1;
//                else if(ordercode==order6) protoContent.ifreturn = 1;
//                else if(ordercode==order7) protoContent.ifreturn = 1;
//                else if(ordercode==order8) protoContent.ifreturn = 0;
//                else if(ordercode=="014100612845000240") protoContent.ifreturn = 1;
//                else if(ordercode=="014100617777000256") protoContent.ifreturn = 1;
//                else protoContent.ifreturn = 0;
//
//                protoContent.items=[];
//                for(var k=0;k<msg.length;k++){
//                    var item={};
//                    item.itemcode=parseInt(msg[k].ITEMCODE);
//                    item.cabinet="000222";
//                    item.unit=msg[k].UNIT;
//                    item.promotioncode=msg[k].PROMOTIONMARK;
//                    item.itemname=msg[k].ITEMNAME;
//                    item.count=msg[k].NUM;
//                    item.oriprice=msg[k].PRICE;
//                    if(ordercode==order1||ordercode==order6||ordercode==order7||ordercode==order8) item.discountprice=msg[k].PRICE;
//                    else if(ordercode==order2) item.discountprice=msg[k].PRICE*0.85;
//                    else if(ordercode==order3) item.discountprice=msg[k].PRICE*0.85;
//                    else if(ordercode==order4) item.discountprice=msg[k].PRICE*0.85;
//                    else if(ordercode==order5) item.discountprice=msg[k].PRICE*0.90;
//                    else item.discountprice=msg[k].PRICE*0.88;
//
//                    if(ordercode==order1||ordercode==order6||ordercode==order7||ordercode==order8) item.discount="100";
//                    else if(ordercode==order2) item.discount="85";
//                    else if(ordercode==order3) item.discount="85";
//                    else if(ordercode==order4) item.discount="85";
//                    else if(ordercode==order5) item.discount="90";
//                    else item.discount="88";
//
//                    item.actualprice=msg[k].NUM * item.discountprice;
//                    protoContent.items.push(item);
//                }
//
//                console.log(protoContent);
//                var buf = protoBufUtil.generate(null, null, "sale", "order", "sale.order.proto", protoContent);
//                console.log(buf);
//
//                res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//                res.write(buf, "binary");
//                res.end();
//            }
//            else {
//                res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//                res.write('', "binary");
//                res.end();
//            }
//        });
//    }
//    else if (ordercode && ordercode.charAt(0) == '1') {
//        orderService.getOnlineContentByOrder(null, ordercode, function (err, msg) {
//            if (!err && msg && msg.length > 0) {
//                var protoContent = {};
//
//                protoContent.salemancode = 123456;//
//                protoContent.salemanname = "haha";//
//                protoContent.vipcode = "666666";
//                protoContent.ifreturn = 1;
//
//                protoContent.items = [];
//                for (var k = 0; k < msg.length; k++) {
//                    var item = {};
//                    item.itemcode = msg[k].ITEMCODE;
//                    item.cabinet = msg[k].COUNTERCODE;
//                    item.unit = msg[k].UNIT;
//                    item.promotioncode = "X";
//                    item.itemname = msg[k].ITEMNAME;
//                    item.count = msg[k].NUM;
//                    item.oriprice = msg[k].PRICE;
//                    item.discountprice = 12.45;
//                    item.discount = "90";
//                    item.actualprice = msg[k].NUM * 12.45;
//                    protoContent.items.push(item);
//                }
//
//                console.log(protoContent);
//                var buf = protoBufUtil.generate(null, null, "sale", "order", "sale.order.proto", protoContent);
//                res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//                //res.write(buffer.toBuffer());
//                res.write(buf, "binary");
//                res.end();
//            }
//            else {
//                res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//                res.write('', "binary");
//                res.end();
//            }
//        });
//    }
//    else {
////        res.send({status:false,data:"illegal ordercode"});
//        res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//        res.write('', "binary");
//        res.end();
//    }
//});

//支付准备
router.get('/payPrepare', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/payPrepare]: " + JSON.stringify(getParams));

    var ordercodes = getParams.ordercode;
    var vipcode = getParams.vipcode;

    var ordercodeArr = [];
    if (!Array.isArray(ordercodes)) {
        ordercodeArr.push(ordercodes);
    } else
        ordercodeArr = ordercodes;

    posService.payPrepare(vipcode, ordercodeArr, function (err, msg) {
        if (err) {
            myLogger.error("payPrepare error:" + JSON.stringify(err));
            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
            res.write('', "binary");
            res.end();
        }
        else {
            myLogger.info("payPrepare success:" + JSON.stringify(msg));
            var buf = protoBufUtil.generate(null, null, "sale", "payprepare", "sale.payprepare.proto", msg);
            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
            res.write(buf, "binary");
            res.end();
        }
        myLogger.info("finish get [/payPrepare]: " + JSON.stringify(getParams));
    });
});

////模拟支付准备
//router.get('/payPrepare2', function (req, res) {
//    var getParams = require('url').parse(req.url, true).query;
//    myLogger.trace("get [/payPrepare]: " + JSON.stringify(getParams));
//
//    var ordercodes = getParams.ordercode;
//    var vipcode = getParams.vipcode;
//    var isonlineorder = ordercodes[0].charAt(0) == '1';
//
//    var ordercodeArr = [];
//    if (!Array.isArray(ordercodes)) {
//        ordercodeArr.push(ordercodes);
//    } else
//        ordercodeArr = ordercodes;
//    console.log("@@@@@@@@@@");
//    console.log(ordercodeArr);
//
//    posService.payPrepare2(isonlineorder, ordercodeArr, function (err, msg) {
//        if (err) {
////            res.send({status:false,data:err});
//            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//            res.write('', "binary");
//            res.end();
//        }
//        else {
////            res.send({status:true,data:msg});
//            var protoContent = {};
//
//            protoContent.totalpay = msg[2];
//            if(vipcode==""||!vipcode){
//                protoContent.actualtotalpay = msg[2];
//            }
//            else if(vipcode=="666666"){
//                protoContent.actualtotalpay = msg[2]*0.85;
//            }
//            else if(vipcode=="666111"){
//                protoContent.actualtotalpay = msg[2]*0.9;
//            }
//            else{
//                protoContent.actualtotalpay = msg[2]*0.88;
//            }
//            protoContent.orderorgroupcode = msg[1];
//            protoContent.paylists = [];
//
//            var order1="014112997105000991";
//            var order2="015030299587000030";
//            var order3="015030297742000053";
//            var order4="014112952203000419";
//            var order5="014112955899000283";
//
//            async.forEachSeries(ordercodeArr,function(ordercode,cb){
//                orderService.getOfflineContentByOrder(null, ordercode, function (err, msg) {
//                    console.log("#####"+ordercode);
//                    console.log(msg);
//                    if (!err && msg && msg.length > 0) {
//                        for(var k=0;k<msg.length;k++){
//                            var i=-1;
////                            for(var n=0;n<protoContent.paylists.length;n++){
////                                if(protoContent.paylists[n].itemcode==msg[k].ITEMCODE){
////                                    i=n;
////                                    break;
////                                }
////                            }
//                            if(i==-1){
//                                var paylist = {}
//                                paylist.itemcode = msg[k].ITEMCODE
//                                paylist.amount=msg[k].NUM;
//                                paylist.handdiscount = 0;
//                                paylist.promotiondiscount = 0;
//                                if(vipcode==""||!vipcode||ordercode==order4||ordercode==order5){
//                                    paylist.vipdiscount = 0;
//                                    paylist.vipcardtype = "";
//                                    paylist.vipdiscountstr = "100";
//                                }
//                                else if(vipcode=="666666"){
//                                    paylist.vipdiscount = msg[k].NUM * msg[k].PRICE*0.15;
//                                    paylist.vipcardtype = "01";
//                                    paylist.vipdiscountstr = "85";
//                                }
//                                else if(vipcode=="666111"){
//                                    paylist.vipdiscount = msg[k].NUM * msg[k].PRICE*0.10;
//                                    paylist.vipcardtype = "02";
//                                    paylist.vipdiscountstr = "90";
//                                }
//                                else{
//                                    paylist.vipdiscount = msg[k].NUM * msg[k].PRICE*0.12;
//                                    paylist.vipcardtype = "03";
//                                    paylist.vipdiscountstr = "88";
//                                }
//
//                                protoContent.paylists.push(paylist);
//                            }
//                            else{
//                                var paylist=protoContent.paylists[i];
//                                paylist.amount+=msg[k].NUM;
//                                if(vipcode==""||!vipcode||ordercode==order4||ordercode==order5){
//                                    paylist.vipdiscount = 0;
//                                }
//                                else if(vipcode=="666666"){
//                                    paylist.vipdiscount = paylist.amount * msg[k].PRICE*0.15;
//                                }
//                                else if(vipcode=="666111"){
//                                    paylist.vipdiscount = paylist.amount * msg[k].PRICE*0.10;
//                                }
//                                else{
//                                    paylist.vipdiscount = paylist.amount * msg[k].PRICE*0.12;
//                                }
//                            }
//                        }
//                        cb(null,null);
//                    }
//                    else cb("for each error",null);
//                });
//            },function(err){
//                console.log(err);
//                console.log(protoContent);
//                var buf = protoBufUtil.generate(null, null, "sale", "payprepare", "sale.payprepare.proto", protoContent);
//                console.log(buf);
//
//                res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//                //res.write(buffer.toBuffer());
//                res.write(buf, "binary");
//                res.end();
//            })
//        }
//    });
//});

////支付准备
//router.get('/payPrepare3', function (req, res) {
//    var getParams = require('url').parse(req.url, true).query;
//    myLogger.trace("get [/payPrepare]: " + JSON.stringify(getParams));
//
//    var ordercodes = getParams.ordercode;
//    var vipcode = getParams.vipcode;
//
//    var ordercodeArr = [];
//    if (!Array.isArray(ordercodes)) {
//        ordercodeArr.push(ordercodes);
//    } else
//        ordercodeArr = ordercodes;
//
//    posService.payPrepare(vipcode, ordercodeArr, function (err, msg) {
//        if (err) {
//            myLogger.error("payPrepare error:" + JSON.stringify(err));
//            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//            res.write('', "binary");
//            res.end();
//        }
//        else {
//            myLogger.info("payPrepare success:" + JSON.stringify(msg));
//            var buf = protoBufUtil.generate2(null, null, "sale", "payprepare", "sale.payprepare.proto", msg);
//            res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//            res.write(buf, "binary");
//            res.end();
//        }
//        myLogger.info("finish get [/payPrepare]: " + JSON.stringify(getParams));
//    });
//});

//支付完成
router.post('/payComplete', function (req, res) {
    var ret=function(x){
        var protoContent = {};
        protoContent.response=x;
        console.log(protoContent);
        var buf = protoBufUtil.generate(null, null, "sale", "over", "sale.over.proto", protoContent);
        res.writeHead(200, {'Content-Type': 'application/octet-stream'});
        res.write(buf, "binary");
        res.end();

//        res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//        res.write(protoBufUtil.convert("888"), "binary");
//        res.end();

//        res.send(null);
    }

//      var getParams = require('url').parse(req.url, true).query;
    var postParams=req.body;
    myLogger.trace("post [/payComplete]: " + JSON.stringify(postParams));

    var orderOrGroupCode = postParams.orderOrGroupCode;
    var payData;
    try {
        if (!postParams.payData) payData = null;
        else payData = JSON.parse(postParams.payData);
        payData.overtime=dateUtil.parseDate(payData.overtime);
        myLogger.trace("post [/payComplete payData]: "+JSON.stringify(payData));
    } catch (e) {
        myLogger.error("post [/payComplete payData.parseError]: " + JSON.stringify(e));
        ret('0');
        return;
    }

    posService.payComplete(orderOrGroupCode, payData, function (err, msg) {
        if (err) ret('0');
        else ret('1');
    });
});

////模拟支付完成
//router.post('/payComplete2', function (req, res) {
////    var getParams = require('url').parse(req.url, true).query;
//    var postParams=req.body;
//    myLogger.trace("post [/payComplete]: " + JSON.stringify(postParams));
//
//    var orderOrGroupCode = postParams.orderOrGroupCode;
//    console.log("@@@@@");console.log(orderOrGroupCode);
//    var payData;
//    try {
//        if (!postParams.payData) payData = null;
//        else payData = JSON.parse(postParams.payData);
//        console.log("$$$$$");console.log(payData);
//    } catch (e) {
//        myLogger.error("post [/payComplete.parseError]: " + JSON.stringify(e));
//
//        var protoContent = {};
//        protoContent.response="888";
//        console.log(protoContent);
//        var buf = protoBufUtil.generate(null, null, "sale", "over", "sale.over.proto", protoContent);
//        console.log(buf);
//        res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//        res.write(buf, "binary");
//        res.end();
//
////        res.send(null);
//
////        res.writeHead(200, {'Content-Type': 'application/octet-stream'});
////        res.write(protoBufUtil.convert("888"), "binary");
////        res.end();
//        return;
//    }
//
////    posService.payComplete(orderOrGroupCode, payData, function (err, msg) {
////        if (err) res.send({status: false, data: err});
////        else res.send({status: true, data: msg});
////    });
//
//    var protoContent = {};
//    protoContent.response="999";
//    console.log(protoContent);
//    var buf = protoBufUtil.generate(null, null, "sale", "over", "sale.over.proto", protoContent);
//    console.log(buf);
//    res.writeHead(200, {'Content-Type': 'application/octet-stream'});
//    res.write(buf, "binary");
//    res.end();
//
////    res.send(null);
//
////    res.writeHead(200, {'Content-Type': 'application/octet-stream'});
////    res.write(protoBufUtil.convert("999"), "binary");
////    res.end();
//});




//遗失订单向mec对账(mis调用）
router.post('/reconciliation', function (req, res) {
    var postParams=req.body;
    myLogger.trace("post [/reconciliation]: " + JSON.stringify(postParams));

    var orderOrGroupCode = postParams.orderOrGroupCode;
    var payData=postParams.payData;
    payData=eval("("+payData+")");
    payData.overtime=dateUtil.parseDate(payData.overtime);
//    try {
//        if (!postParams.payData) payData = null;
//        else payData = JSON.parse(postParams.payData);
//        myLogger.trace("post [/reconciliation payData]: "+JSON.stringify(payData));
//    } catch (e) {
//        myLogger.error("post [/reconciliation payData.parseError]: " + JSON.stringify(e));
//        res.send({status: false, data: "payData parseError"});
//        return;
//    }

    posService.payComplete(orderOrGroupCode, payData, function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: "reconsiliation succeed"});
    });
});

//手工单更新mec库存(mis调用)
router.post('/handOrderUpdateStock',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/handOrderUpdateStock]: " + JSON.stringify(postParams));

    var entries=postParams.entries;
    entries=eval("("+entries+")");
//    try {
//        if (!entries) entries = null;
//        else entries = JSON.parse(entries);
//        myLogger.trace("post [/handOrderUpdateStock entries]: "+JSON.stringify(entries));
//    } catch (e) {
//        myLogger.error("post [/handOrderUpdateStock entries.parseError]: " + JSON.stringify(e));
//        res.send({status: false, data: "entries parseError"});
//        return;
//    }

    posService.handOrderUpdateStock(entries,function (err, msg) {
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: "handOrderUpdateStock succeed"});
    });
})

//获取柜商品全部vip折扣信息
router.get('/getItemVIPDiscount', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getItemVIPDiscount]: " + JSON.stringify(getParams));

    var itemcode=getParams.itemcode;
    var countercode=req.session.countercode;

    mis.getItemVIPDiscount(itemcode,countercode,function(err,msg){
        if (err) res.send({status: false, data: err});
        else res.send({status: true, data: msg});
    })
});

module.exports = router;
