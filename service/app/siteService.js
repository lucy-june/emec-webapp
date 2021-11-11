/**
 * Created by lucywu on 7/24/14.
 * 顾客地址管理相关服务
 */
var mec_ctm_siteDAO     = require("../../dao/mec_ctm_siteDAO");
var generalDAO          = require("../../dao/generalDAO");
var myLogger            = require('../../logging/contextLogger')("app/siteService");
var sequelize                   = require('../../dao/_sequelize');

//获取用户的全部地址
exports.getAllSites = function(usercode,cb){
    mec_ctm_siteDAO.queryAll({
        attributes:["SITEID","USERCODE","ISDEFAULT","PERSON","TELEPHONE","POSTCODE","DETAIL","PROVINCE","CITY","DISTRICT"],
        where:{"USERCODE":usercode}
    },function(err,msg){
        if(!err) myLogger.trace("getAllSites [mec_ctm_siteDAO.queryAll]: " + (msg&&msg.length));
        else myLogger.error("getAllSites [mec_ctm_siteDAO.queryAll]: " + logErr(err));
        cb(err,msg);
    });
}

//获取用户的默认地址
exports.getDefaultSite = function(usercode,cb){
    mec_ctm_siteDAO.queryOne({
        attributes:["SITEID","USERCODE","ISDEFAULT","PERSON","TELEPHONE","POSTCODE","DETAIL","PROVINCE","CITY","DISTRICT"],
        where:{"USERCODE":usercode,"ISDEFAULT":1}
    },function(err,msg){
        if(!err) {
            myLogger.trace("getDefaultSite [mec_ctm_siteDAO.queryOne]: " + JSON.stringify(msg));
            if(msg){
                cb(null,msg);
            }
            else{
                cb("无默认地址!",null);
            }
        }
        else {
            myLogger.error("getDefaultSite [mec_ctm_siteDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
}

//获取用户的特定地址
exports.getCertainSite = function(siteid,cb){
    mec_ctm_siteDAO.queryOne({
        attributes:["SITEID","USERCODE","ISDEFAULT","PERSON","TELEPHONE","POSTCODE","DETAIL","PROVINCE","CITY","DISTRICT"],
        where:{"SITEID":siteid}
    },function(err,msg){
        if(!err) {
            myLogger.trace("getCertainSite [mec_ctm_siteDAO.queryOne]: " + JSON.stringify(msg));
            if(msg){
                cb(null,msg);
            }
            else{
                cb("不存在该地址!",null);
            }
        }
        else {
            myLogger.error("getCertainSite [mec_ctm_siteDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
}

//添加地址信息
exports.addSite = function(value,cb){
    if(value.ISDEFAULT==1){
        sequelize.transaction(function(t){
            //撤销该用户的默认地址
            mec_ctm_siteDAO.update({"ISDEFAULT":0},{"USERCODE":value.USERCODE,"ISDEFAULT":1},t,function(err,msg){
                if(!err){
                    myLogger.trace("addSite [mec_ctm_siteDAO.update]: " + (msg&&msg.length));
                    //插入新的默认地址
                    mec_ctm_siteDAO.add(value,t,function(err,msg){
                        if(!err) {
                            myLogger.trace("addSite [mec_ctm_siteDAO.add]: " + (msg&&msg.null));
                            t.commit();
                            cb(null,msg);
                        }
                        else {
                            myLogger.error("addSite [mec_ctm_siteDAO.add]: " + logErr(err));
                            t.rollback();
                            cb(err,null);
                        }
                    });
                }
                else{
                    myLogger.error("addSite [mec_ctm_siteDAO.update]: " + logErr(err));
                    t.rollback();
                    cb(err,null);
                }
            });
        })
    }
    else{
        //插入新的非默认地址
        sequelize.transaction({autocommit:false},function(t){
            //查询该用户的所有地址,为事务获取更新锁
            generalDAO.runSql(
                    "select SITEID from mec_ctm_site where USERCODE = '"+value.USERCODE+"' FOR UPDATE",
                {transaction:t},function(err,msg){
                if(!err){
                    myLogger.trace("addSite [select SITEID from mec_ctm_site]: " + (msg&&msg.length));
                    if(msg.length==0) value.ISDEFAULT=1;//如果该用户没有地址信息,则设置该地址为默认地址
                    mec_ctm_siteDAO.add(value,t,function(err,msg){
                        if(!err){
                            myLogger.trace("addSite [mec_ctm_siteDAO.add]: " + (msg&&msg.null));
                            t.commit();
                            cb(null,msg);
                        }
                        else {
                            myLogger.error("addSite [mec_ctm_siteDAO.add]: " + logErr(err));
                            t.rollback();
                            cb(err,null);
                        }
                    });
                }
                else{
                    myLogger.error("addSite [select SITEID from mec_ctm_site]: " + logErr(err));
                    t.rollback();
                    cb(err,null);
                }
            });
//            mec_ctm_siteDAO.queryAll({attributes:["SITEID"],where:{"USERCODE":value.USERCODE}},t,t.LOCK,function(err,msg){});
        });
    }
}

//删除地址信息
exports.deleteSite = function(siteid,cb){
    sequelize.transaction(function(t){
        mec_ctm_siteDAO.queryOne({where:{"SITEID":siteid}},t,function(err,msg){
            if(!err){
                myLogger.trace("deleteSite [mec_ctm_siteDAO.queryOne]: " + JSON.stringify(msg));
                if(msg){
                    var usercode=msg.USERCODE;
                    var isdefault=msg.ISDEFAULT;
                    mec_ctm_siteDAO.del({"SITEID":siteid},t,function(err,msg){
                        if(!err){
                            myLogger.trace("deleteSite [mec_ctm_siteDAO.del]: " + JSON.stringify(msg));
                            if(isdefault==1){//如果删除的是默认地址,则更新一个成为默认地址
                                //查询到用户的所有地址
                                mec_ctm_siteDAO.queryAll({attributes:["SITEID"],where:{"USERCODE":usercode}},t,function(err,msg){
                                    if(!err){
                                        myLogger.trace("deleteSite [mec_ctm_siteDAO.queryAll]: " + (msg&&msg.length));
                                        if(msg&&msg.length>0){
                                            var chosenSiteid=msg[0].SITEID;
                                            myLogger.trace("deleteSite [chosenSiteid]: " + chosenSiteid);
                                            mec_ctm_siteDAO.update({"ISDEFAULT":1},{"SITEID":chosenSiteid},t,function(err,msg){
                                                if(!err){
                                                    myLogger.trace("deleteSite [mec_ctm_siteDAO.update]: " + JSON.stringify(msg));
                                                    t.commit();
                                                    cb(null,1);
                                                }
                                                else{
                                                    myLogger.error("deleteSite [mec_ctm_siteDAO.update]: " + logErr(err));
                                                    t.rollback();
                                                    cb(err,null);
                                                }
                                            });
                                        }
                                        else{
                                            t.commit();
                                            cb(null,1);
                                        }
                                    }
                                    else{
                                        myLogger.error("deleteSite [mec_ctm_siteDAO.queryAll]: " + logErr(err));
                                        t.rollback();
                                        cb(err,null);
                                    }
                                });
                            }
                            else{//如果删除的不是默认地址,那么提交即可
                                t.commit();
                                cb(null,1);
                            }
                        }
                        else{
                            myLogger.error("deleteSite [mec_ctm_siteDAO.del]: " + logErr(err));
                            t.rollback();
                            cb(err,null);
                        }
                    });
                }
                else{
                    t.rollback();
                    cb("exception",null);
                }
            }
            else{
                myLogger.error("deleteSite [mec_ctm_siteDAO.queryOne]: " + logErr(err));
                t.rollback();
                cb(err,null);
            }
        });
    });
}

//设置默认地址
exports.setDefaultSite = function(siteid,cb){
    sequelize.transaction(function(t){
        //查询该地址,获取该地址信息
        mec_ctm_siteDAO.queryOne({where:{"SITEID":siteid}},t,function(err,msg){
            if(!err&&msg){
                myLogger.trace("setDefaultSite [mec_ctm_siteDAO.queryOne]: " + JSON.stringify(msg));
                var usercode=msg.USERCODE;
                //撤销该用户的默认地址
                mec_ctm_siteDAO.update({"ISDEFAULT":0},{"USERCODE":usercode,"ISDEFAULT":1},t,function(err,msg){
                    if(!err){
                        myLogger.trace("setDefaultSite [mec_ctm_siteDAO.update]: " + (msg&&msg.length));
                        //插入新的默认地址
                        mec_ctm_siteDAO.update({"ISDEFAULT":1},{"SITEID":siteid},t,function(err,msg){
                            if(!err) {
                                myLogger.trace("setDefaultSite [mec_ctm_siteDAO.update]: " + (msg&&msg.null));
                                t.commit();
                                cb(null,msg);
                            }
                            else {
                                myLogger.error("setDefaultSite [mec_ctm_siteDAO.update]: " + logErr(err));
                                t.rollback();
                                cb(err,null);
                            }
                        });
                    }
                    else{
                        myLogger.error("setDefaultSite [mec_ctm_siteDAO.update]: " + logErr(err));
                        t.rollback();
                        cb(err,null);
                    }
                });
            }
            else{
                myLogger.error("setDefaultSite [mec_ctm_siteDAO.queryOne]: " + logErr(err));
                t.rollback();
                cb(err,null);
            }
        });
    });
}

//修改地址信息
exports.modifySite = function(siteid,value,cb){
    mec_ctm_siteDAO.update(value,{"SITEID":siteid},function(err,msg){
        if(!err) myLogger.trace("modifySite [mec_ctm_siteDAO.update]: " + JSON.stringify(msg));
        else myLogger.error("modifySite [mec_ctm_siteDAO.update]: " + logErr(err));
        cb(err,msg);
    })
}

