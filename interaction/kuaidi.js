/**
 * Created by lucywu on 12/4/14.
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var expressConfig   = require('../config/expressConfig.json')[node_env];
var httpRequest    = require('../util/httpRequest');
var objectUtil      = require("../util/objectUtil");

exports.queryExpress=function(type,postid,cb){
    var config=objectUtil.clone(expressConfig);
    config.path="/query?type="+type+"&postid="+postid;
    config.method="get";

    httpRequest(config,function(err,msg){
            cb(err,msg);
    })
}

