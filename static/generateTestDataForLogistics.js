/**
 * Created by lucywu on 10/21/14.
 */
var async                       = require('async');
var Sequelize                   = require('sequelize');
var sequelize                   = require('../dao/_sequelize');
var generalDAO                  = require('../dao/generalDAO');
var vie_logisticsprepareDAO     = require("../dao/vie_logisticsprepareDAO");
var packagesDAO                 = require("../dao/packagesDAO");
var packagedetailsDAO           = require("../dao/packagedetailsDAO");
var package_logsDAO             = require("../dao/package_logsDAO");

sequelize.transaction(function(t) {
    async.waterfall([
        function(cb) {//在待物流管理的订单信息中获取所有可以的不同分包
            generalDAO.t_runSql("select * from vie_logisticsprepare group by ORDERID,COUNTERCODE;",t,cb);
//            vie_logisticsprepareDAO.t_query({},t,cb);
        },
        function(x,cb) {
            async.parallel([
                function(cb) {//生成lgt_packages表的测试数据
                    async.forEach(x,function(record,callback){
                        record["PACKAGEID"]=record["ORDERID"]+"-"+record["COUNTERCODE"];
                        record["STATE"]=0;
                        record["POSITION"]="";
                        packagesDAO.t_add(record,t,callback);
                    },cb)
                },
                function(cb) {//生成lgt_package_logs表的测试数据
                    async.forEach(x,function(record,callback){
                        record["PACKAGEID"]=record["ORDERID"]+"-"+record["COUNTERCODE"];
                        record["STATE"]=0;
                        record["POSITION"]="";
                        record["OPERATION"]=0;
                        record["OPERATEPERSON"]="";

                        package_logsDAO.t_add(record,t,callback);
                    },cb)
                },
                function(cb) {//生成lgt_packagedetails表的测试数据
                    async.forEach(x,function(record,callback){//对于每一个分包
                        var packageid=record["ORDERID"]+"-"+record["COUNTERCODE"];
                        var orderid=record["ORDERID"];
                        var countercode=record["COUNTERCODE"];

                        async.waterfall([
                            function(cb) {//查询分包内的所有orderdetails
                                vie_logisticsprepareDAO.t_query({where:{"COUNTERCODE":countercode,"ORDERID":orderid}},t,cb);
                            },
                            function(x,cb){//逐一插入
                                async.forEach(x,function(record,callback){
                                    record["PACKAGEID"]=packageid;
                                    packagedetailsDAO.t_add(record,t,callback);
                                },cb);
                            }
                        ],callback);
                    },cb)
                }
            ], cb);
        }
    ], function(err, results) {
        if(err) t.rollback();
        else t.commit();
        console.log(results);
    });
});



