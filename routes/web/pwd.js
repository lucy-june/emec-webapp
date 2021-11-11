var express                     = require('express');
var auth                        = require('../../security/auth');
var pwdService                  = require('../../service/web/pwdService');
var router                      = express.Router();
var myLogger                    = require('../../logging/contextLogger')("web/pwdRouter");

//修改密码iframe内跳转
router.get('/modifyPwd',auth.authority, function(req, res) {
    res.render('pwd/modifyPwd');
});

//修改密码异步请求服务
router.post('/modifyPwdService',auth.authority, function(req, res) {
    var usercode=req.session.usercode ;
    var oldPwd=req.body.oldPwd;
    var newPwd=req.body.newPwd;
    pwdService.modify(usercode,oldPwd,newPwd,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

module.exports = router;
