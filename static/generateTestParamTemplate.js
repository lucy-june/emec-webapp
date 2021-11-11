/**
 * Created by lucywu on 12/4/14.
 */
var mec_itm_categoryDAO = require('../dao/mec_itm_categoryDAO');
var mec_itm_paramtemplateDAO = require('../dao/mec_itm_paramtemplateDAO');

mec_itm_categoryDAO.queryAll({},function(err,msg){
    for(var k=0;k<msg.length;k++){
        var categoryid=msg[k].CATEGORYID;
        var categoryname=msg[k].CATEGORYNAME;
        for(var n=0;n<Math.floor(Math.random()*8);n++){
            mec_itm_paramtemplateDAO.add({CATEGORYID:categoryid,ATTRIBUTE:categoryname+"Key"+n},function(err,msg){
                console.log(err);
                console.log(msg);
            })
        }
    }
})
