/**
 * Created by Legend on 2015/3/24.
 */
var express = require('express');
var router = express.Router();
var auth = require('../../security/auth');

var ukeyInfo={};
exports.ukeyInfo=ukeyInfo;

router.get('/test', function(req, res) {
    var item={};
    item.keyid="1234";
    item.publickey="kkkkkk";
    item.lasttime=123456;
    ukeyInfo.key1=item;
    var item1={};
    item1.keyid="1234";
    item1.publickey="kkkkkk";
    item1.lasttime=123456;
    ukeyInfo.key2=item1;
    for(var p in ukeyInfo){
        console.log(ukeyInfo[p].keyid);
        console.log(p.publickey);
    }
    res.send({'length':ukeyInfo.length,'key1id':ukeyInfo.key1.keyid,'key01':ukeyInfo[1]});
});

router.post("/itsme",auth.authority, function(req,res){

});

module.exports = router;