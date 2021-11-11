package tests;

import utils.HttpsRequestUtils;

public class logisticsTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

		//获取订单的运单信息和物流信息
		//返回的结果里面 EXPRESSINFO 是快递接口查询到的快递信息是String类型的JSON字段
		String s5 =HttpsRequestUtils.sendGet(base+"app/logistics/getOrderExpressInfo","ORDERCODE=014112993672000880");
		System.out.println("\n获取订单的运单信息和物流信息:"+s5);

		//获取订单的全部到柜自提信息或者到门店自提信息
		//返回的结果是个数组:[{自提门店和柜等信息,要提的货的信息..},{自提门店和柜等信息,要提的货的信息..},{},...]
		//分成到柜自提  和  倒门店自提
		//到门店自提的话:  数组只有一个对象, 并且数组内的COUNTERCODE=null
		//到柜台自提的话:  数组内有1-多个对象, 并且数组内的COUNTERCODE必须不等与null
		String s51 =HttpsRequestUtils.sendGet(base+"app/logistics/getOrderPickInfo","ORDERCODE=114091848277000000");
		System.out.println("\n获取订单的全部到柜自提信息或者到门店自提信息:"+s51);
		String s52 =HttpsRequestUtils.sendGet(base+"app/logistics/getOrderPickInfo","ORDERCODE=114080197622000000");
		System.out.println("\n获取订单的全部到柜自提信息或者到门店自提信息:"+s52);
		
	}
}
