/**
 * Created by lucywu on 11/21/14.
 */
var onlineService   = require("../../../service/web/onlineService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
};

var itemcode="1525230";
//var countercode2="000222";
//var countercode3="000333";
//
//var title={"TITLE":"测试title,多种颜色,真皮钱包,财源滚滚"};
//var imgpreviews=[
//    {IMGURL:"http://stimgcn1.s-msn.com/msnportal/fashionlib/images/handbag/12074.jpg",DESCRIPTION:""},
//    {IMGURL:"http://img-tx.meilishuo.net/pic/r/bd/27/b79e0d3caa1148fbd0f4873160f2_800_800.jpeg",DESCRIPTION:""},
//    {IMGURL:"http://l.b2b168.com/2010/06/26/14/20100626144404563895.jpg",DESCRIPTION:""}
//]
//var imgdetails=[
//    {IMGURL:"http://gd3.alicdn.com/imgextra/i3/698598873/TB2OEmZaVXXXXaZXXXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"老手先从嗅觉入手：其实所有LV的产品都有一种独特的皮味，如果你对LV很有研究的话，包包拿到手上就会知道这个手袋究竟是真货还是假货了。这种味道就好像你一进入LV专卖店就会闻到的那种味道，是在非常特别的气味。不过单单以嗅觉来分析真假，并不是人人都能做到的，一定要有一定功力才行。而且也不适合网上购买……当然如果对方承认退货除外。"},
//    {IMGURL:"http://gd2.alicdn.com/imgextra/i2/698598873/TB2RWyWaVXXXXXdXpXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"印字要够浅：袋外面会有块皮上写了“LoulsVulttonParismadeinFrance”的字样，要留意的是真LV的字印得比较浅，但每个字都规范平均。相反假的行距没有真的那么规范平均。字每印得完全不工整（例如LV和U字都要会印错），这一点是很重要的。"},
//    {IMGURL:"http://gd2.alicdn.com/imgextra/i2/698598873/TB2rz9YaVXXXXbMXXXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"LV包，即法国著名品牌Louis Vuitton 路易·威登生产的各款式的包，LV包是世界顶级奢侈消费品。"},
//    {IMGURL:"http://gd2.alicdn.com/imgextra/i2/698598873/TB26S11aVXXXXXfXXXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"看花纹深度：以前很多人以为只要分辨LV提包袋上的花纹图案对不对就会知道真假，但其实这种做法已经out了，现在那些假LV包上的花纹图案已做得和真的相差无几"}
//]
//var itemcategorys=[
//    {CATEGORYID:165},
//    {CATEGORYID:18},
//    {CATEGORYID:4}
//]
//var itemregions=[
//    {REGIONID:38},
//    {REGIONID:6},
//    {REGIONID:1}
//]
//var parameters=[
//    {ATTRIBUTE:"材质",VALUE:"皮革,真牛皮"},
//    {ATTRIBUTE:"洗涤方式",VALUE:"干洗"}
//]
//var onlines=[title,imgpreviews,imgdetails,itemregions,itemcategorys,parameters];
//
//
//var title2={"TITLE":"测试title222,多种颜色,真皮钱包,财源滚滚"};
//var imgpreviews2=[
//    {IMGURL:"http://stimgcn1.s-msn.com/msnportal/fashionlib/images/handbag/12074.jpg",DESCRIPTION:"红"},
//    {IMGURL:"http://img-tx.meilishuo.net/pic/r/bd/27/b79e0d3caa1148fbd0f4873160f2_800_800.jpeg",DESCRIPTION:"绿"},
//    {IMGURL:"http://l.b2b168.com/2010/06/26/14/20100626144404563895.jpg",DESCRIPTION:"蓝"}
//]
//var imgdetails2=[
//    {IMGURL:"http://gd3.alicdn.com/imgextra/i3/698598873/TB2OEmZaVXXXXaZXXXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"22222老手先从嗅觉入手：其实所有LV的产品都有一种独特的皮味，如果你对LV很有研究的话，包包拿到手上就会知道这个手袋究竟是真货还是假货了。这种味道就好像你一进入LV专卖店就会闻到的那种味道，是在非常特别的气味。不过单单以嗅觉来分析真假，并不是人人都能做到的，一定要有一定功力才行。而且也不适合网上购买……当然如果对方承认退货除外。"},
//    {IMGURL:"http://gd2.alicdn.com/imgextra/i2/698598873/TB2RWyWaVXXXXXdXpXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"印字要够浅：袋外面会有块皮上写了“LoulsVulttonParismadeinFrance”的字样，要留意的是真LV的字印得比较浅，但每个字都规范平均。相反假的行距没有真的那么规范平均。字每印得完全不工整（例如LV和U字都要会印错），这一点是很重要的。"},
//    {IMGURL:"http://gd2.alicdn.com/imgextra/i2/698598873/TB2rz9YaVXXXXbMXXXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"LV包，即法国著名品牌Louis Vuitton 路易·威登生产的各款式的包，LV包是世界顶级奢侈消费品。"},
//    {IMGURL:"http://gd2.alicdn.com/imgextra/i2/698598873/TB26S11aVXXXXXfXXXXXXXXXXXX_!!698598873.jpg",DESCRIPTION:"看花纹深度：以前很多人以为只要分辨LV提包袋上的花纹图案对不对就会知道真假，但其实这种做法已经out了，现在那些假LV包上的花纹图案已做得和真的相差无几"}
//]
//var itemcategorys2=[
//    {CATEGORYID:165},
//    {CATEGORYID:18},
//    {CATEGORYID:4}
//]
//var itemregions2=[
//    {REGIONID:38},
//    {REGIONID:6},
//    {REGIONID:1}
//]
//var parameters2=[
//    {ATTRIBUTE:"材质",VALUE:"皮革,真牛皮"},
//    {ATTRIBUTE:"洗涤方式",VALUE:"干洗"},
//    {ATTRIBUTE:"洗涤方式",VALUE:"干洗"}
//]
//var onlines2=[title2,imgpreviews2,imgdetails2,itemregions2,itemcategorys2,parameters2];
//

//onlineService.getOnlineUninitialSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.initialOnline(itemcode,onlines,"test1",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.getOnlineRenewableSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.getOnlineCheckableSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
onlineService.getApprovedOnlineBySku(itemcode,function(err,msg){
    console.log(err);
    console.log(msg);
})

//onlineService.getRenewableOnlineBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//onlineService.getCheckableOnlineBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.updateOnline(itemcode,onlines2,"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.approveOnline(itemcode,"test3",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.updateOnline(itemcode,onlines,"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.approveOnline(itemcode,"test5",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.getRenewableOnlineBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.getCheckableOnlineBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.updateOnline(itemcode,onlines2,"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//onlineService.invalidOnline(itemcode,"test2",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//for(var k=0;k<20;k++){
//    onlineService.updateOnline(itemcode,onlines,"test2",function(err,msg){
//        console.log(err);
//        console.log(msg);
//    });
//    onlineService.invalidOnline(itemcode,"test2",function(err,msg){
//        console.log(err);
//        console.log(msg);
//    })
//}

//onlineService.getOnlinePreparedSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//onlineService.getPreparedCounterBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//onlineService.getOnlineSellingSku({},{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//onlineService.getSellingCounterBySku(itemcode,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//onlineService.performOnline(itemcode,countercode2,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//

//onlineService.performOffline(itemcode,countercode2,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//for(var k=0;k<20;k++){//保证before or after 但是不保证顺序也不用保证顺序
//    onlineService.performOnline(itemcode,countercode2,function(err,msg){
//        console.log(err); k
//        console.log(msg);
//    })
//
//    onlineService.performOnline(itemcode,countercode3,function(err,msg){
//        console.log(err);
//        console.log(msg);
//    })
//
//    onlineService.performOffline(itemcode,countercode2,function(err,msg){
//        console.log(err);
//        console.log(msg);
//    })
//
//    onlineService.performOffline(itemcode,countercode3,function(err,msg){
//        console.log(err);
//        console.log(msg);
//    })
//}


var itemcode1="1525231";

var title1={"TITLE":"测试title,炫酷时尚女士羽绒服全码"};
var imgpreviews1=[
    {IMGURL:"http://d01.res.meilishuo.net/pic/_o/27/cb/9d76c19c24bf2b9a3dfccd83fd5d_800_800.jpg",DESCRIPTION:""},
    {IMGURL:"http://www.duanjifs.cn/attachments/2010/04/1_20100414094258204s3.jpg",DESCRIPTION:""},
    {IMGURL:"http://image.sonhoo.com/server4/photos/photo/xingpai381/16EC05C225F6909E8A2BD6FA0C6E18BF.jpg",DESCRIPTION:""}
]
var imgdetails1=[
    {IMGURL:"http://d05.res.meilishuo.net/pic/_o/83/9d/c117dd38bd6a426bf270aaab0a56_1500_1500.jpg",DESCRIPTION:"#########356老45所5678789很有研究的话，包包拿到手上就会知道这个手袋究竟是真货还是假货了。这种味道就好像你一进入LV专卖店就会闻到的那种味道，是在非常特别的气味。不过单单以嗅觉来分析真假，并不是人人都能做到的，一定要有一定功力才行。而且也不适合网上购买……当然如果对方承认退货除外。"},
    {IMGURL:"http://d01.res.meilishuo.net/pic/_o/27/cb/9d76c19c24bf2b9a3dfccd83fd5d_800_800.jpg",DESCRIPTION:"1525231块皮上写1525231ParismadeinFrance”的字样，要留意的是真LV的字印得比较浅，但每个字都规范平均。相反假的行距没有真的那么规范平均。字每印得完全不工整（例如LV和U字都要会印错），这一点是很重要的。"},
    {IMGURL:"http://www.duanjifs.cn/attachments/2010/04/1_20100414094258204s3.jpg",DESCRIPTION:"1525231品牌Louis Vui1525231的各款式的包1525231世界顶级奢侈消费品。"},
    {IMGURL:"http://www.duanjifs.cn/attachments/2010/04/1_20100414094258204s3.jpg",DESCRIPTION:"1525231知道真假，1525231经out了，1525231包上的1525231得和真的相差无几"}
]
var itemcategorys1=[
    {CATEGORYID:143},
    {CATEGORYID:15},
    {CATEGORYID:1}
]
var itemregions1=[
    {REGIONID:17},
    {REGIONID:3}
]
var parameters1=[
    {ATTRIBUTE:"材质",VALUE:"金丝绒"},
    {ATTRIBUTE:"洗涤方式",VALUE:"干洗"}
]
var onlines1=[title1,imgpreviews1,imgdetails1,itemregions1,itemcategorys1,parameters1];


var itemcode3="1525233"
var title3={"TITLE":"牛皮钱包皮夹,样式全,好又多"};
var imgpreviews3=[
    {IMGURL:"http://pic4.nipic.com/20090906/3340153_001658282531_2.jpg",DESCRIPTION:"红"},
    {IMGURL:"http://pic18.nipic.com/20120111/8993755_112717371343_2.jpg",DESCRIPTION:"绿"},
    {IMGURL:"http://imgsrc.baidu.com/forum/pic/item/faedab64034f78f00e4f527f79310a55b2191cf2.jpg",DESCRIPTION:"蓝"}
]
var imgdetails3=[
    {IMGURL:"http://pic18.nipic.com/20120111/8993755_112717371343_2.jpg",DESCRIPTION:"222221525233所有LV的产品都有一种独特的皮味，如果你对LV很有研究的话，包包拿到手上就会知道这个手袋究竟是真货还是假货了。这种味道就好像你一进入LV专卖店就会闻到的那种味道，是在非常特别的气味。不过单单以嗅觉来分析真假，并不是人人都能做到的，一定要有一定功力才行。而且也不适合网上购买……当然如果对方承认退货除外。"},
    {IMGURL:"http://stimgcn1.s-msn.com/msnportal/fashionlib/images/handbag/12074.jpg",DESCRIPTION:"印1525233上写了“LoulsVulttonParismadeinFrance”的字样，要留意的是真LV的字印得比较浅，但每个字都规范平均。相反假的行距没有真的那么规范平均。字每印得完全不工整（例如LV和U字都要会印错），这一点是很重要的。"},
    {IMGURL:"http://pic24.nipic.com/20121012/11105077_144207774000_2.jpg",DESCRIPTION:"看花纹深度：以前很多人1525233袋上的花纹图案对不对就会知道真假，但其实这种做法已经out了，现在那些假LV包上的花纹图案已做得和真的相差无几"}
]
var itemcategorys3=[
    {CATEGORYID:165},
    {CATEGORYID:18},
    {CATEGORYID:4}
]
var itemregions3=[
    {REGIONID:38},
    {REGIONID:6},
    {REGIONID:1}
]
var parameters3=[
    {ATTRIBUTE:"材质",VALUE:"皮革,真牛皮"},
    {ATTRIBUTE:"洗涤方式",VALUE:"干洗"},
    {ATTRIBUTE:"代言热",VALUE:"阚清子"}
]
var onlines3=[title3,imgpreviews3,imgdetails3,itemregions3,itemcategorys3,parameters3];


//onlineService.initialOnline(itemcode1,onlines1,"test1",cb);
//onlineService.initialOnline(itemcode3,onlines3,"test1",cb);

//onlineService.updateOnline(itemcode1,onlines1,"test1",cb);

//onlineService.approveOnline(itemcode1,"test3",cb);
//onlineService.approveOnline(itemcode3,"test3",cb);

//onlineService.performOnline(itemcode1,"000222",cb);
//onlineService.performOnline(itemcode3,"000222",cb);
//onlineService.performOnline(itemcode1,"000333",cb);
//onlineService.performOnline(itemcode3,"000333",cb);
//onlineService.performOnline(itemcode1,"000666",cb);
//onlineService.performOnline(itemcode3,"000666",cb);