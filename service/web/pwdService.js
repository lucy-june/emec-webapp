/**
 * Created by lucywu on 7/8/14.
 * 个人密码相关服务
 */
var mec_adm_adminDAO        = require('../../dao/mec_adm_adminDAO');
var myLogger                = require('../../logging/contextLogger')("web/pwdService");
var pbkdf2                  = require('../../security/pbkdf2');

//修改密码
exports.modify = function(usercode,oldPwd,newPwd,cb){
    exports.checkUser(usercode,oldPwd,function(msg){
        if(msg==1){
            var salt=pbkdf2.generateSaltSync(32);
            var hash = pbkdf2.hashSync(newPwd, salt, 2, 64, 'sha256');
            mec_adm_adminDAO.update({"SALT":salt,"HASH":hash,"RECORDSTATE":1},{"USERCODE":usercode},function(err,msg) {
                if(!err){
                    myLogger.trace("modify [mec_adm_adminDAO.update]: " + JSON.stringify(msg));
                    cb(null,"密码修改成功!");
                }
                else{
                    myLogger.error("modify [mec_adm_adminDAO.update]: " + logErr(err));
                    cb("修改密码失败!",null);
                }
            });
        }
        else{
            myLogger.error("modify [checkUser]: 原密码不正确");
            cb("原密码不正确!",null);
        }
    })
}

//检测用户是否合法
exports.checkUser = function (usercode,pwd,cb){
    myLogger.trace("checkUser [usercode,pwd]: "+usercode+","+pwd);
    mec_adm_adminDAO.queryOne({
        attributes:['HASH','SALT','RECORDSTATE'],
        where:{"USERCODE":usercode}
        },function(err,msg){
        if(!err){
            myLogger.trace("checkUser [mec_adm_adminDAO.queryOne]: "+JSON.stringify(msg));
            if(msg) {
                if (msg["RECORDSTATE"]!=0){
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
                }else{
                    cb(0)
                }
            }
            else{
                cb(0);
            }
        }
        else{
            myLogger.error("checkUser [mec_adm_adminDAO.queryOne]: "+logErr(err));
            cb(0);
        }
    });
}
