/**
 * Created by lucywu on 7/23/14.
 */
var fs = require("fs");
var crypto = require('crypto');
var key = fs.readFileSync('../security/keys/ca-cert.pem').toString();
var iv ="1234567890000000";
var cryptkey = crypto.createHash('sha256').update(key).digest();

//解密
exports.dec = function decode(secretdata) {
    var
        decipher = crypto.createDecipheriv('aes-256-cbc', cryptkey, iv),
        decoded  = decipher.update(secretdata, 'base64', 'utf8');

    decoded += decipher.final( 'utf8' );
    return decoded;
}

//加密
exports.enc = function encode(cleardata) {
    var
        encipher = crypto.createCipheriv('aes-256-cbc', cryptkey, iv),
        encoded  = encipher.update(cleardata, 'utf8', 'base64');

    encoded += encipher.final( 'base64' );
    return encoded;
}

var str="OUEHeAbZTyPofPT8GzqN+Yt55lo+6I4Rz/BWbHWg7oU0DK6k7nw/NxjI1QhIifP10IAY6jL/wt/XozRNkpnZOewgRoVrxHPL6Rs9S2UdtbnE4S8V/OnJses0mnc3lZyv";
console.log(exports.dec(str));