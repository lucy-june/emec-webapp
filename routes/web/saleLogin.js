var express             = require('express');
var auth                = require('../../security/auth');
var loginService        = require('../../service/web/loginService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("web/loginRouter");
var fs                  = require("fs");
var crypto              = require('crypto');
var ukeyverify          =require('../../security/ukeyVerify');
var titile = "eMEC销售系统";


router.get('/',auth.forward , function(req, res) {
    var rand=new Date().getTime();
    req.session.RandomCode=rand;
    res.render('login', { "title": titile,"rand":rand});
});


router.get('/index',auth.forward , function(req, res) {
    res.render('login', { title: titile});
});

router.get('/main',auth.backward , function(req, res) {
    var istmp=false;
    if(req.session.role==1&&req.session.keytype==2){
        istmp=true;
    }
    res.render('saleMain', {title: titile, usercode:req.session.usercode, role:req.session.role, istmp:istmp, contractstate:req.session.contractstate,recordstate:req.session.recordstate});
});

router.get('/login', function(req, res) {
    res.redirect('/main');
});

router.get('/logout', function(req, res) {
    req.session.destroy();
    res.redirect('/');
});

router.get('/judge', function(req, res) {
    var judge=req.session.recordstate ;
    res.send({data:judge});
});

router.post('/login', function(req, res) {
        myLogger.trace("post [/login]: "+JSON.stringify(req.body));
        var usercode = req.body.username;
        var pwd = req.body.password;
        var signcode=req.body.signcode;
        var keyid=req.body.keyid;
        var requestCcaptxt =req.body.ccapimgtxt;
        var sessionCcaptxt=req.session.ccaptxt;
        var oldurl=req.headers['referer'];
        console.log(oldurl);
        loginService.dologin(usercode,pwd,requestCcaptxt,sessionCcaptxt,function(err,user){
        myLogger.trace("post [/login]: "+JSON.stringify(user));

        if(!err && user) {
            //如果是营业员进行验证U盾
            if (user.ROLE == 1) {
                //console.log("UKEY ID"+signcode);
                if (!keyid || !signcode) {
                    myLogger.trace("没有使用U盾登陆");
                    //res.redirect('/yyy');
                    res.send({status:false,data:"没有使用U盾登陆！"});
                    return;
                }
                loginService.checkKeyMatch(user.COUNTERCODE, keyid, function (err, msg) {
                    if (!err) {
                        //应该根据柜台和U盾的对应关系读取相应U盾信息
                        var publicKey = ukeyverify.ukeyInfo[keyid];
                        if (!publicKey) {
                            var exists=fs.existsSync('../security/publickeys/' + keyid);
                            if(!exists){
                                res.send({status:false,data:"U盾公钥文件不存在！"});
                                return;
                            }
                            publicKey = fs.readFileSync('../security/publickeys/' + keyid);
                        }
                        publicKey = publicKey.toString();
                        var data = new Buffer(req.session.RandomCode + "");//应该是随机码sessionCcaptxt
                        var verifier = crypto.createVerify("RSA-SHA1");
                        verifier.update(data);
                        var ret = verifier.verify(publicKey, signcode, "base64");
                        if (!ret) {
                            myLogger.warn("post [/login]: U盾验证错误！");
                            //res.redirect('/yyy');
                            res.send({status:false,data:"U盾验证错误！"});
                            return;
                        } else {
                            req.session.keyid = keyid;
                            req.session.keytype = msg.KEYTYPE;
                            ukeyverify.ukeyInfo[keyid] = publicKey;

                            req.session.usercode = user.USERCODE;
                            req.session.role = user.ROLE;
                            req.session.deptcode = user.DEPTCODE;
                            req.session.recordstate=user.RECORDSTATE;
                            req.session.user = user;

                            req.session.countercode = user.COUNTERCODE;
                            req.session.assistantList = user.assistantList;
                            req.session.contractstate=user.contractstate;
                            req.session.save();
                            res.send({status:true,state:user.RECORDSTATE,data:"登录成功"});
                        }
                    } else {
                        myLogger.trace(err);
                        //res.redirect('/');
                        res.send({status:false,data:err});
                    }
                });
            } else {
                res.send({status:false,data:"非销售账号登录!"});
            }

        }
        else{
            myLogger.warn("post [/login]: "+logErr(err));
            //res.redirect('/');
            res.send({status:false,data:"用户名或密码不正确！"});
        }
    });
});

module.exports = router;
