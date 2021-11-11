/**
 * Created by lucywu on 7/9/14.
 */
var express             = require('express');
var accountService        = require('../../service/app/accountService');
var loginService        = require('../../service/app/loginService');
var registService       = require('../../service/app/registService');
var pwdService          = require('../../service/app/pwdService');
var myLogger            = require('../../logging/contextLogger')("app/accountRouter");
var router              = express.Router();

router.post('/login', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/login]: "+JSON.stringify(postParams));

    var usercode=postParams.username;
    var pwd=postParams.password;
    var requestVerifyCode="";
    var sessionVerifyCode="";

    loginService.dologin(usercode,pwd,requestVerifyCode,sessionVerifyCode,function(err,msg){
        if(!err){
            var obj={result:true,user:{}};
            obj.user.userid=msg.USERCODE;
            obj.user.iconurl=msg.ICONURL;
            obj.user.title="金牌用户";
            obj.user.score=1000;
            res.send(obj);
        }
        else{
            res.send({result:false})
        }
    });
});

router.post('/modifyPwd', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/modifyPwd]: "+JSON.stringify(postParams));

    var usercode=postParams.username;
    var oldPwd=postParams.oldPwd+"";
    var newPwd=postParams.newPwd+"";

    pwdService.modify(usercode,oldPwd,newPwd,function(err,msg){
        if(!err){
            res.send('1');
        }
        else{
            res.send('0');
        }
    });
});

router.get('/getTelCode', function(req, res) {
    var telephone=require('url').parse(req.url,true).query.TELEPHONE;
    registService.sendTelCode(telephone,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/checkTelCode', function(req, res) {
    var telephone=require('url').parse(req.url,true).query.TELEPHONE;
    var code=require('url').parse(req.url,true).query.CODE;
    var result=registService.checkTelCode(telephone,code);
    if(result){
        res.send({status:true,data:"验证成功"});
    }
    else{
        res.send({status:false,data:"验证失败"});
    }
});

//销毁手机账户
router.get('/delAccount', function(req, res) {
    var telephone=require('url').parse(req.url,true).query.TELEPHONE;
    var usercode=require('url').parse(req.url,true).query.USERCODE;
    registService.delAccount(usercode,telephone,function(err,msg){
        if(!err){
            res.send({status:true,data:"账户销毁成功"});
        }
        else{
            res.send({status:false,data:"账户销毁失败"});
        }
    })
});

router.post('/regist',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/regist]: "+JSON.stringify(postParams));

    var obj=postParams;
    obj.USERCODE=obj.USERID;
    obj.TELEPHONE=obj.TELPHONE;
    delete obj.USERID;
    delete obj.TELPHONE;

    registService.regist(obj,function(err,msg){
        if(!err){
            res.send({status:true,data:"regist success"});
        }
        else{
            res.send({status:false,data:"regist fail"});
        }
    })
});

router.post('/display',function(req,res){
    var postParams=req.body;
    myLogger.trace("post [/display]: "+JSON.stringify(postParams));

    var usercode=postParams.username;

    accountService.display(usercode,function(err,msg){
        if(!err){
            msg.USERID=msg.USERCODE;
            msg.TELPHONE=msg.TELEPHONE;

            res.send(msg);
        }
        else{
            res.send(null);
        }
    })
});

module.exports = router;
