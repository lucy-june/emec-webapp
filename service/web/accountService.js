/**
 * Created by lucywu on 7/8/14.
 * 个人账户信息服务
 */
var mec_adm_adminDAO        = require('../../dao/mec_adm_adminDAO');
var myLogger    = require('../../logging/contextLogger')("web/accountService");

//展示个人信息
exports.display= function(usercode,cb){
    mec_adm_adminDAO.queryOne({
        attributes:["USERCODE","ROLE","DEPTCODE","COUNTERCODE","TELEPHONE","EMAIL","NAME","GENDER"],
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
    mec_adm_adminDAO.update(value,{"USERCODE":usercode},function(err,msg){
        if(!err) myLogger.trace("modify [mec_adm_adminDAO.update]: " + JSON.stringify(msg));
        else myLogger.error("modify [mec_adm_adminDAO.update]: " + logErr(err));
        cb(err,msg);
    });
}