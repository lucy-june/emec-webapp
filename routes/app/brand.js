/**
 * Created by Legend on 2015/4/3.
 */
var express             = require('express');
var brandService     = require('../../service/app/brandService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/categoryRouter");

router.get('/getAll', function(req, res) {
    brandService.getAllBrands(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getAllByLetter', function(req, res) {
   brandService.getAllBrandsByLetter(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getBrandByLetter', function(req, res) {
    var getParams = require('url').parse(req.url,true).query;
    var letter=getParams.letter;
    if(letter!='1'){
        letter=letter.toUpperCase();
    }else{
        letter='#';
    }
    brandService.getBrandByLetter(letter,function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getBrandByCategoryId', function(req, res) {
    var getParams = require('url').parse(req.url,true).query;
    var categoryid=getParams.categoryid;
    brandService.getBrandByCategoryId(categoryid,function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getRootCategories', function(req, res) {
    brandService.getBrandCategory(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

module.exports = router;