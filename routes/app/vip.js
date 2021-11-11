/**
 * Created by lucywu on 7/11/14.
 */
var express             = require('express');
var mis                  = require('../../interaction/mis');
var vipService          = require('../../service/app/vipService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/vipRouter");

router.get('/getVIPInfo', function(req, res) {
    var getParams=require('url').parse(req.url,true).query;
    myLogger.trace("get [/getVIPInfo]: "+JSON.stringify(getParams));

    var usercode=getParams.usercode;

    vipService.getVIPInfo(usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

router.post('/generateAndBindVIP', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/generateAndBindVIP]: "+JSON.stringify(postParams));

    var usercode=postParams.usercode;
    var vipname=postParams.vipname;
    var gender=postParams.gender;
    var birthday=postParams.birthday;
    var email=postParams.email;
    var address=postParams.address;
    var tel=postParams.tel;
    var mobilephone=postParams.mobilephone;
    var idcardno=postParams.idcardno;

    var args={
        vipname:vipname,
        gender:gender,
        birthday:birthday,
        email:email,
        address:address,
        tel:tel,
        mobilephone:mobilephone,
        idcardno:idcardno
    };

    vipService.generateAndBindVIP(usercode,args,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

router.post('/validateAndBindVIP', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/validateAndBindVIP]: "+JSON.stringify(postParams));

    var usercode=postParams.usercode;
    var vipname=postParams.vipname;
    var mobilephone=postParams.mobilephone;
    var cardno=postParams.cardno;
    var idcardno=postParams.idcardno;

    var args={json:JSON.stringify({vipname:vipname,mobilephone:mobilephone,cardno:cardno,idcardno:idcardno})};

    vipService.validateAndBindVIP(usercode,args,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

module.exports = router;
