/**
 * Created by lucywu on 7/11/14.
 * 通用数据库访问函数(其中add与update的value参数中允许包含不是属于数据表的冗余字段)
 */

//根据系统环境载入我们的配置
var node_env = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var config = require('../config/mysqlConfig.json')[node_env];
var sequelize = require('./_sequelize');
var myLogger    = require('../logging/contextLogger')('generalDAO');


//表同步，只管表是否存在，不管表内字段是否相同
exports.sync = function (cb) {
    sequelize.sync().success(function () {
        cb(null, true);
    }).error(function (err) {
        myLogger.error(err);
        cb(err, null);
    })
}

//执行sql(无论sql中是否加limit1返回始终是数组类型) 注意options必须是{}对象
exports.runSql = function (sql, options, cb) {
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    options.raw=true;
    sequelize.query(sql, null, options).success(function (res) {
        cb(null, res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err, null);
    })
}

//查1个
exports.queryOne = function(table,qry,options,cb){
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    options.raw=true;
    table.find(qry,options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err);
    })
}

//查
exports.queryAll = function(table,qry,options,cb){
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    options.raw=true;
    table.findAll(qry,options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err);
    })
}

//查limit限制部分并且返回全部个数
exports.queryAndCount = function(table,qry,options,cb){
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    options.raw=true;
    table.findAndCountAll(qry,options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err);
    })
}

//增
exports.add = function(table,value,options,cb){
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    table.create(value, options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err);
    })
}

//删
exports.del = function(table,where,options,cb){
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    table.destroy(where, options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err);
    })
}

//改
exports.update = function(table,value,where,options,cb){
    if(typeof(options)=='function') {
        cb=options;
        options=null;
    }
    options= options ||{};
    table.update(value,where, options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        myLogger.error(err);
        cb(err);
    })
}