/**
 * Created by lucywu on 7/4/14.
 * skc信息完善更新审核相关服务
 */
var generalDAO              = require("../../dao/generalDAO");
var async                   = require('async');
var sequelize               = require('../../dao/_sequelize');
var myLogger                = require('../../logging/contextLogger')("web/skcService");
var mec_itm_itemDAO         = require('../../dao/mec_itm_itemDAO');
var mec_itm_skcDAO          = require("../../dao/mec_itm_skcDAO");
var mec_itm_skc_tmpDAO      = require("../../dao/mec_itm_skc_tmpDAO");
var mec_vi_skc_uninitial_sku_totalDAO      = require("../../dao/mec_vi_skc_uninitial_sku_totalDAO");
var mec_vi_skc_renewable_sku_totalDAO      = require("../../dao/mec_vi_skc_renewable_sku_totalDAO");
var mec_vi_skc_checkable_sku_totalDAO      = require("../../dao/mec_vi_skc_checkable_sku_totalDAO");
var stringUtil                             = require("../../util/stringUtil");
var rdms = require("../../interaction/rdms");

//查看需要初始化添加skc信息的sku
exports.getSkcUninitialSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_skc_uninitial_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcUninitialSku [mec_vi_skc_uninitial_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcUninitialSku [mec_vi_skc_uninitial_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_skc_uninitial_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcUninitialSku [mec_vi_skc_uninitial_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcUninitialSku [mec_vi_skc_uninitial_sku_totalDAO.queryAndCount]: " + logErr(err));
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
        mec_vi_skc_uninitial_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcUninitialSku [mec_vi_skc_uninitial_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcUninitialSku [mec_vi_skc_uninitial_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}


//查看可以更新skc信息的sku
exports.getSkcRenewableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    if (!qry &&  typeof (qry) != 'number') {
        mec_vi_skc_renewable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcRenewableSku [mec_vi_skc_renewable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcRenewableSku [mec_vi_skc_renewable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_skc_renewable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcRenewableSku [mec_vi_skc_renewable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcRenewableSku [mec_vi_skc_renewable_sku_totalDAO.queryAndCount]: " + logErr(err));
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
        mec_vi_skc_renewable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcRenewableSku [mec_vi_skc_renewable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcRenewableSku [mec_vi_skc_renewable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//查看有等待审核的skc信息的所有的sku
exports.getSkcCheckableSku = function (qry, options, cb) {
    var rows = options.rows || 20;
    var page = options.page || 1;
    var sidx = options.sidx;
    var sord = options.sord || "asc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);

    if (!qry &&  typeof (qry) != "number") {
        mec_vi_skc_checkable_sku_totalDAO.queryAndCount({"offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcCheckableSku [mec_vi_skc_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcCheckableSku [mec_vi_skc_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
    else if (typeof(qry) == 'object') {
        mec_vi_skc_checkable_sku_totalDAO.queryAndCount({"where": qry, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcCheckableSku [mec_vi_skc_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcCheckableSku [mec_vi_skc_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
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
        mec_vi_skc_checkable_sku_totalDAO.queryAndCount({"where": qryOptions, "offset": offset, "limit": limit, "order": order}, function (err, msg) {
            if (!err) {
                myLogger.trace("getSkcCheckableSku [mec_vi_skc_checkable_sku_totalDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            }
            else {
                myLogger.error("getSkcCheckableSku [mec_vi_skc_checkable_sku_totalDAO.queryAndCount]: " + logErr(err));
                cb(err, null);
            }
        });
    }
}

//获取审核通过的skc信息
exports.getApprovedSkcBySku=function(itemcode,cb){
    async.waterfall([
        function(cb){
            mec_itm_itemDAO.queryOne({attributes:["SKCCHECKSTATE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},cb);
        },
        function(x,cb){
            if(x){
                var skccheckstate= x.SKCCHECKSTATE;
                if(skccheckstate==1||skccheckstate==3){
                    mec_itm_skcDAO.queryAll({where:{ITEMCODE:itemcode,RECORDSTATE:1}},function(err,msg){
                        myLogger.trace("getApprovedSkcBySku [mec_itm_skcDAO.queryAll]: "+(msg&&msg.length));
                        cb(err,msg);
                    })
                }
                else{
                    cb("the item's skc is not approved","warn");
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
            if(msg=="warn") myLogger.warn("getApprovedSkcBySku [waterfall.warn]: "+logErr(err));
            myLogger.error("getApprovedSkcBySku [waterfall.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//获取可以更新的某个sku对应的所有的skc
exports.getRenewableSkcBySku=function(itemcode,cb){
    async.waterfall([
        function(cb){
            mec_itm_itemDAO.queryOne({attributes:["SKCCHECKSTATE"],where:{ITEMCODE:itemcode,CHECKSTATE:1}},cb);
        },
        function(x,cb){
            if(x){
                var skccheckstate= x.SKCCHECKSTATE;
                if(skccheckstate==1){
                    mec_itm_skcDAO.queryAll({where:{ITEMCODE:itemcode,RECORDSTATE:1}},function(err,msg){
                        myLogger.trace("getRenewableSkcBySku [mec_itm_skcDAO.queryAll]: "+(msg&&msg.length));
                        cb(err,msg);
                    })
                }
                else{
                    //如果当前skccheckstate为待审核或者审核过又有更新
                    //查询条件中TMPSTATE(0-实数据待审和 1-占位数据待审核)
                    mec_itm_skc_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
                        if(!err){
                            myLogger.trace("getRenewableSkcBySku [mec_itm_skc_tmpDAO.queryAll]: "+(msg&&msg.length));
                            //如果范围的skc为占位数据,返回空
                            if(msg.length==1 && msg[0].TMPSTATE==1){
                                cb(null,[]);
                            }
                            else{
                                cb(null,msg);
                            }
                        }
                        else{
                            cb(err,null);
                        }
                    })
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
            if(msg=="warn") myLogger.warn("getRenewableSkcBySku [waterfall.warn]: "+logErr(err));
            myLogger.error("getRenewableSkcBySku [waterfall.err]: "+logErr(err));
            cb(err,null);
        }
    })
}

//获取等待审核skc的某个sku对应的全部skc
exports.getCheckableSkcBySku=function(itemcode,cb){
    mec_itm_skc_tmpDAO.queryAll({where:{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}}},function(err,msg){
        if(!err){
            myLogger.trace("getCheckableSkcBySku [mec_itm_skc_tmpDAO.queryAll]: "+(msg&&msg.length));
            //如果范围的skc为占位数据,返回空
            if(msg.length==1 && msg[0].TMPSTATE==1){
                cb(null,[]);
            }
            else{
                cb(null,msg);
            }
        }
        else{
            myLogger.error("getCheckableSkcBySku [mec_itm_skc_tmpDAO.queryAll]: "+logErr(err));
            cb(err,null);
        }
    })
}

//完善skc信息(skcs数组的每个对象包括这些属性:MECHANTSKCCODE,SIZE,COLOR)
exports.initialSkc=function(itemcode,skcs,usercode,cb){
    //为每个skc生成对应的skc编码
    exports.generateSkccodes(itemcode,skcs);
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                //更新item表中的skccheckstate
                mec_itm_itemDAO.update({SKCCHECKSTATE:2},{ITEMCODE:itemcode,SKCCHECKSTATE:0},t,cb);
            },
            function(cb){
                //删除暂存表中该商品已有的未经过审核的skc(如果前端可以保证不重复添加,这一步可以省略)
                mec_itm_skc_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
            },
            function(cb){
                //把每个skc添加到skc_tmp暂存表中等待审核
                //如果skcs为空就要插入占位数据
                if(!skcs||skcs.length==0){
                    var skc={};
                    skc.SKCCODE="";
                    skc.ITEMCODE=itemcode;
                    skc.TMPSTATE=1;
                    skc.LASTOPERATEPERSON=usercode;
                    mec_itm_skc_tmpDAO.add(skc,t,cb);
                }
                else{
                    async.forEach(skcs,function(skc,cb){
                        skc.ITEMCODE=itemcode;
                        skc.TMPSTATE=0;
                        skc.LASTOPERATEPERSON=usercode;
                        mec_itm_skc_tmpDAO.add(skc,t,cb);
                    },function(err){
                        cb(err,skcs.length);
                    })
                }
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("initialSkc [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("initialSkc [mec_itm_skc_tmpDAO.del]: "+JSON.stringify(msg[1]));
                myLogger.trace("initialSkc [mec_itm_skc_tmpDAO.add]: "+JSON.stringify(msg[2]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("initialSkc [series.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//更新skc信息(skcs数组的每个对象包括这些属性:MECHANTSKCCODE,SIZE,COLOR)
exports.updateSkc=function(itemcode,skcs,usercode,cb){
    //为每个skc生成对应的skc编码
    exports.generateSkccodes(itemcode,skcs);
    sequelize.transaction(function(t){
        async.series([
            function(cb){
                //如果当前skccheckState为审核过的状态那么将它更改为审核过又有更新的状态
                mec_itm_itemDAO.update({SKCCHECKSTATE:3},{ITEMCODE:itemcode,SKCCHECKSTATE:1},t,cb);
            },
            function(cb){
                //删除暂存表中该商品已有的未经过审核的skc
                mec_itm_skc_tmpDAO.del({ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
            },
            function(cb){
                //在暂存表中插入更新后的skc信息
                //如果skcs为空就要插入占位数据
                if(!skcs||skcs.length==0){
                    var skc={};
                    skc.SKCCODE="";
                    skc.ITEMCODE=itemcode;
                    skc.TMPSTATE=1;
                    skc.LASTOPERATEPERSON=usercode;
                    mec_itm_skc_tmpDAO.add(skc,t,cb);
                }
                else{
                    async.forEach(skcs,function(skc,cb){
                        skc.ITEMCODE=itemcode;
                        skc.TMPSTATE=0;
                        skc.LASTOPERATEPERSON=usercode;
                        mec_itm_skc_tmpDAO.add(skc,t,cb);
                    },function(err){
                        cb(err,skcs.length);
                    })
                }
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("updateSkc [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("updateSkc [mec_itm_skc_tmpDAO.del]: "+JSON.stringify(msg[1]));
                myLogger.trace("updateSkc [mec_itm_skc_tmpDAO.add]: "+JSON.stringify(msg[2]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("updateSkc [series.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//审核通过相应的skc信息
exports.approveSkc=function(itemcode,usercode,cb){
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                //如果当前skccheckState修改为审核过
                mec_itm_itemDAO.update({SKCCHECKSTATE:1},{ITEMCODE:itemcode,SKCCHECKSTATE:{between:[2,3]}},t,cb);
            },
            function(cb){
                async.waterfall([
                    function(cb){
                        //获取所有相关待审核的skc信息
                        exports.getCheckableSkcBySku(itemcode,cb);
                    },
                    function(x,cb){
                        //获取skc表中原始的skc信息
                        mec_itm_skcDAO.queryAll({where:{"ITEMCODE":itemcode}},t,function(err,y){
                            cb(err,[x,y]);//x为更新后的暂存数据,y为skc表中的原始数据
                        });
                    },
                    function(x,cb){
                        //对比更新的skc信息和原始的skc信息,对原始skc信息增量更新
                        var now=x[0];
                        var org=x[1];
                        var nowSkccodes=[];
                        var nowMap={};
                        var orgSkccodes=[];
                        var orgMap={};
                        for(var k=0;k<now.length;k++) {
                            nowSkccodes.push(now[k].SKCCODE);
                            nowMap[now[k].SKCCODE]=now[k];
                        }
                        for(var k=0;k<org.length;k++) {
                            orgSkccodes.push(org[k].SKCCODE);
                            orgMap[org[k].SKCCODE]=org[k];
                        }
                        myLogger.trace("approveSkc [nowSkccodes]: "+JSON.stringify(nowSkccodes));
                        myLogger.trace("approveSkc [orgSkccodes]: "+JSON.stringify(orgSkccodes));

                        //找出分别需要增删改的skccodes
                        var adds=[];
                        var updates=[];
                        var dels=[];
                        for(var k=0;k<nowSkccodes.length;k++){
                            if(orgSkccodes.indexOf(nowSkccodes[k])==-1) adds.push(nowSkccodes[k]);
                            else updates.push(nowSkccodes[k])
                        }
                        for(var k=0;k<orgSkccodes.length;k++){
                            if(nowSkccodes.indexOf(orgSkccodes[k])==-1) dels.push(orgSkccodes[k]);
                        }
                        myLogger.trace("approveSkc [adds skccodes]: "+JSON.stringify(adds));
                        myLogger.trace("approveSkc [updates skccodes]: "+JSON.stringify(updates));
                        myLogger.trace("approveSkc [dels skccodes]: "+JSON.stringify(dels));

                        //开始对skc表增删改
                        async.parallel([
                            function(cb){
                                //增加skc
                                async.forEach(adds,function(skccode,cb){
                                    var value=nowMap[skccode];
                                    value.RECORDSTATE=1;
                                    delete value.createdAt;
                                    delete value.updatedAt;
                                    mec_itm_skcDAO.add(value,t,cb);
                                },function(err){
                                    cb(err,"adds:"+adds.length);
                                })
                            },
                            function(cb){
                                //更新skc
                                async.forEach(updates,function(skccode,cb){
                                    var value=nowMap[skccode];
                                    value.RECORDSTATE=1;
                                    delete value.createdAt;
                                    delete value.updatedAt;
                                    delete value.SKCCODE;
                                    mec_itm_skcDAO.update(value,{SKCCODE:skccode},t,cb);
                                },function(err){
                                    cb(err,"updates:"+updates.length);
                                })
                            },
                            function(cb){
                                //修改skc
                                async.forEach(dels,function(skccode,cb){
                                    mec_itm_skcDAO.update({RECORDSTATE:0},{SKCCODE:skccode,RECORDSTATE:1},t,cb);
                                },function(err){
                                    cb(err,"dels:"+dels.length);
                                })
                            }
                        ],function(err,msg){
                            myLogger.trace("approveSkc [add update del]: "+JSON.stringify(msg));
                            cb(err,now.length);
                        })
                    },
                    function(x,cb){
                        if(x==0){//skc暂存表里面只有占位数据
                            //修改暂存表中该商品已有的未经过审核的skc为占位数据审核过状态
                            mec_itm_skc_tmpDAO.update({TMPSTATE:3,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:1},t,cb);
                        }
                        else{
                            //修改暂存表中该商品已有的未经过审核的skc为实际数据审核过状态
                            mec_itm_skc_tmpDAO.update({TMPSTATE:2,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:0},t,cb);
                        }
                    }
                ],cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("approveSkc [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("approveSkc [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//拒绝相应的skc信息
exports.invalidSkc=function(itemcode,usercode,cb){
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                //如果当前skccheckState为已经完善待审核修改为待完善状态
                mec_itm_itemDAO.update({SKCCHECKSTATE:0},{ITEMCODE:itemcode,SKCCHECKSTATE:2},t,cb);
            },
            function(cb){
                //如果当前skccheckState为审核过又有更新将其修改为审核过
                mec_itm_itemDAO.update({SKCCHECKSTATE:1},{ITEMCODE:itemcode,SKCCHECKSTATE:3},t,cb);
            },
            function(cb){
                //修改暂存表中该商品已有的未经过审核的skc为拒绝状态
                mec_itm_skc_tmpDAO.update({TMPSTATE:4,LASTOPERATEPERSON:usercode},{ITEMCODE:itemcode,TMPSTATE:{between:[0,1]}},t,cb);
            }
        ],function(err,msg){
            if(!err){
                myLogger.trace("invalidSkc [mec_itm_itemDAO.update]: "+JSON.stringify(msg[0]));
                myLogger.trace("invalidSkc [mec_itm_itemDAO.update]: "+JSON.stringify(msg[1]));
                myLogger.trace("invalidSkc [mec_itm_skc_tmpDAO.update]: "+JSON.stringify(msg[2]));
                t.commit();
                cb(null,msg);
            }
            else{
                myLogger.error("invalidSkc [parallel.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//为某商品的全部skc批量生成skc编码(skcs的每个skc对象包含这些属性:MERCHANTCODE,COLOR,SIZE,SKCCODE也可能存在)
exports.generateSkccodes=function(itemcode,skcs){
//    var colorMap={};
//    var sizeMap={};
//    var colorCode=colorMap[color];
//    var sizeCode=sizeMap[size];

    var codes=[];
    for(var k=0;k<skcs.length;k++){
        if(skcs[k].SKCCODE) codes.push(skcs[k].SKCCODE);
    }
    for(var k=0;k<skcs.length;k++){
        var skc=skcs[k];
        var skccode=skc.SKCCODE;
        if (skccode) continue;
        var color=skc.COLOR||"";
        var size=skc.SIZE||"";
        var str=color.toString()+size.toString();
        myLogger.trace("generateSkccodes [colorsize]: "+str);
        //计算颜色尺寸字符串的3位数字hash值
        var num=stringUtil.hashNumber(str,3);
        skccode=itemcode+stringUtil.autoComple(num,3,'0');
        myLogger.trace("generateSkccodes [skccode]: "+skccode);
        while((codes.indexOf(skccode)!=-1)){
            myLogger.warn("generateSkccodes [repeat skccode]: "+skccode);
            //只要同一个itemcode的skc个数不超过1000个不会陷入死循环
            num=(num+1)%1000;
            skccode=itemcode+num+stringUtil.autoComple(num,3,'0');
        }
        skc.SKCCODE=skccode;
    }
}

exports.refreshSkc=function(itemcode,cb){
    async.waterfall([
        function(cb){
            mec_itm_itemDAO.queryOne({attributes:["ITEMID"],where:{ITEMCODE:itemcode}},cb);
        },
        function(x,cb){
            if(!x) cb("unfound itemcode!",null);
            rdms.getSkc(x.ITEMID,cb);
        },
        function(x,cb){
            x=eval("("+x+")");
            myLogger.trace("refreshSku [write skc]: "+JSON.stringify(x));
            sequelize.transaction(function(t){
                async.forEach(x.rows,function(skc,cb){
                    skc.ITEMCODE=itemcode;
                    skc.SKCCODE=skc.ITEMCODE+skc.SKCCODE;
                    mec_itm_skcDAO.queryOne({where:{SKCCODE:skc.SKCCODE,ITEMCODE:skc.ITEMCODE}},function(err,msg){
                        if(err){
                            cb(err,null);
                        }
                        else if(msg){
                            console.log(msg);console.log("#####");
                            mec_itm_skcDAO.update(skc,{SKCCODE:skc.SKCCODE,ITEMCODE:skc.ITEMCODE},t,cb);
                        }
                        else{
                            mec_itm_skcDAO.add(skc,t,cb);
                        }
                    });
//                    mec_itm_skcDAO.add(skc,t,function(err,msg){//添加skc后会自动生成skc到对应若干柜的库存记录
//                        if(err){
//                            mec_itm_skcDAO.update(skc,{SKCCODE:skc.SKCCODE},t,cb);
//                        }
//                        else{
//                            cb(null,msg);
//                        }
//                    });
                },function(err){
                    if(err){
                        t.rollback();
                        myLogger.error("refreshSku [async.forEach]: " +logErr(err));
                        cb(err,null);
                    }
                    else{
                        t.commit();
                        cb(null,null);
                    }
                })
            });
        }
    ],cb)
}

