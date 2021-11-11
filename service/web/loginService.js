/**
 * Created by lucywu on 7/6/14.
 * 登录相关服务
 */
var mec_adm_adminDAO        = require('../../dao/mec_adm_adminDAO');
var mec_hct_counterDAO        = require('../../dao/mec_hct_counterDAO');
var mec_hsy_salesmanDAO    = require('../../dao/mec_hsy_salesmanDAO');
var pbkdf2                  = require('../../security/pbkdf2');
var mec_adm_ukeyDAO    =require("../../dao/mec_adm_ukeyDAO");
var myLogger                = require('../../logging/contextLogger')("web/loginService");

//登录验证与session处理
exports.dologin = function(usercode,pwd,requestCcaptxt,sessionCcaptxt,cb){
    myLogger.trace("dologin [usercode]: "+usercode);
    //检查验证码
//    if(requestCcaptxt.toLowerCase()!=sessionCcaptxt.toLowerCase()){
//        cb("验证码不正确",null);
//        return;
//    }
    exports.checkUser(usercode,pwd,function(err,user){
        if(!err){
            //如果是柜台帐号,则查询出改柜台的所有营业员清单
            if(user && user.ROLE == 1) {
                //查询营业员
                mec_hsy_salesmanDAO.queryAll({where:{"COUNTERCODE":user.COUNTERCODE}}, function (err,msg) {
                    if(!err){
                        myLogger.trace("dologin [mec_hsy_salesmanDAO.queryAll]: "+(msg && msg.length));
                        if(msg ) {
                            var assistantList = [];
                            for(var k=0; k<msg.length; k++) {
                                //只取出营业员姓名列，放入数组中，然后将数组存入session，多个页面都可以使用
                                assistantList[k] = {"SALESMANNAME":msg[k]["SALESMANNAME"]?msg[k]["SALESMANNAME"]:msg[k]["salesmanname"],"SALESMANCODE":msg[k]["SALESMANCODE"]?msg[k]["SALESMANCODE"]:msg[k]["salesmancode"]};
                            }
                            if(msg.length==0){
                                assistantList[0] = {"SALESMANNAME":"默认销售员","SALESMANCODE":"0"};
                            }
                            user.assistantList=assistantList;

                            //查询柜合同状态
                            mec_hct_counterDAO.queryOne({where:{COUNTERCODE:user.COUNTERCODE}},function(err,msg){
                                if(!err && msg){
                                    user.contractstate=msg.CONTRACTSTATE?msg.CONTRACTSTATE:msg.contractstate;
                                    cb(null,user);
                                }
                                else{
                                    //没有查询到柜台相关信息
                                    cb(err,null);
                                }
                            })
                        } else {
                            //没有营业员暂时设置为回到首页，以后在更改
                            cb(err,null);
                        }
                    }
                    else{
                        myLogger.error("checkUser [mec_hsy_salesmanDAO.queryAll]: "+logErr(err));
                        cb(err,null);
                    }
                });
            }
            else{
                cb(null,user);
            }
        }
        else{
            cb("exception",null);
        }
    });
};

//检测U盾和用户名是否匹配
exports.checkKeyMatch=function(counterid,keyid,cb){
    mec_adm_ukeyDAO.queryOne({
        attributes:['KEYID','KEYPATH','KEYTYPE'],
        where:{'KEYID':keyid,'COUNTERCODE':counterid,'STATUS':1}
    },function(err,msg){
        if(!err){
            if(msg){
                cb(null,msg);
            }else{
                cb("U盾与柜台号不匹配或者U盾被注销",null);
            }
        }else{
            cb("验证U盾是否有效出错"+err,null);
        }
    });
}

//检测是否为合法用户
exports.checkUser = function (usercode,pwd,cb){
    mec_adm_adminDAO.queryOne({
        attributes:['USERCODE','ROLE','DEPTCODE','COUNTERCODE','HASH','SALT','RECORDSTATE'],
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
                        delete msg.HASH;
                        delete msg.SALT;
                        cb(null,msg);
                    }
                    else{
                        cb("hash unequal exception",null);
                    }
                }else{
                    cb("invalid user",null);
                }
            }
            else{
                cb("query admin account exception",null);
            }
        }
        else{
            myLogger.error("checkUser [mec_adm_adminDAO.queryOne]: "+logErr(err));
            cb(err,null);
        }
    });
}