/**
 * Created by lucywu on 5/25/14.
 */
domain=require('domain');

//传入try-catch函数，处理异步异常
module.exports=function(myTry, myCatch){
    var d=domain.create();

    d.on('error',function(err){
        console.error(err);
        myCatch(err);
    });

    d.run(myTry);
}