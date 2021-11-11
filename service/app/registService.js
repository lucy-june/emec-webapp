/**
 * Created by lucywu on 7/9/14.
 * 注册相关服务
 */
var mec_ctm_customerDAO = require('../../dao/mec_ctm_customerDAO');
var pbkdf2 = require('../../security/pbkdf2');
var Sequelize = require('sequelize');
var stringUtil = require('../../util/stringUtil');
var myLogger = require('../../logging/contextLogger')("app/registService");
var sms = require('../../interaction/sms');

var telCode = {};

//检测手机验证码是否正确
exports.checkTelCode = function (telephone, code) {
    if (telCode[telephone] != code) return false;
    else return true;
}

//发送手机验证码
exports.sendTelCode = function (telephone, cb) {
    myLogger.trace("sendTelCode [telephone]: " + telephone);
    var randomNumber = Math.floor(Math.random() * 1000000);
    var code = stringUtil.autoComple(randomNumber, 6, '0');
    telCode[telephone] = code;

    mec_ctm_customerDAO.queryOne(
        {attributes: ["USERCODE"], where: {"TELEPHONE": telephone}},
        function (err, msg) {
            if (!err) {
                if(!msg){
                    sms.sendSMS(telephone, 8, "汇金百货购物注册验证码：" + code, "2015-1-1", function (err, msg) {
                        cb(err, msg);
                    })
                }
                else{
                    cb("该手机号已被注册",null);
                }
            }
            else{
                cb("系统错误",null);
            }
        });

}

//销毁手机账户
exports.delAccount = function(usercode,telephone,cb){
    var where={};
    if(usercode){
        where.USERCODE=usercode;
    }
    else{
        where.TELEPHONE=telephone;
    }
    mec_ctm_customerDAO.del(where,cb);
}

//注册账户
exports.regist = function (value, cb) {
    var username = value.USERCODE;
    var password = value.PASSWORD;
    var telephone = value.TELEPHONE;
    var code = value.CODE;

    if (!exports.checkTelCode(telephone, code)) {
        cb("手机验证码不正确", null);
        return;
    }
    if ((!username && username != 0) || (!password && password != 0) || !telephone) {
        cb("exception", null);
        return;
    }
    var salt = pbkdf2.generateSaltSync(32);
    var hash = pbkdf2.hashSync(password, salt, 2, 64, 'sha256');
    value.HASH = hash;
    value.SALT = salt;
    delete value.PASSWORD;

    mec_ctm_customerDAO.queryOne(
        {attributes: ["USERCODE"], where: Sequelize.or({"USERCODE": username}, {"TELEPHONE": telephone})},
        function (err, msg) {
            //确保手机号与用户名不重复
            if (!err) {
                myLogger.trace("regist [mec_ctm_customerDAO.queryOne]: " + JSON.stringify(msg));
                if (!msg) {
                    mec_ctm_customerDAO.add(value, function (err, msg) {
                        if (!err) {
                            myLogger.trace("regist [mec_ctm_customerDAO.add]: " + JSON.stringify(msg));
                            cb(null, 1);
                        }
                        else {
                            myLogger.error("regist [mec_ctm_customerDAO.add]: " + logErr(err));
                            cb(err, null);
                        }
                    });
                }
                else {
                    cb("该用户名或手机号已经被注册!", null);
                }
            }
            else {
                myLogger.error("regist [mec_ctm_customerDAO.queryOne]: " + logErr(err));
                cb(err, null);
            }
        }
    )
};
