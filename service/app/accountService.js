/**
 * Created by lucywu on 7/8/14.
 * 个人账户信息服务
 */
var mec_ctm_customerDAO     = require('../../dao/mec_ctm_customerDAO');
var myLogger                = require('../../logging/contextLogger')("app/accountService");

//展示个人信息
exports.display= function(usercode,cb){
    mec_ctm_customerDAO.queryOne({
        attributes:["USERCODE","TELEPHONE","VIPCODE","EMAIL","NAME","GENDER","ICONURL","IDCARD","BIRTHDAY"],
        where:{"USERCODE":usercode}
    },function(err,msg){
        if(!err){
            myLogger.trace("display [mec_adm_adminDAO.queryOne]: " + JSON.stringify(msg));
            if(msg){
                cb(null,msg);
            }
            else{
                cb("exception",null);
            }
        }
       else{
            myLogger.error("display [mec_adm_adminDAO.queryOne]: " + logErr(err));
            cb(err,null);
        }
    });
}

//修改个人信息
exports.modify = function(value,usercode,cb){
    mec_ctm_customerDAO.update(value,{"USERCODE":usercode},function(err,msg){
        if(!err) myLogger.trace("modify [mec_adm_adminDAO.update]: " + JSON.stringify(msg));
        else myLogger.error("modify [mec_adm_adminDAO.update]: " + logErr(err));
        cb(err,msg);
    });
}
