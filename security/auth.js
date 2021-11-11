/**
 * Created by lucywu on 7/6/14.
 * 验证登录身份和系统权限
 */
var authSetting = require("../global/authSetting");

exports.forward = function(req, res, next) {
    //if (!checkAuthenticate(req)) {
    //    next();
    //} else {
    //    res.writeHead(200, {'Content-Type': 'text/html; charset=UTF-8'});
    //    var html = '<html><body> <script> top.location.href="/main";</script></body></html>';
    //    res.end(html);
    //}
    next();
}

//测试用删除了权限检查
//exports.backward = function(req, res, next) { next();}

exports.backward = function(req, res, next) {
    //if (!checkAuthenticate(req)) {
    //    res.writeHead(200, {'Content-Type': 'text/html; charset=UTF-8'});
    //    var html = '<html><body> <script> top.location.href="/";</script></body></html>';
    //    res.end(html);
    //} else {
    //    next();
    //}
    next();
}

exports.authority = function(req, res, next){
    //if (!checkAuthenticate(req)) {
    //    res.writeHead(200, {'Content-Type': 'text/html; charset=UTF-8'});
    //    var html = '<html><body> <script> top.location.href="/";</script></body></html>';
    //    res.end(html);
    //}
    //else{
    //    if(!checkAuthority(req)){
    //        res.writeHead(403, {'Content-Type': 'text/html; charset=UTF-8'});
    //        res.end("无权访问!");
    //    }
    //    else{
    //        next();
    //    }
    //}
    next();
}

var checkAuthenticate = function(req){
    if (!req.session.usercode) {
        return false;
    }
    else{
        return true;
    }
}

var checkAuthority = function(req){
    return true;
}
