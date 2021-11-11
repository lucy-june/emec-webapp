/**
 * Created by lucywu on 7/8/14.
 * 个人密码相关服务
 */
var mec_ctm_customerDAO        = require('../../dao/mec_ctm_customerDAO');
var myLogger                = require('../../logging/contextLogger')("app/pwdService");
var pbkdf2                  = require('../../security/pbkdf2');

//修改密码
exports.modify = function(usercode,oldPwd,newPwd,cb){
    exports.checkUser(usercode,oldPwd,function(msg){
        if(msg==1){
            var salt=pbkdf2.generateSaltSync(32);
            var hash = pbkdf2.hashSync(newPwd, salt, 2, 64, 'sha256');
            mec_ctm_customerDAO.update({"SALT":salt,"HASH":hash},{"USERCODE":usercode},function(err,msg) {
                if(!err){
                    myLogger.trace("modify [mec_ctm_customerDAO.update]: " + JSON.stringify(msg));
                    cb(null,"密码修改成功!");
                }
                else{
                    myLogger.error("modify [mec_ctm_customerDAO.update]: " + logErr(err));
                    cb("修改密码失败!",null);
                }
            });
        }
        else{
            cb("原密码不正确!",null);
        }
    })
}

//检测用户是否合法
exports.checkUser = function (usercode,pwd,cb){
    mec_ctm_customerDAO.queryOne({
        attributes:['HASH','SALT'],
        where:{"USERCODE":usercode}
        },function(err,msg){
        if(!err){
            myLogger.trace("checkUser [mec_ctm_customerDAO.queryOne]: "+JSON.stringify(msg));
            if(msg) {
                var hash=msg["HASH"];
                var salt=msg["SALT"];
                var realHash=pbkdf2.hashSync(pwd, salt, 2, 64, 'sha256');
                myLogger.trace("checkUser [realHash]: "+realHash);
                if(realHash==hash){
                    cb(1);
                }
                else{
                    cb(0);
                }
            }
            else{
                cb(0);
            }
        }
        else{
            myLogger.error("checkUser [mec_ctm_customerDAO.queryOne]: "+logErr(err));
            cb(0);
        }
    });
}
