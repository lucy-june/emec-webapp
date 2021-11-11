/**
 * Created by legend on 9/29/14.
 */
var express             = require('express');
var analysisService    = require('../../service/app/analysisService');
var router              = express.Router();
var myLogger            = require('../../logging/contextLogger')("app/analysisRouter");

router.get('/getHotSearch', function(req, res) {
    analysisService.getHotSearch(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getHotBrands', function(req, res) {
    analysisService.getHotBrands(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

router.get('/getHotBuys', function(req, res) {
    analysisService.getHotBuys(function(err,msg){
        res.setHeader('content-type','text/html; charset=UTF-8');
        res.end(JSON.stringify(msg));
    });
});

module.exports = router;