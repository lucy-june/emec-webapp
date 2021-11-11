/**
 * Created by lucywu on 7/4/14.
 * 高级搜索服务模块
 */
var generalDAO = require("../../dao/generalDAO");
var mec_vi_online_selling_sku_forappDAO = require("../../dao/mec_vi_online_selling_sku_forappDAO");
var myLogger = require('../../logging/contextLogger')("web/searchService");
var sequelize = require('../../dao/_sequelize');

//查找整个商城的sku信息
exports.searchOnlineSellingSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    var attributes

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_online_selling_sku_forappDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [mec_vi_online_selling_sku_forappDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [mec_vi_online_selling_sku_forappDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_online_selling_sku_forappDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [mec_vi_online_selling_sku_forappDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [mec_vi_online_selling_sku_forappDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "BARCODE",
            "ITEMNAME",
            "BRANDNAME",
            "SPECIFICATION",
            "ITEMTYPENAME",
            "TITLE",
            "CATEGORYNAMES",
            "REGIONNAMES"
        ];

        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: "%"+ qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: "%"+qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_online_selling_sku_forappDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("searchSku [mec_vi_online_selling_sku_forappDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("searchSku [mec_vi_online_selling_sku_forappDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}
