/**
 * Created by lucywu on 12/16/14.
 */

var myLogger = require('../../logging/contextLogger')("web/itemService");
var async                   = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var mec_vi_online_selling_sku_forappDAO = require("../../dao/mec_vi_online_selling_sku_forappDAO");
var mec_vi_online_skc_stockDAO = require("../../dao/mec_vi_online_skc_stockDAO");

//获取上线skc的库存信息
exports.getSkcStock=function(skccode,cb){
    mec_vi_online_skc_stockDAO.queryOne({where:{SKCCODE:skccode}},cb);
}

//app端获取某个上线商品的详细信息
exports.getOnlineSellingSkuForApp=function(itemcode,cb){
    mec_vi_online_selling_sku_forappDAO.queryOne({where:{ITEMCODE:itemcode}},cb);
}
