package tests;

import utils.HttpsRequestUtils;

public class umspayTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//6222021001144131239 15216711947
		
		/**
		 * 触发支付操作,获取后台数据从而跳转银联页面
		 * 
		 * 传入参数为:ORDERCODES的数组, 分以下三种情况
		 * 0.单个线下的订单号
		 * 1.单个线上订单号
		 * 2.多个线下订单号拼单支付
		 * 
		 * 返回参数为:{status:true, data: [payData,umsData] }
		 * payData为:[PlaceOrderType, orderOrGroupCode,finalPrice,priceShare] PlaceOrderType对应上面的0,1,2  priceshare只有拼单付时才给出,里面包含每个订单价格的分摊 
		 * umsData为:跳转银联页面所需数据为{transId:?,chrCode:?,merSign:?,merId:?}
		 */
//		//0.单个线下的订单号
//		String s5 =HttpsRequestUtils.sendPost(base+"app/umspay/createPay","ORDERCODES=['014122743173000005']");
//		System.out.println("\n触发支付操作,获取后台数据从而跳转银联页面:"+s5);
		
		//1.单个线上订单号
		String s6 =HttpsRequestUtils.sendPost(base+"app/umspay/createPay","ORDERCODES=['114121870118000007']");
		System.out.println("\n触发支付操作,获取后台数据从而跳转银联页面:"+s6);
		
		//2.多个线下订单号拼单支付
//		String s7 =HttpsRequestUtils.sendPost(base+"app/umspay/createPay","ORDERCODES=['014122772990000012','014122743173000005']");
//		System.out.println("\n触发支付操作,获取后台数据从而跳转银联页面:"+s7);
		
		

		/**
		 * 银联页面显示支付成功,查询后台确认是否支付成功
		 * 
		 * 传入参数为:ORDERORGROUPCODE, 分以下三种情况
		 * 0.ORDERORGROUPCODE 为线下订单号
		 * 1.ORDERORGROUPCODE 为线上订单号
		 * 2.ORDERORGROUPCODE 为线下订单Group号 (线下拼单支付)
		 * 
		 * 返回参数:
		 * 	    支付成功 {status:true, data:"paid"}
		 * 		支付失败 {status:false, data:"unpay"}
		 * 		系统错误 {status:false ,data: other_err}
		 */
		//线下已经支付
//		String s66 =HttpsRequestUtils.sendPost(base+"app/umspay/queryPay","ORDERORGROUPCODE=014122715241000011");
//		System.out.println("\n银联页面显示支付成功,查询后台确认是否支付成功:"+s66);
//		
//		//线下未支付
//		String s666 =HttpsRequestUtils.sendPost(base+"app/umspay/queryPay","ORDERORGROUPCODE=014122772990000012");
//		System.out.println("\n银联页面显示支付成功,查询后台确认是否支付成功:"+s666);
//		
//		//线上单
//		String s667 =HttpsRequestUtils.sendPost(base+"app/umspay/queryPay","ORDERORGROUPCODE=114113087413000273");
//		System.out.println("\n银联页面显示支付成功,查询后台确认是否支付成功:"+s667);
		
		//线下拼单
		String s667 =HttpsRequestUtils.sendPost(base+"app/umspay/queryPay","ORDERORGROUPCODE=01412271524100001130");
		System.out.println("\n银联页面显示支付成功,查询后台确认是否支付成功:"+s667);
	}
}
