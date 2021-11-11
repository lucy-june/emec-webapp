//根据系统环境载入我们的配置
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var config          = require('../config/mysqlConfig.json')[node_env];
var sequelize       = require('./_sequelize');

var model= require('../model/mec_vi_online_prepared_sku_total.json');
var table = sequelize.define('mec_vi_online_prepared_sku_total',model,{freezeTableName:true,createdAt:false,updatedAt:false});

exports.table=table;

//查1个
exports.queryOne = function(qry,tran,lock,cb){
    var options={raw:true};
    if(typeof(tran)!='function'){
        if(tran) options.transaction=tran;
        if(typeof(lock)!='function'){
            if(lock) options.lock=lock;
        }
        else{
            cb=lock;
        }
    } else{
        cb=tran;
    }
    
    table.find(qry, options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        cb(err,null);
    })
}

//查
exports.queryAll = function(qry,tran,lock,cb){
    var options={raw:true};
    if(typeof(tran)!='function'){
        if(tran) options.transaction=tran;
        if(typeof(lock)!='function'){
            if(lock) options.lock=lock;
        }
        else{
            cb=lock;
        }
    } else{
        cb=tran;
    }
    table.findAll(qry, options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        cb(err,null);
    })
}

//查并计数全部
exports.queryAndCount = function(qry,tran,lock,cb){
    var options={raw:true};
    if(typeof(tran)!='function'){
        if(tran) options.transaction=tran;
        if(typeof(lock)!='function'){
            if(lock) options.lock=lock;
        }
        else{
            cb=lock;
        }
    } else{
        cb=tran;
    }
    table.findAndCountAll(qry, options).success(function(res){
        cb(null,res);
    }).error(function (err) {
        cb(err,null);
    })
}
