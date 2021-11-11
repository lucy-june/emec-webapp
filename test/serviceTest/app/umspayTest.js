/**
 * Created by lucywu on 11/21/14.
 */
var umspayService   = require("../../../service/app/umspayService");

var cb=function(err,msg){
    console.log(err);
    console.log(JSON.stringify(msg));
}
var usercode="gjy";

/**
 * 测试流程
 * 银行帐号6222021001144131239 手机号15216711947
 * 1.单个线下单
 *      createPay-pay-notifyPay
 *      createPay-queryPay
 *      createPay-pay-notifyFail-queryPay
 * 2.单个线上单
 *      createPay-pay-notifyPay
 *      createPay-queryPay
 *      createPay-pay-notifyFail-queryPay
 * 3.多个线下单
 *      createPay-pay-notifyPay
 *      createPay-queryPay
 *      createPay-pay-notifyFail-queryPay
 */


//单个线下订单
//umspayService.createPay(false,["014122745344000004"],cb);

//umspayService.queryPay("014122745344000004",cb);

//umspayService.queryPay("014122744341000003",cb);

//umspayService.queryPay("014122743173000005",cb);


//单个线上订单
//umspayService.createPay(true,["114122595038000001"],cb);

//umspayService.queryPay("114122595038000001",cb);


//多个线下订单
//umspayService.createPay(false,["014122780545000008","014122798124000007","014122757732000006"],cb);
//
//umspayService.queryPay("01412278054500000871",cb);

//umspayService.createPay(false,["014122715241000011","014122797001000009"],cb);

//umspayService.queryPay("01412271524100001109",cb);

//umspayService.createPay(false,["014122715241000011","014122797001000009"],cb);

//umspayService.queryPay("01412271524100001130",cb);



