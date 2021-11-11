/**
 * Created by lucywu on 14-12-31.
 */
var crypto = require('crypto');
var ProtoBuf = require("ProtoBuf");

var KEY_LENGTH = 16;
var _key = new Buffer(KEY_LENGTH);
var _iv=new Buffer(KEY_LENGTH);
for (var i=0; i<KEY_LENGTH; ++i) {
    _key[i] = 32 + i;
    _iv[i] = 0;
}

exports.generate= function(key,iv,packageName,messageName,protoName,protoContent){
    key=key||_key;
    iv=iv||_iv;

// prepare proto
    var builder = ProtoBuf.loadProtoFile('../util/'+protoName),
        protoPackage = builder.build(packageName),
        protoMessage = protoPackage[messageName];

// prepare content
    var content = new protoMessage(protoContent);
    var buffer = content.encode();

// encrypt content data
    var cipher = crypto.createCipheriv('aes-128-cbc',key,iv);
    var cipherChunks = [];
    cipherChunks.push(cipher.update(buffer.toBuffer(),'binary','binary'));
    cipherChunks.push(cipher.final('binary'));

    return cipherChunks.join("");
};

exports.generate2= function(key,iv,packageName,messageName,protoName,protoContent){
// prepare proto
    var builder = ProtoBuf.loadProtoFile('../util/'+protoName),
        protoPackage = builder.build(packageName),
        protoMessage = protoPackage[messageName];

// prepare content
    var content = new protoMessage(protoContent);
    var buffer = content.encode();

    return buffer.toBuffer();
};

exports.convert=function(str,key,iv){
    key=key||_key;
    iv=iv||_iv;
    var cipher = crypto.createCipheriv('aes-128-cbc',key,iv);
    var cipherChunks = [];
    cipherChunks.push(cipher.update(new Buffer(str),'binary','binary'));
    cipherChunks.push(cipher.final('binary'));

    return cipherChunks.join("");
}


//var protoContent={
//    "salemancode": 123456,
//    "salemanname": "haha",
//    "items":[
//        {
//        "itemcode": "000001",
//        "cabinet" : "000666",
//        "unit": "个",
//        "promotioncode": "A",
//        "itemname": "first",
//        "count": 2.50,
//        "oriprice": 3.00,
//        "discountprice":2.68,
//        "discount": "---",
//        "actualprice": 6.78
//        },
//        {
//            "itemcode": "000002",
//            "cabinet" : "000666",
//            "unit": "个",
//            "promotioncode": "A",
//            "itemname": "1中文2",
//            "count": 13.50,
//            "oriprice": 13.00,
//            "discountprice":10.00,
//            "discount": "---",
//            "actualprice": 135.00
//        }
//    ]
//};
//console.log(exports.generate(null,null,"sale","order","sale.order.proto",protoContent));

//var s="12345";
//var x=new Buffer(s);
//console.log(x);
//console.log(new Buffer(s));
//console.log(Array.prototype.slice.call(x, 0));



//console.log(exports.convert("12345"));