/**
 * Created by lucywu on 5/25/14.
 */
var contextLogger=require('../logging/contextLogger');

//全局process监听uncaughtException事件,处理所有未处理的异常
process.on('uncaughtException', function(err) {
    var myLogger=contextLogger("uncaught","ERROR");
    myLogger.error(err);
});
