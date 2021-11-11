package tests;

import utils.HttpsRequestUtils;

public class vipTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

//		//获取vip信息
//		String s6 =HttpsRequestUtils.sendGet(base+"app/vip/getVIPInfo","usercode=gjy");
//		System.out.println("\n获取vip信息:"+s6);

//		//生成并绑定vipcode信息
//		String s7 =HttpsRequestUtils.sendPost(base+"app/vip/generateAndBindVIP","usercode=gjy&vipname=testlucywu&gender=1&birthday=1979-01-03&email=123&address=234&tel=&mobilephone=15222222321&idcardno=41090312151");
//		System.out.println("\n生成并绑定vipcode信息:"+s7);
//
		//验证绑定vip卡
		String s8 =HttpsRequestUtils.sendPost(base+"app/vip/validateAndBindVIP","usercode=gjy&vipname=testlucywu&mobilephone=15222222226&cardno=0000000047706134&idcardno=112146");
		System.out.println("\n验证绑定vip卡:"+s8);
	}
}
