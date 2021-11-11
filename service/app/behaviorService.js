/**
 * Created by LiJunnan on 2014/12/3.
 * 用户行为相关
 */
var sequelize                        = require('../../dao/_sequelize');    
var generalDAO                       = require('../../dao/generalDAO');
var mec_bhv_favoriteitemDAO          = require('../../dao/mec_bhv_favoriteitemDAO');
var mec_bhv_favoritebrandDAO         = require('../../dao/mec_bhv_favoritebrandDAO');
var mec_buy_onlinecontentDAO         = require('../../dao/mec_buy_onlinecontentDAO');
var mec_itm_skcDAO                   = require('../../dao/mec_itm_skcDAO');
var mec_itm_itemDAO                  = require('../../dao/mec_itm_itemDAO');
var mec_buy_offlinecontentDAO        = require('../../dao/mec_buy_offlinecontentDAO');
var mec_bhv_commentDAO               = require('../../dao/mec_bhv_commentDAO');
var mec_vi_bhv_favoriteitem_totalDAO = require('../../dao/mec_vi_bhv_favoriteitem_totalDAO');
var mec_vi_bhv_comment_totalDAO      = require('../../dao/mec_vi_bhv_comment_totalDAO');
var myLogger                         = require('../../logging/contextLogger')("app/behaviorService");
var async                            = require('async');

/**
 * 收藏商品，若已收藏则取消收藏
 * @param usercode 用户ID
 * @param itemcode 商品ID
 * @param cb 回调函数
 */
exports.favoriteItem = function (op,usercode, itemcode, cb) {
    myLogger.trace("favoriteItem [usercode, itemcode]: " + usercode + "," + itemcode);
    if(op!="del" && op!="add") {
        cb(0);
        return;
    }
    mec_bhv_favoriteitemDAO.queryOne({
        attributes: ['ID'],
        where: {"USERCODE": usercode, "ITEMCODE": itemcode}
    }, function (err, msg) {
        if(!err) {
            myLogger.trace("favoriteItem [mec_bhv_favoriteitemDAO.queryOne]: " + JSON.stringify(msg));
            if(msg && op=="del") {
                //说明已收藏，则取消收藏
                var id = msg.ID;
                mec_bhv_favoriteitemDAO.del({"ID": id}, function (err, msg) {
                    if(!err) {
                        myLogger.trace("favoriteItem [mec_bhv_favoriteitemDAO.del]: " + JSON.stringify(msg));
                        //成功取消收藏
                        cb(2);
                    }
                    else {
                        myLogger.error("favoriteItem [mec_bhv_favoriteitemDAO.del]: " + logErr(err));
                        cb(0);
                    }
                });

            }
            else if(!msg && op=="add") {
                //说明不存在该收藏，收藏该商品
                var value = {};
                value.ITEMCODE = itemcode;
                value.USERCODE = usercode;
                mec_bhv_favoriteitemDAO.add(value, function (err, msg) {
                    if(!err) {
                        myLogger.trace("favoriteItem [mec_bhv_favoriteitemDAO.add]: " + JSON.stringify(msg));
                        //成功添加收藏
                        cb(1);
                    }
                    else {
                        myLogger.error("favoriteItem [mec_bhv_favoriteitemDAO.del]: " + logErr(err));
                        cb(0);
                    }
                });
            }
            else if(op=="del"){
                cb(2);
            }
            else{
                cb(1);
            }
        }
        else {
            myLogger.error("favoriteItem [mec_bhv_favoriteitemDAO.queryOne]: " + logErr(err));
            cb(0);
        }
    });
};

exports.checkFavoriteItem = function(usercode,itemcode,cb){
    mec_bhv_favoriteitemDAO.queryOne({
        attributes: ['ID'],
        where: {"USERCODE": usercode, "ITEMCODE": itemcode}
    }, function (err, msg) {
        if(!err){
            if(msg){
                cb(null,"1");
            }
            else{
                cb(null,"0");
            }
        }
        else{
            cb(err,null);
        }
    });
}

/**
 * 收藏品牌，若已收藏则取消收藏
 * @param usercode 用户ID
 * @param brandcode 商品ID
 * @param cb 回调函数
 */
exports.favoriteBrand = function (op,usercode, brandcode, cb) {
    myLogger.trace("favoriteBrand [usercode, brandcode]: " + usercode + "," + brandcode);
    if(op!="del" && op!="add") {
        cb(0);
        return;
    }
    mec_bhv_favoritebrandDAO.queryOne({
        attributes: ['ID'],
        where: {"USERCODE": usercode, "BRANDCODE": brandcode}
    }, function (err, msg) {
        if(!err) {
            myLogger.trace("favoriteBrand [mec_bhv_favoritebrandDAO.queryOne]: " + JSON.stringify(msg));
            if(msg && op=="del") {
                //说明已收藏，则取消收藏
                var id = msg.ID;
                mec_bhv_favoritebrandDAO.del({"ID": id}, function (err, msg) {
                    if(!err) {
                        myLogger.trace("favoriteBrand [mec_bhv_favoritebrandDAO.del]: " + JSON.stringify(msg));
                        //成功取消收藏
                        cb(2);
                    }
                    else {
                        myLogger.error("favoriteBrand [mec_bhv_favoritebrandDAO.del]: " + logErr(err));
                        cb(0);
                    }
                });
            }
            else if(!msg && op=="add") {
                //说明不存在该收藏，收藏该商品
                var value = {};
                value.BRANDCODE = brandcode;
                value.USERCODE = usercode;
                mec_bhv_favoritebrandDAO.add(value, function (err, msg) {
                    if(!err) {
                        myLogger.trace("favoriteBrand [mec_bhv_favoritebrandDAO.add]: " + JSON.stringify(msg));
                        //成功添加收藏
                        cb(1);
                    }
                    else {
                        myLogger.error("favoriteBrand [mec_bhv_favoritebrandDAO.del]: " + logErr(err));
                        cb(0);
                    }
                });
            }
            else if(op=="del"){
                cb(2);
            }
            else{
                cb(1);
            }
        }
        else {
            myLogger.error("favoriteBrand [mec_bhv_favoritebrandDAO.queryOne]: " + logErr(err));
            cb(0);
        }
    });
};

exports.checkFavoriteBrand = function(usercode,brandcode,cb){
    mec_bhv_favoritebrandDAO.queryOne({
        attributes: ['ID'],
        where: {"USERCODE": usercode, "BRANDCODE": brandcode}
    }, function (err, msg) {
        if(!err){
            if(msg){
                cb(null,"1");
            }
            else{
                cb(null,"0");
            }
        }
        else{
            cb(err,null);
        }
    });
}

/**
 * 获取用户的收藏
 * @param usercode 用户ID
 * @param options  查询设置，例如分页等
 * @param cb       回调函数
 */
exports.getFavorItem = function (usercode, options, cb) {
    myLogger.trace("getFavorItem [usercode,options]: " + usercode + "," + options);

    var rows = options.rows || 10;
    var page = options.page || 1;
    var sidx = options.sidx || "CREATETIME";
    var sord = options.sord || "desc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    var where = {"USERCODE": usercode};

    mec_vi_bhv_favoriteitem_totalDAO.queryAndCount(
        {"where": where, "offset": offset, "limit": limit, "order": order},
        function (err, msg) {
        if(!err) {
            myLogger.trace("getFavorItem [mec_vi_bhv_favoriteitem_totalDAO.queryAndCount]" + (msg && msg.count));
            cb(null, msg);
        } else {
            myLogger.error("getFavorItem [mec_vi_bhv_favoriteitem_totalDAO.queryAndCount]" + logErr(err));
            cb(err, null);
        }
    });
};


/**
 * 获取用户收藏的品牌
 * @param usercode 用户ID
 * @param options  查询设置，分页等
 * @param cb       回调函数
 */
//TODO:对收藏的品牌建视图
exports.getFavorBrand = function (usercode, options, cb) {
    myLogger.trace("getFavorBrand [usercode, options]: " + usercode + "," + options);

    var rows = options.rows || 10;
    var page = options.page || 1;
    var sidx = options.sidx || "createdAt";
    var sord = options.sord || "desc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    var where = {"USERCODE": usercode};

    mec_bhv_favoritebrandDAO.queryAndCount(
        {"where": where, "offset": offset, "limit": limit, "order": order},
        function (err, msg) {
            if(!err) {
                myLogger.trace("getFavorBrand [mec_bhv_favoritebrandDAO.queryAndCount]" + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getFavorBrand [mec_bhv_favoritebrandDAO.queryAndCount]" + logErr(err));
                cb(err, null);
            }
        }
    );
};

/**
 * online商品评论
 * @param usercode   用户ID
 * @param contentcode  商品contentcode
 * @param star       评价星级
 * @param comment    用户评论
 * @param cb         回调函数
 */
exports.onlineComment = function (usercode, contentcode, star, comment, cb) {
    myLogger.trace("onlineComment [usercode, contentcode, star, comment]: "
        + usercode + "," + contentcode + "," + star + "," + comment);
    var value = {};
    value.CONTENTCODE = contentcode;
    value.ISONLINEORDER = 1;
    value.USERCODE = usercode;
    value.STARS = star;
    value.COMMENT = comment;
    
    sequelize.transaction({
       autocommit:false 
    }, function (t) {
        async.waterfall([
            function (cb) {
                //获取ORDERCODE和SKCCODE
                var attributes = ["ONLINEORDERCODE", "SKCCODE"];
                var where = {"ONLINECONTENTCODE": contentcode};
                mec_buy_onlinecontentDAO.queryOne({attributes: attributes, where: where}, t, cb);
            },
            function (n, cb) {
                //获取ITEMCODE
                myLogger.trace("onlineComment [mec_buy_onlinecontentDAO.queryOne]: " + JSON.stringify(n));
                value.ORDERCODE = n.ONLINEORDERCODE;
                var skccode = n.SKCCODE;
                var attributes = ["ITEMCODE"];
                var where = {"SKCCODE": skccode};
                mec_itm_skcDAO.queryOne({attributes: attributes, where:where}, t, cb);
            },
            function (n, cb) {
                //添加评论
                myLogger.trace("onlineComment [mec_itm_skcDAO.queryOne]: " + JSON.stringify(n));
                value.ITEMCODE = n.ITEMCODE;
                mec_bhv_commentDAO.add(value, t, cb);
            },
            function (n, cb) {
                myLogger.trace("onlineComment [mec_bhv_commentDAO.add]: " + JSON.stringify(n));
                //在Comment表添加评论完成，下面在ITEM表更新评价相关信息
                //在Item表获取原评论数据
                var sql = "select SCORE, SCOREPOPULARITY, PRAISERATE from mec_itm_item where ITEMCODE = '?1' limit 1 FOR UPDATE";
                sql = sql.replace('?1', value.ITEMCODE);
                    async.waterfall([
                        function (cb) {
                            generalDAO.runSql(sql, {transaction:t}, cb);
                        },
                        function (x, cb) {
                            myLogger.trace("onlineComment [select SCORE, SCOREPOPULARITY, PRAISERATE from mec_itm_item]: " + JSON.stringify(x));
                            //通过原数据计算新数据
                            var oldscore = x[0].SCORE;
                            var oldscorepopularity = x[0].SCOREPOPULARITY;
                            var oldpraiserate = x[0].PRAISERATE;
                            var newscorepopularity = oldscorepopularity + 1;
                            var score = value.STARS;
                            score = parseInt(score);
                            var newscore = (oldscore*oldscorepopularity + score)/newscorepopularity;
                            newscore = newscore.toFixed(5);
                            var newpraiserate;
                            if(value.STARS == 4||value.STARS == 5) {
                                newpraiserate = (oldpraiserate*oldscorepopularity/100 + 1)/newscorepopularity;
                                newpraiserate = Math.round(newpraiserate*100);
                            } else {
                                newpraiserate = (oldpraiserate*oldscorepopularity/100)/newscorepopularity;
                                newpraiserate = Math.round(newpraiserate*100);
                            }
                            //计算完成,更新新数据到数据库
                            var data = {SCORE: newscore, SCOREPOPULARITY: newscorepopularity, PRAISERATE: newpraiserate};
                            var where = {ITEMCODE: value.ITEMCODE};
                            mec_itm_itemDAO.update(data, where, t, cb);
                        }
                    ], function (err, msg) {
                        if(!err) {
                            //数据库更新成功
                            myLogger.trace("onlineComment [mec_itm_itemDAO.update]: " + JSON.stringify(msg));
                            cb(null, "success in update");
                        } else {
                            myLogger.error("onlineComment [updatewaterfall.err]: " + logErr(err));
                            cb("error in update mec_itm_item", null);
                        }
                    });
            }
        ], function (err, msg) {
            if(!err) {
                console.log(msg);
                t.commit();
                cb(1);
            } else {
                myLogger.error("onlineComment [addwaterfull.err]: " + logErr(err));
                cb(0);
            }
        });
    });
};


/**
 * offline商品评论
 * @param {String} usercode 用户id
 * @param {String} contentcode 商品contentcode
 * @param {Num} star     评价星级
 * @param {String} comment  评论
 * @param {function} cb  回调函数
 */
exports.offlineComment = function (usercode, contentcode, star, comment, cb) {
    myLogger.trace("offlineComment [usercode, contentcode, star, comment]: "
        + usercode + "," + contentcode + "," + star + "," + comment);
    var value = {};
    value.CONTENTCODE = contentcode;
    value.ISONLINEORDER = 0;
    value.USERCODE = usercode;
    value.STARS = star;
    value.COMMENT = comment;

    sequelize.transaction({
        autocommit:false
    }, function (t) {
        async.waterfall([
            function (cb) {
                //获取ORDERCODE和ITEMCODE
                var attributes = ["OFFLINEORDERCODE", "ITEMCODE"];
                var where = {"OFFLINECONTENTCODE": contentcode};
                mec_buy_offlinecontentDAO.queryOne({attributes: attributes, where: where}, t, cb);
            },
            function (n, cb) {
                myLogger.trace("offlineComment [mec_buy_offlinecontentDAO.queryOne]: " + JSON.stringify(n));
                //添加评论
                value.ORDERCODE = n.OFFLINEORDERCODE;
                value.ITEMCODE = n.ITEMCODE;
                mec_bhv_commentDAO.add(value, t, cb);
            },
            function (n, cb) {
                myLogger.trace("offlineComment [mec_bhv_commentDAO.add]: " + JSON.stringify(n));
                //在Comment表添加评论完成，下面在ITEM表更新评价相关信息
                //在Item表获取原评论数据
                var sql = "select SCORE, SCOREPOPULARITY, PRAISERATE from mec_itm_item where ITEMCODE = '?1' limit 1 FOR UPDATE";
                sql = sql.replace('?1', value.ITEMCODE);
                async.waterfall([
                    function (cb) {
                        generalDAO.runSql(sql, {transaction: t}, cb);
                    },
                    function (x, cb) {
                        myLogger.trace("offlineComment [select SCORE, SCOREPOPULARITY, PRAISERATE from mec_itm_item]: " + JSON.stringify(x));
                        //通过原数据计算新数据
                        var oldscore = x[0].SCORE;
                        var oldscorepopularity = x[0].SCOREPOPULARITY;
                        var oldpraiserate = x[0].PRAISERATE;
                        var newscorepopularity = oldscorepopularity + 1;
                        var score = value.STARS;
                        score = parseInt(score);
                        var newscore = (oldscore*oldscorepopularity + score)/newscorepopularity;
                        //取小数点后5位
                        newscore = newscore.toFixed(5);
                        var newpraiserate;
                        if(value.STARS == 4||value.STARS == 5) {
                            newpraiserate = (oldpraiserate*oldscorepopularity/100 + 1)/newscorepopularity;
                            //好评率百分之取整
                            newpraiserate = Math.round(newpraiserate*100);
                        } else {
                            newpraiserate = (oldpraiserate*oldscorepopularity/100)/newscorepopularity;
                            newpraiserate = Math.round(newpraiserate*100);
                        }
                        //计算完成,更新新数据到数据库
                        var data = {SCORE: newscore, SCOREPOPULARITY: newscorepopularity, PRAISERATE: newpraiserate};
                        var where = {ITEMCODE: value.ITEMCODE};
                        mec_itm_itemDAO.update(data, where, t, cb);
                    }
                ], function (err, msg) {
                    if(!err) {
                        //数据库更新成功
                        myLogger.trace("offlineComment [mec_itm_itemDAO.update]: " + JSON.stringify(msg));
                        cb(null, "success in update");

                    } else {
                        myLogger.error("offlineComment [updatewaterfall.err]: " + logErr(err));
                        cb("error in update mec_itm_item", null);
                    }
                });
            }
        ], function (err, msg) {
            if(!err) {
                console.log(msg);
                t.commit();
                cb(1);
            }
            else {
                myLogger.error("offlineComment [addwaterfall.err]: " + logErr(err));
                t.rollback();
                cb(0);
            }
        });
    });
};

/**
 * 获取商品的评论
 * @param itemcode  ITEMCODE
 * @param options   分页等设置
 * @param cb        回调函数
 */
exports.getComment = function (itemcode, options, cb) {
    myLogger.trace("getComment [itemcode,options]: " + itemcode + "," + options);

    var rows = options.rows || 10;
    var page = options.page || 1;
    var sidx = options.sidx || "createdAt";
    var sord = options.sord || "desc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    var where = {"ITEMCODE": itemcode};

    mec_vi_bhv_comment_totalDAO.queryAndCount(
        {"where": where, "offset": offset, "limit": limit, "order": order},
        function (err, msg) {
            if(!err) {
                myLogger.trace("getComment [mec_bhv_commentDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getComment [mec_bhv_commentDAO.queryAndCount]" + logErr(err));
                cb(err, null);
            }
        }
    );
};

//获取商品好评
exports.getCommentGood = function(itemcode,options,cb){
    myLogger.trace("getCommentGood [itemcode,options]: " + itemcode + "," + options);

    var rows = options.rows || 10;
    var page = options.page || 1;
    var sidx = options.sidx || "createdAt";
    var sord = options.sord || "desc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    var where = {"ITEMCODE": itemcode,STARS:{between:[4,5]}};

    mec_vi_bhv_comment_totalDAO.queryAndCount(
        {"where": where, "offset": offset, "limit": limit, "order": order},
        function (err, msg) {
            if(!err) {
                myLogger.trace("getCommentGood [mec_bhv_commentDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getCommentGood [mec_bhv_commentDAO.queryAndCount]" + logErr(err));
                cb(err, null);
            }
        }
    );
}

//获取商品中评
exports.getCommentMid = function(itemcode,options,cb){
    myLogger.trace("getCommentMid [itemcode,options]: " + itemcode + "," + options);

    var rows = options.rows || 10;
    var page = options.page || 1;
    var sidx = options.sidx || "createdAt";
    var sord = options.sord || "desc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    var where = {"ITEMCODE": itemcode,STARS:{between:[2,3]}};

    mec_vi_bhv_comment_totalDAO.queryAndCount(
        {"where": where, "offset": offset, "limit": limit, "order": order},
        function (err, msg) {
            if(!err) {
                myLogger.trace("getCommentMid [mec_bhv_commentDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getCommentMid [mec_bhv_commentDAO.queryAndCount]" + logErr(err));
                cb(err, null);
            }
        }
    );
}

//获取商品差评
exports.getCommentBad= function(itemcode,options,cb){
    myLogger.trace("getCommentBad [itemcode,options]: " + itemcode + "," + options);

    var rows = options.rows || 10;
    var page = options.page || 1;
    var sidx = options.sidx || "createdAt";
    var sord = options.sord || "desc";

    var offset = rows * (page - 1);
    var limit = rows;
    var order = sidx && (sidx + " " + sord);
    var where = {"ITEMCODE": itemcode,STARS:{between:[0,1]}};

    mec_vi_bhv_comment_totalDAO.queryAndCount(
        {"where": where, "offset": offset, "limit": limit, "order": order},
        function (err, msg) {
            if(!err) {
                myLogger.trace("getCommentBad [mec_bhv_commentDAO.queryAndCount]: " + (msg && msg.count));
                cb(null, msg);
            } else {
                myLogger.error("getCommentBad [mec_bhv_commentDAO.queryAndCount]" + logErr(err));
                cb(err, null);
            }
        }
    );
}
