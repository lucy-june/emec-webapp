package tests;

import utils.HttpsRequestUtils;

public class analysisTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//热门搜索
		String s2 =HttpsRequestUtils.sendGet(base+"app/analysis/getHotSearch","");
		System.out.println("\n热门搜索:"+s2);

		//热门品牌
		String s3 =HttpsRequestUtils.sendGet(base+"app/analysis/getHotBrands","");
		System.out.println("\n热门品牌:"+s3);

		//热门商品
		String s31 =HttpsRequestUtils.sendGet(base+"app/analysis/getHotBuys","");
		System.out.println("\n热门商品:"+s31);

	}
}
