/**
 * Created by Legend on 2015/4/1.
 */
var mec_vi_category_brandDAO    =require("../../dao/mec_vi_category_brandDAO");
var hct_brandDAO    =require("../../dao/hct_brandDAO");
var cacheObject = require('../../global/cacheObject');
var mec_itm_category = require('../../dao/mec_itm_categoryDAO');
/**
 * 获取全部分类-品牌
 * @param cb
 */
exports.getAllBrands=function(cb){
    if(cacheObject.brandCategory){
        cb(null,cacheObject.brandCategory);
        return;
    }
    mec_vi_category_brandDAO.queryAll({attributes:["BRANDCODE","BRANDNAME","LOGO","CATEGORYNAME"],order:'CATEGORYID'},function(err,msg){
        if(!err){
            var result=[];
            var lastname="";
            var items={};
            for(var i=0;i<msg.length;i++){
                if(lastname!=msg[i]['CATEGORYNAME']){
                    lastname=msg[i]['CATEGORYNAME'];
                    items={};
                    items['CATEGORYNAME']=msg[i]['CATEGORYNAME'];
                    items['BRANDS']=[];
                    result.push(items);
                }
                delete msg[i].CATEGORYNAME;
                items['BRANDS'].push(msg[i]);
            }
            cacheObject.brandCategory=result;
            cb(null,result);
        }else{
            cb(err,null);
        }
   });
}

/**
 * 获取全部字母-品牌
 * @param cb
 */
exports.getAllBrandsByLetter=function(cb){
    if(cacheObject.brandLetter){
        cb(null,cacheObject.brandLetter);
        return;
    }
    hct_brandDAO.queryAll({attributes:["BRANDCODE","BRANDNAME","LOGO","LETTER"],order:'LETTER'},function(err,msg){
        if(!err){
            var result=[];
            var lastname="";
            var items={};
            for(var i=0;i<msg.length;i++){
                if(lastname!=msg[i]['LETTER']){
                    lastname=msg[i]['LETTER'];
                    items={};
                    items['LETTER']=msg[i]['LETTER'];
                    items['BRANDS']=[];
                    result.push(items);
                }
                delete msg[i].LETTER;
                items['BRANDS'].push(msg[i]);
            }
            cacheObject.brandLetter=result;
            cb(null,result);
        }else{
            cb(err,null);
        }
    });
}

/**
 * 获取根分类（按分类查看也可以使用）
 * @param cb
 */
exports.getBrandCategory=function(cb){
    if(cacheObject.rootCategories){
        cb(null,cacheObject.rootCategories);
        return;
    }
    mec_itm_category.queryAll({attributes:["CATEGORYID","CATEGORYNAME"],order:'CATEGORYID',where:{'SUPERCATEGORYID':null}},function(err,msg){
        if(!err){
            cb(null,msg);
        }else{
            cb(err,null);
        }
    });
}

/**
 * 根据分类的ID获得品牌名称
 * @param categoryid
 * @param cb
 */
exports.getBrandByCategoryId=function(categoryid,cb){
    mec_vi_category_brandDAO.queryAll({attributes:["BRANDCODE","BRANDNAME","LOGO"],where:{'CATEGORYID':categoryid}},function(err,msg){
        if(!err){
            cb(null,msg);
        }else{
            cb(err,null);
        }
    });
}

/**
 * 根据品牌首字母获取品牌名称
 * @param letter
 * @param cb
 */
exports.getBrandByLetter=function(letter,cb){
    hct_brandDAO.queryAll({attributes:["BRANDCODE","BRANDNAME","LOGO"],order:'BRANDNAME',where:{'LETTER':letter}},function(err,msg){
        if(!err){
            cb(null,msg);
        }else{
            cb(err,null);
        }
    });
}