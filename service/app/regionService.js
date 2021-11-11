/**
 * Created by lucywu on 7/11/14.
 * 商品分区相关服务
 */

var mec_itm_regionDAO = require('../../dao/mec_itm_regionDAO');
var generalDAO = require("../../dao/generalDAO");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var myLogger = require('../../logging/contextLogger')("web/regionService");
var exhandler = require('../../exception/exhandler');
var cacheObject = require('../../global/cacheObject');
var mec_vi_region_sku_totalDAO = require('../../dao/mec_vi_region_sku_totalDAO');

//根据分区名称获取分区id
exports.getRegionNameById = function (regionid, cb) {
    if (cacheObject.regionId2Name) {
        var regionname = cacheObject.regionId2Name[regionid];
        myLogger.trace("getRegionNameById [regionname]: " + regionname);
        cb(null, regionname);
        return;
    }
    mec_itm_regionDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            cacheObject.regionId2Name = {};
            cacheObject.regionName2Id = {};
            for (var k = 0; k < msg.length; k++) {
                var id = msg[k]["REGIONID"];
                var name = msg[k]["REGIONNAME"];
                cacheObject.regionId2Name[id] = name;
                cacheObject.regionName2Id[name] = id;
            }
            var regionname = cacheObject.regionId2Name[regionid];
            myLogger.trace("getRegionNameById [regionname]: " + regionname);
            cb(null, regionname);
        }
        else {
            myLogger.error("getRegionNameById [mec_itm_regionDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    });
}

//根据分区id获取分区名称
exports.getRegionIdByName = function (regionname, cb) {
    if (cacheObject.regionName2Id) {
        var regionid = cacheObject.regionName2Id[regionname];
        myLogger.trace("getRegionIdByName [regionid]: " + regionid);
        cb(null, regionid);
        return;
    }
    mec_itm_regionDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            cacheObject.regionId2Name = {};
            cacheObject.regionName2Id = {};
            for (var k = 0; k < msg.length; k++) {
                var id = msg[k]["REGIONID"];
                var name = msg[k]["REGIONNAME"];
                cacheObject.regionId2Name[id] = name;
                cacheObject.regionName2Id[name] = id;
            }
            var regionid = cacheObject.regionName2Id[regionname];
            myLogger.trace("getRegionIdByName [regionid]: " + regionid);
            cb(null, regionid);
        }
        else {
            myLogger.error("getRegionIdByName [mec_itm_regionDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    });
}

//获取每个分区对应的上级分区,上上级分区...
exports.getReverseCategories = function (cb) {
    if (cacheObject.reverseRegionMap) {
        cb(null, cacheObject.reverseRegionMap);
        return;
    }
    mec_itm_regionDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            exhandler(function () {
                var temp = {};
                var ref = [];
                var cur = [];
                for (var k = 0; k < msg.length; k++) {
                    cur.push(msg[k]["REGIONID"]);
                    ref.push(msg[k]["SUPERREGIONID"]);
                    temp[msg[k]["REGIONID"]] = msg[k];
                }
                var result = {};
                for (var k = 0; k < cur.length; k++) {
                    var path = [];

                    path.push(temp[cur[k]]["REGIONNAME"]);
                    var parent = temp[cur[k]]["SUPERREGIONID"];
                    while (parent) {
                        path.push(temp[parent]["REGIONNAME"]);
                        parent = temp[parent]["SUPERREGIONID"];
                    }
                    result[temp[cur[k]]["REGIONNAME"]] = path;
                }
                cacheObject.reverseRegionMap = result;
                myLogger.trace("getReverseCategories [reverseRegionMap]: " + JSON.stringify(result));
                cb(null, result);
            }, function (err) {
                myLogger.error("getReverseCategories [exhandler.err]: " + logErr(err));
                cb(err, null);
            });
        }
        else {
            myLogger.error("getReverseCategories [mec_itm_regionDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    })
}

//获取全部分区的map关系
exports.getCategories = function (cb) {
    if (cacheObject.regionMap) {
        cb(null, cacheObject.regionMap);
        return;
    }
    mec_itm_regionDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            exhandler(function () {
                var temp = {};
                var ref = [];
                var cur = [];
                for (var k = 0; k < msg.length; k++) {
                    cur.push(msg[k]["REGIONID"]);
                    ref.push(msg[k]["SUPERREGIONID"]);
                    temp[msg[k]["REGIONID"]] = msg[k];
                }
                var reverses = [];
                for (var k = 0; k < cur.length; k++) {
                    if (ref.indexOf(cur[k]) == -1) {
                        var path = [];

                        path.push(temp[cur[k]]["REGIONNAME"]);
                        var parent = temp[cur[k]]["SUPERREGIONID"];
                        while (parent) {
                            path.push(temp[parent]["REGIONNAME"]);
                            parent = temp[parent]["SUPERREGIONID"];
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
                cacheObject.regionMap = result;
                myLogger.trace("getCategories [regionMap]: " + JSON.stringify(result));
                cb(null, result);
            }, function (err) {
                myLogger.error("getCategories [exhandler.err]: " + logErr(err));
                cb(err, null);
            });
        }
        else {
            myLogger.error("getCategories [mec_itm_regionDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    })
}

//获取类目下的商品
exports.getItemsByRegion = function (regionname,options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    var qry={"where": {REGIONNAME:regionname}, "offset": offset, "limit": limit, "order": order};
    mec_vi_region_sku_totalDAO.queryAndCount(qry, function (err, msg) {
        if (!err) {
            myLogger.trace("getItemsByRegion [mec_vi_region_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
            cb(null, msg);
        }
        else {
            myLogger.error("getItemsByRegion [mec_vi_region_sku_totalDAO.queryAndCount]: " + logErr(err));
            cb(err, null);
        }
    });
}

//获取原始分区数据
exports.getRawRegions = function(cb){
    mec_itm_regionDAO.queryAll({attributes:["REGIONID","REGIONNAME","SUPERREGIONID","IMGURL"]},cb);
}