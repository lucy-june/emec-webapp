 /**
 * Created by lucywu on 7/17/14.
 * sequelize数据库访问基对象
 */

//表中必须包含createdAt与updatedAt列并且不允许为null.但是orm中可以不包含这两个字段，orm中json对列名字的解析是区分大小写的
//下面所有的json字段大小写必须与orm映射中的字段对应，表名可以不区分大小写
//orm映射字段与表中字段可以大小写不同
var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var config          = require('../config/mysqlConfig.json')[node_env];
var Sequelize       = require('sequelize');

var sequelize = new Sequelize(
    config.database,
    config.username,
    config.password,
    {
        host: config.host,
        port: config.port,
        timezone : config.timezone,
        dialect: config.dialect,
        // use pooling in order to reduce db connection overload and to increase speed
        // currently only for mysql and postgresql (since v1.5.0)
        pool: {
            maxConnections: config.maxConnections,
            maxIdleTime: config.maxIdleTime
        }
    }
);

module.exports=sequelize;


