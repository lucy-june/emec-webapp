/**
 * Created by lucywu on 7/17/14.
 */
var express             = require('express');
var skcService        = require('../../service/web/skcService');
var auth                = require('../../security/auth');
var router              = express.Router();
var myLogger                    = require('../../logging/contextLogger')("web/skcRouter");

router.get('/',auth.authority, function(req, res) {
    res.render('skcs/stock',{"assistantList":req.session.assistantList || []});
});

router.get('/check',auth.authority, function(req, res) {
    var itemcode = require('url').parse(req.url,true).query.itemcode;
    var countercode = req.session.countercode;
    skcService.check(itemcode,countercode,function(msg){
        res.send(JSON.stringify(msg));
    },function(err){
        res.send('0');
    })
});

router.post('/submit',auth.authority, function(req, res) {
    var itemcode = req.body.itemcode;
    var size = req.body.size;
    var color = req.body.color;
    var delta = req.body.delta;
    var sellername = req.body.sellername;
    var countercode = req.session.countercode;

    skcService.submit(itemcode,countercode,size,color,delta,sellername,function(msg){
        res.send("1");
    },function(err){
        res.send("0");
    })
});

module.exports = router;
