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

//刷新服务器端保存的分区缓存
exports.refreshRegionCache = function (cb) {
    mec_itm_regionDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            exhandler(function () {
                var temp = {};
                var ref = [];
                var cur = [];
                var id2Name={};
                var name2Id={};
                for (var k = 0; k < msg.length; k++) {
                    var id = msg[k]["REGIONID"];
                    var name = msg[k]["REGIONNAME"];
                    id2Name[id] = name;
                    name2Id[name] = id;
                    cur.push(id);
                    ref.push(msg[k]["SUPERREGIONID"]);
                    temp[id] = msg[k];
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
                var resultMap = {};
                for (var k = 0; k < reverses.length; k++) {
                    var path = reverses[k];
                    var curObj = resultMap;
                    for (var n = path.length - 1; n >= 0; n--) {
                        if (!curObj[path[n]]) curObj[path[n]] = {};
                        curObj = curObj[path[n]];
                    }
                }

                cacheObject.regionId2Name = id2Name;
                cacheObject.regionName2Id = name2Id;
                cacheObject.reverseRegionMap = result;
                cacheObject.regionMap = resultMap;

                var regionCache = [
                    cacheObject.regionId2Name,
                    cacheObject.regionName2Id,
                    cacheObject.reverseRegionMap,
                    cacheObject.regionMap
                ];

                myLogger.trace("refreshRegionCache [regionCache]: " + JSON.stringify(regionCache));
                cb(null, regionCache);
            }, function (err) {
                myLogger.error("refreshRegionCache [exhandler.err]: " + logErr(err));
                cb(err, null);
            });
        }
        else {
            myLogger.error("refreshRegionCache [mec_itm_regionDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    })
}

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

//添加分区
exports.addRegion=function(superregionid,regionname,usercode,cb){
    var value={"REGIONNAME":regionname,"SUPERREGIONID":superregionid,"LASTOPERATEPERSON":usercode};
    mec_itm_regionDAO.add(value,function(err,msg){
        if(!err){
            myLogger.trace("addRegion [mec_itm_regionDAO.add]: " + JSON.stringify(msg));
            exports.refreshRegionCache(cb);
        }
        else{
            myLogger.error("addRegion [mec_itm_regionDAO.add]: " + logErr(err));
            cb(err,null);
        }
    });
}

//修改分区
exports.updateRegion=function(regionid,regionname,usercode,cb){
    mec_itm_regionDAO.update({REGIONNAME:regionname},{REGIONID:regionid},function(err,msg){
        if(!err){
            myLogger.trace("updateRegion [mec_itm_regionDAO.update]: " + JSON.stringify(msg));
            exports.refreshRegionCache(cb);
        }
        else{
            myLogger.error("updateRegion [mec_itm_regionDAO.update]: " + logErr(err));
            cb(err,null);
        }
    })
}

//查询一级分区
exports.queryRegion1 = function (cb) {
    mec_itm_regionDAO.queryAll({}, function (err,msg) {
        if(!err){
            if(msg && msg.length>0) {
                var region1 = [];
                var region1id = [];

                for(var k=0; k<msg.length; k++) {
                    if(msg[k]["SUPERREGIONID"] == null) {
                        region1.push(msg[k]["REGIONNAME"]);
                        region1id.push(msg[k]["REGIONID"]);
                    }
                }
                myLogger.trace("queryRegion1 [region1]: "+JSON.stringify(region1));
                myLogger.trace("queryRegion1 [region1id]: "+JSON.stringify(region1id));
                cb(null,{region1:region1,region1id:region1id});
            }
            else{
                myLogger.error("queryRegion1 [mec_itm_regionDAO.query]: "+"no region data found");
                cb("no region data found",null);
            }
        }
        else{
            myLogger.error("queryRegion1 [mec_itm_regionDAO.query]: "+logErr(err));
            cb(err,null);
        }
    });
};

//查询二级分区和三级分区
exports.querySonRegion = function (regionid,cb) {
    myLogger.trace("querySonRegionService [regionid]: "+regionid);
    mec_itm_regionDAO.queryAll({}, function (err,msg) {
        if(!err){
            if(msg && msg.length>0) {
                var sonregion = [];
                var sonregionid = [];
                for(var i=0; i<msg.length; i++) {
                    if(msg[i]["SUPERREGIONID"] == regionid) {
                        sonregion.push(msg[i]["REGIONNAME"]);
                        sonregionid.push(msg[i]["REGIONID"]);
                    }
                }
                myLogger.trace("querySonRegionService [sonregion]: "+JSON.stringify(sonregion));
                myLogger.trace("querySonRegionService [sonregionid]: "+JSON.stringify(sonregionid));
                cb(null,{namedata:sonregion, iddata: sonregionid});
            }
            else{
                myLogger.error("querySonRegion [mec_itm_regionDAO.query]: "+"no region data found");
                cb("no region data found",null);
            }
        }
        else{
            myLogger.error("querySonRegion [mec_itm_regionDAO.query]: "+logErr(err));
            cb(err,null);
        }
    });
};