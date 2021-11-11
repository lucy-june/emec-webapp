package tests;

import utils.HttpsRequestUtils;

public class behaviorTest {
	public static void main(String [] args) {
		String base = HttpsRequestUtils.base;
		
		//测试收藏商品,返回值：({status:true, data: "add"});({status:true, data: "del"});send({status:false, data:null});
		//分别表示添加收藏，取消收藏和出错
//		String s2 = HttpsRequestUtils.sendPost(base+"app/behavior/favoriteItem", "op=add&usercode=legend&itemcode=1525230");
//		System.out.println("\n收藏商品:"+s2);
//
//		//测试取消收藏（和收藏商品一样，已存在的收藏会取消）
//		String s3 = HttpsRequestUtils.sendPost(base+"app/behavior/favoriteItem", "op=del&usercode=legend&itemcode=hello");
//		System.out.println("\n取消收藏商品:"+s3);
//
//		
//		//测试收藏品牌,返回值：({status:true, data: "add"});({status:true, data: "del"});send({status:false, data:null});
//		//分别表示添加收藏，取消收藏和出错
//		String s4 = HttpsRequestUtils.sendPost(base+"app/behavior/favoriteBrand", "op=add&usercode=legend&brandcode=000004");
//		System.out.println("\n收藏品牌:"+s4);
//
//		
//		//测试取消收藏（和收藏品牌一样，已存在的收藏会取消）
//		String s5 = HttpsRequestUtils.sendPost(base+"app/behavior/favoriteBrand", "op=del&usercode=legend&brandcode=hi");
//		System.out.println("\n取消收藏商品:"+s5);
//
//		
		//测试获取用户收藏的商品,必传usercode，剩下的分页设置参数可选
		//返回值：成功：{status:true, total:total, records:msg.count, page:page, rows:msg.rows}
		//        失败：{status: false, data:err}
		String s6 = HttpsRequestUtils.sendGet(base+"app/behavior/getFavorItem", "usercode=legend&rows=10&page=1&sidx=CREATETIME&sord=desc");
		//String s62 = HttpsRequestUtils.sendGet(base+"app/behavior/getFavorItem", "usercode=legend");
		System.out.println("\n获取用户收藏商品："+ s6);
//
//		
//		//测试获取用户收藏的品牌,必传usercode，剩下的分页设置参数可选
//		//返回值：成功：{status:true, total:total, records:msg.count, page:page, rows:msg.rows}
//		//        失败：{status: false, data:err}
//		String s7 = HttpsRequestUtils.sendGet(base+"app/behavior/getFavorBrand", "usercode=legend&rows=10&page=1&sidx=createdAt&sord=desc");
//		String s72 = HttpsRequestUtils.sendGet(base+"app/behavior/getFavorBrand", "usercode=legend");
//		System.out.println("\n获取用户收藏品牌："+ s7);
//
//		
//		//测试对online商品的评论
//		//返回值：{status:true, data: "add"};   {status:false, data:null}
//		String s8 = HttpsRequestUtils.sendPost(base+"app/behavior/onlineComment", "usercode=legend&contentcode=11409168851100000038761006&star=5&comment=good");
//		System.out.println("\n评论online商品:"+s8);
//
//		
//		//测试对offline商品的评论
//		//返回值同online
//		String s9 = HttpsRequestUtils.sendPost(base+"app/behavior/offlineComment", "usercode=legend&contentcode=01410060747800023741165002&star=4&comment=seems good");
//		System.out.println("\n评论offline商品:"+s9);
//
//		
//		//测试获取某商品评论,必传itemcode，剩下的分页设置参数可选
//		//返回值：成功：{status:true, total:total, records:msg.count, page:page, rows:msg.rows}
//		//        失败：{status: false, data:err}
//		String s10 = HttpsRequestUtils.sendGet(base+"app/behavior/getComment", "itemcode=1234567&rows=5&page=1&sidx=createdAt&sord=desc");
//		String s101 = HttpsRequestUtils.sendGet(base+"app/behavior/getComment", "itemcode=1234567");
//		System.out.println("\n评论:"+s101);
		
//		String s201 = HttpsRequestUtils.sendGet(base+"app/behavior/getCommentGood", "itemcode=1525233");
//		System.out.println("\n评论:"+s201);
//		
//		String s301 = HttpsRequestUtils.sendGet(base+"app/behavior/getCommentMid", "itemcode=1525233");
//		System.out.println("\n评论:"+s301);
//		
//		String s401 = HttpsRequestUtils.sendGet(base+"app/behavior/getCommentBad", "itemcode=1525233");
//		System.out.println("\n评论:"+s401);
	}
}
