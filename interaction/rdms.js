/**
 * Created by lucywu on 11/2/14.
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var rdmsConfig       = require('../config/rdmsConfig.json')[node_env];
var httpsRequest    = require('../util/httpsRequest');
var httpRequest     = require('../util/httpRequest');
var objectUtil      = require("../util/objectUtil");
var myLogger        = require('../logging/contextLogger')("interaction/rdms");

exports.getSkc=function(skuCode,cb){
    var config=objectUtil.clone(rdmsConfig);
    config.path="/itemSvc/getSkcs?skuCode="+skuCode;
    config.method="get";

    myLogger.trace("getSkc [config]: "+JSON.stringify(config));

    httpRequest(config,cb);
}



