package tests;

import utils.HttpsRequestUtils;

public class itemTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		/**
		上线商品测试用例:
		ITEMCODE=1525233 的SKC包括
		    1525233273
		    1525233351
		    1525233837

		ITEMCODE=1525231 的SKC包括
		    1525231036
		    1525231054
		    1525231786

       ITEMCODE=1525230 的SKC包括
		    1525230076
		    1525230392
		    1525230525
		    1525230796
		 */

		//查看商品信息
		String s5 =HttpsRequestUtils.sendPost(base+"app/item/display","ITEMCODE=1525231");
		System.out.println("\n查看商品信息:"+s5);
		String s122 =HttpsRequestUtils.sendPost(base+"app/item/display","USERCODE=gjy&ITEMCODE=1525231");
		System.out.println("\n查看商品信息:"+s122);

//		//获取skc库存信息
//		String s6 =HttpsRequestUtils.sendGet(base+"app/item/getSkcStock","SKCCODE=1525231054");
//		System.out.println("\n获取skc库存信息:"+s6);
//
//		//获取商品key-value参数信息
//		String s61 =HttpsRequestUtils.sendGet(base+"app/item/getParameters","ITEMCODE=1525230");
//		System.out.println("\n获取商品key-value参数信息:"+s61);
//
//		//获取商品图文详情信息  /app/item/getImgDetail?ITEMCODE=1525233
//		String s62 =HttpsRequestUtils.sendGet(base+"app/item/getImgDetail","ITEMCODE=1525233");
//		System.out.println("\n获取商品图文详情信息:"+s62);
	}
}
