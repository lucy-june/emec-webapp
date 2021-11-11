package tests;

import utils.HttpsRequestUtils;

public class accountTest {
	public static void main(String [] args){
		String base=HttpsRequestUtils.base;

//		//登录
//		String s2 =HttpsRequestUtils.sendPost(base+"app/account/login","username=gjy&password=2");
//		System.out.println("\n登录:"+s2);
//
//		//修改密码
//		String s3 =HttpsRequestUtils.sendPost(base+"app/account/modifyPwd","username=gjy&oldPwd=1&newPwd=2");
//		System.out.println("\n修改密码:"+s3);
//
//		//查看用户信息
//		String s4 =HttpsRequestUtils.sendPost(base+"app/account/display","username=gjy");
//		System.out.println("\n查看用户信息:"+s4);

		//获取验证码
		//				String s68 =HttpsRequestUtils.sendGet(base+"app/account/getTelCode","TELEPHONE=15216711947");
		//				System.out.println("\n获取验证码:"+s68);

		//销毁账户
		//				String s682 =HttpsRequestUtils.sendGet(base+"app/account/delAccount","USERCODE=AAZSSSS");
		//				System.out.println("\n销毁账户:"+s682);
		String s683 =HttpsRequestUtils.sendGet(base+"app/account/delAccount","TELEPHONE=15216711947");
		System.out.println("\n销毁账户:"+s683);

		//		//验证验证码
		//		String s681 =HttpsRequestUtils.sendGet(base+"app/account/checkTelCode","TELEPHONE=15216711947&CODE=320924");
		//		System.out.println("\n验证验证码:"+s681);
		//
		//		//注册用户信息
		//		String s6 =HttpsRequestUtils.sendPost(base+"app/account/regist","USERID=AAZSSSS&PASSWORD=AAA&TELPHONE=15216711947&CODE=611226");
		//		System.out.println("\n注册用户信息:"+s6);
	}
}
