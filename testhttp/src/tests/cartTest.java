package tests;

import utils.HttpsRequestUtils;

public class cartTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//获取全部购物车信息
		String s14 = HttpsRequestUtils.sendGet(base+"app/cart/get","userid=gjy");
		System.out.println("\n购物车信息:"+s14);

		//合并并获取合并后的全部购物车信息
		String s100 = HttpsRequestUtils.sendPost(base+"app/cart/mergeAndGet","USERCODE=gjy&CONTENTS=[{SKCCODE:'1525230796',NUM:5},{SKCCODE:'1525233837',NUM:2}]");
		System.out.println("\n购物车信息:"+s100);

		//未登录购物车刷新skc信息
		String s143 = HttpsRequestUtils.sendGet(base+"app/cart/refresh","SKCS=['1525231262','1525230076']");
		System.out.println("\n购物车信息:"+s143);

		//购物车添加skc
		String s17 = HttpsRequestUtils.sendPost(base+"app/cart/add","SKCID=2&USERID=wjc&NUM=1");
		System.out.println("\n购物车添加skc:"+s17);

		//购物车删除skc
		String s15 = HttpsRequestUtils.sendPost(base+"app/cart/delete","options=[{USERID:'aaa'},{USERID:'wjc',SKCID:6}]");
		System.out.println("\n购物车删除skc:"+s15);

		//购物车更改skc
		String s16 = HttpsRequestUtils.sendPost(base+"app/cart/update","userid=gjy&skcid=28&num=22");
		System.out.println("\n购物车更改skc:"+s16);

	}
}
