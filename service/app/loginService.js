/**
 * Created by lucywu on 7/6/14.
 * 登录相关服务
 */
var mec_ctm_customerDAO     = require('../../dao/mec_ctm_customerDAO');
var pbkdf2                  = require('../../security/pbkdf2');
var myLogger                = require('../../logging/contextLogger')("app/loginService");

//登录验证与session处理
exports.dologin = function(usercode,pwd,requestVerifyCode,sessionVerifyCode,cb){
    //检查验证码
    if(requestVerifyCode.toLowerCase()!=sessionVerifyCode.toLowerCase()){
        cb("验证码错误",null);
        return;
    }
    exports.checkUser(usercode,pwd,cb);
};

//检测是否为合法用户
exports.checkUser = function (usercode,pwd,cb){
    mec_ctm_customerDAO.queryOne({
        attributes:['USERCODE','VIPCODE','HASH','SALT','ICONURL'],
        where:{"USERCODE":usercode}
        },function(err,msg){
        if(!err){
            myLogger.trace("checkUser [mec_adm_adminDAO.queryOne]: "+JSON.stringify(msg));
            if(msg) {
                var hash=msg["HASH"];
                var salt=msg["SALT"];
                var realHash=pbkdf2.hashSync(pwd, salt, 2, 64, 'sha256');
                myLogger.trace("checkUser [realHash]: "+realHash);
                if(realHash==hash){
                    delete msg.HASH;
                    delete msg.SALT;
                    cb(null,msg);
                }
                else{
                    cb("exception",null);
                }
            }
            else{
                cb("exception",null);
            }
        }
        else{
            myLogger.error("checkUser [mec_adm_adminDAO.queryOne]: "+logErr(err));
            cb(err,null);
        }
    });
}