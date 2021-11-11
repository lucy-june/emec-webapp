/**
 * Created by lucywu on 5/25/14.
 * ssl私钥与证书
 */
var fs = require('fs');

module.exports={
    key: fs.readFileSync('../security/keys/privatekey.pem'),
    cert: fs.readFileSync('../security/keys/certificate.pem')
}