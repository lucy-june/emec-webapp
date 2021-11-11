/**
 * Created by lucywu on 12/4/14.
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var imgserverConfig = require('../config/imgserverConfig.json')[node_env];
var httpRequest    = require('../util/httpRequest');
var stringUtil      = require('../util/stringUtil');

var host=imgserverConfig.host;
var port=imgserverConfig.port;

exports.getImgpreviewsStored=function(itemcode,cb){
    var base="http://robohash.org/"+itemcode+"/imgpreview/";
    console.log(itemcode);
    var num=stringUtil.hashNumber(itemcode,5)%17+5;
    console.log(num);
    var imgs=[];
    for(var k=0;k<num;k++){
        imgs.push(base+k);
    }
    console.log(imgs);
    cb(null,imgs);
}

exports.getImgdetailsStored=function(itemcode,cb){
    var base="http://robohash.org/"+itemcode+"/imgdetail/";
    console.log(itemcode);
    var num=stringUtil.hashNumber(itemcode,5)%17+5;
    console.log(num);
    var imgs=[];
    for(var k=0;k<num;k++){
        imgs.push(base+k);
    }
    console.log(imgs);
    cb(null,imgs);
}
