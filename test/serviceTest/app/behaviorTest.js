/**
 * Created by LiJunnan on 2014/12/8.
 */

var behaviorService = require('../../../service/app/behaviorService');

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

//测试收藏和取消收藏商品
//behaviorService.favoriteItem("legend", "1518511", function (msg) {
//    console.log(msg);
//});
//
//behaviorService.favoriteItem("legend", "1525208", function (msg) {
//    console.log(msg);
//});
//
//behaviorService.favoriteItem("legend", "1518207", function (msg) {
//    console.log(msg);
//});
//
//behaviorService.favoriteItem("add","legend", "0000333", function (msg) {
//    console.log(msg);
//});

//behaviorService.favoriteItem("del","legend", "0000333", function (msg) {
//    console.log(msg);
//});

//behaviorService.favoriteItem("add","legend", "1525244", function (msg) {
//    console.log(msg);
//});
//
//behaviorService.favoriteItem("del","legend", "1525244", function (msg) {
//    console.log(msg);
//});

//behaviorService.favoriteItem("legend", "1525233", function (msg) {
//    console.log(msg);
//});

//测试收藏和取消收藏品牌
//behaviorService.favoriteBrand("legend", "hello", function (msg) {
//    console.log(msg);
//});
//
//behaviorService.favoriteBrand("legend", "hi", function (msg) {
//    console.log(msg);
//});

//测试评论online商品
//behaviorService.onlineComment("legend2", "11409168851100000038761006", 4, "seems good", function (msg) {
//    console.log(msg);
//});

//测试评论offline商品
//behaviorService.offlineComment("offlinetest3", "01410066472800022431191002", 4, "good", function (msg) {
//    console.log(msg);
//});

//测试获取收藏商品
//behaviorService.getFavorItem("legend", {}, function (err, msg) {
//    if(!err) {
//        console.log(msg);
//    } else {
//        console.log(err);
//    }
//});

//测试获取收藏品牌
//behaviorService.getFavorBrand("legend", {}, function (err, msg) {
//    if(!err) {
//        console.log(msg);
//    } else {
//        console.log(err);
//    }
//});

////测试获取评论
//behaviorService.getComment("1518506", {}, function (err, msg) {
//    if(!err) {
//        console.log(msg);
//    } else {
//        console.log(err);
//    }
//});

//behaviorService.getCommentGood("1518506", {}, function (err, msg) {
//    if(!err) {
//        console.log(msg);
//    } else {
//        console.log(err);
//    }
//});

//behaviorService.getCommentMid("1518506", {}, function (err, msg) {
//    if(!err) {
//        console.log(msg);
//    } else {
//        console.log(err);
//    }
//});

//behaviorService.getCommentBad("1518506", {}, function (err, msg) {
//    if(!err) {
//        console.log(msg);
//    } else {
//        console.log(err);
//    }
//});