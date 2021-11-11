package tests;

import utils.HttpsRequestUtils;

public class promotionTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//查看购物车所选商品总价格
		String s5 =HttpsRequestUtils.sendGet(base+"app/promotion/getTotalPrice","ENTRIES=[{SKCCODE:'1525233273',NUM:3},{SKCCODE:'1525233837',NUM:2}]");
		System.out.println("\n查看购物车所选商品总价格:"+s5);

		//查看所选线下订单拼单总价格
		String s51 =HttpsRequestUtils.sendGet(base+"app/promotion/getGroupTotalPrice","OFFLINEORDERCODES=['014113006292000020','014112996729000359']");
		System.out.println("\n查看所选线下订单拼单总价格:"+s51);
	}
}
