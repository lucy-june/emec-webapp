/**
 * Created by Legend on 2015/3/26.
 */

var crypto              = require('crypto');
var ukeyInfo={};
exports.ukeyInfo=ukeyInfo;

exports.checkukey= function(req, res, next){
    //next();
    console.log("进入敏感操作检测"+req.method);
    //var data= req.body.data;
    var sign='';
    if(req.method=="POST"){
        sign=req.body.sign;
    }else{
        sign=require('url').parse(req.url,true).query.sign;
    }
    var publickey=ukeyInfo[req.session.keyid];
    if(!publickey){
        //不应该出现的错误，内存中没有存在该ID的U盾公钥
        console.log("Can't find publickey");
        res.send({status:false,data:"发生了未知错误UKEY！请退出重新登录试试"});
    }
    var verifier = crypto.createVerify("RSA-SHA1");
    //console.log(JSON.stringify(data));
   // verifier.update(JSON.stringify(data));
    verifier.update(req.session.RandomCode+"");
    var ret= verifier.verify(publickey, sign, "base64");
    if(ret){
        console.log("U盾验证成功，离开验证");
        next();
    }else{
        console.log("U盾验证出错啦");
        res.send({status:false,data:"U盾验证出错啦^-^!"});
    }
}