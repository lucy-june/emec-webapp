/**
 * Created by lucywu on 11/2/14.
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var misConfig       = require('../config/misConfig.json')[node_env];
var httpsRequest    = require('../util/httpsRequest');
var httpRequest     = require('../util/httpRequest');
var objectUtil      = require("../util/objectUtil");
var soap             = require('soap');
var http             = require('http');
var misItmMeta      =require('../model/itm_item');
var myLogger        = require('../logging/contextLogger')("interaction/mis");
var urlencode       = require('urlencode');
var exhandler       = require('../exception/exhandler');

//http://126.200.200.101:8080/XJHmecWS/
function callMisSvc(svcPath,data,callback){
    exhandler(function(){
        var opt = {
            method: "POST",
            host: misConfig.hostname,
            port: misConfig.port,
            path: svcPath+data,
            headers: {
                "Content-Type": 'application/json',
                "Content-Length": data.length,
                "Charset" :        "utf8"
            }
        };
        var req = http.request(opt, function (serverFeedback) {
            serverFeedback.setEncoding('utf8');
            if (serverFeedback.statusCode == 200) {
                serverFeedback.on('data', function (data) {
                    myLogger.trace("invoking mis service:" +opt.path );
                    var returnObj;
                    try{
                        console.log(data);
//                    returnObj= JSON.parse(data);
                        returnObj=eval("("+data+")");
                    }catch(e){
                        myLogger.error("invoking mis service [parseError]: "+JSON.stringify(e));
                        callback(e,null);
                        return;
                    }
                    if(returnObj.flag){
                        myLogger.trace("invoking mis service succeed: "+JSON.stringify(returnObj));
                        callback(null,returnObj.msg);
                    }
                    else{
                        myLogger.warn("invoking mis service failed "+JSON.stringify(returnObj));
                        callback(returnObj.msg,null);
                    }
                });
            }
            else {
                myLogger.error("callMisSvc ["+serverFeedback.statusCode+"]: unknown error");
                callback(serverFeedback.statusCode+" unknow error",null);
//            console.log(serverFeedback);
            }
        });
        req.write(data + "\n");
        req.end();
    },function(){
        callback("request timeout",null);
    });
}

//调用mis服务，之前调用接口拼接字符串容易超长
function callMisSvc2(svcPath,data,callback){
    var options = {
        host: misConfig.hostname,
        port: misConfig.port,
        path: svcPath,
        method: 'POST'
    };
    var req = http.request(options, function(res) {
        console.log('STATUS: ' + res.statusCode);
        console.log('HEADERS: ' + JSON.stringify(res.headers));
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
            console.log(chunk);
            chunk=eval("("+chunk+")");
            if(chunk.flag){
                callback(null,chunk.msg);
            }
            else{
                callback(chunk.msg,null);
            }
        });
    });

// write data to request body
    req.write(JSON.stringify(data)+ "\n");
    req.end();
}

/**
 * 创建商品信息
 * @param args
 * @param callback
 */
exports.createSKU = function(args,callback){
    myLogger.trace("mis-createSKU [args]: "+JSON.stringify(args));
    //传给MIS的Item对象属性名称和数量必须严格对应，否则会失败，故此处按MIS结构重新构造
    var misObj={};
    for(var attr in misItmMeta){
        misObj[attr]=args[attr];
    }
    var data = JSON.stringify(misObj);
    callMisSvc("/XJHmecWS/rest/xjhmecws/createiteminfoservice/",data,callback);
}

/**
 * 更新商品信息
 * @param args
 * @param callback
 */
exports.updateSKU = function(args,callback){
    myLogger.trace("mis-updateSKU [args]: "+JSON.stringify(args));
    //传给MIS的Item对象属性名称和数量必须严格对应，否则会失败，故此处按MIS结构重新构造
    var misObj={};
    for(var attr in misItmMeta){
        misObj[attr]=args[attr];
    }
    var data = JSON.stringify(misObj);
    callMisSvc("/XJHmecWS/rest/xjhmecws/updateiteminfoservice/",data,callback);
}

/**
 * 根据vipcode或者vipcardno或者手机号码获取vip信息
 * (特别包含：vipcardno,vipcode,vipcardtype,vipdiscountstr)
 * @param vipcode(8)/vipcardno(16)/telephone(11)
 * @param cb
 */
exports.getVIPInfo=function(args,cb){
    myLogger.trace("mis-getVIPInfo [args]: "+JSON.stringify(args));
    if(!args){
        myLogger.info("getVIPInfo [args check]: null args");
        cb("null args",null);
        return;
    }
    if(args.length==8&&args[0]!='0') args="00000000"+args;
    var data=JSON.stringify({querystring:args});
    callMisSvc("/XJHmecWS/rest/xjhmecws/getvipinfoservice/",data,function(err,msg){
        if(!err){
            if(msg){
                 msg=eval("("+msg+")");
                 if(msg.cardno.indexOf("00000000")==0)
                 msg.cardno=msg.cardno.replace("00000000","");
                 if(msg.vipdiscount=='0') msg.vipdiscount='100';
                 cb(null,msg);
            }
            else{
                cb("unfound vipinfo",null);
            }
        }
        else{
            myLogger.warn("getVIPInfo [callMisSvc]: "+logErr(err));
            cb(err,null);
        }
    });

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/getvipinfoservice/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

//模拟获取vip信息
exports.getVIPInfo2=function(vipcode,cb){
    //为传入的卡号添加0000，为获取的卡号删除0000 TODO
    var entry={"vipcode":"00073374","cardno":"0000000020000446","vipname":"习近平","usableamt":"2090","gender":"0","birthday":"2015-03-23","mobilephone":"13888888888","totalamt":"69539","cardtype":"02","vipdiscount":88.0,"preparativecongeal":1000};
    if (!vipcode) {
        entry.cardtype = "00";
        entry.vipdiscount = 100;//如果无折扣，mis会返回0
        entry.cardno="";
    }
    else if (vipcode == "66666666") {
        entry.cardtype = "02";
        entry.vipdiscount = 88;
    }
    else if (vipcode == "88888888") {
        entry.cardtype = "01";
        entry.vipdiscount = 90;
    }
    else {
        entry.cardtype = "03";
        entry.vipdiscount = 95;
    }
    entry.cardno=entry.cardno.substr(8,entry.cardno.length-8);
    cb(null,entry);
}

/**
 * 获取商品对于特定vip账户的实际折扣类型
 * @param itemcode
 * @param countercode
 * @param cardno
 * @param cb
 */
exports.getVIPDiscountByCard=function(itemcode,countercode,cardno,cb){
    if(!cardno) {
        myLogger.info("getVIPDiscountByCard [args check]: null cardno");
        cb("null cardno",null);
        return;
    }
    myLogger.trace("getVIPDiscountByCard [args]: "+itemcode+" "+countercode+" "+cardno);
    if(cardno.indexOf("00000000")!=0) cardno="00000000"+cardno;

    callMisSvc("/XJHmecWS/rest/xjhmecws/getvipdiscountservice/"+itemcode+"/"+countercode+"/"+cardno+"/","",function(err,msg){
        if(!err&&msg){
            msg=eval("("+msg+")");
            if(msg.discount==0) msg.discount=100;
            cb(null,msg);
        }
        else{
            myLogger.warn("getVIPDiscountByCard [callMisSvc]: "+logErr(err));
            cb(err,null);
        }
    });

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/getvipinfoservice/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

/**
 * 获取商品对特定vip卡的实际折扣类型
 * @param itemcode
 * @param countercode
 * @param vipcode
 * @param cb
 */
exports.getVIPDiscount=function(itemcode,countercode,vipcode,cb){
    if(!vipcode) {
        myLogger.info("getVIPDiscount [args check]: null vipcode");
        cb("null vipcode",null);
        return;
    }

    exports.getVIPInfo(vipcode,function(err,msg){
        if(!err){
            var cardno=msg.cardno;
            exports.getVIPDiscountByCard(itemcode,countercode,cardno,cb);
        }
        else{
            cb(err,null);
        }
    })
}

//模拟获取商品对于特定vip账户的实际折扣类型
exports.getVIPDiscount2=function(itemcode,countercode,vipcode,cb){
    var entry={};

    if (!vipcode) {
        entry.cardtype = "00";
        entry.discount = 100;//如果无折扣，mis会返回0
    }
    else if (vipcode == "66666666") {
        entry.cardtype = "02";
        entry.discount = 88;
    }
    else if (vipcode == "88888888") {
        entry.cardtype = "01";
        entry.discount = 90;
    }
    else {
        entry.cardtype = "03";
        entry.discount = 95;
    }
    cb(null,entry);
}

/**
 * 获取柜台商品的全部vip类型折扣信息
 * @param itemcode
 * @param countercode
 * @param cb
 */
exports.getItemVIPDiscount=function(itemcode,countercode,cb){
    myLogger.trace("getItemVIPDiscount [args]: "+itemcode+" "+countercode);

    callMisSvc("/XJHmecWS/rest/xjhmecws/getallvipdiscountservice/"+itemcode+"/"+countercode+"/","",function(err,msg){
        if(!err&&msg){
            msg=eval("("+msg+")");
            if(msg.discount==0) msg.discount=100;
            cb(null,msg);
        }
        else{
            myLogger.error("getItemVIPDiscount [callMisSvc]: "+logErr(err));
            cb(err,null);
        }
    });
}




/**
 * 传mis订单信息
 * @param args
 * @param cb
 */
exports.getOrderInfo=function(args,cb){
    myLogger.trace("mis-getOrderInfo [args]: "+JSON.stringify(args));

    callMisSvc2("/XJHmecWS/rest/xjhmecws/getorderinfoservice/",args,cb);

//    var data=JSON.stringify(args);
//    callMisSvc("/XJHmecWS/rest/xjhmecws/getorderinfoservice/"+urlencode(data)+"/","",cb);

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/getOrderInfoSerivce/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

/**
 * 传mis订单内商品信息
 * @param args
 * @param cb
 */
exports.getOrderItemInfo=function(args,cb){
    myLogger.trace("mis-getOrderItemInfo [args]: "+JSON.stringify(args));

    callMisSvc2("/XJHmecWS/rest/xjhmecws/getorderiteminfoservice/",args,cb);

//    var data=JSON.stringify(args);
//    callMisSvc("/XJHmecWS/rest/xjhmecws/getorderiteminfoservice/"+urlencode(data)+"/","",cb);

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/getOrderItemInfoService/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

/**
 * 传mis订单内商品的折扣信息
 * @param args
 * @param cb
 */
exports.getOrderDiscountInfo=function(args,cb){
    myLogger.trace("mis-getOrderDiscountInfo [args]: "+JSON.stringify(args));

    callMisSvc2("/XJHmecWS/rest/xjhmecws/getorderdiscountinfoservice/",args,cb);

//    var data=JSON.stringify(args);
//    callMisSvc("/XJHmecWS/rest/xjhmecws/getorderdiscountinfoservice/"+urlencode(data)+"/","",cb);

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/getorderdiscountinfoservice/";
//    config.method="post";
//    config.post_data=urlencode(JSON.stringify({orderdiscountList:args}));
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

/**
 * 传mis订单支付信息
 * @param args
 * @param cb
 */
exports.getOrderPayInfo=function(args,cb){
    myLogger.trace("mis-getOrderPayInfo [args]: "+JSON.stringify(args));

    callMisSvc2("/XJHmecWS/rest/xjhmecws/getorderpayinfoservice/",args,cb);

//    var data=JSON.stringify(args);
//    callMisSvc("/XJHmecWS/rest/xjhmecws/getorderpayinfoservice/"+urlencode(data)+"/","",cb);

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/getOrderChargeInfoSerivce/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

/**
 * 传mis订单运费包装费等差额信息
 * @param args
 * @param cb
 */
exports.getOrderChargeInfo=function(args,cb){
    myLogger.trace("mis-getOrderChargeInfo [args]: "+JSON.stringify(args));

    callMisSvc2("/XJHmecWS/rest/xjhmecws/getorderchargeinfoservice/",args,cb);

//    var data=JSON.stringify(args);
//    callMisSvc("/XJHmecWS/rest/xjhmecws/getorderchargeinfoservice/"+urlencode(data)+"/","",cb);

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/getOrderPayInfoSerivce/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}

/**
 * 更新订单信息
 * @param args
 * @param cb
 */
exports.updateOrderInfo=function(args,cb){
    myLogger.trace("mis-updateOrderInfo [args]: "+JSON.stringify(args));

    callMisSvc2("/XJHmecWS/rest/xjhmecws/updateorderinfoservice/",args,cb);

//    var data=JSON.stringify(args);
//    callMisSvc("/XJHmecWS/rest/xjhmecws/updateorderinfoservice/"+urlencode(data)+"/","",cb);

//    var config=objectUtil.clone(misConfig);
//    config.path="/XJHmecWS/rest/xjhmecws/updateOrderInfoSerivce/";
//    config.method="post";
//    config.post_data=JSON.stringify({querystring:args});
//
//    httpRequest(config,function(err,msg){
//        cb(err,msg);
//    })
}



//exports.createSKU=function(args,callback){
//    myLogger.trace("createSKU [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/createItemInfoService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.createItemInfoService(args, function(err, result) {
//                myLogger.trace("createSKU [createItemInfoService.result]: "+JSON.stringify(result));
//                if(!err){
//
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("createSKU [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("createSKU [createItemInfoService]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("createSKU [createItemInfoService]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("createSKU [createItemInfoService]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("createSKU [createItemInfoService]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.updateSKU=function(args,callback){
//    myLogger.trace("updateSKU [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/updateItemInfoService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.updateItemInfoService(args, function(err, result) {
//                myLogger.trace("updateSKU [updateItemInfoService.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("updateSKU [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("updateSKU [updateItemInfoService]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("updateSKU [updateItemInfoService]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("updateSKU [updateItemInfoService]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("updateSKU [updateItemInfoService]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.generateVIP=function(args,callback){
//    myLogger.trace("generateVIP [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/regVipInfoService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.regVipInfoService(args, function(err, result) {
//                myLogger.trace("generateVIP [regVipInfoService.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("generateVIP [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("generateVIP [regVipInfoService]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("generateVIP [regVipInfoService]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("generateVIP [regVipInfoService]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("generateVIP [regVipInfoService]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.validateVIP=function(args,callback){
//    myLogger.trace("validateVIP [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/checkVipInfoService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.checkVipInfoService(args, function(err, result) {
//                myLogger.trace("validateVIP [checkVipInfoService.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("validateVIP [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("validateVIP [checkVipInfoService]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("validateVIP [checkVipInfoService]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("validateVIP [checkVipInfoService]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("validateVIP [checkVipInfoService]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.getVIPInfo=function(args,callback){
//    myLogger.trace("getVIPInfo [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/getVipInfoByVipCodeService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.getVipInfoByVipCodeService(args, function(err, result) {
//                myLogger.trace("getVIPInfo [getVipInfoByVipCodeService.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("getVIPInfo [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("getVIPInfo [getVipInfoByVipCodeService]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("getVIPInfo [getVipInfoByVipCodeService]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("getVIPInfo [getVipInfoByVipCodeService]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("getVIPInfo [getVipInfoByVipCodeService]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.placeOrder=function(args,callback){
//    myLogger.trace("placeOrder [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/checkVipInfoService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.______myService______(args, function(err, result) {
//                myLogger.trace("placeOrder [______myService______.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("placeOrder [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("placeOrder [______myService______]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("placeOrder [______myService______]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("placeOrder [______myService______]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("placeOrder [______myService______]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.cancelOrder=function(args,callback){
//    myLogger.trace("cancelOrder [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/checkVipInfoService';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.______myService______(args, function(err, result) {
//                myLogger.trace("cancelOrder [______myService______.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("cancelOrder [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("cancelOrder [______myService______]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("cancelOrder [______myService______]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("cancelOrder [______myService______]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("cancelOrder [______myService______]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.delivery=function(args,callback){
//    myLogger.trace("delivery [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/______myService______';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.______myService______(args, function(err, result) {
//                myLogger.trace("delivery [______myService______.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("delivery [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("delivery [______myService______]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("delivery [______myService______]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("delivery [______myService______]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("delivery [______myService______]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}

//exports.payBill=function(args,callback){
//    myLogger.trace("payBill [args]: "+JSON.stringify(args));
//
//    var wsdl = 'http://hostname:port/XJHjoyWS/WebService?wsdl';
//    var action='http://hostname:port/XJHjoyWS/WebService/______myService______';
//    wsdl=wsdl.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//    action=action.replace("hostname",misConfig.hostname).replace("port",misConfig.port);
//
//    soap.createClient(wsdl, function(err, client) {
//        if(!err){
//            client.setSOAPAction(action);
//            client.______myService______(args, function(err, result) {
//                myLogger.trace("payBill [______myService______.result]: "+JSON.stringify(result));
//                if(!err){
//                    var returnObj;
//                    try{
//                        returnObj= JSON.parse(result.return);
//                    }catch(e){
//                        myLogger.error("payBill [parseError]: "+JSON.stringify(e));
//                        callback(e,null);
//                        return;
//                    }
//
//                    if(returnObj.flag){
//                        myLogger.trace("payBill [______myService______]: "+JSON.stringify(result));
//                        callback(null,returnObj.msg);
//                    }
//                    else{
//                        myLogger.warn("payBill [______myService______]: "+JSON.stringify(result));
//                        callback(returnObj.msg,null);
//                    }
//                }
//                else{
//                    myLogger.error("payBill [______myService______]: "+logErr(err));
//                    callback(err,null);
//                }
//            });
//        }else{
//            myLogger.error("payBill [______myService______]: "+logErr(err));
//            callback(err,null);
//        }
//    });
//}



