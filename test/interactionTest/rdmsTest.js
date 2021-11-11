/**
 * Created by lucywu on 12/19/14.
 */

var rdms = require("../../interaction/rdms");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

rdms.getSkc(1525293,cb);
//rdms.getSkc(1525286,cb);
