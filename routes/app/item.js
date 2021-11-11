/**
 * Created by lucywu on 7/9/14.
 */
var express             = require('express');
var metaService         = require('../../service/app/metaService');
var async               = require('async');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/itemRouter");
var itemService         = require('../../service/app/itemService');
var behaviorService     = require('../../service/app/behaviorService');

router.post('/display', function(req, res) {
    var postParams=req.body;
    myLogger.trace("post [/display]: "+JSON.stringify(postParams));

    var itemcode=postParams.ITEMCODE;
    var usercode=postParams.USERCODE;

    async.parallel([
        function(cb){
            if(usercode){
                behaviorService.checkFavoriteItem(usercode,itemcode,cb);
            }
            else{
                cb(null,null);
            }
        },
        function(cb){
            itemService.getOnlineSellingSkuForApp(itemcode,cb);
        },
        function(cb){
            metaService.getSkcs(itemcode,cb);
        },
        function(cb){
            metaService.getImgpreviews(itemcode,cb);
        }
    ],function(err,msg){
        if(!err){
            var sku=msg[1];
            var skcs=msg[2];
            var pics=msg[3];
            sku.ISFAVORITE=msg[0];

            for(var k=0;k<skcs.length;k++){
                skcs[k].ID=skcs[k].SKCCODE;
                delete skcs[k].SKCCODE;
            }
            for(var k=0;k<pics.length;k++){
                pics[k].URL=pics[k].IMGURL;
                delete pics[k].IMGURL;
            }

            async.forEach(skcs,function(skc,cb){
                itemService.getSkcStock(skc.ID,function(err,msg){
                    if(!err){
                        skc.STOCK=!msg?0:msg.AMOUNT;
                        cb(null,msg);
                    }
                    else{
                        cb("query stock error",null);
                    }
                })
            },function(err){
                if(!err){
                    var obj=sku;
                    obj.skcs=skcs;
                    obj.pics=pics;
                    res.send(obj);
                }
                else{
                    res.send(null);
                }
            })
        }
        else{
            res.send(null);
        }
    })
});

router.get('/getSkcStock', function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/SkcStock]: "+JSON.stringify(getParams));

    var skccode=getParams.SKCCODE;

    itemService.getSkcStock(skccode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else {
            if(msg){
                res.send({status:true,data:msg.AMOUNT});
            }
            else{
                res.send({status:true,data:0});
            }
        }
    })
})

router.get('/getImgDetail',function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getImgDetail]: "+JSON.stringify(getParams));

    var itemcode=getParams.ITEMCODE;

    metaService.getImgdetails(itemcode,function(err,msg){
        var imgdetailList=[];
        if(err) {
            myLogger.error("get [/getImgDetail.err]: "+logErr(err));
            imgdetailList=[];
        }
        else {
            imgdetailList=msg;
        }
        res.render('forapp/imgdetail',{"imgdetailList":imgdetailList});
    })
})

router.get('/getParameters',function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    myLogger.trace("get [/getParameters]: "+JSON.stringify(getParams));

    var itemcode=getParams.ITEMCODE;

    metaService.getParameters(itemcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    })
})

module.exports = router;
