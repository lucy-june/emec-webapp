/**
 * Created by lucywu on 5/25/14.
 * url访问日志
 */
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var logConfig          = require('../config/logConfig.json')[node_env];
var fs = require('fs');
var FileStreamRotator = require('file-stream-rotator');

//if (!fs.existsSync(logConfig["accessLogPath"].replace("\access.log",""))) fs.mkdirSync(logConfig["accessLogPath"].replace("\access.log",""));
//var accessLogfile = fs.createWriteStream(logConfig["accessLogPath"] , {flags: 'a'});

var logDirectory=logConfig["accessLogPath"].replace("\access.log","");

// ensure log directory exists
fs.existsSync(logDirectory) || fs.mkdirSync(logDirectory)

// create a rotating write stream
var accessLogfile = FileStreamRotator.getStream({
    filename: logDirectory + '/access.log',
    frequency: 'daily',
    verbose: false
})

var schema={
    format:'[:date] [:remote-addr] :method :url :status :response-time ms [:user-agent] :http-version',
    stream:accessLogfile
};

module.exports=schema;