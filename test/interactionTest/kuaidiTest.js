/**
 * Created by lucywu on 12/19/14.
 */

var kuaidi = require("../../interaction/kuaidi");

kuaidi.queryExpress("shunfeng","588426068483",function(err,msg){
    console.log(err);
    console.log(msg);
});