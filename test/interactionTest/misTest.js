/**
 * Created by lucywu on 12/19/14.
 */
var myLogger = require('../../logging/contextLogger')("web/posService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var mec_buy_offlinegroupDAO = require('../../dao/mec_buy_offlinegroupDAO');
var mec_buy_offlineorderDAO = require('../../dao/mec_buy_offlineorderDAO');

var mis = require("../../interaction/mis");

var cb = function (err, msg) {
    console.log(err);
    console.log(msg);
}

//http://126.200.200.101:8080/XJHjoyWS/WebService?wsdl

//var args = {"itemcode":"0000007",
//    "barcode":"2000000000017",
//    "itemname":"羊皮男皮鞋",
//    "itemshortname":"男鞋",
//    "brandcode":"000048",
//    "retailtypecode":"341",
//    "itemtypecode":"34101",
//    "merchantcode":"000160",
//    "businessmode":"A",
//    "producingarea":"广东东莞",
//    "price":79,
//    "tempprice":79,
//    "taxrate":"01",
//    "exciserate":"07",
//    "returngoods":1,
//    "salestate":0,
//    "netweight":0,
//    "grossweight":0,
//    "specification":"均码",
//    "productcode":"18088",
//    "grade":"正",
//    "color":"",
//    "casing":1,
//    "dimension":"",
//    "volume":"",
//    "itemcodetype":0,
//    "unit":"双",
//    "lastpurchaseprice":0,
//    "purchasetaxrate":"01",
//    "safestock":0,
//    "maxstock":0,
//    "minstock":0,
//    "maxorder":0,
//    "minorder":0,
//    "property":0,
//    "checkstate":0,
//    "errorinfo":"",
//    "inputperson":"000066",
//    "agentcode":"",
//    "term":""};
//mis.createSKU(args,cb);


//var args = {"itemcode":"0000001",
//    "barcode":"2000000000017",
//    "itemname":"羊皮男皮鞋0",
//    "itemshortname":"男鞋",
//    "brandcode":"000048",
//    "retailtypecode":"341",
//    "itemtypecode":"34101",
//    "merchantcode":"000160",
//    "businessmode":"A",
//    "producingarea":"广东东莞",
//    "price":79,
//    "tempprice":79,
//    "taxrate":"01",
//    "exciserate":"07",
//    "returngoods":1,
//    "salestate":0,
//    "netweight":0,
//    "grossweight":0,
//    "specification":"均码",
//    "productcode":"18088",
//    "grade":"正",
//    "color":"",
//    "casing":1,
//    "dimension":"",
//    "volume":"",
//    "itemcodetype":0,
//    "unit":"双",
//    "lastpurchaseprice":0,
//    "purchasetaxrate":"01",
//    "safestock":0,
//    "maxstock":0,
//    "minstock":0,
//    "maxorder":0,
//    "minorder":0,
//    "property":0,
//    "checkstate":0,
//    "errorinfo":"",
//    "inputperson":"000066",
//    "agentcode":"",
//    "term":""};
//mis.updateSKU(args,cb);


//var args={
//    "vipname": "testlucywu",
//    "gender": "1",
//    "birthday": "1979-01-03",
//    "email": "123",
//    "address": "234",
////    "tel": "",
//    "mobilephone": "15222222228",
//    "idcardno": "41090112148"
//};
//mis.generateVIP(args,cb);


//var args={
//    vipname:"testlucywu",
//    mobilephone:"15222222226",
//    cardno:"0000000047706134",
//    idcardno:"112146"
//};
//mis.validateVIP({"json":JSON.stringify(args)},cb);


//var args={vipcode:"00342033"};
//var args={vipcode:"00092281"};
//mis.getVIPInfo(args,cb);

//var args={"querystring":"13681826960"};
//var args={"vipname":"张三","gender":"1","birthday":"2015-01-01","email":"bl@126.com","address":"天竺","tel":"123456","mobilephone":"12345678911","idcardno":"333333333333333333"};

//mis.getVIPInfo2(args,cb);

//
//var args={};
//mis.placeOrder(args,cb);
//
//
//var args={};
//mis.cancelOrder(args,cb);
//
//
//var args={};
//mis.payBill(args,cb);
//
//
//var args={};
//mis.delivery(args,cb);

//mis.getVIPInfo("13888888888",cb);

////88折
//mis.getVIPInfo("00073374",cb);//20000446   13888888888
//mis.getVIPInfo("00126394",cb);//60001629   13585527307
////90折
//mis.getVIPInfo("00145591",cb);//50003716   13801882749
//mis.getVIPInfo("00147882",cb);//50003717   13661672385
////95折
//mis.getVIPInfo("00115545",cb);//30000001   无
//mis.getVIPInfo("00115544",cb);//30000002   无

//mis.getVIPInfo("12222222222",cb);

//mis.getVIPInfo("30088888",cb);

//mis.getVIPInfo("0000000020000446",cb);
//{"vipcode":"00073374","cardno":"0000000020000446","vipname":"鞠倩","usableamt":"0","gender":"0","birthday":"2015-03-19","mobilephone":"13888888888","totalamt":"69539","cardtype":"02","vipdiscount":88.0}

//mis.getVIPInfo2("00073374",cb);

//mis.getVIPDiscount("0147842", "000092", "30000002",cb);
//mis.getVIPDiscount2("0147842", "000092", "00073374",cb);
//mis.getVIPDiscount("0008464", "000039", "0000000030000002",cb);
//{"cardtype":"02","discount":0}


//mis.getOrderInfo([
//    {
//        groupid: null,
//        ordercode: "014100612845000240",
//        ifreturn: 0,
//        ordercodetype: 0,
//        pickupmode: 1,
//        paymenttype: 0,
//        status: 4,
//        orderdate: null,
//        audittime: null,
//        paytime: "2012-12-12 12:45:28",
//        outtime: null,
//        finishtime: null,
//        receivabletime: null,
//        vipcardNo: null,
//        cashier: "000001",
//        receivableamt: null,
//        realshipprice: null,
//        realpacking: null,
//        shipprice: null,
//        packing: null,
//        receivecontact: "王进城",
//        receivename: "王进城",
//        receivephone: "1888888",
//        receivecellphone: "1888888",
//        receiveaddress: "上海一所大学",
//        receivezip: "200240",
//        storecode: null,
//        poscode: "06102",
//        paylocal: 0,
//        possalecode: "123"
//    }
//], cb);

//mis.updateOrderInfo([
//    {
//        groupid: null,
//        ordercode: "014100612845000240",
//        ifreturn: 0,
//        ordercodetype: 0,
//        pickupmode: 1,
//        paymenttype: 0,
//        status: 4,
//        orderdate: null,
//        audittime: null,
//        paytime: "2012-12-12 12:45:28",
//        outtime: null,
//        finishtime: null,
//        receivabletime: null,
//        vipcardNo: null,
//        cashier: "000001",
//        receivableamt: null,
//        realshipprice: null,
//        realpacking: null,
//        shipprice: null,
//        packing: null,
//        receivecontact: "王进城",
//        receivename: "王进城",
//        receivephone: "1888888",
//        receivecellphone: "122222",
//        receiveaddress: "上海一所大学",
//        receivezip: "200240",
//        storecode: null,
//        poscode: "06102",
//        paylocal: 0,
//        possalecode: "123"
//    }
//], cb);


//mis.getOrderDiscountInfo(
//    [
//        {"ordercode":"015032184571000002","itemlistid":"001","listid":1,"discountreason":1,"discountamt":285.6,"vipcardtype":2},
//        {"ordercode":"015032184571000002","itemlistid":"001","listid":2,"discountreason":2,"discountamt":0.4,"vipcardtype":2},
//        {"ordercode":"015032184571000002","itemlistid":"001","listid":3,"discountreason":3,"discountamt":0,"vipcardtype":2}
//    ]
//,cb
//)

//var data=[
//    {"ordercode":"015032184571000002","itemlistid":"001","listid":1,"discountreason":1,"discountamt":285.6,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"001","listid":2,"discountreason":2,"discountamt":0.4,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"001","listid":3,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"001","listid":4,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"001","listid":5,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"001","listid":6,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"002","listid":7,"discountreason":1,"discountamt":136.3,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"002","listid":8,"discountreason":2,"discountamt":0.7,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"002","listid":9,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"002","listid":10,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"002","listid":11,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"002","listid":12,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"003","listid":13,"discountreason":1,"discountamt":503.2,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"003","listid":14,"discountreason":2,"discountamt":0.8,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"003","listid":15,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"003","listid":16,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"003","listid":17,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"003","listid":18,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"004","listid":19,"discountreason":1,"discountamt":226.5,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"004","listid":20,"discountreason":2,"discountamt":0.5,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"004","listid":21,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"004","listid":22,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"004","listid":23,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"004","listid":24,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"005","listid":25,"discountreason":1,"discountamt":274.8,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"005","listid":26,"discountreason":2,"discountamt":0.2,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"005","listid":27,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"005","listid":28,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"005","listid":29,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"005","listid":30,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"006","listid":31,"discountreason":1,"discountamt":64.4,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"006","listid":32,"discountreason":2,"discountamt":0.6,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"006","listid":33,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"006","listid":34,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"006","listid":35,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"006","listid":36,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"007","listid":37,"discountreason":1,"discountamt":279.7,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"007","listid":38,"discountreason":2,"discountamt":0.3,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"007","listid":39,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"007","listid":40,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"007","listid":41,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"007","listid":42,"discountreason":6,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"008","listid":43,"discountreason":1,"discountamt":27,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"008","listid":44,"discountreason":2,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"008","listid":45,"discountreason":3,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"008","listid":46,"discountreason":4,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"008","listid":47,"discountreason":5,"discountamt":0,"vipcardtype":2},
//    {"ordercode":"015032184571000002","itemlistid":"008","listid":48,"discountreason":6,"discountamt":0,"vipcardtype":2}
//];
//mis.getOrderDiscountInfo(data,cb);


//var http=require("http");
//var urlencode=require("urlencode");
//
//var options = {
//    host: '126.200.69.185',
//    port: 8080,
//    path: '/XJHmecWS/rest/xjhmecws/getorderdiscountinfoservice/',
//    method: 'POST'
//};
//var req = http.request(options, function(res) {
//    console.log('STATUS: ' + res.statusCode);
//    console.log('HEADERS: ' + JSON.stringify(res.headers));
//    res.setEncoding('utf8');
//    res.on('data', function (chunk) {
//        console.log('BODY: ' + chunk);
//    });
//});
//
//// write data to request body
//req.write(JSON.stringify(data)+"\n");
//req.end();
var mec_vi_paid_orderinfoDAO = require("../../dao/mec_vi_paid_orderinfoDAO");
var mec_vi_paid_contentinfoDAO = require("../../dao/mec_vi_paid_contentinfoDAO");
var mec_vi_paid_discountinfoDAO = require("../../dao/mec_vi_paid_discountinfoDAO");
var mec_vi_paid_chargeinfoDAO = require("../../dao/mec_vi_paid_chargeinfoDAO");
var mec_vi_paid_payinfoDAO = require("../../dao/mec_vi_paid_payinfoDAO");


notifyMisPaidOrder = function(orderOrGroupCode,cb){
    async.series([
        function(cb){
            mec_vi_paid_orderinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_contentinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_discountinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_chargeinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        },
        function(cb){
            mec_vi_paid_payinfoDAO.queryAll({where:{orderorgroupcode:orderOrGroupCode}},cb);
        }
    ],function(err,msg){
        if(!err){
            if(!msg[0]){
                myLogger.error("notifyMisPaidOrder [async.parallel]: unfound orderinfo");
                cb("unfound orderinfo",null);
            }
            else if(!msg[1]){
                myLogger.error("notifyMisPaidOrder [async.parallel]: unfound contentinfo");
                cb("unfound contentinfo",null);
            }
            else if(!msg[4]){
                myLogger.error("notifyMisPaidOrder [async.parallel]: unfound payinfo");
                cb("unfound payinfo",null);
            }
            else{
                for(var i=0;i<msg.length;i++){
                    for(var j=0;j<msg[i].length;j++){
                        delete msg[i][j].orderorgroupcode;
                    }
                }
                myLogger.trace("notifyMisPaidOrder [async.parallel.msg]: "+JSON.stringify(msg));
                async.series([
                    function(cb){
                        mis.getOrderInfo(msg[0],cb);
                    },
                    function(cb){
                        mis.getOrderItemInfo(msg[1],cb);
                    },
                    function(cb){
                        mis.getOrderDiscountInfo(msg[2],cb);
                    },
                    function(cb){
                        mis.getOrderChargeInfo(msg[3],cb);
                    },
                    function(cb){
                        mis.getOrderPayInfo(msg[4],cb);
                    }
                ],function(err,msg){
                    if(!err){
                        cb(null,"notifyMisPaidOrder successfully: "+msg);
                    }
                    else{
                        myLogger.error("notifyMisPaidOrder [async.series]: "+logErr(err));
                        cb(err,null);
                    }
                })
            }
        }
        else{
            myLogger.error("notifyMisPaidOrder [async.parallel]: "+logErr(err));
            cb(err,null);
        }
    })
}

notifyMisPaidOrder("01506292316700002501",cb);