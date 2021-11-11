/**
 * Created by lucywu on 11/20/14.
 */
var generalDAO = require("../../dao/generalDAO");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

var rid = 5;
//var sql = "REPLACE INTO mec_prm_prmrule(ID, RULECODE, RULECONTENT, DATEEFFECTIVE, DATEEXPIRES, DEPTCODE, STATE, REDUCECONVERT, REDUCE, COUPONCONVERT, COUPON, GIFTCONVERT, GIFT, RULESCRIPT, VIPSALIENCE, COUPONVIPGRADE, COUPONPOSACCU, COUPONVIPMORE, COUPONALLOWERROR, GIFTVIPGRADE, GIFTPOSACCU, GIFTVIPMORE, GIFTALLOWERROR) SELECT ID, RULECODE, RULECONTENT, DATEEFFECTIVE, DATEEXPIRES, DEPTCODE, STATE, REDUCECONVERT, REDUCE, COUPONCONVERT, COUPON, GIFTCONVERT, GIFT, RULESCRIPT, VIPSALIENCE, COUPONVIPGRADE, COUPONPOSACCU, COUPONVIPMORE, COUPONALLOWERROR, GIFTVIPGRADE, GIFTPOSACCU, GIFTVIPMORE, GIFTALLOWERROR FROM mec_prm_prmrule_tmp WHERE ID = " + rid;
var sql="select * from mec_itm_stock where SKCCODE='1525921246' and COUNTERCODE='001033' for UPDATE";
generalDAO.runSql(sql, cb);


//generalDAO.runSql("select max(ITEMCODE) as MAXCODE from itm_storeitem",cb)

//generalDAO.runSql("select * from hct_brand limit 0,3", null,function(err,msg){
//    console.log(err);
//    console.log(msg);
//});

//generalDAO.runSql('select max(DAILYNUM)as MAXDAILYNUM FROM ( select right(ONLINEORDERCODE,6) as DAILYNUM from ' +
//    'mec_buy_onlineorder where ONLINEORDERCODE like "1140729%" union ' +
//    'select right(OFFLINEORDERCODE,6) as DAILYNUM from mec_buy_offlineorder ' +
//    'where OFFLINEORDERCODE like "0140729%" ) as t',cb);


//var sql="insert into mec_itm_region(REGIONNAME,SUPERREGIONID)values('testRegion?1',?2)"
//
//for(var k=9;k<200;k++){
//    var tmp=sql.replace("?1",k);
//    tmp=tmp.replace("?2",k%35+1);
//    console.log(tmp);
//    generalDAO.runSql(tmp,cb);
//}

//var sql="delete from mec_itm_region where REGIONNAME='testRegion?1' and  SUPERREGIONID=?2"
//
//for(var k=9;k<200;k++){
//    var num=k%35+1;
//    if(num<=5){
//        var tmp=sql.replace("?1",k);
//        tmp=tmp.replace("?2",k%35+1);
//        console.log(tmp);
//        generalDAO.runSql(tmp,cb);
//    }
//
//}