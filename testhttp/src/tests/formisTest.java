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
		//		//????????????
		//		String s90 =HttpsRequestUtils.sendPost(base+"formis/toCounter",params);
		//		System.out.println("\n????????????:"+s90);


		//		//??????
		//		String s990 =HttpsRequestUtils.sendPost(base+"formis/adjustPrice","itemcode=1525245&price=366&tempprice=366");
		//		System.out.println("\n????????????:"+s990);
		//
		//		//???????????????
		//		String s9990 =HttpsRequestUtils.sendPost(base+"formis/adjustCounterPrice","itemcode=1525235&countercode=000555&storecheckedprice=500&storetempprice=500");
		//		System.out.println("\n???????????????:"+s9990);
		//
		//		//??????
		//		String s9908 =HttpsRequestUtils.sendPost(base+"formis/adjustPriceBatch","jsonStr=[{'itemcode':'152524','price':366,'tempprice':366}]");
		//		System.out.println("\n????????????:"+s9908);
		//
		//		//???????????????
		//		String s99908 =HttpsRequestUtils.sendPost(base+"formis/adjustCounterPriceBatch","jsonStr=[{'itemcode':1525235,'countercode':'000555','storecheckedprice':500,'storetempprice':500}]");
		//		System.out.println("\n???????????????:"+s99908);
		//
		//		//????????????????????????
		//		String s9991 =HttpsRequestUtils.sendPost(base+"formis/adjustPromotionMark","itemcode=1525235&countercode=000555&promotionmark=X");
		//		System.out.println("\n????????????????????????:"+s9991);

		//				//????????????????????????
		//				String s9997 =HttpsRequestUtils.sendPost(base+"formis/adjustPromotionMarkBatch","jsonStr=[{'itemcode':'1525235','countercode':'000555','promotionmark':'X'}]");
		//				System.out.println("\n????????????????????????:"+s9997);
		//
		//		//??????????????????
		//		String s55 =HttpsRequestUtils.sendGet(base+"formis/getOrderInfo","ordercode=014121862882000002");
		//		System.out.println("\n??????????????????:"+s55);
		//		String s56 =HttpsRequestUtils.sendGet(base+"formis/getOrderInfo","ordercode=114122985982000001");
		//		System.out.println("\n??????????????????:"+s56);
				String s57 =HttpsRequestUtils.sendGet(base+"formis/getOrderInfo","ordercode=015032191607000008");
				System.out.println("\n??????????????????:"+s57);
		//
		//
		//		//??????????????????????????????????????????
		//		String s58 =HttpsRequestUtils.sendGet(base+"formis/payPrepare","vipcode=66666666&ordercode=015032132540000005&ordercode=015032111666000006");
		//		System.out.println("\n??????????????????????????????????????????:"+s58);
		//
		//		//??????????????????
		//		String s586 =HttpsRequestUtils.sendPost(base+"formis/payComplete","orderOrGroupCode=01412098109300000199&payData=");
		//		System.out.println("\n??????????????????:"+s586);

		//		//????????????
		//		String misCreateItem="{" + 
		//				"	ITEMID:2353253," + 
		//				"	ITEMCODE:'1525297'," + 
		//				"	BARCODE: '2000000044354'," + 
		//				"	ITEMNAME: '???????????????'," + 
		//				"	ITEMSHORTNAME: '???????????????'," + 
		//				"	BRANDCODE: '000182'," + 
		//				"	RETAILTYPECODE: '131'," + 
		//				"	ITEMTYPECODE: '30101'," + 
		//				"	MERCHANTCODE: '000075'," + 
		//				"	BUSINESSMODE: 'A'," + 
		//				"	PROCDUCINGAREA: '????????????'," + 
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
		//				"	GRADE: '???'," + 
		//				"	COLOR: null," + 
		//				"	CASING: '1'," + 
		//				"	DIMENSION: null," + 
		//				"	VOLUME: null," + 
		//				"	ITEMCODETYPE: '0'," + 
		//				"	UNIT: '???'," + 
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
		//		System.out.println("\n????????????:"+s980);

		//		//????????????
		//		String misCreateItem="{" + 
		//				"	ITEMCODE:'1525297'," + 
		//				"	BARCODE: '2000000044356'," + 
		//				"	ITEMNAME: '???????????????555'," + 
		//				"	ITEMSHORTNAME: '???????????????666'," + 
		//				"	PROCDUCINGAREA: '????????????'" + 
		//				"}";
		//		String s990 =HttpsRequestUtils.sendPost(base+"formis/updateSKU","skuinfo="+misCreateItem);
		//		System.out.println("\n????????????:"+s990);

//		//?????????????????????
//		String entries="[{" + 
//				"	skccode:'12345'," + 
//				"	countercode: '22222'," + 
//				"	num: 1" +
//				"}]";
//		String s9890 =HttpsRequestUtils.sendPost(base+"formis/handOrderUpdateStock","entries="+entries);
//		System.out.println("\n????????????:"+s9890);
		
//		//??????
//		String s9999 =HttpsRequestUtils.sendPost(base+"formis/reconciliation","orderOrGroupCode=014100612845000240&payData=[{'id':0,'paycode':'01','amount':-902.88,'extracode':'','creditport':'','bankcardcode':'',feerate:'0'}]");
//		System.out.println("\n????????????:"+s9999);
	}
}
