/**
 * Created by lucywu on 7/17/14.
 */
var express             = require('express');
var cartService         = require('../../service/app/cartService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/cartRouter");

router.get('/get', function(req, res) {
    var userid=require('url').parse(req.url,true).query.userid;

    cartService.getCart(userid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.post('/mergeAndGet', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/mergeAndGet]: "+JSON.stringify(postParams));

    var usercode=postParams.USERCODE;
    var options=eval("("+postParams.CONTENTS+")");

    cartService.mergeAndGetCart(usercode,options,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.post('/add', function(req, res) {
    var options=req.body;
    myLogger.trace("post [/add]: "+JSON.stringify(options));
    var usercode=options.USERID;
    var skccode=options.SKCID;
    var num=options.NUM;

    cartService.addCart(usercode,skccode,num,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.post('/delete',function(req,res){
    var postParams=req.body;
    console.log(postParams);

//    var options=JSON.parse(postParams.options);
    var options=eval("("+postParams.options+")");
    for(var k=0;k<options.length;k++){
        options[k].USERCODE=options[k].USERID;
        options[k].SKCCODE=options[k].SKCID;
        delete options[k].USERID;
        delete options[k].SKCID;
    }

    cartService.delCart3(options,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.post('/update',function(req,res){
    var postParams = req.body;

    var usercode=postParams.userid;
    var skccode=postParams.skcid;
    var num=postParams.num;

    cartService.updateCart2(usercode,skccode,num,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/refresh',function(req,res){
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/refresh]: "+JSON.stringify(getParams));

    var skcs=eval("("+getParams.SKCS+")");
    cartService.refreshUnloginCartSkcs(skcs,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});


module.exports = router;
