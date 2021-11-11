var express                     = require('express');
var auth                        = require('../../security/auth');
var accountService              = require('../../service/web/accountService')
var router                      = express.Router();
var myLogger                    = require('../../logging/contextLogger')("web/accountRouter");

//用户信息iframe内跳转
router.get('/displayInfo',auth.authority, function(req, res) {
    myLogger.trace("get [/displayInfo."+req.session.usercode+"]: "+JSON.stringify(require('url').parse(req.url,true).query));
    var usercode=req.session.usercode;
    accountService.display(usercode,function(err,msg){
        if(!err){
            res.render('account/displayInfo',{"user":msg});
        }
        else{
            res.send('获取用户信息失败!');
        }
    })
});

//修改用户信息异步请求
router.post('/modifyInfoService',auth.authority, function(req, res) {
    myLogger.trace("post [/modifyInfoService."+req.session.usercode+"]: "+JSON.stringify(req.body));
    var usercode=req.session.usercode;
    var value=req.body;
    accountService.modify(value,usercode,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

module.exports = router;
