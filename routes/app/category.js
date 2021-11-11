/**
 * Created by lucywu on 7/11/14.
 */
var express             = require('express');
var categoryService     = require('../../service/app/categoryService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/categoryRouter");

router.get('/getAllRaw', function(req, res) {
    categoryService.getRawCategories(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getAllReverse', function(req, res) {
    categoryService.getReverseCategories(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getAll', function(req, res) {
    categoryService.getCategories(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getItems', function(req, res) {
    var getParams = require('url').parse(req.url,true).query;
    myLogger.trace("get [/getItems by category]: "+JSON.stringify(getParams));
    var category=getParams.category;
    var options={};
    options.page=getParams.page;
    options.rows=getParams.num;

    categoryService.getItemsByCategory(category,options,function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.send(JSON.stringify(msg));
    });
});


module.exports = router;
