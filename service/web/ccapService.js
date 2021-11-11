/**
 * Created by lucywu on 7/7/14.
 * 验证码服务
 */
//var ccap      = require('ccap')();
var sha1        = require('../../security/sha1');
var myLogger    = require('../../logging/contextLogger')("web/ccapService");

//生成验证码
exports.generateCcap = function(cb){
    var ary = ccap.get();
    var txt = ary[0].toLocaleString().toLowerCase();
    var buf = ary[1];
    myLogger.trace("generateCcap [txt]: "+txt);
    cb(txt,buf);
};

//获取验证码hash,保存在前端
exports.ccapHash = function(ccaptxt,cb){
    var hash=sha1.hex_sha1(ccaptxt.toLowerCase());
    myLogger.trace("ccapHash [hash]: "+hash);
    cb(hash);
};


