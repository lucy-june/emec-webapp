/**
 * Created by LiJunnan on 2014/9/9.
 */
var express = require('express');
var auth = require('../../security/auth');
var router = express.Router();
var multiparty = require('multiparty');
var superService = require('../../service/web/superService');
var appActivityService=require('../../service/web/appActivityService');
var myLogger                    = require('../../logging/contextLogger')("web/superRouter");
var fs = require('fs');
var unzip=require('unzip');

//添加柜台信息iframe内跳转
router.get('/addCounter', auth.authority, function (req, res) {
    res.render('super/addCounter');
});

router.get('/bindUkey', auth.authority, function (req, res) {
    res.render('super/bindUkey');
});

router.get('/changeUkey', auth.authority, function (req, res) {
    res.render('super/changeUkey');
});

router.get('/updateUkey', auth.authority, function (req, res) {
    res.render('super/updateUkey');
});

router.get('/lossUkey', auth.authority, function (req, res) {
    res.render('super/lossUkey');
});

router.get('/uploadPublicKeys', auth.authority, function (req, res) {
    res.render('super/uploadPublicKeys');
});

router.post('/uploadPublicKeysService', auth.authority, function (req, res) {
    var form = new multiparty.Form({uploadDir: '../security/publickeys/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if (err) {
            res.send({status: false, msg: "处理上传文件出错！"});
            return;
        }
        if(!files.ZIPFILE||!files.ZIPFILE[0]){
            res.send({status: false, msg: "没有上传文件！"});
            return;
        }
        var inputFile = files.ZIPFILE[0];
        var uploadedPath = inputFile.path;
        var ofilename=inputFile.originalFilename;
        var pos=ofilename.indexOf(".");
        var ext=ofilename.substring(pos);
        if(ext!='.zip'){
            res.send({status: false, msg: "上传文件格式不支持！"});
            return;
        }
        fs.createReadStream(uploadedPath).pipe(unzip.Extract({ path: '../security/publickeys/' }));
        res.send({status: true, msg: "上传成功！"});
    });
});

router.post('/bindKeyService', auth.authority, function (req, res) {
    //生成multiparty对象，并配置下载目标路径
    var form = new multiparty.Form({uploadDir: '../security/publickeys/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if(err){
            console.log('parse error: ' + err);
            res.send({status:false,msg:"处理公钥文件出错！"});
        } else {
            //检测是否存在了
            //console.log(JSON.stringify(fields.UKEYID));
            var keyid=fields.UKEYID[0];
            var keytype=fields.KEYTYPEE[0];
            var userid=fields.COUNTERID[0];
            var usercode=req.session.usercode;
            console.log(keyid);
            console.log(userid);
            superService.checkKeyExists(keyid,function(err,msg){
                if(!err&&!msg){
                    if(files.PUBLICKEY&&files.PUBLICKEY[0]){
                        var inputFile = files.PUBLICKEY[0];
                        var uploadedPath = inputFile.path;
                        var dstPath = '../security/publickeys/' + inputFile.originalFilename;
                        //判断目标文件是否存在了
                        var exists=fs.existsSync(dstPath);
                        if(exists){
                            console.log("删除已存在文件");
                            fs.unlinkSync(dstPath);
                        }
                        //重命名为真实文件名
                        fs.rename(uploadedPath, dstPath, function(err) {
                            if(err){
                                console.log('rename error: ' + err);
                                res.send({status:false,msg:"公钥文件重命名出错！"});
                            } else {
                                console.log('rename ok');
                                superService.bindUkey(keyid,keytype,userid,usercode,function(err,msg){
                                    if(!err){
                                        res.send({status:true,msg:"绑定成功！"});
                                    }else{
                                        res.send({status:false,msg:err});
                                    }
                                });
                            }
                        });
                    }else{
                        //没有上传公钥文件，检查公钥文件是否已经存在了
                        var dstPath = '../security/publickeys/' + keyid;
                        var already=fs.existsSync(dstPath);
                        if(already){
                            superService.bindUkey(keyid,keytype,userid,usercode,function(err,msg){
                                if(!err){
                                    res.send({status:true,msg:"绑定成功！"});
                                }else{
                                    res.send({status:false,msg:err});
                                }
                            });
                        }else{
                            res.send({status:false,msg:'缺少公钥文件!'});
                        }
                    }
                }else{
                    if(msg){
                        res.send({status:false,msg:"该ID的U盾已经存在了！"});
                    }else{
                        res.send({status:false,msg:"检测U盾是否存在出错了！"});
                    }
                }
            });
        }
       // res.send({status:true,msg:"OK"});
    });
});

router.post('/getKeyInfoService', auth.authority, function (req, res) {
    //console.log(req.body.KEYID);
    superService.getKeyInfo(req.body.KEYID,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }else{
            res.send({status:false,data:err});
        }
    });
});

router.get('/changeKeyService', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;
    //console.log(getParams);
    superService.changeKey(getParams,function(err,msg){
        if(!err){
            res.send({status:true,data:"更新成功"});
        }else{
            res.send({status:false,data:err});
        }
    });
});

router.post("/changePublicKey",auth.authority,function(req,res){
    //生成multiparty对象，并配置下载目标路径
    var form = new multiparty.Form({uploadDir: '../security/publickeys/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if(err){
            console.log('parse error: ' + err);
            res.send({status:false,data:"处理公钥文件出错！"});
        } else {
            //检查uKey是否存在
            var keyid=fields.UKEYID2[0];
            superService.checkKeyExists(keyid,function(err,msg){
                if(!err){
                    if(msg){
                        var inputFile = files.PUBLICKEY2[0];
                        var uploadedPath = inputFile.path;
                        var dstPath = '../security/publickeys/' + inputFile.originalFilename;
                        //判断目标文件是否存在了
                        var exists=fs.existsSync(dstPath);
                        if(exists){
                            console.log("删除已存在文件");
                            fs.unlinkSync(dstPath);
                        }
                        fs.rename(uploadedPath, dstPath, function(err) {
                            if(!err){
                                res.send({status:true,msg:"更新成功！"});
                            }else{
                                res.send({status:false,msg:"重命名出错！"});
                            }
                        });
                    }else{
                        res.send({status:false,msg:"U盾不在系统中！"});
                    }
                }else{
                    res.send({status:false,msg:"检查U盾是否存在出错！"});
                }
            });
        }
    });
});

router.get('/getAllKeys', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;
    console.log(getParams);
    var id=getParams.ID;
    if(id.length==6){
        superService.getAllKeys(id,function(err,msg){
            if(!err){
                res.send({status:true,data:msg});
            }else{
                res.send({status:false,data:err});
            }
        });
    }else if(id.length==16){
        superService.getKeyInfo(id,function(err,msg){
            if(!err){
                var ret=new Array();;
                ret.push(msg);
                res.send({status:true,data:ret});
            }else{
                res.send({status:false,data:err});
            }
        });
    }else{
        res.send({status:false,data:"参数错误"});
    }
});

router.get('/updateKeyStatus', auth.authority, function (req, res) {
    //更新U盾状态
    var getParams= require('url').parse(req.url,true).query;
    var keyid=getParams.KEYID;
    var status=getParams.STATUS||1;
    var keytype=getParams.KEYTYPE||1;
    if(keyid){
       superService.updateKeyStatus(keyid,status,keytype,function(err,msg){
           if(!err){
               res.send({status:true,data:"更新成功"});
           }else{
               res.send({status:false,data:err});
           }
       }) ;
    }else{
        res.send({status:false,data:"参数错误"});
    }
});

router.get('/addGoodsadmin', auth.authority, function (req, res) {
    res.render('super/addGoodsadmin');
});

router.get('/addSalesadmin', auth.authority, function (req, res) {
    res.render('super/addSalesadmin');
});

router.get('/addAlladmin', auth.authority, function (req, res) {
    res.render('super/addAlladmin');
});

router.get('/resetPwd', auth.authority, function (req, res) {
    res.render('super/resetPwd');
});

router.get('/addSeller', auth.authority, function (req, res) {
    res.render('super/addSeller');
})

router.get('/addAccountService', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;

    var uid=getParams.USERID;
    delete getParams.USERID;
    getParams.USERCODE=uid;
    if (getParams.ROLE=="2"){
        getParams.ROLE=2;
    }else if (getParams.ROLE=="3"){
        getParams.ROLE=3;
    }else if (getParams.ROLE=="4"){
        getParams.ROLE=4;
    }else if (getParams.ROLE=="5"){
        getParams.ROLE=5;
    }
    getParams.RECORDSTATE=2;

    superService.addAccount(getParams,req.session.usercode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    });
});

router.get('/addSellerService', auth.authority, function (req, res) {
    superService.addSeller(req, res);
})

router.get('/testHelper', auth.authority, function (req, res) {
    res.render('super/testHelper');
});

var skuService = require("../../service/web/skuService");
router.get('/testToCounter', function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    console.log(getParams);

    skuService.toCounter([getParams],function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    })
});

router.get('/rollbackPaid', function(req,res){
    var getParams= require('url').parse(req.url,true).query;
    console.log(getParams);

    var orderorgroupcode=getParams.orderorgroupcode;

    superService.rollbackPaid(orderorgroupcode,function(err,msg){
        if(err) res.send({status:false,data:err});
        else res.send({status:true,data:msg});
    })
});

var payService = require("../../service/app/payService");
var posService = require("../../service/web/posService");
router.post('/testPay', function(req,res){
    var postParams= req.body;
    console.log(postParams);

    var paymentmode=postParams.PAYMENTMODE;
    var ordercodes=postParams.ORDERCODES;
    console.log(paymentmode);
    console.log(ordercodes);

    var isonlineorder=(ordercodes[0].charAt(0)=='1');

    if(isonlineorder && ordercodes.length>1){
        res.send({status:false,data:"输入订单不符合要求"});
        return;
    }
    for(var k=1;k<ordercodes.length;k++){
        if(isonlineorder!=(ordercodes[k].charAt(0)=='1')){
            res.send({status:false,data:"输入订单不符合要求"});
            return;
        }
    }
    console.log(isonlineorder);

    if(paymentmode==0){
        posService.payPrepare(isonlineorder,ordercodes,function(err,msg){
            if(!err){
                var orderOrGroupCode=msg[1];
                posService.payComplete(orderOrGroupCode,null,function(err,msg){
                    if(!err){
                        res.send({status:true,data:msg});
                    }
                    else{
                        res.send({status:false,data:err});
                    }
                })
            }
            else{
                res.send({status:false,data:err});
            }
        })
    }
    else{
        payService.payPrepare(isonlineorder,ordercodes,function(err,msg){
            if(!err){
                var orderOrGroupCode=msg[1];
                payService.payComplete(orderOrGroupCode,null,function(err,msg){
                    if(!err){
                        res.send({status:true,data:msg});
                    }
                    else{
                        res.send({status:false,data:err});
                    }
                })
            }
            else{
                res.send({status:false,data:err});
            }
        })
    }
});

router.get('/businessSetting', auth.authority, function (req, res) {
    res.render('super/businessSetting');
});

router.get('/modifyBusinessSetting', auth.authority, function (req, res) {
    var getParams= require('url').parse(req.url,true).query;
//    console.log(getParams);
    var key="paymentExpireTime";
    var value=getParams.paymentExpireTime;
    superService.modifyBusinessSetting(key,value,function(err,msg){
        if(!err){
            res.send({status:true,data:"更新业务设置成功"});
        }else{
            res.send({status:false,data:err});
        }
    });
});


//超级管理员重置某个其他管理员的密码
router.get('/resetPwdService',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var superadmin=req.session.usercode;
    var usercode=getParams.USERCODE;
    superService.resetPwd(usercode,superadmin,function(err,msg){
        if(!err){
            res.send({status:true,data:msg});
        }
        else{
            res.send({status:false,data:err});
        }
    });
});

router.get('/addAppActivity',auth.authority, function(req, res) {
    res.render('super/addAppActivity');
});

router.post('/addAppActivityService',auth.authority, function(req, res) {
    //res.render('super/addAppActivity');
    var form = new multiparty.Form({uploadDir: '../public/upload/app/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if(err){
            console.log('parse error: ' + err);
            res.send({status:false,msg:"处理上传文件出错！"});
            return;
        }
        var options={};
        options.TITLE=fields.TITLE[0];
        options.LASTOPERATEPERSON=req.session.usercode;
        options.DESCRIPTION=fields.DESCRIPTION[0];
        var picurl=fields.PICURL[0];
        if(!picurl||picurl.length<5){
            if(files.PICFILE){
                var inputFile = files.PICFILE[0];
                options.PIC="/upload/app/"+inputFile.fileName;
            }
            //var dstPath = '../public/upload/add/' + inputFile.originalFilename;
            ////判断目标文件是否存在了
            //var exists=fs.existsSync(dstPath);
            //if(exists){
            //    console.log("删除已存在文件");
            //    fs.unlinkSync(dstPath);
            //}
        }else{
            options.PIC=picurl;
        }
        appActivityService.addActivity(options,function(err,msg){
            if(err){
                res.send({status:false,msg:"插入数据库出错！"});
            }else{
                res.send({status:true,msg:"Insert OK！"});
            }
        });
    });
});

router.get('/editAppHome',auth.authority, function(req, res) {
    appActivityService.displayBundles(function(err,msg){
        if(!err){
            res.render('super/editAppHome',{items:msg});
        }else{
            res.send({status:false,msg:"获取Bundle出错了！"});
        }
    });

});

router.get('/addAppBundle',auth.authority, function(req, res) {
    appActivityService.getAll(function(err,msg){
        if(!err){
            res.render('super/addAppBundle',{items:msg});
        }else{
            res.send({status:false,msg:"获取活动出错了！"});
        }
    });

});

router.post('/addAppBundleService',auth.authority, function(req, res) {
    var form = new multiparty.Form({uploadDir: '../public/upload/app/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if(err){
            res.send({status:false,msg:"处理表单出错！"});
            return;
        }
        console.log(fields);
        var options={};
        if(!files.PICFILE1){
            var picurl=fields.PICURL1[0];
            if(!picurl||picurl==''){
                res.send({status:false,msg:"缺少图片信息1！"});
                return;
            }
            options.PIC1=picurl;
        }else{
            var inputFile = files.PICFILE1[0];
            options.PIC1="/upload/app/"+inputFile.fileName;
        }
        options.ACTIVITYID1=fields.AID1[0];
        var bundleType=fields.TYPE[0];
        options.TYPE=bundleType;
        if(bundleType>0){
            if(!files.PICFILE2){
                var picurl2=fields.PICURL2[0];
                if(!picurl2||picurl2==''){
                    res.send({status:false,msg:"缺少图片信息2！"});
                    return;
                }
                options.PIC2=picurl2;
            }else{
                var inputFile2 = files.PICFILE2[0];
                options.PIC2="/upload/app/"+inputFile2.fileName;
            }
            options.ACTIVITYID2=fields.AID2[0];
        }
        if(bundleType>1){
            if(!files.PICFILE3){
                var picurl3=fields.PICURL3[0];
                if(!picurl3||picurl3==''){
                    res.send({status:false,msg:"缺少图片信息3！"});
                    return;
                }
                options.PIC3=picurl3;
            }else{
                var inputFile3 = files.PICFILE3[0];
                options.PIC3="/upload/app/"+inputFile3.fileName;
            }
            options.ACTIVITYID3=fields.AID3[0];
        }
        options.PRIORITY=fields.PRIORITY[0];
        options.STARTTIME=fields.STARTTIME[0];
        options.ENDTIME=fields.ENDTIME[0];
        options.TITLE=fields.TITLE[0];
        options.LASTOPERATEPERSON=req.session.usercode;
        appActivityService.addBundle(options,function(err,msg){
           if(err){
               res.send({status:false,msg:"插入数据库出错！"});
           } else{
               res.send({status:true,msg:"Insert OK！"});
           }
        });
    });
});
router.post('/deleteBundleService',auth.authority, function(req, res) {
    var postParams= req.body;
    var bundleid=postParams.BUNDLEID;
    appActivityService.deleteBundle(bundleid,function(err,msg){
       if(err){
           res.send({status:false,msg:err});
       } else{
           res.send({status:true,msg:"Delete OK！"});
       }
    });
});

router.get('/editAppBundle',auth.authority, function(req, res) {
    var getParams= require('url').parse(req.url,true).query;
    var bundleid=getParams.bundleid;
    if(!bundleid||bundleid==''){
        res.send({status:false,msg:"缺少参数！"});
        return;
    }
    appActivityService.getAll(function(err,msg){
        if(!err){
            appActivityService.getSingleBundle(bundleid,function(err,bundle){
               if(err){
                   res.send({status:false,msg:"获取Bundle出错了！"});
               } else{
                   res.render('super/editAppBundle',{items:msg,bundle:bundle});
               }
            });
        }else{
            res.send({status:false,msg:"获取活动出错了！"});
        }
    });

});

router.post('/editAppBundleService',auth.authority, function(req, res) {
    var form = new multiparty.Form({uploadDir: '../public/upload/app/'});
    //下载后处理
    form.parse(req, function(err, fields, files) {
        if(err){
            res.send({status:false,msg:"处理表单出错！"});
            return;
        }
        var bundleid=fields.BUNDLEID[0];
        var options={};
        if(!files.PICFILE1){
            if(fields.PICURL1&&fields.PICURL1[0].length>=5){
                options.PIC1=fields.PICURL1[0];
            }
        }else{
            var inputFile = files.PICFILE1[0];
            options.PIC1="/upload/app/"+inputFile.fileName;
        }
        options.ACTIVITYID1=fields.AID1[0];
        var bundleType=fields.TYPE[0];
        options.TYPE=bundleType;
        if(bundleType>0){
            if(!files.PICFILE2){
                if(fields.PICURL2&&fields.PICURL2[0].length>=5){
                    options.PIC2=fields.PICURL2[0];
                }
            }else{
                var inputFile2 = files.PICFILE2[0];
                options.PIC2="/upload/app/"+inputFile2.fileName;
            }
            options.ACTIVITYID2=fields.AID2[0];
        }
        if(bundleType>1){
            if(!files.PICFILE3){
                if(fields.PICURL3&&fields.PICURL3[0].length>=5){
                    options.PIC3=fields.PICURL3[0];
                }
            }else{
                var inputFile3 = files.PICFILE3[0];
                options.PIC3="/upload/app/"+inputFile3.fileName;
            }
            options.ACTIVITYID3=fields.AID3[0];
        }
        options.PRIORITY=fields.PRIORITY[0];
        options.STARTTIME=fields.STARTTIME[0];
        options.ENDTIME=fields.ENDTIME[0];
        options.TITLE=fields.TITLE[0];
        options.LASTOPERATEPERSON=req.session.usercode;
        appActivityService.updateBundle(bundleid, options,function(err,msg){
            if(err){
                res.send({status:false,msg:"更新数据库出错！"});
            } else{
                res.send({status:true,msg:"Update OK！"});
            }
        });
    });
});

module.exports = router;