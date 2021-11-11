package tests;

import utils.HttpsRequestUtils;

public class regionTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//获取分区名称图片等原始数据
		String s90 =HttpsRequestUtils.sendGet(base+"app/region/getAllRaw","");
		System.out.println("\n获取分区名称图片等原始数据:"+s90);

		//		//获取处理后楼层信息
		//		String x9 =HttpsRequestUtils.sendGet(base+"app/region/getAll","");
		//		System.out.println("\n获取处理后楼层信息:"+x9);
		//
		//		//获取楼层信息反向路径
		//		String x10 =HttpsRequestUtils.sendGet(base+"app/region/getAllReverse","");
		//		System.out.println("\n获取楼层信息反向路径:"+x10);
		//
		//		//获取楼层分类对应的商品
		//		String z2 =HttpsRequestUtils.sendGet(base+"app/region/getItems","region=迷你女包&page=1&num=5");
		//		System.out.println("\n获取楼层分类对应商品:"+z2);
		//		String z3 =HttpsRequestUtils.sendGet(base+"app/region/getItems","region=第一楼层&page=1&num=5");
		//		System.out.println("\n获取楼层分类对应商品:"+z3);
	}
}
