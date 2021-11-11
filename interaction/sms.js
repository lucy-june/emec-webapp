/**
 * Created by lucywu on 12/4/14.
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var smsConfig       = require('../config/smsConfig.json')[node_env];
var httpRequest     = require('../util/httpRequest');
var objectUtil      = require("../util/objectUtil");

var tokenID="7100105830590823";

exports.sendSMS=function(mobile,formatid,content,scheduledate,cb){
    var config=objectUtil.clone(smsConfig);
    config.path=config.path+"SendSMS?mobile="+mobile+"&FormatID="+formatid+"&Content="+content+"&ScheduleDate="+scheduledate+"&TokenID="+tokenID;
    config.method="get";

    httpRequest(config,function(err,msg){
            cb(err,msg);
    })
}

