/**
 * Created by lucywu on 12/19/14.
 */

var imgserver = require("../../interaction/imgserver");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

imgserver.getImgdetailsStored("1525233",cb);

imgserver.getImgpreviewsStored("1525230",cb);