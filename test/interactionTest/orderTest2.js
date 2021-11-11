var soap = require('soap');

var order_url = 'http://126.200.200.101:8080/XJHjoyWS/WebService?wsdl';
var args = {
    itemList:[{
        ordercode:'A0000001',
        listid:'1',
        sku:'0000001',
        countercode:'000006',
        itemname:'测试1',
        promotionmark:'X',
        price:'1000',
        qty:'1',
        saler:'000011',
        discountlist: [{
            discountlistid:'1',
            discountreason:'手工折扣',
            discountamt:'100',
            vipcardtype:''
        },{
            discountlistid:'2',
            discountreason:'活动折扣',
            discountamt:'100',
            vipcardtype:''
        }]
    },{
        ordercode:'A0000001',
        listid:'2',
        sku:'0000002',
        countercode:'000566',
        itemname:'测试2',
        promotionmark:'X',
        price:'1500',
        qty:'1',
        saler:'000021',
        discountlist: [{
            discountlistid:'1',
            discountreason:'手工折扣',
            discountamt:'100',
            vipcardtype:''
        },{
            discountlistid:'2',
            discountreason:'活动折扣',
            discountamt:'100',
            vipcardtype:''
        },{
            discountlistid:'3',
            discountreason:'贵宾卡',
            discountamt:'100',
            vipcardtype:'01'
        }]
    }]
};

var billcode = 'A00000011';
var billcode1 = 'A00000012';

var order = {
    orderList:[{
        groupcode:"",
        ordercode:billcode,
        ifreturn:'0',//#####是否是退货单
        ordercodetype:'1',
        pickupmode:"0",
        paymenttype:'0',
        status:'2',
        orderdate:'2014-12-16 11:29:52',
        audittime:'2014-12-16 11:29:53',
        paytime:'2014-12-16 11:30:20',
        outtime:'',
        finishtime:'',
        receivabletime:'',
        vipcardNo:'60001245',
        cashier:'000099',
        receivableamt:'2000',
        realshipprice:'0',//实付运费
        realpacking:'0',//实付包装费
        shipprice:'0',//总运费
        packing:'0',//总包装费
        receivecontact:'李四',
        receivename:'李四',
        receivephone:'12356715',
        receivecellphone:'09876543210',
        receiveaddress:'上海市徐汇区肇嘉浜路1000号',
        receivezip:'200030',
        storecode:'10501',//门店号
        poscode:'234424',//pos机号
        paylocal:1//0-pos付款，1-app付款,

//	-----新增字段
//	POSSALECODE:线下支付POS凭条号
//	GROUPLISTID:组内订单序号
    },{
        groupcode:"",
        ordercode:billcode1,
        ordercodetype:'1',
        pickupmode:"0",
        paymenttype:'0',
        status:'9',
        orderdate:'2014-12-16 18:29:52',
        audittime:'2014-12-16 18:29:53',
        paytime:'2014-12-16 18:30:20',
        outtime:'2014-12-16 21:01:30',
        finishtime:'',
        receivabletime:'',
        vipcardNo:'60001245',
        cashier:'000099',
        receivableamt:'2300',
        shipprice:'0',
        packing:'0',
        receivecontact:'张三',
        receivename:'张三',
        receivephone:'11111111',
        receivecellphone:'09876543210',
        receiveaddress:'上海市徐汇区肇嘉浜路1000号',
        receivezip:'200030'
    }]
};

var item = {
    orderitemList:[{
        ordercode:billcode,
        listID:'1',
        sku:'0000011',
        billcountercode:'100006',
        countercode:'000006',
        itemname:'测试11',
        promotionmark:'X',
        price:'1200',
        qty:'1',
        saler:'000011',
        VIPDISCOUNTAMT:0,//汇金贵宾卡折扣
        DISCOUNTOUTAMT:0,//支付前满减 - 折让
        DISCOUNTINAMT:0,//赠券
        PRESENTSHAREQTY:0,//赠礼
        MERCHANTDISCOUTAMT:0,//供应商折扣
        shipprice : 0,//每个订单charge里非顾客支付运费到商品的分摊
        packing :0,//每个订单charge里非顾客支付包装费到商品的分摊
        

//	-----新增字段
//	RETAILAMT:成交价（分摊后实际折后价）
//	TEMPDISTRIBUTIONMARK:是否临时销售状态* 0--否 ,1--是
//	RETURNORDERCODE:退货商品对应的订单号
//	RETURNLISTID:退货商品对应的商品序号号
//	HANDAMT:手工折扣金额
	
        discountlist: []
    },{
        ordercode:billcode,
        listID:'2',
        sku:'0000012',
        billcountercode:'100566',
        countercode:'000566',
        itemname:'测试12',
        promotionmark:'X',
        price:'1100',
        qty:'1',
        saler:'000021',
        discountlist: []
    },{
        ordercode:billcode1,
        listID:'1',
        sku:'0000001',
        billcountercode:'100006',
        countercode:'000006',
        itemname:'测试01',
        promotionmark:'X',
        price:'1000',
        qty:'1',
        saler:'000011',
        discountlist: []
    },{
        ordercode:billcode1,
        listID:'2',
        sku:'0000002',
        billcountercode:'100566',
        countercode:'000566',
        itemname:'测试02',
        promotionmark:'X',
        price:'1500',
        qty:'1',
        saler:'000021',
        discountlist: []
    }]
};

var discountlist = {
    orderdiscountList:[{
        ordercode:billcode,
        itemListID:"1",
        listID:'1',
        discountreason:'01',
        discountamt:'100',
        vipcardtype:''
        
        
//        -----新增字段
//        DISCOUNTTYPE:折扣折让类型（1-折让；2-折扣；3-增礼；4-手工折扣；5-供应商活动）
    },{
        ordercode:billcode,
        itemListID:"1",
        listID:'2',
        discountreason:'02',
        discountamt:'125',
        vipcardtype:''
    },{
        ordercode:billcode,
        itemListID:"1",
        listID:'3',
        discountreason:'03',
        discountamt:'75',
        vipcardtype:'01'
    },{
        ordercode:billcode1,
        itemListID:"1",
        listID:'1',
        discountreason:'01',
        discountamt:'100',
        vipcardtype:''
    },{
        ordercode:billcode1,
        itemListID:"1",
        listID:'2',
        discountreason:'02',
        discountamt:'100',
        vipcardtype:''
    }]
};

var paylist = {
    orderpayList:[{
        ifreturn:'1',//#####是否是退货
        groupcode:'',//#####单一订单给订单号，多个订单组号

//    ----还是要的
        ordercode:billcode,

        listID:'1',
        paycode:'01',
        amt:300,
        cardcode:'',
        portno:'',
        bankcardcode:'',
        feeratecode:''
    },{
        ordercode:billcode,
        listID:'2',
        paycode:'03',
        amt:700,
        cardcode:'1111122222',
        portno:'',
        bankcardcode:'',
        feeratecode:''
    },{
        ordercode:billcode,
        listID:'3',
        paycode:'07',
        amt:1000,
        cardcode:'622290998901919',
        portno:'10231',
        bankcardcode:'51',
        feeratecode:'1'
    },{
        ordercode:billcode1,
        listID:'1',
        paycode:'01',
        amt:300,
        cardcode:'',
        portno:'',
        bankcardcode:'',
        feeratecode:''
    },{
        ordercode:billcode1,
        listID:'2',
        paycode:'07',
        amt:2000,
        cardcode:'622290998901919',
        portno:'10231',
        bankcardcode:'51',
        feeratecode:'1'
    }]
};

var chargelist = {
    orderchargerList:[{
        ordercode:billcode,
        listID:'1',
        chargecode:'01',
        amt:'10'
    }]
};

var updateorder = {
    updateorderList:[{
        ordercode:billcode,
        ordercodetype:'1',
        pickupmode:"0",
        paymenttype:'0',
        status:'10',
        orderdate:'2014-12-16 11:29:52',
        audittime:'2014-12-16 11:29:53',
        paytime:'2014-12-16 11:30:20',
        outtime:'2014-12-16 13:50:07',
        finishtime:'2014-12-17 12:31:25',
        receivabletime:'',
        vipcardNo:'60001245',
        cashier:'000099',
        receivableamt:'2000',
        shipprice:'0',
        packing:'0',
        receivecontact:'李四',
        receivename:'李四',
        receivephone:'12356715',
        receivecellphone:'09876543210',
        receiveaddress:'上海市徐汇区肇嘉浜路1000号',
        receivezip:'200030'
    }]
};

soap.createClient(order_url, function (err, client1) {
    if (!err) {
        client1.setSOAPAction("http://126.200.200.101:8080/XJHjoyWS/WebService/getOrderInfoService");
        //client.setSOAPAction("");
        client1.getOrderInfoService(order, function (err, result) {
            //console.log(result["return"]);
            console.log(result);
        });
    } else {
        console.log(err);
    }
});

soap.createClient(order_url, function(err, client2) {
    if(!err){
        client2.setSOAPAction("http://126.200.200.101:8080/XJHjoyWS/WebService/getOrderItemInfoService");
        //client.setSOAPAction("");
        client2.getOrderItemInfoService(item, function(err, result) {
            //console.log(result["return"]);
            console.log(result);
        });
    }else{
        console.log(err);
    }
});

soap.createClient(order_url, function(err, client3) {
    if(!err){
        client3.setSOAPAction("http://126.200.200.101:8080/XJHjoyWS/WebService/getOrderDiscountInfoService");
        //client.setSOAPAction("");
        client3.getOrderDiscountInfoService(discountlist, function(err, result) {
            //console.log(result["return"]);
            console.log(result);
        });
    }else{
        console.log(err);
    }
});

soap.createClient(order_url, function(err, client4) {
    if(!err){
        client4.setSOAPAction("http://126.200.200.101:8080/XJHjoyWS/WebService/getOrderPayInfoService");
        //client.setSOAPAction("");
        client4.getOrderPayInfoService(paylist, function(err, result) {
            //console.log(result["return"]);
            console.log(result);
        });
    }else{
        console.log(err);
    }
});

soap.createClient(order_url, function(err, client5) {
    if(!err){
        client5.setSOAPAction("http://126.200.200.101:8080/XJHjoyWS/WebService/getOrderChargeInfoService");
        //client.setSOAPAction("");
        client5.getOrderChargeInfoService(chargelist, function(err, result) {
            //console.log(result["return"]);
            console.log(result);
        });
    }else{
        console.log(err);
    }
});

soap.createClient(order_url, function(err, client6) {
    if(!err){
        client6.setSOAPAction("http://126.200.200.101:8080/XJHjoyWS/WebService/updateOrderInfoService");
        //client.setSOAPAction("");
        client6.updateOrderInfoService(updateorder, function(err, result) {
            //console.log(result["return"]);
            console.log(result);
        });
    }else{
        console.log(err);
    }
});
