/**
 * Created by lucywu on 7/4/14.
 * 商品元数据相关服务,基于itemcode获取metadata
 */

var myLogger = require('../../logging/contextLogger')("web/metaService");
var async                   = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
//sku
var mec_itm_itemDAO = require("../../dao/mec_itm_itemDAO");
//skc
var mec_itm_skcDAO = require("../../dao/mec_itm_skcDAO");
//counter&&department
var mec_hct_counterDAO = require("../../dao/mec_hct_counterDAO");
var hsy_departmentDAO = require("../../dao/hsy_departmentDAO");
var mec_itm_storeitemDAO = require("../../dao/mec_itm_storeitemDAO");
var mec_vi_dept_skuDAO  = require("../../dao/mec_vi_dept_skuDAO");
//origin
var hsy_itemtypeDAO = require("../../dao/hsy_itemtypeDAO");
var hsy_retailtypeDAO = require("../../dao/hsy_retailtypeDAO");
var hsy_agentDAO = require("../../dao/hsy_agentDAO");
var hct_merchantDAO = require("../../dao/hct_merchantDAO");
var hct_brandDAO = require("../../dao/hct_brandDAO");
//online
var mec_itm_imgpreviewDAO = require("../../dao/mec_itm_imgpreviewDAO");
var mec_itm_imgdetailDAO = require("../../dao/mec_itm_imgdetailDAO");
var mec_itm_itemcategoryDAO = require("../../dao/mec_itm_itemcategoryDAO");
var mec_itm_itemregionDAO = require("../../dao/mec_itm_itemregionDAO");
var mec_itm_parameterDAO = require("../../dao/mec_itm_parameterDAO");
var mec_vi_first_imgpreviewDAO = require("../../dao/mec_vi_first_imgpreviewDAO");
var mec_vi_sku_categorynamesDAO = require("../../dao/mec_vi_sku_categorynamesDAO");
var mec_vi_sku_regionnamesDAO = require("../../dao/mec_vi_sku_regionnamesDAO");

//获取商品的全部sku信息
exports.getSkuAll=function(itemcode,cb){
    var attributes=[
        "ITEMCODE",
        "BARCODE",
        "ITEMNAME",
        "ITEMSHORTNAME",
        "BRANDCODE",
        "ITEMTYPECODE",
        "PRODUCINGAREA",
        "PRICE",
        "TEMPPRICE",
        "RETURNGOODS",
        "SPECIFICATION",
        "PRODUCTCODE",
        "UNIT",
        "TITLE",
        "SCORE",
        "SCOREPOPULARITY",
        "PURCHASE",
        "PURCHASEPOPULARITY",
        "PRAISERATE",
        "ONLINETIME"
    ];
    var where={ITEMCODE:itemcode,CHECKSTATE:1};
    mec_itm_itemDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品Sku (fields是选取字段的数组)
exports.getSku=function(fields,itemcode,cb){
    var attributes=fields;
    var where={ITEMCODE:itemcode};
    mec_itm_itemDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的所有skc(颜色 尺寸)
exports.getSkcs=function(itemcode,cb){
    var attributes=[
        "SKCCODE",
        "MERCHANTSKCCODE",
        "SIZE",
        "COLOR"
    ]
    var where={ITEMCODE:itemcode,RECORDSTATE:1};
    mec_itm_skcDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取该商品所到的柜(柜号,柜价格)
exports.getCounters=function(itemcode,cb){
    var attributes=[
        "COUNTERCODE",
        "MEMBERPRICE",
        "STORECHECKEDPRICE",
        "STORETEMPPRICE"
    ];
    var where={ITEMCODE:itemcode,CHECKSTATE:1};
    mec_itm_storeitemDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取该商品所到的门店
exports.getDepts=function(itemcode,cb){
    exports.getCounters(itemcode,function(err,counters){
        if(!err){
            var depts=[];
            async.forEach(counters,function(counter,cb){
                var countercode=counter.COUNTERCODE;
                mec_hct_counterDAO.queryOne({attributes:["STORECODE"],where:{COUNTERCODE:countercode}},function(err,msg){
                    if(!err){
                        if(depts.indexOf(msg.STORECODE)==-1){
                            depts.push(msg.STORECODE);
                        }
                        cb(null,msg);
                    }
                    else{
                        cb(err,null);
                    }
                });
            },function(err){
                cb(err,depts);
            })
        }
        else{
            cb(err,null);
        }
    })
//    var attributes=[ "STORECODE" ];
//    var where={ITEMCODE:itemcode};
//    mec_vi_dept_skuDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的品牌名称
exports.getBrandname=function(itemcode,cb){
    mec_itm_itemDAO.queryOne({attributes:["BRANDCODE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},function(err,msg){
        if(!err){
            if(msg){
                var attributes=["BRANDCODE","BRANDNAME"];
                var where={BRANDCODE:msg.BRANDCODE};
                hct_brandDAO.queryAll({"attributes":attributes,"where":where},cb);
            }
            else{
                cb("illegal itemcode","warn");
            }
        }
        else{
            cb(err,null);
        }
    })
}

//获取商品的供应商名称
exports.getMerchantname=function(itemcode,cb){
    mec_itm_itemDAO.queryOne({attributes:["MERCHANTCODE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},function(err,msg){
        if(!err){
            if(msg){
                var attributes=["MERCHANTCODE","MERCHANTNAME"];
                var where={MERCHANTCODE:msg.MERCHANTCODE};
                hct_merchantDAO.queryAll({"attributes":attributes,"where":where},cb);
            }
            else{
                cb("illegal itemcode","warn");
            }
        }
        else{
            cb(err,null);
        }
    })
}

//获取商品的经销商名称
exports.getAgentname=function(itemcode,cb){
    mec_itm_itemDAO.queryOne({attributes:["AGENTCODE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},function(err,msg){
        if(!err){
            if(msg){
                var attributes=["AGENTCODE","AGENTNAME"];
                var where={AGENTCODE:msg.AGENTCODE};
                hsy_agentDAO.queryAll({"attributes":attributes,"where":where},cb);
            }
            else{
                cb("illegal itemcode","warn");
            }
        }
        else{
            cb(err,null);
        }
    })
}

//获取商品的商品类型
exports.getItemtypename=function(itemcode,cb){
    mec_itm_itemDAO.queryOne({attributes:["ITEMTYPECODE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},function(err,msg){
        if(!err){
            if(msg){
                var attributes=["ITEMTYPECODE","ITEMTYPENAME"];
                var where={ITEMTYPECODE:msg.ITEMTYPECODE};
                hsy_itemtypeDAO.queryAll({"attributes":attributes,"where":where},cb);
            }
            else{
                cb("illegal itemcode","warn");
            }
        }
        else{
            cb(err,null);
        }
    })
}

//获取商品的销售类型
exports.getRetailtypename=function(itemcode,cb){
    mec_itm_itemDAO.queryOne({attributes:["RETAILTYPECODE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},function(err,msg){
        if(!err){
            if(msg){
                var attributes=["RETAILTYPECODE","RETAILTYPENAME"];
                var where={RETAILTYPECODE:msg.RETAILTYPECODE};
                hsy_retailtypeDAO.queryAll({"attributes":attributes,"where":where},cb);
            }
            else{
                cb("illegal itemcode","warn");
            }
        }
        else{
            cb(err,null);
        }
    })
}

//获取商品的图片预览
exports.getImgpreviews=function(itemcode,cb){
    var attributes=[
        "IMGURL",
        "DESCRIPTION"
    ];
    var where={ITEMCODE:itemcode};
    mec_itm_imgpreviewDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的图文详情
exports.getImgdetails=function(itemcode,cb){
    var attributes=[
        "IMGURL",
        "DESCRIPTION"
    ];
    var where={ITEMCODE:itemcode};
    mec_itm_imgdetailDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的分类id
exports.getCategoryids=function(itemcode,cb){
    var attributes=[
        "CATEGORYID"
    ];
    var where={ITEMCODE:itemcode};
    mec_itm_itemcategoryDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的分区id
exports.getRegionids=function(itemcode,cb){
    var attributes=[
        "REGIONID"
    ];
    var where={ITEMCODE:itemcode};
    mec_itm_itemregionDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的参数信息
exports.getParameters=function(itemcode,cb){
    var attributes=[
        "ATTRIBUTE",
        "VALUE"
    ];
    var where={ITEMCODE:itemcode};
    mec_itm_parameterDAO.queryAll({"attributes":attributes,"where":where},cb);
}

//获取商品的第一张预览图
exports.getFirstImgpreview=function(itemcode,cb){
    var attributes=[
        "IMGURL"
    ];
    var where={ITEMCODE:itemcode};
    mec_vi_first_imgpreviewDAO.queryOne({"attributes":attributes,"where":where},cb);
}

//获取商品的分类字符串
exports.getCategoryStr=function(itemcode,cb){
    var attributes=[
        "CATEGORYNAMES"
    ];
    var where={ITEMCODE:itemcode};
    mec_vi_sku_categorynamesDAO.queryOne({"attributes":attributes,"where":where},cb);
}

//获取商品的分区字符串
exports.getRegionStr=function(itemcode,cb){
    var attributes=[
        "REGIONNAMES"
    ];
    var where={ITEMCODE:itemcode};
    mec_vi_sku_regionnamesDAO.queryOne({"attributes":attributes,"where":where},cb);
}