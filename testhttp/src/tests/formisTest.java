package tests;

import utils.HttpsRequestUtils;

public class formisTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base.replace("2003", "2001");


		//		String params="storeitems=[{"+
		//				"	        ID:'102015522222',"+
		//				"	        ITEMCODE: '1525235',"+
		//				"	        COUNTERCODE: '000222',"+
		//				"	        MEMBERPRICE: 0,"+
		//				"	        STORECHECKEDPRICE: 458,"+
		//				"	        STORETEMPPRICE: 0,"+
		//				"	        PROMOTIONMARK: 'X',"+
		//				"	        DISCOUNTMARK: 1,"+
		//				"	        STORESALESTATE: null,"+
		//				"	        SAFESTOCK: 0,"+
		//				"	        FULLSTOCK: 0,"+
		//				"	        MAXSTOCK: 0,"+
		//				"	        MINSTOCK: 0,"+
		//				"	        MAXORDER: 0,"+
		//				"	        MINORDER: 0,"+
		//				"	        NEGATIVESTOCK: null,"+
		//				"	        TEMPDISTRIBUTIONMARK: 0,"+
		//				"	        ERRORINFO: null,"+
		//				"	        INPUTPERSON: null,"+
		//				"	        COSTMODE: '01',"+
		//				"	        DEDUCTAMT: 0,"+
		//				"	        ONLINESTATE: 0"+
		//				"	    },"+
		//				"	    {"+
		//				"	        ID:'102015533333',"+
		//				"	        ITEMCODE: '1525235',"+
		//				"	        COUNTERCODE: '000333',"+
		//				"	        MEMBERPRICE: 0,"+
		//				"	        STORECHECKEDPRICE: 458,"+
		//				"	        STORETEMPPRICE: 0,"+
		//				"	        PROMOTIONMARK: 'X',"+
		//				"	        DISCOUNTMARK: 1,"+
		//				"	        STORESALESTATE: null,"+
		//				"	        SAFESTOCK: 0,"+
		//				"	        FULLSTOCK: 0,"+
		//				"	        MAXSTOCK: 0,"+
		//				"	        MINSTOCK: 0,"+
		//				"	        MAXORDER: 0,"+
		//				"	        MINORDER: 0,"+
		//				"	        NEGATIVESTOCK: null,"+
		//				"	        TEMPDISTRIBUTIONMARK: 0,"+
		//				"	        ERRORINFO: null,"+
		//				"	        INPUTPERSON: null,"+
		//				"	        COSTMODE: '01',"+
		//				"	        DEDUCTAMT: 0,"+
		//				"	        ONLINESTATE: 0"+
		//				"	    },"+
		//				"	    {"+
		//				"	        ID:'102016655555',"+
		//				"	        ITEMCODE: '1525235',"+
		//				"	        COUNTERCODE: '000555',"+
		//				"	        MEMBERPRICE: 0,"+
		//				"	        STORECHECKEDPRICE: 458,"+
		//				"	        STORETEMPPRICE: 0,"+
		//				"	        PROMOTIONMARK: 'X',"+
		//				"	        DISCOUNTMARK: 1,"+
		//				"	        STORESALESTATE: null,"+
		//				"	        SAFESTOCK: 0,"+
		//				"	        FULLSTOCK: 0,"+
		//				"	        MAXSTOCK: 0,"+
		//				"	        MINSTOCK: 0,"+
		//				"	        MAXORDER: 0,"+
		//				"	        MINORDER: 0,"+
		//				"	        NEGATIVESTOCK: null,"+
		//				"	        TEMPDISTRIBUTIONMARK: 0,"+
		//				"	        ERRORINFO: null,"+
		//				"	        INPUTPERSON: null,"+
		//				"	        COSTMODE: '01',"+
		//				"	        DEDUCTAMT: 0,"+
		//				"	        ONLINESTATE: 0"+
		//				"	    }]";
		//		//商品到柜
		//		String s90 =HttpsRequestUtils.sendPost(base+"formis/toCounter",params);
		//		System.out.println("\n商品到柜:"+s90);


		//		//调价
		//		String s990 =HttpsRequestUtils.sendPost(base+"formis/adjustPrice","itemcode=1525245&price=366&tempprice=366");
		//		System.out.println("\n商品到柜:"+s990);
		//
		//		//调到柜价格
		//		String s9990 =HttpsRequestUtils.sendPost(base+"formis/adjustCounterPrice","itemcode=1525235&countercode=000555&storecheckedprice=500&storetempprice=500");
		//		System.out.println("\n调到柜价格:"+s9990);
		//
		//		//调价
		//		String s9908 =HttpsRequestUtils.sendPost(base+"formis/adjustPriceBatch","jsonStr=[{'itemcode':'152524','price':366,'tempprice':366}]");
		//		System.out.println("\n商品到柜:"+s9908);
		//
		//		//调到柜价格
		//		String s99908 =HttpsRequestUtils.sendPost(base+"formis/adjustCounterPriceBatch","jsonStr=[{'itemcode':1525235,'countercode':'000555','storecheckedprice':500,'storetempprice':500}]");
		//		System.out.println("\n调到柜价格:"+s99908);
		//
		//		//调到柜促销标志位
		//		String s9991 =HttpsRequestUtils.sendPost(base+"formis/adjustPromotionMark","itemcode=1525235&countercode=000555&promotionmark=X");
		//		System.out.println("\n调到柜促销标志位:"+s9991);

		//				//调到柜促销标志位
		//				String s9997 =HttpsRequestUtils.sendPost(base+"formis/adjustPromotionMarkBatch","jsonStr=[{'itemcode':'1525235','countercode':'000555','promotionmark':'X'}]");
		//				System.out.println("\n调到柜促销标志位:"+s9997);
		//
		//		//获取订单详情
		//		String s55 =HttpsRequestUtils.sendGet(base+"formis/getOrderInfo","ordercode=014121862882000002");
		//		System.out.println("\n获取订单详情:"+s55);
		//		String s56 =HttpsRequestUtils.sendGet(base+"formis/getOrderInfo","ordercode=114122985982000001");
		//		System.out.println("\n获取订单详情:"+s56);
				String s57 =HttpsRequestUtils.sendGet(base+"formis/getOrderInfo","ordercode=015032191607000008");
				System.out.println("\n获取订单详情:"+s57);
		//
		//
		//		//支付准备获取总价和价格分摊等
		//		String s58 =HttpsRequestUtils.sendGet(base+"formis/payPrepare","vipcode=66666666&ordercode=015032132540000005&ordercode=015032111666000006");
		//		System.out.println("\n支付准备获取总价和价格分摊等:"+s58);
		//
		//		//支付完成通知
		//		String s586 =HttpsRequestUtils.sendPost(base+"formis/payComplete","orderOrGroupCode=01412098109300000199&payData=");
		//		System.out.println("\n支付完成通知:"+s586);

		//		//创建商品
		//		String misCreateItem="{" + 
		//				"	ITEMID:2353253," + 
		//				"	ITEMCODE:'1525297'," + 
		//				"	BARCODE: '2000000044354'," + 
		//				"	ITEMNAME: '女士羽绒服'," + 
		//				"	ITEMSHORTNAME: '女士羽绒服'," + 
		//				"	BRANDCODE: '000182'," + 
		//				"	RETAILTYPECODE: '131'," + 
		//				"	ITEMTYPECODE: '30101'," + 
		//				"	MERCHANTCODE: '000075'," + 
		//				"	BUSINESSMODE: 'A'," + 
		//				"	PROCDUCINGAREA: '辽宁丹东'," + 
		//				"	PRICE: '1888'," + 
		//				"	TEMPPRICE: '1888'," + 
		//				"	TAXRATE: '01'," + 
		//				"	EXCISERATE: '07'," + 
		//				"	RETURNGOODS: '1'," + 
		//				"	SALESTATE: '0'," + 
		//				"	NETWEIGHT: null," + 
		//				"	GROSSWEIGHT: null," + 
		//				"	SPECIFICATION: '160/84A-165/88A'," + 
		//				"	PRODUCTCODE: 'MIJ8231'," + 
		//				"	GRADE: '正'," + 
		//				"	COLOR: null," + 
		//				"	CASING: '1'," + 
		//				"	DIMENSION: null," + 
		//				"	VOLUME: null," + 
		//				"	ITEMCODETYPE: '0'," + 
		//				"	UNIT: '件'," + 
		//				"	LASTPURCHASEPRICE: null," + 
		//				"	PURCHASETAXRATE: '01'," + 
		//				"	SAFESTOCK: null," + 
		//				"	MAXSTOCK: null," + 
		//				"	MINSTOCK: null," + 
		//				"	MAXORDER: null," + 
		//				"	MINORDER: null," + 
		//				"	PROPERTY: '0'," + 
		//				"	CHECKSTATE: '3'," + 
		//				"	ERRORINFO: null," + 
		//				"	INPUTPERSON:null," + 
		//				"	AGENTCODE: '003'," + 
		//				"	TERM: null" + 
		//				"}";
		//		String s980 =HttpsRequestUtils.sendPost(base+"formis/createSKU","skuinfo="+misCreateItem);
		//		System.out.println("\n创建商品:"+s980);

		//		//创建商品
		//		String misCreateItem="{" + 
		//				"	ITEMCODE:'1525297'," + 
		//				"	BARCODE: '2000000044356'," + 
		//				"	ITEMNAME: '女士羽绒服555'," + 
		//				"	ITEMSHORTNAME: '女士羽绒服666'," + 
		//				"	PROCDUCINGAREA: '辽宁丹东'" + 
		//				"}";
		//		String s990 =HttpsRequestUtils.sendPost(base+"formis/updateSKU","skuinfo="+misCreateItem);
		//		System.out.println("\n创建商品:"+s990);

//		//更新手工单库存
//		String entries="[{" + 
//				"	skccode:'12345'," + 
//				"	countercode: '22222'," + 
//				"	num: 1" +
//				"}]";
//		String s9890 =HttpsRequestUtils.sendPost(base+"formis/handOrderUpdateStock","entries="+entries);
//		System.out.println("\n创建商品:"+s9890);
		
//		//对账
//		String s9999 =HttpsRequestUtils.sendPost(base+"formis/reconciliation","orderOrGroupCode=014100612845000240&payData=[{'id':0,'paycode':'01','amount':-902.88,'extracode':'','creditport':'','bankcardcode':'',feerate:'0'}]");
//		System.out.println("\n创建商品:"+s9999);
	}
}
