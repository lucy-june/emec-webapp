/**
 * Created by lucywu on 7/11/14.
 * 商品分类相关服务
 */

var mec_itm_categoryDAO = require('../../dao/mec_itm_categoryDAO');
var generalDAO = require("../../dao/generalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var myLogger = require('../../logging/contextLogger')("web/categoryService");
var exhandler = require('../../exception/exhandler');
var cacheObject = require('../../global/cacheObject');
var mec_vi_category_sku_totalDAO = require('../../dao/mec_vi_category_sku_totalDAO');

//根据分类名称获取分类id
exports.getCategoryNameById = function (categoryid, cb) {
    if (cacheObject.categoryId2Name) {
        var categoryname = cacheObject.categoryId2Name[categoryid];
        myLogger.trace("getCategoryNameById [categoryname]: " + categoryname);
        cb(null, categoryname);
        return;
    }
    mec_itm_categoryDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            cacheObject.categoryId2Name = {};
            cacheObject.categoryName2Id = {};
            for (var k = 0; k < msg.length; k++) {
                var id = msg[k]["CATEGORYID"];
                var name = msg[k]["CATEGORYNAME"];
                cacheObject.categoryId2Name[id] = name;
                cacheObject.categoryName2Id[name] = id;
            }
            var categoryname = cacheObject.categoryId2Name[categoryid];
            myLogger.trace("getCategoryNameById [categoryname]: " + categoryname);
            cb(null, categoryname);
        }
        else {
            myLogger.error("getCategoryNameById [mec_itm_categoryDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    });
}

//根据分类id获取分类名称
exports.getCategoryIdByName = function (categoryname, cb) {
    if (cacheObject.categoryName2Id) {
        var categoryid = cacheObject.categoryName2Id[categoryname];
        myLogger.trace("getCategoryIdByName [categoryid]: " + categoryid);
        cb(null, categoryid);
        return;
    }
    mec_itm_categoryDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            cacheObject.categoryId2Name = {};
            cacheObject.categoryName2Id = {};
            for (var k = 0; k < msg.length; k++) {
                var id = msg[k]["CATEGORYID"];
                var name = msg[k]["CATEGORYNAME"];
                cacheObject.categoryId2Name[id] = name;
                cacheObject.categoryName2Id[name] = id;
            }
            var categoryid = cacheObject.categoryName2Id[categoryname];
            myLogger.trace("getCategoryIdByName [categoryid]: " + categoryid);
            cb(null, categoryid);
        }
        else {
            myLogger.error("getCategoryIdByName [mec_itm_categoryDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    });
}

//获取每个分类对应的上级分类,上上级分类...
exports.getReverseCategories = function (cb) {
    if (cacheObject.reverseCategoryMap) {
        cb(null, cacheObject.reverseCategoryMap);
        return;
    }
    mec_itm_categoryDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            exhandler(function () {
                var temp = {};
                var ref = [];
                var cur = [];
                for (var k = 0; k < msg.length; k++) {
                    cur.push(msg[k]["CATEGORYID"]);
                    ref.push(msg[k]["SUPERCATEGORYID"]);
                    temp[msg[k]["CATEGORYID"]] = msg[k];
                }
                var result = {};
                for (var k = 0; k < cur.length; k++) {
                    var path = [];

                    path.push(temp[cur[k]]["CATEGORYNAME"]);
                    var parent = temp[cur[k]]["SUPERCATEGORYID"];
                    while (parent) {
                        path.push(temp[parent]["CATEGORYNAME"]);
                        parent = temp[parent]["SUPERCATEGORYID"];
                    }
                    result[temp[cur[k]]["CATEGORYNAME"]] = path;
                }
                cacheObject.reverseCategoryMap = result;
                myLogger.trace("getReverseCategories [reverseCategoryMap]: " + JSON.stringify(result));
                cb(null, result);
            }, function (err) {
                myLogger.error("getReverseCategories [exhandler.err]: " + logErr(err));
                cb(err, null);
            });
        }
        else {
            myLogger.error("getReverseCategories [mec_itm_categoryDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    })
}

//获取原始分类数据
exports.getRawCategories = function(cb){
    mec_itm_categoryDAO.queryAll({attributes:["CATEGORYID","CATEGORYNAME","SUPERCATEGORYID","IMGURL"]},cb);
}

//获取全部分类的map关系
exports.getCategories = function (cb) {
    if (cacheObject.categoryMap) {
        cb(null, cacheObject.categoryMap);
        return;
    }
    mec_itm_categoryDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            exhandler(function () {
                var temp = {};
                var ref = [];
                var cur = [];
                for (var k = 0; k < msg.length; k++) {
                    cur.push(msg[k]["CATEGORYID"]);
                    ref.push(msg[k]["SUPERCATEGORYID"]);
                    temp[msg[k]["CATEGORYID"]] = msg[k];
                }
                var reverses = [];
                for (var k = 0; k < cur.length; k++) {
                    if (ref.indexOf(cur[k]) == -1) {
                        var path = [];

                        path.push(temp[cur[k]]["CATEGORYNAME"]);
                        var parent = temp[cur[k]]["SUPERCATEGORYID"];
                        while (parent) {
                            path.push(temp[parent]["CATEGORYNAME"]);
                            parent = temp[parent]["SUPERCATEGORYID"];
                        }
                        reverses.push(path);
                    }
                }

                var result = {};
                for (var k = 0; k < reverses.length; k++) {
                    var path = reverses[k];
                    var curObj = result;
                    for (var n = path.length - 1; n >= 0; n--) {
                        if (!curObj[path[n]]) curObj[path[n]] = {};
                        curObj = curObj[path[n]];
                    }
                }
                cacheObject.categoryMap = result;
                myLogger.trace("getCategories [categoryMap]: " + JSON.stringify(result));
                cb(null, result);
            }, function (err) {
                myLogger.error("getCategories [exhandler.err]: " + logErr(err));
                cb(err, null);
            });
        }
        else {
            myLogger.error("getCategories [mec_itm_categoryDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    })
}

//获取类目下的商品
exports.getItemsByCategory = function (categoryname,options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    var qry={"where": {CATEGORYNAME:categoryname}, "offset": offset, "limit": limit, "order": order};
    mec_vi_category_sku_totalDAO.queryAndCount(qry, function (err, msg) {
        if (!err) {
            myLogger.trace("getItemsByCategory [mec_vi_category_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
            cb(null, msg);
        }
        else {
            myLogger.error("getItemsByCategory [mec_vi_category_sku_totalDAO.queryAndCount]: " + logErr(err));
            cb(err, null);
        }
    });
}

