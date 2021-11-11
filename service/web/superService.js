/**
 * Created by lucywu on 7/8/14.
 * 超级管理员相关服务
 */
var mec_adm_adminDAO        = require('../../dao/mec_adm_adminDAO');
var mec_hsy_salesmanDAO    = require("../../dao/mec_hsy_salesmanDAO");
var mec_hct_counterDAO  =require("../../dao/mec_hct_counterDAO");
var mec_adm_ukeyDAO    =require("../../dao/mec_adm_ukeyDAO");
var mec_sys_businesssettingDAO    =require("../../dao/mec_sys_businesssettingDAO");
var pbkdf2                  = require("../../security/pbkdf2");
var myLogger                = require('../../logging/contextLogger')("web/superService");
var sequelize               = require('../../dao/_sequelize');
var generalDAO              = require('../../dao/generalDAO');
var async                   = require('async');

//获取相关管理员账户信息
exports.getAccounts = function (qry,options,cb) {
    var rows=options.rows||20;
    var page=options.page||1;
    var sidx=options.sidx;
    var sord=options.sord||"asc";

    var offset=rows*(page-1);
    var limit=rows;
    var order=sidx&&(sidx+" "+sord);

    var attributes=[
        "USERCODE",
        "ROLE",
        "DEPTCODE",
        "COUNTERCODE",
        "TELEPHONE",
        "EMAIL",
        "NAME",
        "GENDER"
    ];

    if(!qry||qry==""){
        mec_adm_adminDAO.queryAndCount({
            "where":{RECORDSTATE:1},
            "attributes":attributes,
            "offset":offset,
            "limit":limit,
            "order":order
        },function(err,msg){
            if(!err){
                myLogger.trace("getAccounts [mec_adm_adminDAO.queryAndCount]: "+(msg&&msg.count));
                cb(null,msg);
            }
            else{
                myLogger.error("getAccounts [mec_adm_adminDAO.queryAndCount]: "+logErr(err));
                cb(err,null);
            }
        });
    }
    else if(typeof(qry)=='object'){
        qry.RECORDSTATE=1;
        mec_adm_adminDAO.queryAndCount({
            "where":qry,
            "attributes":attributes,
            "offset":offset,
            "limit":limit,
            "order":order
        },function(err,msg){
            if(!err){
                myLogger.trace("getAccounts [mec_adm_adminDAO.queryAndCount]: "+(msg&&msg.count));
                cb(null,msg);
            }
            else{
                myLogger.error("getAccounts [mec_adm_adminDAO.queryAndCount]: "+logErr(err));
                cb(err,null);
            }
        });
    }
    else{
        //要模糊查询的所有列
        var qryFields=[
            "USERCODE",
            "ROLE",
            "DEPTCODE",
            "COUNTERCODE",
            "TELEPHONE",
            "NAME",
            "GENDER",
            "LASTOPERATEPERSON"
        ];
        var reg=new RegExp(/^[\x00-\xff]+$/);
        if(reg.test(qry)) qryFields.push("updatedAt"); //时间字段的like查询不允许有中文

        //构造查询条件
        var qryOptions={};
        qryOptions[qryFields[0]]={like:qry+"%"};
        for(var k=1;k<qryFields.length;k++){
            var tmp={};
            tmp[qryFields[k]]={like:qry+"%"};
            qryOptions=sequelize.or(qryOptions,tmp);
        }
        qryOptions=sequelize.and(qryOptions,{"RECORDSTATE":1});
        mec_adm_adminDAO.queryAndCount({
            "where":qryOptions,
            "attributes":attributes,
            "offset":offset,
            "limit":limit,
            "order":order
        },function(err,msg){
            if(!err){
                myLogger.trace("getAccounts [mec_adm_adminDAO.queryAndCount]: "+(msg&&msg.count));
                cb(null,msg);
            }
            else{
                myLogger.error("getAccounts [mec_adm_adminDAO.queryAndCount]: "+logErr(err));
                cb(err,null);
            }
        });
//        var sql;
//        generalDAO.runSql(sql,function(err,msg){
//
//        });
    }
};

//获取一个管理账户信息
exports.getAccount = function (usercode,cb) {
    var qry={"USERCODE":usercode,RECORDSTATE:1};
    mec_adm_adminDAO.queryOne({
        attributes:["USERCODE","ROLE","DEPTCODE","COUNTERCODE","TELEPHONE","EMAIL","NAME","GENDER"],
        where: qry
    }, function (err,msg) {
        if(!err && msg) {
            myLogger.trace("getAccount [mec_adm_adminDAO.queryOne]: " + JSON.stringify(msg));
            cb(null,msg);
        }
        else {
            myLogger.error("getAccount [mec_adm_adminDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
};

//添加管理员账户
exports.addAccount = function (value,superadmin,cb) {
    value.LASTOPERATEPERSON=superadmin;
    var usercode = value.USERCODE;
    var password = value.PWD;
    if(!usercode && usercode!=0){
        cb("用户名不能为空!",null);
        return;
    }
    if(!password && password!=0){
        cb("密码不能为空",null);
        return;
    }
    else{
        var salt = pbkdf2.generateSaltSync(32);
        var hash = pbkdf2.hashSync(password, salt, 2, 64, 'sha256');
        value.HASH = hash;
        value.SALT = salt;
        delete value.PWD;
    }
    mec_adm_adminDAO.queryOne({attributes:["USERCODE"],where: {"USERCODE":usercode}}, function (err,msg) {
        if(!err) {
            myLogger.trace("addAccount [mec_adm_adminDAO.queryOne]: " + JSON.stringify(msg));
            if(!msg){
                mec_adm_adminDAO.add(value, function (err,msg) {
                    if(!err){
                        myLogger.trace("addAccount [mec_adm_adminDAO.add]: " +JSON.stringify(msg));
                        cb(null,"账户添加成功!");
                    }
                    else{
                        myLogger.error("addAccount [mec_adm_adminDAO.add]: " +logErr(err));
                        cb(err,null);
                    }
                });
            }
            else{
                cb("该用户名已经存在!",null);
            }
        }
        else {
            myLogger.error("addAccount [mec_adm_adminDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
};

bindAndAddCounter=function(counterid,cb){
    mec_adm_adminDAO.queryOne({attributes:["USERCODE"],where: {"USERCODE":counterid}}, function (err,msg) {
        if(!err){
            if(!msg){
                var user={};
                user.USERCODE=counterid;
                user.PWD='123456';
                var salt = pbkdf2.generateSaltSync(32);
                var hash = pbkdf2.hashSync(user.PWD, salt, 2, 64, 'sha256');
                user.HASH = hash;
                user.SALT = salt;
                user.ROLE=1;
                user.DEPTCODE='10201';
                user.COUNTERCODE=counterid;
                user.GENDER=0;
                mec_adm_adminDAO.add(user, function (err,msg) {
                    if(!err){
                        myLogger.trace("addAccount [mec_adm_adminDAO.add]: " +(msg && msg.null));
                        cb(null,"账户添加成功!");
                    }
                    else{
                        myLogger.error("addAccount [mec_adm_adminDAO.add]: " +logErr(err));
                        cb(err,null);
                    }
                });
            }else{
                cb(null,'不用添加账户！');
            }
        }else{
            myLogger.error("addAccount [mec_adm_adminDAO.queryOne]: " + logErr(err));
            cb('查询账号时出错了'+err,null);
        }
    });
}

exports.bindUkey=function(keyid, keytype,counterid,superadmin,cb){
    if(!keyid||!counterid||!superadmin){
        cb("参数不正确",null);
        return;
    }
    //判断柜台是否存在
    counterExists(counterid,function(err,msg){
        if(!err&&msg){
            //执行插入操作
            var value={};
            value.KEYID=keyid;
            value.KEYTYPE=keytype;
            value.COUNTERCODE=counterid;
            value.STATUS=1;
            value.LASTOPERATEPERSON=superadmin;
            mec_adm_ukeyDAO.add(value,function(err,msg){
                if(!err){
                    bindAndAddCounter(counterid,function(err,msg){
                       if(!err){
                           cb(null,'绑定成功了');
                       } else{
                           cb('绑定失败了'+err,null);
                       }
                    });
                    //cb(null,"插入成功");
                }else{
                    console.log("Error:"+err);
                    cb("插入失败！",null);
                }
            });
            /*
            //检测KEYID是否已经存在了
            mec_adm_ukeyDAO.queryOne({attributes:["KEYID"],where: {"KEYID":keyid}},function(err,msg){
                if(!err){
                    if(!msg){
                        mec_adm_ukeyDAO.add(value,function(err,msg){
                            if(!err){
                                cb(null,"插入成功");
                            }else{
                                cb("插入失败！",null);
                            }
                        });
                    }else{
                        cb("该ID的U盾已存在",null);
                    }
                }else{
                    cb("验证是否存在出错",null);
                }
            });
            */
        }else if(msg==null){
            cb("该柜台不存在",null);
        }else{
            cb(err,null);
        }
    });
}

exports.checkKeyExists=function(keyid,cb){
    mec_adm_ukeyDAO.queryOne({attributes:["KEYID"],where: {"KEYID":keyid}},function(err,msg){
        if(!err){
            if(!msg){
                cb(null,false);
            }else{
                cb(null,true);
            }
        }else{
            cb("查询出错",null);
        }
    });
}

counterExists= function (counterid,cb) {
    mec_hct_counterDAO.queryOne({
        attributes:['COUNTERCODE','COUNTERNAME'],
        where:{'COUNTERCODE':counterid}
    },function(err,msg){
        if(!err){
            myLogger.trace("checkCounter [htc_counterDAO.queryOne]: "+JSON.stringify(msg));
            if(msg){
                cb(null,true);
            }else{
                cb(null,false);
            }
        }else{
            cb("检测柜台出错",false);
        }
    });
}
//获取U盾的信息
exports.getKeyInfo=function(keyid,cb){
    mec_adm_ukeyDAO.queryOne({attributes:["KEYID","COUNTERCODE","STATUS","KEYTYPE"],where: {"KEYID":keyid}},function(err,msg){
        if(!err){
            if(msg){
                //cb(null,msg);
                if(msg.COUNTERCODE==-1){
                    var counter={};
                    counter.COUNTERNAME="未绑定柜台";
                    counter.COUNTERCODE="未绑定柜台";
                    msg.COUNTER=counter;
                    cb(null,msg);
                    return;
                }
                mec_hct_counterDAO.queryOne({
                    attributes:['COUNTERCODE','COUNTERNAME'],
                    where:{'COUNTERCODE':msg.COUNTERCODE}
                },function(err,counter){
                    if(!err){
                        myLogger.trace("checkCounter [htc_counterDAO.queryOne]: "+JSON.stringify(counter));
                        if(counter){
                            msg.COUNTER=counter;
                            cb(null,msg);
                        }else{
                            cb("柜台不存在",null);
                        }
                    }else{
                        cb("检测柜台出错",null);
                    }
                });
            }else{
                cb("不存在该ID的U盾",null);
            }
        }else{
            cb("查询出错",null);
        }
    });
}

//更改U盾的绑定信息
exports.changeKey=function(params,cb){
    var keyid=params.KEYID;
    if(!keyid){
        cb("参数错误",null);
        return;
    }
    var counterid=params.NEWCOUNTERID||-1;
    //检测U盾是否存在
    exports.checkKeyExists(keyid,function(err,msg){
        if(!err){
            if(msg){
                if(counterid!=-1){
                    //检测目标柜台是否存在
                    counterExists(counterid,function(err,msg){
                       if(!err){
                           if(msg){
                               //更新
                               mec_adm_ukeyDAO.update({"COUNTERCODE":counterid},{"KEYID":keyid},function(err,msg){
                                   if(!err){
                                       bindAndAddCounter(counterid,function(err,msg){
                                           if(!err){
                                               cb(null,'更新成功了');
                                           } else{
                                               cb('更新出现问题，但是不一定失败'+err,null);
                                           }
                                       });
                                       //cb(null,"更新成功");
                                   }else{
                                       cb(err,null);
                                   }
                               });
                           }else{
                               cb("目标柜台不存在",null);
                           }
                       }else{
                           cb("检查柜台出错",null);
                       }
                    });
                }else{
                    //更新
                    mec_adm_ukeyDAO.update({"COUNTERCODE":counterid},{"KEYID":keyid},function(err,msg){
                        if(!err){
                            cb(null,"更新成功");
                        }else{
                            cb(err,null);
                        }
                    });
                }
            }else{
                cb("该ID的U盾不存在",null);
            }
        }
    });

}

//获取某个柜台的全部U盾
exports.getAllKeys=function(counterid,cb){
    //检查柜台是否存在
    mec_hct_counterDAO.queryOne({
        attributes:['COUNTERCODE','COUNTERNAME'],
        where:{'COUNTERCODE':counterid}
    },function(err,counter){
        if(!err){
            if(counter){
                //查询全部的U盾
                mec_adm_ukeyDAO.queryAll({attributes:["KEYID","COUNTERCODE","STATUS","KEYTYPE"],where: {"COUNTERCODE":counter.COUNTERCODE}},function(err,msg){
                    if(!err){
                        var num=msg.length;
                        for(var i=0;i<num;i++){
                            msg[i].COUNTER=counter;
                        }
                        cb(null,msg);
                    }else{
                        cb("查询U盾出错啦",null);
                    }
                });
            }else{
                cb("柜台不存在",null);
            }
        }else{
            cb("查询柜台时出错",null);
        }
    });
}

exports.updateKeyStatus=function(keyid,status,type,cb){
    //检查key是否存在
    exports.checkKeyExists(keyid,function(err,msg){
        if(!err){
            if(msg){
                mec_adm_ukeyDAO.update({"KEYTYPE":type,"STATUS":status},{"KEYID":keyid},function(err,msg){
                    if(!err){
                        cb(null,"更新成功");
                    }else{
                        cb("更新失败",null);
                    }
                });
            }else{
                cb("没有该U盾！",null);
            }
        }else{
            cb("查询U盾出错了！",null);
        }
    });
}

//修改管理员账户
exports.modifyAccount = function (usercode,value,superadmin,cb) {
    value.LASTOPERATEPERSON=superadmin;
    var password = value.PWD;
    if(!usercode && usercode!=0){
        cb("用户名不能为空!",null);
        return;
    }
    if(password){
        var salt = pbkdf2.generateSaltSync(32);
        var hash = pbkdf2.hashSync(password, salt, 2, 64, 'sha256');
        value.HASH = hash;
        value.SALT = salt;
        delete value.PWD;
    }
    var where={"USERCODE":usercode,"RECORDSTATE":1}
    mec_adm_adminDAO.update(value,where, function (err,msg) {
        if(!err) {
            myLogger.trace("modifyAccount [mec_adm_adminDAO.update]: " + JSON.stringify(msg));
            if(msg==1){
                cb(null,"账户修改成功!");
            }
            else{
                cb("不存在该账户",null);
            }
        }
        else {
            myLogger.error("modifyAccount [mec_adm_adminDAO.update]: " + logErr(err));
            cb(err,null);
        }
    });
};

//删除管理员账户
exports.delAccount = function (usercode,superadmin,cb) {
    if(!usercode && usercode!=0){
        cb("用户名不能为空!",null);
        return;
    }
    var value={"RECORDSTATE":0,"LASTOPERATEPERSON":superadmin};
    var where={"USERCODE":usercode,"RECORDSTATE":1};
    mec_adm_adminDAO.update(value,where, function (err,msg) {
        if(!err) {
            myLogger.trace("delAccount [mec_adm_adminDAO.update]: " +JSON.stringify(msg));
            if(msg==1){
                cb(null,"账户删除成功!");
            }
            else{
                cb("不存在该账户",null);
            }
        }
        else {
            myLogger.error("delAccount [mec_adm_adminDAO.update]: " +logErr(err));
            cb(err,null);
        }
    });
};

//查询某柜台的全部营业员
exports.queryCounterAssistants = function (countercode,cb) {
    var qry={"COUNTERCODE":countercode};
    mec_hsy_salesmanDAO.queryAll({
        attributes:["SALESMANCODE","COUNTERCODE","NAME","GENDER","IDNUMBER","TELEPHONE"],
        where:qry
    },function(err,msg){
        if(!err) myLogger.trace("queryCounterAssistants [mec_hsy_salesmanDAO.queryAll]: " + (msg&&msg.length));
        else myLogger.error("queryCounterAssistants [mec_hsy_salesmanDAO.queryAll]: " + logErr(err));
        cb(err,msg);
    });
};

//添加营业员
exports.addAssistant = function (value,superadmin,cb) {
    value.LASTOPERATEPERSON=superadmin;
    mec_hsy_salesmanDAO.add(value,function(err,msg){
        if(!err) myLogger.trace("addAssistant [mec_hsy_salesmanDAO.add]: " + (msg&&msg.null));
        else myLogger.error("addAssistant [mec_hsy_salesmanDAO.add]: " + logErr(err));
        cb(err,msg);
    });
};

//修改营业员信息
exports.modifyAssistant = function(assistantid,value,superadmin,cb){
    value.LASTOPERATEPERSON=superadmin;
    var where={"SALESMANCODE":assistantid};
    mec_hsy_salesmanDAO.update(value,where,function(err,msg){
        if(!err) myLogger.trace("modifyAssistant [mec_hsy_salesmanDAO.update]: " + JSON.stringify(msg));
        else  myLogger.error("modifyAssistant [mec_hsy_salesmanDAO.update]: " + logErr(err));
        cb(err,msg);
    });
}

//删除营业员
exports.delAssistant = function(assistantid,superadmin,cb){
    var value={"RECORDSTATE":0,"LASTOPERATEPERSON":superadmin};
    var where={"SALESMANCODE":assistantid,"RECORDSTATE":1};
    mec_hsy_salesmanDAO.update(value,where,function(err,msg){
        if(!err) myLogger.trace("delAssistant [mec_hsy_salesmanDAO.update]: " + JSON.stringify(msg));
        else  myLogger.error("modifyAssistant [mec_hsy_salesmanDAO.update]: " + logErr(err));
        cb(err,msg);
    });
}

//将已支付订单回滚到未支付状态
exports.rollbackPaid=function(orderorgroupcode,cb){
    sequelize.transaction(function(t){
        async.parallel([
            function(cb){
                generalDAO.runSql("update mec_buy_offlineorder set ORDERSTATE=0,PAYMENTSTATE=0,createdAt=Now(),updatedAt=Now(),PLACETIME=date_add(now(),interval 6 MINUTE),TIMEOUTTIME=Now(),POSDEALNUM=null,POSCODE=null,CASHIER=null where OFFLINEORDERCODE in (select mec_vi_paid_orderinfo.ordercode from mec_vi_paid_orderinfo where orderorgroupcode='"+orderorgroupcode+"')",t,cb);
            },
            function(cb){
                generalDAO.runSql("update mec_buy_offlinecontent set createdAt=Now(),updatedAt=Now() where OFFLINECONTENTCODE in (select mec_vi_paid_contentinfo.listid from mec_vi_paid_contentinfo where orderorgroupcode='"+orderorgroupcode+"')", t,cb);
            },
            function(cb){
                generalDAO.runSql("select listid from mec_vi_paid_discountinfo where orderorgroupcode='"+orderorgroupcode+"'",function(err,msg){
                    async.forEach(msg,function(x,cb){
                        generalDAO.runSql("delete from mec_audit_discount where DISCOUNTID='"+ x.listid+"'",t,cb);
                    },cb)
                })
            },
            function(cb){
                generalDAO.runSql("select listid from mec_vi_paid_discountinfo where orderorgroupcode='"+orderorgroupcode+"'",function(err,msg){
                    async.forEach(msg,function(x,cb){
                        generalDAO.runSql("delete from mec_audit_charge where CHARGEID='"+x.listid+"'",t,cb);
                    },cb)
                })
            },
            function(cb){
                generalDAO.runSql("select listid from mec_vi_paid_discountinfo where orderorgroupcode='"+orderorgroupcode+"'",function(err,msg){
                    async.forEach(msg,function(x,cb){
                        generalDAO.runSql("delete from mec_audit_pay where PAYID='"+x.listid+"'",t,cb);
                    },cb)
                })
            }
        ],function(err,msg){
            if(!err){
                t.commit();
//                t.rollback();
//                console.log(msg);
                cb(null,msg);
            }
            else{
                t.rollback();
                console.log(err);
                cb(err,null);
            }
        })
    })
}

//获取业务设置的对应key的value
exports.getBusinessSetting = function (key,cb) {
    var qry={"KEY":key};
    mec_sys_businesssettingDAO.queryOne({
        attributes:["KEY","VALUE"],
        where: qry
    }, function (err,msg) {
        if(!err && msg) {
            myLogger.trace("getBusinessSetting [mec_sys_businesssettingDAO.queryOne]: " + JSON.stringify(msg));
            cb(null,msg);
        }
        else {
            myLogger.error("getBusinessSetting [mec_sys_businesssettingDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
};

//修改业务设置的对应key的value
exports.modifyBusinessSetting = function (key,value,cb) {
    var valueObj={"VALUE":value};
    var where={"KEY":key};
    mec_sys_businesssettingDAO.update(valueObj,where,function(err,msg){
        if(!err) myLogger.trace("modifyBusinessSetting [mec_sys_businesssettingDAO.update]: " + JSON.stringify(msg));
        else  myLogger.error("modifyBusinessSetting [mec_sys_businesssettingDAO.update]: " + logErr(err));
        cb(err,msg);
    });
};


//超级管理员重置某个其他管理员的密码
exports.resetPwd = function(usercode,superadmin,cb){
    if(!usercode && usercode!=0){
        cb("用户名不能为空!",null);
        return;
    }
    //重置为123456
    var password = "123456";
    var salt = pbkdf2.generateSaltSync(32);
    var hash = pbkdf2.hashSync(password, salt, 2, 64, 'sha256');

    mec_adm_adminDAO.queryOne({attributes:["USERCODE"],where: {"USERCODE":usercode}}, function (err,msg) {
        if(!err) {
            myLogger.trace("resetPwd [mec_adm_adminDAO.queryOne]: " + JSON.stringify(msg));
            if(msg){
                mec_adm_adminDAO.update({"SALT":salt,"HASH":hash,"LASTOPERATEPERSON":superadmin,"RECORDSTATE":2},{"USERCODE":usercode},function(err,msg) {
                    if(!err){
                        myLogger.trace("resetPwd [mec_adm_adminDAO.update]: " + JSON.stringify(msg));
                        cb(null,"密码重置成功!");
                    }
                    else{
                        myLogger.error("resetPwd [mec_adm_adminDAO.update]: " + logErr(err));
                        cb("密码重置失败!",null);
                    }
                });
            }
            else{
                cb("该用户名不存在!",null);
            }
        }
        else {
            myLogger.error("resetPwd [mec_adm_adminDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
}
