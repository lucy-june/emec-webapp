/**
 * Created by YuanBo on 14-8-1.
 */
var express             = require('express');
var otherService        = require('../../service/web/otherService');
var auth                = require('../../security/auth');
var router              = express.Router();
var myLogger                    = require('../../logging/contextLogger')("web/otherRouter");

router.get('/queryMerchantService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    otherService.queryMerchantService(data,res);
});

router.get('/queryBrandService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    otherService.queryBrandService(data,res);
});

router.get('/queryItemtypeService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    otherService.queryItemtypeService(data,res);
});

router.get('/queryRetailtypeService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    otherService.queryRetailtypeService(data,res);
});

router.get('/queryAgentService',auth.authority, function(req, res) {
    var data = require('url').parse(req.url,true).query;
    otherService.queryAgentService(data,res);
});


module.exports = router;