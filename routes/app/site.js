/**
 * Created by lucywu on 7/24/14.
 */

var express             = require('express');
var siteService       = require('../../service/app/siteService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/siteRouter");

router.get('/getAll', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getAll]: "+JSON.stringify(getParams));

    var usercode=getParams.userid;

    siteService.getAllSites(usercode,function(err,msg){
        if(!err){
            for(var k=0;k<msg.length;k++){
                msg[k].ID=msg[k].SITEID;
                msg[k].USERID=msg[k].USERCODE;
                msg[k].TEL=msg[k].TELEPHONE;
            }
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/getDefault', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getDefault]: "+JSON.stringify(getParams));

    var usercode=getParams.userid;

    siteService.getDefaultSite(usercode,function(err,msg){
        if(!err){
            msg.ID=msg.SITEID;
            msg.USERID=msg.USERCODE;
            msg.TEL=msg.TELEPHONE;
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.get('/getCertain', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getCertain]: "+JSON.stringify(getParams));

    var siteid=getParams.siteid;

    siteService.getCertainSite(siteid,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.post('/create', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/create]: "+JSON.stringify(postParams));

    var obj=postParams;
    obj.USERCODE=obj.USERID;
    obj.TELEPHONE=obj.TEL;
    delete obj.USERID;
    delete obj.TEL;

    siteService.addSite(obj,function(err,msg){
        if(!err){
            res.send({status:true,data:msg.null});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

router.post('/delete', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/delete]: "+JSON.stringify(postParams));

    var siteid=postParams.siteid;

    siteService.deleteSite(siteid,function(msg){
        res.send({status:true,data:null});
    },function(err){
        res.send({status:false,data:err});
    })
});

router.post('/update', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/update]: "+JSON.stringify(postParams));

    var value=postParams;
    value.SITEID=value.ID;
    value.USERCODE=value.USERID;
    if(value.TEL) value.TELEPHONE=value.TEL;
    delete value.ID;
    delete value.USERID;
    delete value.TEL;

    siteService.modifySite(value.SITEID,value,function(err,msg){
        if(!err){
            res.send({status:true,data:null});
        }
        else{
            res.send({status:false,data:err});
        }
    })
});

module.exports = router;
