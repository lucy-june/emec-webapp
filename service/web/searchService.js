/**
 * Created by lucywu on 7/4/14.
 * 高级搜索服务模块
 */
var generalDAO = require("../../dao/generalDAO");
var myLogger = require('../../logging/contextLogger')("web/searchService");
var sequelize = require('../../dao/_sequelize');
var mec_vi_sku_totalDAO = require("../../dao/mec_vi_sku_totalDAO");
var mec_vi_offline_hasstock_selling_sku_totalDAO = require("../../dao/mec_vi_offline_hasstock_selling_sku_totalDAO");
var mec_vi_offline_nostock_selling_sku_totalDAO = require("../../dao/mec_vi_offline_nostock_selling_sku_totalDAO");
var mec_vi_offline_selling_sku_totalDAO = require("../../dao/mec_vi_offline_selling_sku_totalDAO");
var mec_vi_online_selling_sku_totalDAO = require("../../dao/mec_vi_online_selling_sku_totalDAO");
var mec_vi_offline_hasstock_selling_counter_sku_totalDAO = require("../../dao/mec_vi_offline_hasstock_selling_counter_sku_totalDAO");
var mec_vi_offline_nostock_selling_counter_sku_totalDAO = require("../../dao/mec_vi_offline_nostock_selling_counter_sku_totalDAO");
var mec_vi_offline_selling_counter_sku_totalDAO = require("../../dao/mec_vi_offline_selling_counter_sku_totalDAO");
var mec_vi_online_selling_counter_sku_totalDAO = require("../../dao/mec_vi_online_selling_counter_sku_totalDAO");

//查找整个商城的sku信息
exports.searchSku = function (flag, qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    //根据flag标志选取合适的dao
    //0-全部有效商品 1-线下在售管库存的商品 2-线下在售不管库存的商品 3-线下在售的商品 4-线上在售商品
    var list = [
        mec_vi_sku_totalDAO,
        mec_vi_offline_hasstock_selling_sku_totalDAO,
        mec_vi_offline_nostock_selling_sku_totalDAO,
        mec_vi_offline_selling_sku_totalDAO,
        mec_vi_online_selling_sku_totalDAO
    ];
    var _dao = list[flag] || list[0];

    if (!qry &&  typeof (qry) != "number") {
        _dao.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [_dao.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [_dao.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        _dao.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [_dao.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [_dao.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "PRODUCTCODE",
            "ITEMNAME",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文

        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: "%" + qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like:  "%" + qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        _dao.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [_dao.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [_dao.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//搜索柜内的sku信息
exports.searchCounterSku = function (flag, countercode, qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    //根据flag标志选取合适的dao
    //0-全部线下在售的商品 1-线下在售管库存的商品 2-线下在售不管库存的商品 3-线上在售商品
    var list = [
        mec_vi_offline_selling_counter_sku_totalDAO,
        mec_vi_offline_hasstock_selling_counter_sku_totalDAO,
        mec_vi_offline_nostock_selling_counter_sku_totalDAO,
        mec_vi_online_selling_counter_sku_totalDAO
    ];
    var _dao = list[flag] || list[0];

    if (!qry &&  typeof (qry) != "number") {
        _dao.queryAndCount({where: {"COUNTERCODE": countercode}, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchCounterSku [_dao.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchCounterSku [_dao.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        qry.COUNTERCODE = countercode;
        _dao.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchCounterSku [_dao.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchCounterSku [_dao.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "PRODUCTCODE",
            "ITEMNAME",
            "ITEMTYPENAME",
            "RETAILTYPENAME"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文

        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: "%" + qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: "%" + qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        qryOptions = sequelize.and(qryOptions, {"COUNTERCODE": countercode});
        _dao.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [_dao.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [_dao.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}