/**
 * Created by YuanBo on 15-1-19.
 */
var express             = require('express');
var router              = express.Router();


router.get('/',function(req,res) {
    res.render('forapp/editHome',{});
});
router.get('/list',function(req,res) {
    res.render('forapp/editList',{});
});

module.exports = router;