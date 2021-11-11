/**
 * Created by LiJunnan on 2014/12/3.
 */

var express = require('express');
var auth    = require('../../security/auth');
var router  = express.Router();
var behaviorService = require('../../service/app/behaviorService');
var myLogger = require('../../logging/contextLogger')("behaviorRouter");

//收藏商品
router.post('/favoriteItem', function (req, res) {
    myLogger.trace("post [/favoriteItem]: " + JSON.stringify(req.body));
    var op=req.body.op;
    var usercode = req.body.usercode;
    var itemcode = req.body.itemcode;
    behaviorService.favoriteItem(op,usercode, itemcode, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else if(msg == 2) {
            res.send({status:true, data: "del"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功添加收藏,  2:成功取消收藏
    });
});

//添加收藏商品
router.post('/addFavoriteItem', function (req, res) {
    myLogger.trace("post [/addFavoriteItem]: " + JSON.stringify(req.body));
    var usercode = req.body.usercode;
    var itemcode = req.body.itemcode;
    behaviorService.favoriteItem("add",usercode, itemcode, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else if(msg == 2) {
            res.send({status:true, data: "del"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功添加收藏,  2:成功取消收藏
    });
});

//删除收藏商品
router.post('/delFavoriteItem', function (req, res) {
    myLogger.trace("post [/delFavoriteItem]: " + JSON.stringify(req.body));
    var usercode = req.body.usercode;
    var itemcode = req.body.itemcode;
    behaviorService.favoriteItem("del",usercode, itemcode, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else if(msg == 2) {
            res.send({status:true, data: "del"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功添加收藏,  2:成功取消收藏
    });
});

//收藏品牌
router.post('/favoriteBrand', function (req, res) {
    myLogger.trace("post [/favoriteBrand]: " + JSON.stringify(req.body));
    var op=req.body.op;
    var usercode = req.body.usercode;
    var brandcode = req.body.brandcode;
    behaviorService.favoriteBrand(op,usercode, brandcode, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else if(msg == 2) {
            res.send({status:true, data: "del"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功添加收藏,  2:成功取消收藏
    });
});

//添加收藏品牌
router.post('/addFavoriteBrand', function (req, res) {
    myLogger.trace("post [/addFavoriteBrand]: " + JSON.stringify(req.body));
    var usercode = req.body.usercode;
    var brandcode = req.body.brandcode;
    behaviorService.favoriteBrand("add",usercode, brandcode, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else if(msg == 2) {
            res.send({status:true, data: "del"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功添加收藏,  2:成功取消收藏
    });
});

//删除收藏品牌
router.post('/delFavoriteBrand', function (req, res) {
    myLogger.trace("post [/delFavoriteBrand]: " + JSON.stringify(req.body));
    var usercode = req.body.usercode;
    var brandcode = req.body.brandcode;
    behaviorService.favoriteBrand("del",usercode, brandcode, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else if(msg == 2) {
            res.send({status:true, data: "del"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功添加收藏,  2:成功取消收藏
    });
});

//获取收藏的商品
router.get('/getFavorItem', function (req, res) {
    var getParams= require('url').parse(req.url, true).query;
    myLogger.trace("get [/getFavorItem]: " + JSON.stringify(getParams));
    var usercode = getParams.usercode;
    //如果没传设置值则使用默认值
    var rows = getParams.rows || 10;
    var page = getParams.page || 1;
    var sidx = getParams.sidx || "CREATETIME";
    var sord = getParams.sord || "desc";

    behaviorService.getFavorItem(usercode, {rows: rows, page: page, sidx: sidx, sord: sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows) + (msg.count%rows==0?0:1);
            var result = {status:true, total:total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({status: false, data:err});
        }
    });
});

//获取收藏的品牌
router.get('/getFavorBrand', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getFavorBrand]: " + JSON.stringify(getParams));
    var usercode = getParams.usercode;
    //如果没传设置值则使用默认值
    var rows = getParams.rows || 10;
    var page = getParams.page || 1;
    var sidx = getParams.sidx || "createdAt";
    var sord = getParams.sord || "desc";

    behaviorService.getFavorBrand(usercode, {rows: rows, page: page, sidx: sidx, sord: sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows) + (msg.count%rows==0?0:1);
            var result = {status:true, total:total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({status: false, data:err});
        }
    });
});

//对线上商品评论
router.post('/onlineComment', function (req, res) {
    myLogger.trace("post [/onlineComment]: " + JSON.stringify(req.body));
    var usercode = req.body.usercode;
    var contentcode = req.body.contentcode;
    var star = req.body.star;
    var comment = req.body.comment;
    behaviorService.onlineComment(usercode, contentcode, star, comment, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功评论
    });
});

//对线下商品评论
router.post('/offlineComment', function (req, res) {
    myLogger.trace("post [/offlineComment]: " + JSON.stringify(req.body));
    var usercode = req.body.usercode;
    var contentcode = req.body.contentcode;
    var star = req.body.star;
    var comment = req.body.comment;
    behaviorService.offlineComment(usercode, contentcode, star, comment, function (msg) {
        if(msg == 1) {
            res.send({status:true, data: "add"});
        } else {
            res.send({status:false, data:null});
        }
        //msg: 0:出错, 1:成功评论
    })
});

//获取商品的评论
router.get('/getComment', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getComment]: " + JSON.stringify(getParams));
    var itemcode = getParams.itemcode;
    var rows = getParams.rows || 10;
    var page = getParams.page || 1;
    var sidx = getParams.sidx || "createdAt";
    var sord = getParams.sord || "desc";

    behaviorService.getComment(itemcode, {rows: rows, page: page, sidx: sidx, sord: sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows)  + (msg.count%rows==0?0:1);
            var result = {status:true, total:total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({status: false, data:err});
        }
    });
});

//获取商品的好评论
router.get('/getCommentGood', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getComment]: " + JSON.stringify(getParams));
    var itemcode = getParams.itemcode;
    var rows = getParams.rows || 10;
    var page = getParams.page || 1;
    var sidx = getParams.sidx || "createdAt";
    var sord = getParams.sord || "desc";

    behaviorService.getCommentGood(itemcode, {rows: rows, page: page, sidx: sidx, sord: sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows)  + (msg.count%rows==0?0:1);
            var result = {status:true, total:total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({status: false, data:err});
        }
    });
});

//获取商品的中评论
router.get('/getCommentMid', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getComment]: " + JSON.stringify(getParams));
    var itemcode = getParams.itemcode;
    var rows = getParams.rows || 10;
    var page = getParams.page || 1;
    var sidx = getParams.sidx || "createdAt";
    var sord = getParams.sord || "desc";

    behaviorService.getCommentMid(itemcode, {rows: rows, page: page, sidx: sidx, sord: sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows)  + (msg.count%rows==0?0:1);
            var result = {status:true, total:total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({status: false, data:err});
        }
    });
});

//获取商品的差评论
router.get('/getCommentBad', function (req, res) {
    var getParams = require('url').parse(req.url, true).query;
    myLogger.trace("get [/getComment]: " + JSON.stringify(getParams));
    var itemcode = getParams.itemcode;
    var rows = getParams.rows || 10;
    var page = getParams.page || 1;
    var sidx = getParams.sidx || "createdAt";
    var sord = getParams.sord || "desc";

    behaviorService.getCommentBad(itemcode, {rows: rows, page: page, sidx: sidx, sord: sord}, function (err, msg) {
        if(!err) {
            var total = Math.floor(msg.count/rows)  + (msg.count%rows==0?0:1);
            var result = {status:true, total:total, records:msg.count, page:page, rows:msg.rows};
            res.send(result);
        } else {
            res.send({status: false, data:err});
        }
    });
});

module.exports = router;

