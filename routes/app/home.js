/**
 * Created by YuanBo on 15-1-19.
 */
var express             = require('express');
var router              = express.Router();
var appActivityService=require('../../service/web/appActivityService');

router.get('/old',function(req,res) {
    res.render('forapp/home',{});
});

router.get('/',function(req,res) {
    appActivityService.getAllBundles(function(err,msg){
        if(!err){
            res.render('forapp/home_new',{items:msg});
        }else{
            res.send({status:false,msg:err});
        }

    });
});

router.get('/list',function(req,res) {
    res.render('forapp/list',{});
});
module.exports = router;