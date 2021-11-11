/**
 * Created by lucywu on 7/17/14.
 */
var myLogger = require('../../logging/contextLogger')("app/cartService");
var async = require('async');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
var mec_buy_shoppingcartDAO = require("../../dao/mec_buy_shoppingcartDAO");
var mec_vi_shoppingcart_skc_totalDAO = require("../../dao/mec_vi_shoppingcart_skc_totalDAO");
var mec_vi_online_selling_skc_forappDAO = require("../../dao/mec_vi_online_selling_skc_forappDAO")
var mec_itm_skcDAO = require("../../dao/mec_itm_skcDAO");
var promotionService = require("./promotionService");

//获取特定用户的购物车信息
exports.getCart = function (usercode, cb) {
    mec_vi_shoppingcart_skc_totalDAO.queryAll({where: {USERCODE: usercode}}, cb);
}

//合并并获取购物车信息
//options结构为[{SKCCODE:,NUM:},{SKCCODE:,NUM:}...]
//SKCCODE,NUM必须包含,NUM必须是正整数,可以为字符串
//options可以为null或者[],这样会返回所有数据库中的购物车信息
exports.mergeAndGetCart = function (usercode, options, cb) {
    //检查options参数合法性
    if (!options || options.length == 0) {
        myLogger.warn("mergeAndGetCart [Check Params]: no local cart need to merge")
        exports.getCart(usercode, cb);
        return;
    }

    var reg = new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    for (var k = 0; k < options.length; k++) {
        if (!options[k].SKCCODE || !options[k].NUM || !reg.test(options[k].NUM)) {
            myLogger.error("mergeAndGetCart [Check Params]: illegal cart content parameters")
            cb("illegal cart content parameters", null);
            return;
        }
        if (typeof(options[k].NUM) != "number") {
            options[k].NUM = Number(options[k].NUM);
        }
        if (!options[k].NUM || options[k].NUM < 0) {
            myLogger.error("mergeAndGetCart [Check Params]: illegal NUM of cart content")
            cb("illegal NUM of cart content", null);
            return;
        }
    }

    sequelize.transaction(function (t) {
        async.forEach(options, function (option, cb) {
            async.waterfall([
                function (cb) {
                    mec_buy_shoppingcartDAO.queryOne({where: {USERCODE: usercode, SKCCODE: option.SKCCODE}}, t, cb);
                },
                function (x, cb) {
                    if (x) {
                        var num = x.NUM;
                        num += option.NUM;
                        mec_buy_shoppingcartDAO.update({NUM: num}, {USERCODE: usercode, SKCCODE: option.SKCCODE}, t, cb);
                    }
                    else {
                        mec_buy_shoppingcartDAO.add({NUM: option.NUM, USERCODE: usercode, SKCCODE: option.SKCCODE}, t, cb);
                    }
                }
            ], cb)
        }, function (err) {
            if (!err) {
                //提交成功在获取购物车信息
                t.commit().success(function(){
                    exports.getCart(usercode, cb);
                });
            }
            else {
                myLogger.error("mergeAndGetCart [forEach.err]: "+logErr(err));
                t.rollback();
                cb(err,null);
            }
        })
    })
}

//刷新未登录的购物车内skc信息
//skcs是skccode的list:[skccode1,skccode2,...]
exports.refreshUnloginCartSkcs = function (skcs,cb){
    mec_vi_online_selling_skc_forappDAO.queryAll({where:{SKCCODE:{in:skcs}}},cb);
}

//添加购物车条目
exports.addCart = function (usercode, skccode, num, cb) {
    myLogger.trace("addCart [usercode,skccode,num]: "+usercode+" "+skccode+" "+num);

    //参数num检查
    var reg = new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    if(!reg.test(num)){
        myLogger.error("addCart [Check Params]: illegal num");
        cb("illegal num");
        return;
    }
    if(typeof(num)=="string"){
        num=Number(num);
    }
    if(!num||num<0){
        myLogger.error("addCart [Check Params]: illegal num");
        cb("illegal num");
        return;
    }

    //数据库unsigned int sequelize只接受整数!!
    num=num+"";

    async.waterfall([
        function (cb) {
            mec_buy_shoppingcartDAO.queryOne({where: {USERCODE: usercode, SKCCODE: skccode}}, cb);
        },
        function (x, cb) {
            if (x) {
                num += x.NUM;
                mec_buy_shoppingcartDAO.update({"NUM": num}, {USERCODE: usercode, SKCCODE: skccode}, cb);
            }
            else {
                mec_buy_shoppingcartDAO.add({"USERCODE": usercode, "SKCCODE": skccode, "NUM": num}, cb);
            }
        }
    ], function (err, msg) {
        if (!err) {
            cb(null, msg);
        }
        else {
            myLogger.error("addCart [waterfall.err]: " + logErr(err));
            cb(err, null);
        }
    })

}

//删除购物车条目
exports.delCart = function (id, cb) {
    mec_buy_shoppingcartDAO.del({ID: id}, cb);
}

//删除购物车条目
exports.delCart2 = function (usercode, skccode, cb) {
    mec_buy_shoppingcartDAO.del({USERCODE: usercode, SKCCODE: skccode}, cb);
}

//删除多条购物车条目
//options结构是[{USERCODE:,SKCCODE},{USERCODE,SKCCODE},..]
//其中SKCCODE可以省略,这样会删除该用户的全部购物车信息
exports.delCart3 = function (options, cb) {
    sequelize.transaction(function (t) {
        async.forEach(options, function (option, cb) {
            if (option.USERCODE) {
                mec_buy_shoppingcartDAO.del(option, t, cb);
            }
            else {
                cb("no usercode error", null);
            }
        }, function (err) {
            if (!err) {
                t.commit();
                cb(null, options);
            }
            else {
                myLogger.error("delCart3 [forEach.err]: " + logErr(err));
                t.rollback;
                cb(err, null);
            }
        })
    })
}

//更新购物车条目
exports.updateCart = function (id, value, cb) {
    mec_buy_shoppingcartDAO.update(value, {ID: id}, cb);
}

//更新购物车条目
exports.updateCart2 = function (usercode, skccode, num, cb) {
    //参数num检查
    var reg = new RegExp(/^\+{0,1}[0-9]{1,5}$/);
    if(!reg.test(num)){
        myLogger.error("addCart [Check Params]: illegal num");
        cb("illegal num");
        return;
    }
    if(typeof(num)=="string"){
        num=Number(num);
    }
    if(!num||num<0){
        myLogger.error("addCart [Check Params]: illegal num");
        cb("illegal num");
        return;
    }

    //数据库unsigned int sequelize只接受整数!!
    num=num+"";

    mec_buy_shoppingcartDAO.update({NUM: num}, {USERCODE: usercode, SKCCODE: skccode}, cb);
}

//勾选购物车商品过促销引擎
//entries的结构是:[{SKCCODE:?,NUM:?},{SKCCODE:?,NUM:?}...]
exports.getTotalPrice = function (entries, cb) {
    async.forEach(entries, function (entry, cb) {
        mec_itm_skcDAO.queryOne({attributes: ["ITEMCODE"], where: {SKCCODE: entry.SKCCODE, RECORDSTATE: 1}}, function (err, msg) {
            if (!err) {
                if (msg) {
                    entry.ITEMCODE = msg.ITEMCODE;
                    myLogger.trace("getTotalPrice [entry.ITEMCODE]: " + entry.ITEMCODE);
                    cb(null, msg);
                }
                else {
                    cb("unfound itemcode for the skc", null);
                }
            }
            else {
                cb(err, null)
            }
        })
    }, function (err) {
        if (!err) {
            promotionService.process(true, entries, function (err, msg) {
                myLogger.trace("getTotalPrice [promotionService.process.msg]: " + JSON.stringify(msg));
                if (!err) {
                    var sumPrice = 0;
                    for (var k = 0; k < msg.length; k++) {
                        var finalpricelist = msg[k].FINALPRICELIST;
                        for (var i = 0; i < finalpricelist.length; i++) {
                            var _price = finalpricelist[i].PRICE;
                            var _num = finalpricelist[i].NUM;
                            sumPrice += _price * _num;
                        }
                    }
                    myLogger.trace("getTotalPrice [sumPrice]: " + sumPrice);
                    cb(null, sumPrice);
                }
                else {
                    myLogger.error("getTotalPrice [promotionService.process.err]: " + logErr(err));
                    cb(err, null);
                }
            });
        }
        else {
            myLogger.error("getTotalPrice [forEach.err]: " + logErr(err));
            cb(err, null);
        }
    })
}