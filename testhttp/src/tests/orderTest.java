package tests;

import utils.HttpsRequestUtils;

public class orderTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		/**
			var orderinfo={USERCODE:"gjy",PAYMENTMODE:1,DELIVERYMODE:1,SITEID:1};
			var contentinfo=[
				    {SKCCODE:"1525233837",NUM:10},
				    {SKCCODE:"1525231853",NUM:393},
				    {SKCCODE:"1525230796",NUM:100},
				    {SKCCODE:"1525230525",NUM:133}
			];

			paymentmode: 0-现付 1-网付 2-到付
			deliverymode 0-自提 1-配送
		 * 顾客开线上订单
		 * orderinfo: usercode,paymentmode,deliverymode,siteid(配送-必须有),deliverydeptcode(自提-必须有)
		 * contentinfo: skc-num的数组
		 * */
		


		//app下订单
		String s14 = HttpsRequestUtils.sendPost(base+"app/order/placeOnlineOrder","orderinfo={USERCODE:'gjy',PAYMENTMODE:1,DELIVERYMODE:1,SITEID:1}"
				+ "&contentinfo=[{SKCCODE:'1525233837',NUM:2},{SKCCODE:'1525231853',NUM:1},{SKCCODE:'1525230796',NUM:6}]");
		System.out.println("\nAPP下订单:"+s14);



		//获取线下(待支付的订单)
//		String s17 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderUnpay","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线下(待支付的订单):"+s17);
//		String s17 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderUnpay","usercode=gjy&page=5&rows=10");
//		System.out.println("\n获取线下(待支付的订单):"+s17);

		//获取线上(待支付)
//		String s15 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderUnpay","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线上(待支付的订单):"+s15);

		//获取线下((待收货物者待自提的)
//		String s170 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderUnconfirm","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线下((待收货物者待自提的):"+s170);

		//获取线上((待收货物者待自提的)
//		String s150 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderUnconfirm","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线上((待收货物者待自提的):"+s150);

		//获取全部线下订单
//		String s1700 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrder","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取全部线下订单:"+s1700);

		//获取全部线上订单
//		String s1500 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrder","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取全部线上订单:"+s1500);



		//获取线下订单内商品通过订单号
//		String s19 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineContentByOrder","OFFLINEORDERCODE=014100606207000218");
//		System.out.println("\n获取线下订单内商品通过订单号:"+s19);

		//获取线上订单内商品通过订单号
//		String s18= HttpsRequestUtils.sendGet(base+"app/order/getOnlineContentByOrder","ONLINEORDERCODE=114072936654000002");
//		System.out.println("\n获取线上订单内商品通过订单号:"+s18);


		
		
		//线下订单取消
//		String s143 = HttpsRequestUtils.sendPost(base+"app/order/cancelOfflineOrder","OFFLINEORDERCODE=00001");
//		System.out.println("\n线下订单取消:"+s143);

		//线上订单取消
//		String s140 = HttpsRequestUtils.sendPost(base+"app/order/cancelOnlineOrder","ONLINEORDERCODE=00001");
//		System.out.println("\n线上订单取消:"+s140);

		//线下订单确认收货
//		String s141 = HttpsRequestUtils.sendPost(base+"app/order/confirmOfflineOrder","OFFLINEORDERCODE=00001");
//		System.out.println("\n线下订单确认收货:"+s141);

		//线上订单确认收货
//		String s142 = HttpsRequestUtils.sendPost(base+"app/order/confirmOnlineOrder","ONLINEORDERCODE=00001");
//		System.out.println("\n线上订单确认收货:"+s142);
		
		
		
		
		
		
		//获取全部线下订单以及明细
//		String s17001 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderWithContent","usercode=gjy&page=1&rows=10&sidx=TIME&sord=desc");
//		System.out.println("\n获取全部线下订单以及明细:"+s17001);
		
//		//获取全部线上订单以及明细
//		String s15001 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderWithContent","usercode=gjy&page=1&rows=10&sidx=TIME&sord=desc");
//		System.out.println("\n获取全部线上订单以及明细:"+s15001);
//		
		//获取线下(待支付的订单以及明细)
//		String s178 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderWithContentUnpay","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线下(待支付的订单以及明细):"+s178);

		//获取线上(待支付订单以及明细)
//		String s158 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderWithContentUnpay","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线上(待支付的订单以及明细):"+s158);

		//获取线下((待收货物者待自提的订单以及明细)
//		String s1708 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderWithContentUnconfirm","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线下((待收货物者待自提的订单以及明细):"+s1708);

		//获取线上((待收货物者待自提的订单以及明细)
//		//获取线下订单内商品通过订单号
//		String s19 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineContentByOrder","OFFLINEORDERCODE=014100606207000218");
//		System.out.println("\n获取线下订单内商品通过订单号:"+s19);
//
//		//获取线上订单内商品通过订单号
//		String s18= HttpsRequestUtils.sendGet(base+"app/order/getOnlineContentByOrder","ONLINEORDERCODE=114072936654000002");
//		System.out.println("\n获取线上订单内商品通过订单号:"+s18);
//
//
//		
//		
//		//线下订单取消
//		String s143 = HttpsRequestUtils.sendPost(base+"app/order/cancelOfflineOrder","OFFLINEORDERCODE=00001");
//		System.out.println("\n线下订单取消:"+s143);
//
//		//线上订单取消
//		String s140 = HttpsRequestUtils.sendPost(base+"app/order/cancelOnlineOrder","ONLINEORDERCODE=00001");
//		System.out.println("\n线上订单取消:"+s140);
//
//		//线下订单确认收货
//		String s141 = HttpsRequestUtils.sendPost(base+"app/order/confirmOfflineOrder","OFFLINEORDERCODE=00001");
//		System.out.println("\n线下订单确认收货:"+s141);
//
//		//线上订单确认收货
//		String s142 = HttpsRequestUtils.sendPost(base+"app/order/confirmOnlineOrder","ONLINEORDERCODE=00001");
//		System.out.println("\n线上订单确认收货:"+s142);
//		
//		
//		
//		
//		
//		
//		//获取全部线下订单以及明细
//		String s17001 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderWithContent","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取全部线下订单以及明细:"+s17001);
//		
//		//获取全部线上订单以及明细
//		String s15001 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderWithContent","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取全部线上订单以及明细:"+s15001);
//		
//		//获取线下(待支付的订单以及明细)
//		String s178 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderWithContentUnpay","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线下(待支付的订单以及明细):"+s178);
//
//		//获取线上(待支付订单以及明细)
//		String s158 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderWithContentUnpay","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线上(待支付的订单以及明细):"+s158);
//
//		//获取线下((待收货物者待自提的订单以及明细)
//		String s1708 = HttpsRequestUtils.sendGet(base+"app/order/getOfflineOrderWithContentUnconfirm","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线下((待收货物者待自提的订单以及明细):"+s1708);
//
//		//获取线上((待收货物者待自提的订单以及明细)
//		String s1508 = HttpsRequestUtils.sendGet(base+"app/order/getOnlineOrderWithContentUnconfirm","usercode=gjy&page=1&rows=10");
//		System.out.println("\n获取线上((待收货物者待自提的订单以及明细):"+s1508);

	}
}
