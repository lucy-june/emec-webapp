/**
 * Created by legend on 9/29/14.
 */
var generalDAO = require("../../dao/generalDAO");

//得到热门搜索
exports.getHotSearch=function(cb){
	generalDAO.runSql("select KEYWORD from mec_anl_hotsearch where RECORDSTATE=1 order by WEIGHT desc" , cb);
}

//得到热门品牌
exports.getHotBrands=function(cb){
	generalDAO.runSql("select hct_brand.BRANDNAME from mec_anl_hotbrand join hct_brand on mec_anl_hotbrand." +
        "BRANDCODE=hct_brand.BRANDCODE where RECORDSTATE=1 order by mec_anl_hotbrand.WEIGHT desc", cb);
}

//得到热门商品信息
exports.getHotBuys=function(cb){
    generalDAO.runSql("select mec_vi_online_selling_sku_forapp.* from mec_anl_hotbuy join " +
        "mec_vi_online_selling_sku_forapp on mec_anl_hotbuy.ITEMCODE=mec_vi_online_selling_sku_forapp." +
        "ITEMCODE where mec_anl_hotbuy.RECORDSTATE=1 ORDER BY mec_anl_hotbuy.WEIGHT desc", cb);
}