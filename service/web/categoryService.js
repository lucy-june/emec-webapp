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
var mec_itm_paramtemplateDAO = require('../../dao/mec_itm_paramtemplateDAO');

//刷新服务器端保存的分类缓存
exports.refreshCategoryCache = function (cb) {
    mec_itm_categoryDAO.queryAll({where: {RECORDSTATE: 1}}, function (err, msg) {
        if (!err) {
            exhandler(function () {
                var temp = {};
                var ref = [];
                var cur = [];
                var id2Name={};
                var name2Id={};
                for (var k = 0; k < msg.length; k++) {
                    var id = msg[k]["CATEGORYID"];
                    var name = msg[k]["CATEGORYNAME"];
                    id2Name[id] = name;
                    name2Id[name] = id;
                    cur.push(id);
                    ref.push(msg[k]["SUPERCATEGORYID"]);
                    temp[id] = msg[k];
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
                var resultMap = {};
                for (var k = 0; k < reverses.length; k++) {
                    var path = reverses[k];
                    var curObj = resultMap;
                    for (var n = path.length - 1; n >= 0; n--) {
                        if (!curObj[path[n]]) curObj[path[n]] = {};
                        curObj = curObj[path[n]];
                    }
                }

                cacheObject.categoryId2Name = id2Name;
                cacheObject.categoryName2Id = name2Id;
                cacheObject.reverseCategoryMap = result;
                cacheObject.categoryMap = resultMap;

                var categoryCache = [
                    cacheObject.categoryId2Name,
                    cacheObject.categoryName2Id,
                    cacheObject.reverseCategoryMap,
                    cacheObject.categoryMap
                ];

                myLogger.trace("refreshCategoryCache [categoryCache]: " + JSON.stringify(categoryCache));
                cb(null, categoryCache);
            }, function (err) {
                myLogger.error("refreshCategoryCache [exhandler.err]: " + logErr(err));
                cb(err, null);
            });
        }
        else {
            myLogger.error("refreshCategoryCache [mec_itm_categoryDAO.queryAll]: " + logErr(err));
            cb(err, null);
        }
    })
}

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

//添加分类
exports.addCategory=function(supercategoryid,categoryname,usercode,cb){
    var value={"CATEGORYNAME":categoryname,"SUPERCATEGORYID":supercategoryid,"LASTOPERATEPERSON":usercode};
    mec_itm_categoryDAO.add(value,function(err,msg){
        if(!err){
            myLogger.trace("addCategory [mec_itm_categoryDAO.add]: " + JSON.stringify(msg));
            exports.refreshCategoryCache(cb);
        }
        else{
            myLogger.error("addCategory [mec_itm_categoryDAO.add]: " + logErr(err));
            cb(err,null);
        }
    });
}

//修改分类
exports.updateCategory=function(categoryid,categoryname,usercode,cb){
    mec_itm_categoryDAO.update({CATEGORYNAME:categoryname},{CATEGORYID:categoryid},function(err,msg){
        if(!err){
            myLogger.trace("updateCategory [mec_itm_categoryDAO.update]: " + JSON.stringify(msg));
            exports.refreshCategoryCache(cb);
        }
        else{
            myLogger.error("updateCategory [mec_itm_categoryDAO.update]: " + logErr(err));
            cb(err,null);
        }
    })
}

//获取分类参数模板
exports.getCategoryParamTemplate=function(categoryid,cb){
    var qry={attributes:["ATTRIBUTE"],where:{CATEGORYID:categoryid,RECORDSTATE:1}};
    mec_itm_paramtemplateDAO.queryAll(qry,cb);
}

//更新或添加分类参数模板(attributes是一个List)
exports.renewCategoryParamTemplate=function(categoryid,attributes,usercode,cb){
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                var value={RECORDSTATE:0,LASTOPERATEPERSON:usercode};
                var where={CATEGORYID:categoryid,RECORDSTATE:1};
                mec_itm_paramtemplateDAO.update(value,where,t,cb);
            },
            function(cb){
                async.forEach(attributes,function(attribute,cb){
                    var value={CATEGORYID:categoryid,ATTRIBUTE:attribute,LASTOPERATEPERSON:usercode};
                    mec_itm_paramtemplateDAO.add(value,t,cb);
                },function(err){
                    cb(err,null);
                })
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("renewCategoryParamTemplate [mec_itm_paramtemplateDAO.update]: "+JSON.stringify(msg[0]));
                t.commit();
                cb(null,{CATEGORYID:categoryid,ATTRIBUTES:attributes});
            }
            else{
                myLogger.error("renewCategoryParamTemplate [forEach.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        });
    })

}

//查询一级分类
exports.queryCategory1 = function (cb) {
    mec_itm_categoryDAO.queryAll({}, function (err,msg) {
        if(!err){
            if(msg && msg.length>0) {
                var category1 = [];
                var category1id = [];

                for(var k=0; k<msg.length; k++) {
                    if(msg[k]["SUPERCATEGORYID"] == null) {
                        category1.push(msg[k]["CATEGORYNAME"]);
                        category1id.push(msg[k]["CATEGORYID"]);
                    }
                }
                myLogger.trace("queryCategory1 [category1]: "+JSON.stringify(category1));
                myLogger.trace("queryCategory1 [category1id]: "+JSON.stringify(category1id));
                cb(null,{category1:category1,category1id:category1id});
            }
            else{
                myLogger.error("queryCategory1 [mec_itm_categoryDAO.query]: "+"no category data found");
                cb("no category data found",null);
            }
        }
        else{
            myLogger.error("queryCategory1 [mec_itm_categoryDAO.query]: "+logErr(err));
            cb(err,null);
        }
    });
};

//查询二级分类和三级分类
exports.querySonCategory = function (categoryid,cb) {
    myLogger.trace("querySonCategoryService [categoryid]: "+categoryid);
    mec_itm_categoryDAO.queryAll({}, function (err,msg) {
        if(!err){
            if(msg && msg.length>0) {
                var soncategory = [];
                var soncategoryid = [];
                for(var i=0; i<msg.length; i++) {
                    if(msg[i]["SUPERCATEGORYID"] == categoryid) {
                        soncategory.push(msg[i]["CATEGORYNAME"]);
                        soncategoryid.push(msg[i]["CATEGORYID"]);
                    }
                }
                myLogger.trace("querySonCategoryService [soncategory]: "+JSON.stringify(soncategory));
                myLogger.trace("querySonCategoryService [soncategoryid]: "+JSON.stringify(soncategoryid));
                cb(null,{namedata:soncategory, iddata: soncategoryid});
            }
            else{
                myLogger.error("querySonCategory [mec_itm_categoryDAO.query]: "+"no category data found");
                cb("no category data found",null);
            }
        }
        else{
            myLogger.error("querySonCategory [mec_itm_categoryDAO.query]: "+logErr(err));
            cb(err,null);
        }
    });
};