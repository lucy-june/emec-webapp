/**
 * Created by lucywu on 7/9/14.
 */
var express             = require('express');
var alipayService        = require('../../service/app/alipayService');
var myLogger            = require('../../logging/contextLogger')("app/alipayRouter");
var router              = express.Router();


module.exports = router;
