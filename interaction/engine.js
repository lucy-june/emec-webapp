/**
 * Created by lucywu on 11/2/14.
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var engineConfig    = require('../config/engineConfig.json')[node_env];
var httpsRequest    = require('../util/httpsRequest');
var httpRequest     = require('../util/httpRequest');
var objectUtil      = require("../util/objectUtil");
var urlencode       = require('urlencode');
var myLogger        = require('../logging/contextLogger')("interaction/engine");
var exhandler        = require('../exception/exhandler');


exports.process=function(args,cb){
    var config=objectUtil.clone(engineConfig);
    config.path="/mecengine-Jersey/services/promotion/postpromotioninfo/";
    config.method="post";
    config.post_data="itemlist="+urlencode(args);
    config.headers = config.headers?config.headers:{
        "Content-Type": 'application/x-www-form-urlencoded',
        "Content-Length": config.post_data.length
    };

    myLogger.trace("process [config]: "+JSON.stringify(config));

    exhandler(function(){
        httpRequest(config,function(err,msg){
            cb(err,msg);
        })
    },function(err){
        myLogger.error("promotion engine process")
    })
};

exports.refresh = function(cb) {
    var config = objectUtil.clone(engineConfig);
    console.log(JSON.stringify(config));
    config.path = "/mecengine-Jersey/services/promotion/refreshengine";
    config.method = "get";

    myLogger.trace("refresh [config]: " + JSON.stringify(config));

    httpRequest(config, function (err, msg) {
        cb(err, msg);
    })
};
