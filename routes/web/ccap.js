/**
 * Created by lucywu on 11/21/14.
 */
var express             = require('express');
var ccapService         = require('../../service/web/ccapService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("web/ccapRouter");

//生成验证码
router.get('/generateCcap/:randnumber', function(req, res) {
    myLogger.trace("get [/generateCcap]: "+JSON.stringify(require('url').parse(req.url,true).query));
    ccapService.generateCcap(function(txt,buf){
        req.session.ccaptxt= txt;
        req.session.save();
        res.end(buf);
    })
});

//获取验证码的hash保存到前端
router.get('/ccapHash', function(req, res) {
    myLogger.trace("get [/ccapHash]: "+JSON.stringify(require('url').parse(req.url,true).query));
    req.session.reload(function(){
        var ccaptxt=req.session.ccaptxt;
        ccapService.ccapHash(ccaptxt,function(msg){
            res.send(msg);
        })
    });
});

module.exports = router;
