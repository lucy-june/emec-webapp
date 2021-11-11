/**
* Created by lucywu on 11/21/14.
*/
var skuService   = require("../../../service/web/skuService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

//skuService.generateItemcode(function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//console.log(skuService.generateBarcode("1518596"));
//
//var newItem={
////    BARCODE: '2000000044354',
//    ITEMNAME: '财运包',
//    ITEMSHORTNAME: '财运包',
//    BRANDCODE: '000564',
//    RETAILTYPECODE: '131',
//    ITEMTYPECODE: '13105',
//    MERCHANTCODE: '000273',
//    BUSINESSMODE: 'A',
//    PROCDUCINGAREA: '广东深圳',
//    PRICE: '458',
//    TEMPPRICE: '458',
//    TAXRATE: '01',
//    EXCISERATE: '07',
//    RETURNGOODS: '1',
//    SALESTATE: '0',
//    NETWEIGHT: null,
//    GROSSWEIGHT: null,
//    SPECIFICATION: null,
//    PRODUCTCODE: 'P0007',
//    GRADE: '正',
//    COLOR: null,
//    CASING: '1',
//    DIMENSION: null,
//    VOLUME: null,
//    ITEMCODETYPE: '0',
//    UNIT: '件',
//    LASTPURCHASEPRICE: null,
//    PURCHASETAXRATE: '01',
//    SAFESTOCK: null,
//    MAXSTOCK: null,
//    MINSTOCK: null,
//    MAXORDER: null,
//    MINORDER: null,
//    PROPERTY: '0',
//    CHECKSTATE: '3',
//    ERRORINFO: null,
//    INPUTPERSON:null,
//    AGENTCODE: '003',
//    TERM: null
//};
//
//skuService.addSku(newItem,"xxx",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.getRevisableSku({},{page:100,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//
//skuService.getRevisableSku("2014-07-12 07:06:17",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.getCheckableSku("152",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.getCheckableSku("工艺",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//var value1={
//    ITEMCODE: '0005043',
//    BARCODE: '2000000044354',
//    ITEMNAME: '财运包',
//    ITEMSHORTNAME: '财运包',
//    BRANDCODE: '000564',
//    RETAILTYPECODE: '131',
//    ITEMTYPECODE: '13105',
//    MERCHANTCODE: '000273',
//    BUSINESSMODE: 'A',
//    PROCDUCINGAREA: '广东深圳',
//    PRICE: '458',
//    TEMPPRICE: '458',
//    TAXRATE: '01',
//    EXCISERATE: '07',
//    RETURNGOODS: '1',
//    SALESTATE: '0',
//    NETWEIGHT: null,
//    GROSSWEIGHT: null,
//    SPECIFICATION: null,
//    PRODUCTCODE: 'P0007',
//    GRADE: '正',
//    COLOR: null,
//    CASING: '1',
//    DIMENSION: null,
//    VOLUME: null,
//    ITEMCODETYPE: '0',
//    UNIT: '件',
//    LASTPURCHASEPRICE: null,
//    PURCHASETAXRATE: '01',
//    SAFESTOCK: null,
//    MAXSTOCK: null,
//    MINSTOCK: null,
//    MAXORDER: null,
//    MINORDER: null,
//    PROPERTY: '0',
//    CHECKSTATE: '3',
//    ERRORINFO: null,
//    INPUTPERSON:null,
//    AGENTCODE: '003',
//    TERM: null
//};
//skuService.reviseSku(null,value1,"system",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//var value2={
//    ITEMCODE: '1525230',
//    BARCODE: '20000021243',
//    ITEMNAME: '财运包xxxxx',
//    ITEMSHORTNAME: '财运包xxxx',
//    BRANDCODE: '000564',
//    RETAILTYPECODE: '131',
//    ITEMTYPECODE: '13105',
//    MERCHANTCODE: '000273',
//    BUSINESSMODE: 'A',
//    PROCDUCINGAREA: '广东深圳xxxxx',
//    PRICE: '458',
//    TEMPPRICE: '458',
//    TAXRATE: '01',
//    EXCISERATE: '07',
//    RETURNGOODS: '1',
//    SALESTATE: '0',
//    NETWEIGHT: null,
//    GROSSWEIGHT: null,
//    SPECIFICATION: null,
//    PRODUCTCODE: 'P0007',
//    GRADE: '正',
//    COLOR: null,
//    CASING: '1',
//    DIMENSION: null,
//    VOLUME: null,
//    ITEMCODETYPE: '0',
//    UNIT: '件',
//    LASTPURCHASEPRICE: null,
//    PURCHASETAXRATE: '01',
//    SAFESTOCK: null,
//    MAXSTOCK: null,
//    MINSTOCK: null,
//    MAXORDER: null,
//    MINORDER: null,
//    PROPERTY: '0',
//    CHECKSTATE: '3',
//    ERRORINFO: null,
//    INPUTPERSON:null,
//    AGENTCODE: '003',
//    TERM: null
//};
//skuService.reviseSku(null,value2,"system",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.invalidSku(8, "system2" ,function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.approveSku(7,"system",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skuService.approveSku(9,"system",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//skuService.getDeletableSku("2014-07-12 07:06:17",{page:1,rows:3,sidx:"ITEMCODE",sord:"desc"},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.deleteSku("1525226","system3",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.approveSku(20,"system",function(err,msg){
//    console.log(err);
//    console.log(msg);
//});
//
//
//
//skuService.toCounter([
//    {
//        ID:'102012222222',
//        ITEMCODE: '1525230',
//        COUNTERCODE: '000222',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 458,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102013333333',
//        ITEMCODE: '1525230',
//        COUNTERCODE: '000333',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 458,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102015555555',
//        ITEMCODE: '1525230',
//        COUNTERCODE: '000555',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 458,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102016666666',
//        ITEMCODE: '1525230',
//        COUNTERCODE: '000666',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 458,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    }
//],function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//

//var newItem5={
////    BARCODE: '2000000044354',
//    ITEMNAME: '女士羽绒服',
//    ITEMSHORTNAME: '女士羽绒服',
//    BRANDCODE: '000182',
//    RETAILTYPECODE: '131',
//    ITEMTYPECODE: '30101',
//    MERCHANTCODE: '000075',
//    BUSINESSMODE: 'A',
//    PROCDUCINGAREA: '辽宁丹东',
//    PRICE: '1888',
//    TEMPPRICE: '1888',
//    TAXRATE: '01',
//    EXCISERATE: '07',
//    RETURNGOODS: '1',
//    SALESTATE: '0',
//    NETWEIGHT: null,
//    GROSSWEIGHT: null,
//    SPECIFICATION: "160/84A-165/88A",
//    PRODUCTCODE: 'MIJ8231',
//    GRADE: '正',
//    COLOR: null,
//    CASING: '1',
//    DIMENSION: null,
//    VOLUME: null,
//    ITEMCODETYPE: '0',
//    UNIT: '件',
//    LASTPURCHASEPRICE: null,
//    PURCHASETAXRATE: '01',
//    SAFESTOCK: null,
//    MAXSTOCK: null,
//    MINSTOCK: null,
//    MAXORDER: null,
//    MINORDER: null,
//    PROPERTY: '0',
//    CHECKSTATE: '3',
//    ERRORINFO: null,
//    INPUTPERSON:null,
//    AGENTCODE: '003',
//    TERM: null
//};
//
//skuService.addSku(newItem5,"xxx",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skuService.getCheckableSku("1525231",{},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skuService.approveSku(21,"test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.getRevisableSku("1525231",{},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skuService.toCounter([
//    {
//        ID:'102012222221',
//        ITEMCODE: '1525231',
//        COUNTERCODE: '000222',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1888,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102013333331',
//        ITEMCODE: '1525231',
//        COUNTERCODE: '000333',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1888,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102015555551',
//        ITEMCODE: '1525231',
//        COUNTERCODE: '000555',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1888,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102016666661',
//        ITEMCODE: '1525231',
//        COUNTERCODE: '000666',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1888,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    }
//],function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//var newItem3={
////    BARCODE: '2000000044354',
//    ITEMNAME: '牛皮女鞋',
//    ITEMSHORTNAME: '牛皮女鞋',
//    BRANDCODE: '000083',
//    RETAILTYPECODE: '341',
//    ITEMTYPECODE: '34102',
//    MERCHANTCODE: '000026',
//    BUSINESSMODE: 'A',
//    PROCDUCINGAREA: '辽宁丹东',
//    PRICE: '1398',
//    TEMPPRICE: '1398',
//    TAXRATE: '01',
//    EXCISERATE: '07',
//    RETURNGOODS: '1',
//    SALESTATE: '0',
//    NETWEIGHT: null,
//    GROSSWEIGHT: null,
//    SPECIFICATION: "22-24.5cm",
//    PRODUCTCODE: 'B8556601',
//    GRADE: '正',
//    COLOR: null,
//    CASING: '1',
//    DIMENSION: null,
//    VOLUME: null,
//    ITEMCODETYPE: '0',
//    UNIT: '件',
//    LASTPURCHASEPRICE: null,
//    PURCHASETAXRATE: '01',
//    SAFESTOCK: null,
//    MAXSTOCK: null,
//    MINSTOCK: null,
//    MAXORDER: null,
//    MINORDER: null,
//    PROPERTY: '0',
//    CHECKSTATE: '3',
//    ERRORINFO: null,
//    INPUTPERSON:null,
//    AGENTCODE: '003',
//    TERM: null
//};
//
//skuService.addSku(newItem3,"xxx",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skuService.getCheckableSku("1525232",{},function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.approveSku(22,"test",function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skuService.toCounter([
//    {
//        ID:'102012222111',
//        ITEMCODE: '1525233',
//        COUNTERCODE: '000222',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 568,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102013333321',
//        ITEMCODE: '1525233',
//        COUNTERCODE: '000333',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 568,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102015555521',
//        ITEMCODE: '1525233',
//        COUNTERCODE: '000555',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 568,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102016666621',
//        ITEMCODE: '1525233',
//        COUNTERCODE: '000666',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 568,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    }
//],function(err,msg){
//    console.log(err);
//    console.log(msg);
//})
//
//skuService.toCounter([
//    {
//        ID:'102012222211',
//        ITEMCODE: '1525232',
//        COUNTERCODE: '000222',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1398,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102013333311',
//        ITEMCODE: '1525232',
//        COUNTERCODE: '000333',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1398,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102015555511',
//        ITEMCODE: '1525232',
//        COUNTERCODE: '000555',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1398,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102016666611',
//        ITEMCODE: '1525232',
//        COUNTERCODE: '000666',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 1398,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    }
//],function(err,msg){
//    console.log(err);
//    console.log(msg);
//})


//skuService.toCounter([
//    {
//        ID:'10201220211',
//        ITEMCODE: '1518506',
//        COUNTERCODE: '000222',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 2380,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'102013303311',
//        ITEMCODE: '1518511',
//        COUNTERCODE: '000222',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 179,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'10201505511',
//        ITEMCODE: '1518506',
//        COUNTERCODE: '000555',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 179,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    },
//    {
//        ID:'10201660611',
//        ITEMCODE: '1518506',
//        COUNTERCODE: '000666',
//        MEMBERPRICE: 0,
//        STORECHECKEDPRICE: 2380,
//        STORETEMPPRICE: 0,
//        PROMOTIONMARK: 'X',
//        DISCOUNTMARK: 1,
//        STORESALESTATE: null,
//        SAFESTOCK: 0,
//        FULLSTOCK: 0,
//        MAXSTOCK: 0,
//        MINSTOCK: 0,
//        MAXORDER: 0,
//        MINORDER: 0,
//        NEGATIVESTOCK: null,
//        TEMPDISTRIBUTIONMARK: 0,
//        ERRORINFO: null,
//        INPUTPERSON: null,
//        COSTMODE: '01',
//        DEDUCTAMT: 0,
//        ONLINESTATE: 0
//    }
//],function(err,msg){
//    console.log(err);
//    console.log(msg);
//})

//skuService.toCounter([{ITEMCODE:"1234568",COUNTERCODE:"000775"}],cb);

//skuService.adjustPromotionMark("9999971","999985","C",cb);

//var misCreateItem=[{
//    ITEMID:1,
//    ITEMCODE:"1525313",
//    BARCODE: '2000000044354',
//    ITEMNAME: '女士羽绒服',
//    ITEMSHORTNAME: '女士羽绒服',
//    BRANDCODE: '000182',
//    RETAILTYPECODE: '131',
//    ITEMTYPECODE: '30101',
//    MERCHANTCODE: '000075',
//    BUSINESSMODE: 'A',
//    PROCDUCINGAREA: '辽宁丹东',
//    PRICE: '1888',
//    TEMPPRICE: '1888',
//    TAXRATE: '01',
//    EXCISERATE: '07',
//    RETURNGOODS: '1',
//    SALESTATE: '0',
//    NETWEIGHT: null,
//    GROSSWEIGHT: null,
//    SPECIFICATION: "160/84A-165/88A",
//    PRODUCTCODE: 'MIJ8231',
//    GRADE: '正',
//    COLOR: null,
//    CASING: '1',
//    DIMENSION: null,
//    VOLUME: null,
//    ITEMCODETYPE: '0',
//    UNIT: '件',
//    LASTPURCHASEPRICE: null,
//    PURCHASETAXRATE: '01',
//    SAFESTOCK: null,
//    MAXSTOCK: null,
//    MINSTOCK: null,
//    MAXORDER: null,
//    MINORDER: null,
//    PROPERTY: '0',
//    CHECKSTATE: '3',
//    ERRORINFO: null,
//    INPUTPERSON:null,
//    AGENTCODE: '003',
//    TERM: null,
//    ISCONSIDERSTOCK:1,
//    ISALLOWONLINE:0
//}];
//skuService.createSku(misCreateItem,cb);

//var misUpdateItem=[{
//    ITEMID:"2",
//    ITEMCODE:"1525296",
//    BARCODE: '2000000044354',
//    ITEMNAME: '女士羽绒服222',
//    ITEMSHORTNAME: '女士羽绒服2',
//    PROCDUCINGAREA: '辽宁丹东5',
//    ISCONSIDERSTOCK:1
//}];
//skuService.updateSku(misUpdateItem,cb);

