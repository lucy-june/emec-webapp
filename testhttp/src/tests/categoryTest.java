package tests;

import utils.HttpsRequestUtils;

public class categoryTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//获取类目名称图片等原始数据
		String s90 =HttpsRequestUtils.sendGet(base+"app/category/getAllRaw","");
		System.out.println("\n获取类目名称图片等原始数据:"+s90);

//		//获取处理后分类信息
//		String s9 =HttpsRequestUtils.sendGet(base+"app/category/getAll","");
//		System.out.println("\n获取处理后分类信息:"+s9);
//
//		//获取分类信息反向路径
//		String s10 =HttpsRequestUtils.sendGet(base+"app/category/getAllReverse","");
//		System.out.println("\n获取分类信息反向路径:"+s10);
//
//		//获取普通分类对应商品
//		String z1 =HttpsRequestUtils.sendGet(base+"app/category/getItems","category=男式钱包&page=1&num=5");
//		System.out.println("\n获取普通分类对应商品:"+z1);
//		String z0 =HttpsRequestUtils.sendGet(base+"app/category/getItems","category=箱包手袋&page=1&num=5");
//		System.out.println("\n获取普通分类对应商品:"+z0);
	}
}
