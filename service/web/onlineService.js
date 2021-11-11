/**
 * Created by lucywu on 7/4/14.
 * 上线信息的完善更新审核,以及商品上下线管理
 */
var generalDAO              = require("../../dao/generalDAO");
var async                   = require('async');
var sequelize               = require('../../dao/_sequelize');
var myLogger                = require('../../logging/contextLogger')("web/onlineService");
var mec_itm_itemDAO         = require('../../dao/mec_itm_itemDAO');
var mec_itm_item_tmp2DAO         = require('../../dao/mec_itm_item_tmp2DAO');
var mec_itm_itemcategoryDAO      = require('../../dao/mec_itm_itemcategoryDAO');
var mec_itm_itemcategory_tmpDAO      = require('../../dao/mec_itm_itemcategory_tmpDAO');
var mec_itm_itemregionDAO        = require('../../dao/mec_itm_itemregionDAO');
var mec_itm_itemregion_tmpDAO        = require('../../dao/mec_itm_itemregion_tmpDAO');
var mec_itm_imgpreviewDAO        = require('../../dao/mec_itm_imgpreviewDAO');
var mec_itm_imgpreview_tmpDAO        = require('../../dao/mec_itm_imgpreview_tmpDAO')
var mec_itm_imgdetailDAO         = require('../../dao/mec_itm_imgdetailDAO');
var mec_itm_imgdetail_tmpDAO         = require('../../dao/mec_itm_imgdetail_tmpDAO');
var mec_itm_parameterDAO            = require('../../dao/mec_itm_parameterDAO');
var mec_itm_storeitemDAO            = require('../../dao/mec_itm_storeitemDAO');
var mec_itm_parameter_tmpDAO        = require('../../dao/mec_itm_parameter_tmpDAO');
var mec_vi_online_uninitial_sku_totalDAO      = require("../../dao/mec_vi_online_uninitial_sku_totalDAO");
var mec_vi_online_renewable_sku_totalDAO      = require("../../dao/mec_vi_online_renewable_sku_totalDAO");
var mec_vi_online_checkable_sku_totalDAO      = require("../../dao/mec_vi_online_checkable_sku_totalDAO");
var mec_vi_online_prepared_sku_totalDAO       = require("../../dao/mec_vi_online_prepared_sku_totalDAO");
var mec_vi_online_prepared_counter_skuDAO     = require("../../dao/mec_vi_online_prepared_counter_skuDAO");
var mec_vi_online_selling_sku_totalDAO        = require("../../dao/mec_vi_online_selling_sku_totalDAO");
var mec_vi_online_selling_counter_skuDAO      = require("../../dao/mec_vi_online_selling_counter_skuDAO");

//查看需要初始化添加online信息的sku
exports.getOnlineUninitialSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_online_uninitial_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineUninitialSku [mec_vi_online_uninitial_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineUninitialSku [mec_vi_online_uninitial_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_online_uninitial_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineUninitialSku [mec_vi_online_uninitial_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineUninitialSku [mec_vi_online_uninitial_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "INPUTPERSON",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_online_uninitial_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineUninitialSku [mec_vi_online_uninitial_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineUninitialSku [mec_vi_online_uninitial_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//查看可以更新online信息的sku
exports.getOnlineRenewableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_online_renewable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineRenewableSku [mec_vi_online_renewable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineRenewableSku [mec_vi_online_renewable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_online_renewable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineRenewableSku [mec_vi_online_renewable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineRenewableSku [mec_vi_online_renewable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
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
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_online_renewable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineRenewableSku [mec_vi_online_renewable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineRenewableSku [mec_vi_online_renewable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//查看有等待审核的online信息的所有的sku
exports.getOnlineCheckableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_online_checkable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineCheckableSku [mec_vi_online_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineCheckableSku [mec_vi_online_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_online_checkable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineCheckableSku [mec_vi_online_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineCheckableSku [mec_vi_online_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
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
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_online_checkable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineCheckableSku [mec_vi_online_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineCheckableSku [mec_vi_online_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取已审核通过上线信息的某个sku对应的所有的online
exports.getApprovedOnlineBySku=function(itemcode,cb){
    async.waterfall([
        function(cb){
            mec_itm_itemDAO.queryOne({attributes:["ONLINECHECKSTATE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},cb);
        },
        function(x,cb){
            if(x){
                var onlinecheckstate= x.ONLINECHECKSTATE;
                if(onlinecheckstate==1||onlinecheckstate==3){//当前上线信息处于审核通过状态
                    async.parallel([
                        function(cb){
                            mec_itm_itemDAO.queryOne({attributes:["TITLE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},cb);
                        },
                        function(cb){
                            mec_itm_imgpreviewDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_imgdetailDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_itemregionDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_itemcategoryDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_parameterDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        }
                    ],cb);
                }
                else{
                    cb("the item has no approved online info","warn");
                }
            }
            else{
                cb("unfound itemcode","warn");
            }
        }
    ],function(err,msg){
        if(!err){
            cb(null,msg);
        }
        else{
            if(msg=="warn") myLogger.warn("getApprovedOnlineBySku [waterfall.warn]: "+logErr(err));
            myLogger.error("getApprovedOnlineBySku [waterfall.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//获取可以更新的某个sku对应的所有的online
exports.getRenewableOnlineBySku=function(itemcode,cb){
    async.waterfall([
        function(cb){
            mec_itm_itemDAO.queryOne({attributes:["ONLINECHECKSTATE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},cb);
        },
        function(x,cb){
            if(x){
                var onlinecheckstate= x.ONLINECHECKSTATE;
                if(onlinecheckstate==1){//当前上线信息处于审核通过状态
                    async.parallel([
                        function(cb){
                            mec_itm_itemDAO.queryOne({attributes:["TITLE"],where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_imgpreviewDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_imgdetailDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_itemregionDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_itemcategoryDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        },
                        function(cb){
                            mec_itm_parameterDAO.queryAll({where:{ITEMCODE:itemcode}},cb);
                        }
                    ],cb);
                }
                else{
                    //如果当前onlinecheckstate为待审核或者审核过又有更新
                    //查询条件中TMPSTATE(0-实数据待审和 1-占位数据待审核)
                    async.parallel([
                        function(cb){
                            mec_itm_item_tmp2DAO.queryOne({attributes:["TITLE"],where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                                if(!err){
                                    if(!msg) cb(null,{"TITLE":""});
                                    else cb(null,msg);
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        },
                        function(cb){
                            mec_itm_imgpreview_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                                if(!err){
                                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                                    else cb(null,msg);
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        },
                        function(cb){
                            mec_itm_imgdetail_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                                if(!err){
                                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                                    else cb(null,msg);
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        },
                        function(cb){
                            mec_itm_itemregion_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                                if(!err){
                                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                                    else cb(null,msg);
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        },
                        function(cb){
                            mec_itm_itemcategory_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                                if(!err){
                                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                                    else cb(null,msg);
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        },
                        function(cb){
                            mec_itm_parameter_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                                if(!err){
                                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                                    else cb(null,msg);
                                }
                                else{
                                    cb(err,null);
                                }
                            })
                        }
                    ],cb);
                }
            }
            else{
                cb("unfound itemcode","warn");
            }
        }
    ],function(err,msg){
        if(!err){
            cb(null,msg);
        }
        else{
            if(msg=="warn") myLogger.warn("getRenewableOnlineBySku [waterfall.warn]: "+logErr(err));
            myLogger.error("getRenewableOnlineBySku [waterfall.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//获取等待审核online的某个sku对应的全部online
exports.getCheckableOnlineBySku=function(itemcode,cb){
    async.parallel([
        function(cb){
            mec_itm_item_tmp2DAO.queryOne({attributes:["TITLE"],where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                if(!err){
                    if(!msg) cb(null,{"TITLE":""});
                    else cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            mec_itm_imgpreview_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                if(!err){
                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                    else cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            mec_itm_imgdetail_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                if(!err){
                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                    else cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            mec_itm_itemregion_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                if(!err){
                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                    else cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            mec_itm_itemcategory_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                if(!err){
                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                    else cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        },
        function(cb){
            mec_itm_parameter_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                if(!err){
                    if(msg.length==1 && msg[0].TMPSTATE==1) cb(null,[]);
                    else cb(null,msg);
                }
                else{
                    cb(err,null);
                }
            })
        }
    ],function(err,msg){
        if(!err){
            cb(null,msg);
        }
        else{
            myLogger.error("getCheckableOnlineBySku [parallel.err]: "+logErr(err));
            cb(err,null);
        }
    });
}

//完善online信息(onlines数组对象依次为title{},imgpreviews[],imgdetails[],itemregions[],itemcategorys[],parameters[])
exports.initialOnline=function(itemcode,onlines,usercode,cb){
    myLogger.trace("initialOnline [onlines]: "+JSON.stringify(onlines));
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                //更新item表中的onlinecheckstate
                mec_itm_itemDAO.update({ONLINECHECKSTATE:2},{ITEMCODE:itemcode,ONLINECHECKSTATE:0},t,cb);
            },
            function(cb){
                //删除暂存表中该商品已有的未经过审核的online(如果前端可以保证不重复添加,这一步可以省略)
                async.parallel([
                    function(cb){
                        mec_itm_item_tmp2DAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_imgpreview_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_imgdetail_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_itemregion_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_itemcategory_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_parameter_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    }
                ],cb)
            },
            function(cb){
                //把每个online添加到online_tmp暂存表中等待审核
                //如果onlines为空就要插入占位数据
                var title=onlines[0];
                var imgpreviews=onlines[1];
                var imgdetails=onlines[2];
                var itemregions=onlines[3];
                var itemcategorys=onlines[4];
                var parameters=onlines[5];
                async.parallel([
                    function(cb){
                        title=title||{"TITLE":""};
                        title.ITEMCODE=itemcode;
                        title.TMPSTATE=0;
                        title.LASTOPERATEPERSON=usercode;
                        mec_itm_item_tmp2DAO.add(title,t,cb);
                    },
                    function(cb){
                        console.log("############################0000");
                        if(!imgpreviews||imgpreviews.length==0){
                            console.log("############################1111");
                            var imgpreview={};
                            imgpreview.ITEMCODE=itemcode;
                            imgpreview.IMGURL='#';
                            imgpreview.TMPSTATE=1;
                            imgpreview.LASTOPERATEPERSON=usercode;
                            mec_itm_imgpreview_tmpDAO.add(imgpreview,t,cb);
                        }
                        else{
                            console.log("############################22222");
                            async.forEach(imgpreviews,function(imgpreview,cb){
                                imgpreview.ITEMCODE=itemcode;
                                imgpreview.TMPSTATE=0;
                                imgpreview.LASTOPERATEPERSON=usercode;
                                mec_itm_imgpreview_tmpDAO.add(imgpreview,t,cb);
                            },function(err){
                                cb(err,imgpreviews.length);
                            })
                        }
                    },
                    function(cb){
                        if(!imgdetails||imgdetails.length==0){
                            var imgdetail={};
                            imgdetail.ITEMCODE=itemcode;
                            imgdetail.IMGURL='#';
                            imgdetail.TMPSTATE=1;
                            imgdetail.LASTOPERATEPERSON=usercode;
                            mec_itm_imgdetail_tmpDAO.add(imgdetail,t,cb);
                        }
                        else{
                            async.forEach(imgdetails,function(imgdetail,cb){
                                imgdetail.ITEMCODE=itemcode;
                                imgdetail.TMPSTATE=0;
                                imgdetail.LASTOPERATEPERSON=usercode;
                                mec_itm_imgdetail_tmpDAO.add(imgdetail,t,cb);
                            },function(err){
                                cb(err,imgdetails.length);
                            })
                        }
                    },
                    function(cb){
                        if(!itemregions||itemregions.length==0){
                            var itemregion={};
                            itemregion.ITEMCODE=itemcode;
                            itemregion.TMPSTATE=1;
                            itemregion.LASTOPERATEPERSON=usercode;
                            mec_itm_itemregion_tmpDAO.add(itemregion,t,cb);
                        }
                        else{
                            async.forEach(itemregions,function(itemregion,cb){
                                itemregion.ITEMCODE=itemcode;
                                itemregion.TMPSTATE=0;
                                itemregion.LASTOPERATEPERSON=usercode;
                                mec_itm_itemregion_tmpDAO.add(itemregion,t,cb);
                            },function(err){
                                cb(err,itemregions.length);
                            })
                        }
                    },
                    function(cb){
                        if(!itemcategorys||itemcategorys.length==0){
                            var itemcategory={};
                            itemcategory.ITEMCODE=itemcode;
                            itemcategory.TMPSTATE=1;
                            itemcategory.LASTOPERATEPERSON=usercode;
                            mec_itm_itemcategory_tmpDAO.add(itemcategory,t,cb);
                        }
                        else{
                            async.forEach(itemcategorys,function(itemcategory,cb){
                                itemcategory.ITEMCODE=itemcode;
                                itemcategory.TMPSTATE=0;
                                itemcategory.LASTOPERATEPERSON=usercode;
                                mec_itm_itemcategory_tmpDAO.add(itemcategory,t,cb);
                            },function(err){
                                cb(err,itemcategorys.length);
                            })
                        }
                    },
                    function(cb){
                        if(!parameters||parameters.length==0){
                            var parameter={};
                            parameter.ITEMCODE=itemcode;
                            parameter.TMPSTATE=1;
                            parameter.LASTOPERATEPERSON=usercode;
                            mec_itm_parameter_tmpDAO.add(parameter,t,cb);
                        }
                        else{
                            async.forEach(parameters,function(parameter,cb){
                                parameter.ITEMCODE=itemcode;
                                parameter.TMPSTATE=0;
                                parameter.LASTOPERATEPERSON=usercode;
                                mec_itm_parameter_tmpDAO.add(parameter,t,cb);
                            },function(err){
                                cb(err,parameters.length);
                            })
                        }
                    }
                ],cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("initialOnline [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("initialOnline [online tmp del]: "+JSON.stringify(msg[1]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("initialOnline [series.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//更新online信息(onlines数组对象依次为title{},imgpreviews[],imgdetails[],itemregions[],itemcategorys[],parameters[])
exports.updateOnline=function(itemcode,onlines,usercode,cb){
    myLogger.trace("updateOnline [onlines]: "+JSON.stringify(onlines));
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                //如果当前onlinecheckState为审核过的状态那么将它更改为审核过又有更新的状态
                mec_itm_itemDAO.update({ONLINECHECKSTATE:3},{ITEMCODE:itemcode,ONLINECHECKSTATE:1},t,cb);
            },
            function(cb){
                //删除暂存表中该商品已有的未经过审核的online(如果前端可以保证不重复添加,这一步可以省略)
                async.parallel([
                    function(cb){
                        mec_itm_item_tmp2DAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_imgpreview_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_imgdetail_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_itemregion_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_itemcategory_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_parameter_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    }
                ],cb)
            },
            function(cb){
                //把每个online添加到online_tmp暂存表中等待审核
                //如果onlines为空就要插入占位数据
                var title=onlines[0];
                var imgpreviews=onlines[1];
                var imgdetails=onlines[2];
                var itemregions=onlines[3];
                var itemcategorys=onlines[4];
                var parameters=onlines[5];
                async.parallel([
                    function(cb){
                        title=title||{"TITLE":""};
                        title.ITEMCODE=itemcode;
                        title.TMPSTATE=0;
                        title.LASTOPERATEPERSON=usercode;
                        mec_itm_item_tmp2DAO.add(title,t,cb);
                    },
                    function(cb){
                        if(!imgpreviews||imgpreviews.length==0){
                            var imgpreview={};
                            imgpreview.ITEMCODE=itemcode;
                            imgpreview.IMGURL='#';
                            imgpreview.TMPSTATE=1;
                            imgpreview.LASTOPERATEPERSON=usercode;
                            mec_itm_imgpreview_tmpDAO.add(imgpreview,t,cb);
                        }
                        else{
                            async.forEach(imgpreviews,function(imgpreview,cb){
                                delete imgpreview.ID;
                                delete imgpreview._ID;
                                imgpreview.ITEMCODE=itemcode;
                                imgpreview.TMPSTATE=0;
                                imgpreview.LASTOPERATEPERSON=usercode;
                                mec_itm_imgpreview_tmpDAO.add(imgpreview,t,cb);
                            },function(err){
                                cb(err,imgpreviews.length);
                            })
                        }
                    },
                    function(cb){
                        if(!imgdetails||imgdetails.length==0){
                            var imgdetail={};
                            imgdetail.ITEMCODE=itemcode;
                            imgdetail.IMGURL='#';
                            imgdetail.TMPSTATE=1;
                            imgdetail.LASTOPERATEPERSON=usercode;
                            mec_itm_imgdetail_tmpDAO.add(imgdetail,t,cb);
                        }
                        else{
                            async.forEach(imgdetails,function(imgdetail,cb){
                                delete imgdetail.ID;
                                delete imgdetail._ID;
                                imgdetail.ITEMCODE=itemcode;
                                imgdetail.TMPSTATE=0;
                                imgdetail.LASTOPERATEPERSON=usercode;
                                mec_itm_imgdetail_tmpDAO.add(imgdetail,t,cb);
                            },function(err){
                                cb(err,imgdetails.length);
                            })
                        }
                    },
                    function(cb){
                        if(!itemregions||itemregions.length==0){
                            var itemregion={};
                            itemregion.ITEMCODE=itemcode;
                            itemregion.TMPSTATE=1;
                            itemregion.LASTOPERATEPERSON=usercode;
                            mec_itm_itemregion_tmpDAO.add(itemregion,t,cb);
                        }
                        else{
                            async.forEach(itemregions,function(itemregion,cb){
                                delete itemregion.ID;
                                delete itemregion._ID;
                                itemregion.ITEMCODE=itemcode;
                                itemregion.TMPSTATE=0;
                                itemregion.LASTOPERATEPERSON=usercode;
                                mec_itm_itemregion_tmpDAO.add(itemregion,t,cb);
                            },function(err){
                                cb(err,itemregions.length);
                            })
                        }
                    },
                    function(cb){
                        if(!itemcategorys||itemcategorys.length==0){
                            var itemcategory={};
                            itemcategory.ITEMCODE=itemcode;
                            itemcategory.TMPSTATE=1;
                            itemcategory.LASTOPERATEPERSON=usercode;
                            mec_itm_itemcategory_tmpDAO.add(itemcategory,t,cb);
                        }
                        else{
                            async.forEach(itemcategorys,function(itemcategory,cb){
                                delete itemcategory.ID;
                                delete itemcategory._ID;
                                itemcategory.ITEMCODE=itemcode;
                                itemcategory.TMPSTATE=0;
                                itemcategory.LASTOPERATEPERSON=usercode;
                                mec_itm_itemcategory_tmpDAO.add(itemcategory,t,cb);
                            },function(err){
                                cb(err,itemcategorys.length);
                            })
                        }
                    },
                    function(cb){
                        if(!parameters||parameters.length==0){
                            var parameter={};
                            parameter.ITEMCODE=itemcode;
                            parameter.TMPSTATE=1;
                            parameter.LASTOPERATEPERSON=usercode;
                            mec_itm_parameter_tmpDAO.add(parameter,t,cb);
                        }
                        else{
                            async.forEach(parameters,function(parameter,cb){
                                delete parameter.ID;
                                delete parameter._ID;
                                parameter.ITEMCODE=itemcode;
                                parameter.TMPSTATE=0;
                                parameter.LASTOPERATEPERSON=usercode;
                                mec_itm_parameter_tmpDAO.add(parameter,t,cb);
                            },function(err){
                                cb(err,parameters.length);
                            })
                        }
                    }
                ],cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("updateOnline [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("updateOnline [online tmp del]: "+JSON.stringify(msg[1]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("updateOnline [series.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//审核通过相应的online信息
exports.approveOnline=function(itemcode,usercode,cb){
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                //如果当前onlinecheckState修改为审核过
                mec_itm_itemDAO.update({ONLINECHECKSTATE:1},{ITEMCODE:itemcode,ONLINECHECKSTATE:{between:[2,3]}},t,cb);
            },
            function(cb){
                async.waterfall([
                    function(cb){
                        //获取所有相关待审核的online信息
                        exports.getCheckableOnlineBySku(itemcode,cb);
                    },
                    function(x,cb){
                        //更新online信息主表
                        async.series([
                            function(cb){
                                //删除该商品的上线信息
                                async.parallel([
                                    function(cb){
                                        mec_itm_imgpreviewDAO.del({ITEMCODE:itemcode},t,cb);
                                    },
                                    function(cb){
                                        mec_itm_imgdetailDAO.del({ITEMCODE:itemcode},t,cb);
                                    },
                                    function(cb){
                                        mec_itm_itemregionDAO.del({ITEMCODE:itemcode},t,cb);
                                    },
                                    function(cb){
                                        mec_itm_itemcategoryDAO.del({ITEMCODE:itemcode},t,cb);
                                    },
                                    function(cb){
                                        mec_itm_parameterDAO.del({ITEMCODE:itemcode},t,cb);
                                    }
                                ],cb);
                            },
                            function(cb){
                                //添加审核后的上线信息
                                var title= x[0];
                                var imgpreviews=x[1];
                                var imgdetails=x[2];
                                var itemregions=x[3];
                                var itemcategorys=x[4];
                                var parameters=x[5];

                                async.parallel([
                                    function(cb){
                                        title=title||{"TITLE":""};
                                        mec_itm_itemDAO.update(title,{ITEMCODE:itemcode},t,cb);
                                    },
                                    function(cb){
                                        async.forEach(imgpreviews,function(imgpreview,cb){
                                            delete imgpreview.ID;
                                            delete imgpreview._ID;
                                            imgpreview.ITEMCODE=itemcode;
                                            mec_itm_imgpreviewDAO.add(imgpreview,t,cb);
                                        },function(err){
                                            cb(err,imgpreviews.length);
                                        })
                                    },
                                    function(cb){
                                        async.forEach(imgdetails,function(imgdetail,cb){
                                            delete imgdetail.ID;
                                            delete imgdetail._ID;
                                            imgdetail.ITEMCODE=itemcode;
                                            mec_itm_imgdetailDAO.add(imgdetail,t,cb);
                                        },function(err){
                                            cb(err,imgdetails.length);
                                        })
                                    },
                                    function(cb){
                                        async.forEach(itemregions,function(itemregion,cb){
                                            delete itemregion.ID;
                                            delete itemregion._ID;
                                            itemregion.ITEMCODE=itemcode;
                                            mec_itm_itemregionDAO.add(itemregion,t,cb);
                                        },function(err){
                                            cb(err,itemregions.length);
                                        })
                                    },
                                    function(cb){
                                        async.forEach(itemcategorys,function(itemcategory,cb){
                                            delete itemcategory.ID;
                                            delete itemcategory._ID;
                                            itemcategory.ITEMCODE=itemcode;
                                            mec_itm_itemcategoryDAO.add(itemcategory,t,cb);
                                        },function(err){
                                            cb(err,itemcategorys.length);
                                        })
                                    },
                                    function(cb){
                                        async.forEach(parameters,function(parameter,cb){
                                            delete parameter.ID;
                                            delete parameter._ID;
                                            parameter.ITEMCODE=itemcode;
                                            mec_itm_parameterDAO.add(parameter,t,cb);
                                        },function(err){
                                            cb(err,parameters.length);
                                        })
                                    }
                                ],cb);
                            }
                        ],cb);
                    },
                    function(x,cb){
                        //更新online信息暂存表状态
                        async.parallel([
                            //修改暂存表中该商品已有的未经过审核的online为占位数据审核过状态
                            //修改暂存表中该商品已有的未经过审核的online为实际数据审核过状态
                            function(cb){
                                mec_itm_item_tmp2DAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                            },
                            function(cb){
                                mec_itm_item_tmp2DAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                            },
                            function(cb){
                                mec_itm_imgpreview_tmpDAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                            },
                            function(cb){
                                mec_itm_imgpreview_tmpDAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                            },
                            function(cb){
                                mec_itm_imgdetail_tmpDAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                            },
                            function(cb){
                                mec_itm_imgdetail_tmpDAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                            },
                            function(cb){
                                mec_itm_itemregion_tmpDAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                            },
                            function(cb){
                                mec_itm_itemregion_tmpDAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                            },
                            function(cb){
                                mec_itm_itemcategory_tmpDAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                            },
                            function(cb){
                                mec_itm_itemcategory_tmpDAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                            },
                            function(cb){
                                mec_itm_parameter_tmpDAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                            },
                            function(cb){
                                mec_itm_parameter_tmpDAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                            }
                        ],cb)
                    }
                ],cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("approveOnline [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("approveOnline [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//拒绝相应的online信息
exports.invalidOnline=function(itemcode,usercode,cb){
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                //如果当前onlinecheckState为已经完善待审核修改为待完善状态
                mec_itm_itemDAO.update({ONLINECHECKSTATE:0},{ITEMCODE:itemcode,ONLINECHECKSTATE:2},t,cb);
            },
            function(cb){
                //如果当前onlinecheckState为审核过又有更新将其修改为审核过
                mec_itm_itemDAO.update({ONLINECHECKSTATE:1},{ITEMCODE:itemcode,ONLINECHECKSTATE:3},t,cb);
            },
            function(cb){
                //修改暂存表中该商品已有的未经过审核的online为拒绝状态
                async.parallel([
                    function(cb){
                        mec_itm_item_tmp2DAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_imgpreview_tmpDAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_imgdetail_tmpDAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_itemcategory_tmpDAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_itemregion_tmpDAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    },
                    function(cb){
                        mec_itm_parameter_tmpDAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
                    }
                ],cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("invalidOnline [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("invalidOnline [mec_itm_itemDAO.update]: "+JSON.stringify(msg[1]));
                myLogger.trace("invalidOnline [online tmp update]: "+JSON.stringify(msg[2]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("invalidOnline [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//获取已经完善好online信息,线上在卖的商品
exports.getOnlineSellingSku = function(qry,options,cb){
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_online_selling_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineSellingSku [mec_vi_online_selling_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineSellingSku [mec_vi_online_selling_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_online_selling_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineSellingSku [mec_vi_online_selling_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineSellingSku [mec_vi_online_selling_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "INPUTPERSON",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME",
            "CATEGORYNAMES",
            "REGIONNAMES"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_online_selling_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlineSellingSku [mec_vi_online_selling_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlineSellingSku [mec_vi_online_selling_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取某sku线上在卖的门店
exports.getSellingCounterBySku = function(itemcode,cb){
    mec_vi_online_selling_counter_skuDAO.queryAll({"ITEMCODE":itemcode},cb);
}

//获取已经完善好online信息,可以上线/下线的商品
exports.getOnlinePreparedSku = function(qry,options,cb){
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_online_prepared_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlinePreparedSku [mec_vi_online_prepared_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlinePreparedSku [mec_vi_online_prepared_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_online_prepared_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlinePreparedSku [mec_vi_online_prepared_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlinePreparedSku [mec_vi_online_prepared_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else {
        //要模糊查询的所有列
        var qryFields = [
            "ITEMCODE",
            "BARCODE",
            "MERCHANTCODE",
            "ITEMNAME",
            "INPUTPERSON",
            "BRANDNAME",
            "ITEMTYPENAME",
            "MERCHANTNAME",
            "RETAILTYPENAME",
            "CATEGORYNAMES",
            "REGIONNAMES"
        ];
        var reg = new RegExp(/^[\x00-\xff]+$/);
        if (reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文
        //构造查询条件
        var qryOptions = {};
        qryOptions[qryFields[0]] = {like: qry + "%"};
        for (var k = 1; k < qryFields.length; k++) {
            var tmp = {};
            tmp[qryFields[k]] = {like: qry + "%"};
            qryOptions = sequelize.or(qryOptions, tmp);
        }
        mec_vi_online_prepared_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getOnlinePreparedSku [mec_vi_online_prepared_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getOnlinePreparedSku [mec_vi_online_prepared_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取某sku可以上线/下线的门店
exports.getPreparedCounterBySku = function(itemcode,cb){
    mec_vi_online_prepared_counter_skuDAO.queryAll({where:{"ITEMCODE":itemcode}},cb);
}

//上线某商品到某个柜
exports.performOnline=function(itemcode,countercode,cb){
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                //设置商品到柜为上线状态
                mec_itm_storeitemDAO.update({ONLINESTATE:1},{ITEMCODE:itemcode,COUNTERCODE:countercode},t,cb);
            },
            function(cb){
                //如果该商品的销售状态为线下有库存销售,将它设置为线上有库存销售
                mec_itm_itemDAO.update({SELLINGSTATE:3},{ITEMCODE:itemcode,SELLINGSTATE:2},t,cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("performOnline [mec_itm_storeitemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("performOnline [mec_itm_itemDAO.update]: "+JSON.stringify(msg[1]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("performOnline [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    });
}

//下线操作
exports.performOffline=function(itemcode,countercode,cb){
    sequelize.transaction({autocommit:false},function(t){
        async.waterfall([
            function(cb){
                //设置商品到柜为上线状态
                mec_itm_storeitemDAO.update({ONLINESTATE:0},{ITEMCODE:itemcode,COUNTERCODE:countercode},t,cb);
            },
            function(x,cb){
                myLogger.trace("performOffline [mec_itm_storeitemDAO.update]: "+JSON.stringify(x));
                //查询当前该商品上线柜的数目
                var sql="select COUNTERCODE from mec_itm_storeitem where CHECKSTATE=1 and ONLINESTATE=1 and ITEMCODE='?1' FOR UPDATE";
                sql=sql.replace("?1",itemcode);
                generalDAO.runSql(sql,{transaction:t},cb);
            },
            function(x,cb){
                myLogger.trace("performOffline [last online selling counters]: "+JSON.stringify(x));
                //如果该商品最购一各柜台下线,将它设置为线下有库存销售
                if(!x || x.length==0){
                    mec_itm_itemDAO.update({SELLINGSTATE:2},{ITEMCODE:itemcode,SELLINGSTATE:3},t,cb);
                }
                else{
                    cb(null, x.length);
                }
            }
        ],function(err,msg){
            if(!err){
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("performOffline [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    });
}