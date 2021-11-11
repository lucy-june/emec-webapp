/**
 * Created by lucywu on 7/11/14.
 */
var express             = require('express');
var regionService        = require('../../service/app/regionService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/regionRouter");

router.get('/getAllRaw', function(req, res) {
    regionService.getRawRegions(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getAllReverse', function(req, res) {
    regionService.getReverseCategories(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getAll', function(req, res) {
    regionService.getCategories(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getItems', function(req, res) {
    var getParams = require('url').parse(req.url,true).query;
    myLogger.trace("get [/getItems by region]: "+JSON.stringify(getParams));
    var region=getParams.region;
    var options={};
    options.page=getParams.page;
    options.rows=getParams.num;

    regionService.getItemsByRegion(region,options,function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.send(JSON.stringify(msg));
    });
});

module.exports = router;
