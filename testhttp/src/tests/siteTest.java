package tests;

import utils.HttpsRequestUtils;

public class siteTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//获取自己的全部地址信息
		String d1 =HttpsRequestUtils.sendGet(base+"app/site/getAll","userid=gjy");
		System.out.println("\n获取自己的全部地址信息:"+d1);

		//添加地址 必须包含userid,person,tel,返回的数据是生成的siteid
		String d2 =HttpsRequestUtils.sendPost(base+"app/site/create","USERID=wjc&PERSON=是红博&TEL=1880196011&DETAIL=&ISDEFAULT=1&PROVINCCE=河北省&CITY=衡水市&DISTRICT=桃城区");
		System.out.println("\n添加地址:"+d2);

		//删除地址
		String d3 =HttpsRequestUtils.sendPost(base+"app/site/delete","siteid=11");
		System.out.println("\n删除地址:"+d3);

		//更新地址 必须包含id,userid
		String d5 =HttpsRequestUtils.sendPost(base+"app/site/update","ID=9&USERID=wjc&PERSON=史宏波&TEL=1880196011&DETAIL=&ISDEFAULT=1&PROVINCCE=河北省&CITY=衡水市&DISTRICT=桃城区");
		System.out.println("\n更新地址:"+d5);

	}
}
