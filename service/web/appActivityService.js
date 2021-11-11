/**
 * Created by Legend on 2015/5/27.
 */
var mec_app_activityDAO=require('../../dao/mec_app_activityDAO');
var mec_app_homeDAO=require('../../dao/mec_app_homeDAO');
var sequelize = require('../../dao/_sequelize');
var generalDAO = require("../../dao/generalDAO");
/**
 * 添加活动
 * @param options
 * @param superadmin
 * @param cb
 */
exports.addActivity=function(options,cb){
    if(!options.TITLE||options.TITLE==''){
        cb('No Title',null);
        return;
    }
    //options.LASTOPERATEPERSON=superadmin;
    mec_app_activityDAO.add(options,cb);
};

/**
 * 添加首页的活动图片
 * @param options
 * @param superadmin
 * @param cb
 */
exports.addBundle=function(options,cb){
    //options.LASTOPERATEPERSON=superadmin;
    mec_app_homeDAO.add(options,cb);
};


exports.getAll=function(cb){
    mec_app_activityDAO.queryAll({attributes:["ACTIVITYID",'TITLE'],where: {"VALID":1}},cb);
}

exports.getAllBundles=function(cb){
    generalDAO.runSql('select * from mec_app_home where VALID=1 and now() >STARTTIME and now() <ENDTIME order by PRIORITY desc',function(err,msg){
        if(err){
            cb('查询出错了！',null);
        }else{
            //console.log(msg);
            cb(null,msg);
        }
    });
}

exports.displayBundles=function(cb){
    //select b.*, a1.TITLE as ATITLE1,a2.TITLE as ATITLE2,a3.TITLE as ATITLE3 from mec_app_home as b,mec_app_activity as a1,mec_app_activity as a2,mec_app_activity as a3 where b.VALID=1 and now() <b.ENDTIME and b.ACTIVITYID1=a1.ACTIVITYID and b.ACTIVITYID2=a2.ACTIVITYID and b.ACTIVITYID3=a3.ACTIVITYID order by b.PRIORITY desc
    generalDAO.runSql('SELECT\
    tmp2.*, a3.TITLE AS ATITLE3\
    FROM\
    (\
        SELECT\
    tmp.*, a2.TITLE AS ATITLE2\
    FROM\
    (\
        SELECT\
    b.*, a1.TITLE AS ATITLE1\
    FROM\
    mec_app_home AS b,\
        mec_app_activity AS a1\
    WHERE\
    b.VALID = 1\
    AND now() < b.ENDTIME\
    AND b.ACTIVITYID1 = a1.ACTIVITYID\
    ) tmp\
    LEFT JOIN mec_app_activity AS a2 ON tmp.ACTIVITYID2 = a2.ACTIVITYID\
    ) tmp2\
    LEFT JOIN mec_app_activity AS a3 ON tmp2.ACTIVITYID3 = a3.ACTIVITYID',function(err,msg){
        if(err){
            cb('查询出错了！',null);
        }else{
            console.log(msg);
            cb(null,msg);
        }
    });
}

exports.deleteBundle=function(bundleid,cb){
    mec_app_homeDAO.update({VALID:0},{BUNDLEID:bundleid},function(err,msg){
       if(err){
           cb('删除数据库出错',null);
       } else{
           cb(null,msg);
       }
    });
}

exports.getSingleBundle=function(bundleid,cb){
    mec_app_homeDAO.queryOne({attributes:["BUNDLEID",'TITLE','TYPE','ACTIVITYID1','PIC1','ACTIVITYID2','PIC2','ACTIVITYID3','PIC3','VALID','PRIORITY','STARTTIME','ENDTIME'],where: {"BUNDLEID":bundleid}},cb);
}

exports.updateBundle=function(bundleid,values,cb){
    mec_app_homeDAO.update(values,{BUNDLEID:bundleid},cb);
}