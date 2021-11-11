
#商品的第一张预览图片
drop view mec_vi_first_imgpreview;
create view mec_vi_first_imgpreview as
select
ITEMCODE,
IMGURL,
createdAt,
updatedAt
from
mec_itm_imgpreview
GROUP BY mec_itm_imgpreview.ITEMCODE;









#商品的所有分类字符串
drop view mec_vi_sku_categorynames;
create view mec_vi_sku_categorynames as
SELECT
	`mec_itm_itemcategory`.`ITEMCODE` AS `ITEMCODE`,
	group_concat(
		`mec_itm_category`.`CATEGORYNAME`
		ORDER BY
			`mec_itm_category`.`CATEGORYID` ASC SEPARATOR '-'
	) AS `CATEGORYNAMES`,
	max(mec_itm_itemcategory.createdAt) as createdAt,
	max(mec_itm_itemcategory.updatedAt) as updatedAt
FROM
	(
		`mec_itm_itemcategory`
		JOIN `mec_itm_category`
	)
WHERE
	(
		`mec_itm_itemcategory`.`CATEGORYID` = `mec_itm_category`.`CATEGORYID`
	)
GROUP BY
	`mec_itm_itemcategory`.`ITEMCODE`;









#商品的所有分区字符串
drop view mec_vi_sku_regionnames ;
create view mec_vi_sku_regionnames as
SELECT
	`mec_itm_itemregion`.`ITEMCODE` AS `ITEMCODE`,
	group_concat(
		`mec_itm_region`.`REGIONNAME`
		ORDER BY
			`mec_itm_region`.`REGIONID` ASC SEPARATOR '-'
	) AS `REGIONNAMES`,
	max(mec_itm_itemregion.createdAt) as createdAt,
    max(mec_itm_itemregion.updatedAt) as updatedAt
FROM
	(
		`mec_itm_itemregion`
		JOIN `mec_itm_region`
	)
WHERE
	(
		`mec_itm_itemregion`.`REGIONID` = `mec_itm_region`.`REGIONID`
	)
GROUP BY
	`mec_itm_itemregion`.`ITEMCODE`;












#商品表中所有有效skucode
drop view mec_vi_sku;
create view mec_vi_sku as
SELECT
	mec_itm_item.ITEMCODE AS ITEMCODE
FROM mec_itm_item
where mec_itm_item.CHECKSTATE=1;






#商品表中所有有效sku的详细信息
drop view mec_vi_sku_total;
create view mec_vi_sku_total as
SELECT
	mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	mec_itm_item.SELLINGSTATE AS SELLINGSTATE,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
FROM
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where mec_itm_item.CHECKSTATE=1;









#线下在卖的不管库存的skucode
drop view mec_vi_offline_nostock_selling_sku;
create view mec_vi_offline_nostock_selling_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE
from
mec_itm_item
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=1;








#线下在卖的管库存的skucode
drop view mec_vi_offline_hasstock_selling_sku;
create view mec_vi_offline_hasstock_selling_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE
from
mec_itm_item
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE between 2 and 3;








#线下在卖的全部skucode
drop view mec_vi_offline_selling_sku;
create view mec_vi_offline_selling_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE
from
mec_itm_item
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE>0;








#全部上线在卖的skucode
drop view mec_vi_online_selling_sku;
create view mec_vi_online_selling_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE
from
mec_itm_item
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=3;









#线下在卖的不管库存的每个柜台的skucode
drop view mec_vi_offline_nostock_selling_counter_sku;
create view mec_vi_offline_nostock_selling_counter_sku as
select
mec_itm_storeitem.ITEMCODE,
mec_itm_storeitem.COUNTERCODE
from
mec_itm_storeitem join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1;









#线下在卖的管库存的每个柜台的skucode(有些商品柜没有进货也算它的)
drop view mec_vi_offline_hasstock_selling_counter_sku;
create view mec_vi_offline_hasstock_selling_counter_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_storeitem.COUNTERCODE AS COUNTERCODE
from
mec_itm_storeitem join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_item.ISCONSIDERSTOCK=1 and
mec_itm_item.SKCCHECKSTATE in (1,3);
#mec_itm_item.SELLINGSTATE between 2 and 3;












#线下每个柜台的管库存的skucode(进货前使用)
drop view mec_vi_offline_hasstock_counter_sku;
create view mec_vi_offline_hasstock_counter_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_storeitem.COUNTERCODE AS COUNTERCODE
from
mec_itm_storeitem join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.ISCONSIDERSTOCK=1 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_item.SKCCHECKSTATE in (1,3);













#线下在卖的全部每个柜台的skucode(有些商品柜没有进货也算它的)
drop view mec_vi_offline_selling_counter_sku;
create view mec_vi_offline_selling_counter_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_storeitem.COUNTERCODE AS COUNTERCODE
from
mec_itm_storeitem join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1 and
(mec_itm_item.ISCONSIDERSTOCK=0 or
(mec_itm_item.ISCONSIDERSTOCK=1 and
mec_itm_item.SKCCHECKSTATE in (1,3)));









#全部上线在卖的每个柜台的skucode
drop view mec_vi_online_selling_counter_sku;
create view mec_vi_online_selling_counter_sku as
select
mec_itm_storeitem.ITEMCODE,
mec_itm_storeitem.COUNTERCODE
from
mec_itm_storeitem join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=3 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_storeitem.ONLINESTATE=1;


















#线下在卖的不管库存的sku详细信息
drop view mec_vi_offline_nostock_selling_sku_total;
create view mec_vi_offline_nostock_selling_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
    mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.TAXRATE AS TAXRATE,
    mec_itm_item.EXCISERATE AS EXCISERATE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SALESTATE AS SALESTATE,
    mec_itm_item.NETWEIGHT AS NETWEIGHT,
    mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.GRADE AS GRADE,
    mec_itm_item.COLOR AS COLOR,
    mec_itm_item.CASING AS CASING,
    mec_itm_item.DIMENSION AS DIMENSION,
    mec_itm_item.VOLUME AS VOLUME,
    mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
    mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
    mec_itm_item.SAFESTOCK AS SAFESTOCK,
    mec_itm_item.MAXSTOCK AS MAXSTOCK,
    mec_itm_item.MINSTOCK AS MINSTOCK,
    mec_itm_item.MAXORDER AS MAXORDER,
    mec_itm_item.MINORDER AS MINORDER,
    mec_itm_item.PROPERTY AS PROPERTY,
    mec_itm_item.CHECKSTATE AS CHECKSTATE,
    mec_itm_item.ERRORINFO AS ERRORINFO,
    mec_itm_item.INPUTPERSON AS INPUTPERSON,
    mec_itm_item.AGENTCODE AS AGENTCODE,
    mec_itm_item.TERM AS TERM,
    mec_itm_item.createdAt AS createdAt,
    mec_itm_item.updatedAt AS updatedAt,
    mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
    mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
    mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
    mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
    mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
    hct_brand.BRANDNAME AS BRANDNAME,
    hct_merchant.MERCHANTNAME AS MERCHANTNAME,
    hsy_agent.AGENTNAME AS AGENTNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=1;








#线下在卖的管库存的sku详细信息
drop view mec_vi_offline_hasstock_selling_sku_total;
create view mec_vi_offline_hasstock_selling_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
    mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.TAXRATE AS TAXRATE,
    mec_itm_item.EXCISERATE AS EXCISERATE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SALESTATE AS SALESTATE,
    mec_itm_item.NETWEIGHT AS NETWEIGHT,
    mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.GRADE AS GRADE,
    mec_itm_item.COLOR AS COLOR,
    mec_itm_item.CASING AS CASING,
    mec_itm_item.DIMENSION AS DIMENSION,
    mec_itm_item.VOLUME AS VOLUME,
    mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
    mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
    mec_itm_item.SAFESTOCK AS SAFESTOCK,
    mec_itm_item.MAXSTOCK AS MAXSTOCK,
    mec_itm_item.MINSTOCK AS MINSTOCK,
    mec_itm_item.MAXORDER AS MAXORDER,
    mec_itm_item.MINORDER AS MINORDER,
    mec_itm_item.PROPERTY AS PROPERTY,
    mec_itm_item.CHECKSTATE AS CHECKSTATE,
    mec_itm_item.ERRORINFO AS ERRORINFO,
    mec_itm_item.INPUTPERSON AS INPUTPERSON,
    mec_itm_item.AGENTCODE AS AGENTCODE,
    mec_itm_item.TERM AS TERM,
    mec_itm_item.createdAt AS createdAt,
    mec_itm_item.updatedAt AS updatedAt,
    mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
    mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
    mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
    mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
    mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
    hct_brand.BRANDNAME AS BRANDNAME,
    hct_merchant.MERCHANTNAME AS MERCHANTNAME,
    hsy_agent.AGENTNAME AS AGENTNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE between 2 and 3;








#线下在卖的全部sku详细信息
drop view mec_vi_offline_selling_sku_total;
create view mec_vi_offline_selling_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
    mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.TAXRATE AS TAXRATE,
    mec_itm_item.EXCISERATE AS EXCISERATE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SALESTATE AS SALESTATE,
    mec_itm_item.NETWEIGHT AS NETWEIGHT,
    mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.GRADE AS GRADE,
    mec_itm_item.COLOR AS COLOR,
    mec_itm_item.CASING AS CASING,
    mec_itm_item.DIMENSION AS DIMENSION,
    mec_itm_item.VOLUME AS VOLUME,
    mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
    mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
    mec_itm_item.SAFESTOCK AS SAFESTOCK,
    mec_itm_item.MAXSTOCK AS MAXSTOCK,
    mec_itm_item.MINSTOCK AS MINSTOCK,
    mec_itm_item.MAXORDER AS MAXORDER,
    mec_itm_item.MINORDER AS MINORDER,
    mec_itm_item.PROPERTY AS PROPERTY,
    mec_itm_item.CHECKSTATE AS CHECKSTATE,
    mec_itm_item.ERRORINFO AS ERRORINFO,
    mec_itm_item.INPUTPERSON AS INPUTPERSON,
    mec_itm_item.AGENTCODE AS AGENTCODE,
    mec_itm_item.TERM AS TERM,
    mec_itm_item.createdAt AS createdAt,
    mec_itm_item.updatedAt AS updatedAt,
    mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
    mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
    mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
    mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
    mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
    hct_brand.BRANDNAME AS BRANDNAME,
    hct_merchant.MERCHANTNAME AS MERCHANTNAME,
    hsy_agent.AGENTNAME AS AGENTNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE>0;








#全部上线在卖的sku详细信息
drop view mec_vi_online_selling_sku_total;
create view mec_vi_online_selling_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
    mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.TAXRATE AS TAXRATE,
    mec_itm_item.EXCISERATE AS EXCISERATE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SALESTATE AS SALESTATE,
    mec_itm_item.NETWEIGHT AS NETWEIGHT,
    mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.GRADE AS GRADE,
    mec_itm_item.COLOR AS COLOR,
    mec_itm_item.CASING AS CASING,
    mec_itm_item.DIMENSION AS DIMENSION,
    mec_itm_item.VOLUME AS VOLUME,
    mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
    mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
    mec_itm_item.SAFESTOCK AS SAFESTOCK,
    mec_itm_item.MAXSTOCK AS MAXSTOCK,
    mec_itm_item.MINSTOCK AS MINSTOCK,
    mec_itm_item.MAXORDER AS MAXORDER,
    mec_itm_item.MINORDER AS MINORDER,
    mec_itm_item.PROPERTY AS PROPERTY,
    mec_itm_item.CHECKSTATE AS CHECKSTATE,
    mec_itm_item.ERRORINFO AS ERRORINFO,
    mec_itm_item.INPUTPERSON AS INPUTPERSON,
    mec_itm_item.AGENTCODE AS AGENTCODE,
    mec_itm_item.TERM AS TERM,
    mec_itm_item.createdAt AS createdAt,
    mec_itm_item.updatedAt AS updatedAt,
    mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
    mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
    mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
    mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
    mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hct_merchant.MERCHANTNAME AS MERCHANTNAME,
    hsy_agent.AGENTNAME AS AGENTNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES
from
(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
    left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
    left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
    left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=3;










#全部上线的sku详细信息(app希望看到的)
drop view mec_vi_online_selling_sku_forapp;
create view mec_vi_online_selling_sku_forapp as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES,
    mec_itm_item.createdAt,
    GREATEST(mec_itm_item.updatedAt,mec_vi_first_imgpreview.updatedAt,mec_vi_sku_categorynames.updatedAt,mec_vi_sku_regionnames.updatedAt) AS updatedAt
from
mec_itm_item
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=3;















#线下在卖的不管库存的每个柜台的sku详细信息(sku级别直接和价格相关,线下到门店看门店价格,线上才看统一价格)
drop view mec_vi_offline_nostock_selling_counter_sku_total;
create view mec_vi_offline_nostock_selling_counter_sku_total as
select
    mec_itm_storeitem.COUNTERCODE,
    mec_itm_storeitem.MEMBERPRICE,
    mec_itm_storeitem.STORECHECKEDPRICE,
    mec_itm_storeitem.STORETEMPPRICE,
    mec_itm_storeitem.PROMOTIONMARK,
    mec_itm_storeitem.DISCOUNTMARK,
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
mec_itm_storeitem
join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join hct_merchant on mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
left join hsy_agent on mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
left join hsy_retailtype on mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1;









#线下在卖的管库存的每个柜台的sku详细信息(sku级别直接和价格相关,线下到门店看门店价格,线上才看统一价格)
drop view mec_vi_offline_hasstock_selling_counter_sku_total;
create view mec_vi_offline_hasstock_selling_counter_sku_total as
select
    mec_itm_storeitem.COUNTERCODE,
    mec_itm_storeitem.MEMBERPRICE,
    mec_itm_storeitem.STORECHECKEDPRICE,
    mec_itm_storeitem.STORETEMPPRICE,
    mec_itm_storeitem.PROMOTIONMARK,
    mec_itm_storeitem.DISCOUNTMARK,
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
mec_itm_storeitem
join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join hct_merchant on mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
left join hsy_agent on mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
left join hsy_retailtype on mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_item.ISCONSIDERSTOCK=1 and
mec_itm_item.SKCCHECKSTATE in (1,3);
#mec_itm_item.SELLINGSTATE between 2 and 3;











#线下管库存的每个柜台的sku详细信息(进货前使用)
drop view mec_vi_offline_hasstock_counter_sku_total;
create view mec_vi_offline_hasstock_counter_sku_total as
select
    mec_itm_storeitem.COUNTERCODE,
    mec_itm_storeitem.MEMBERPRICE,
    mec_itm_storeitem.STORECHECKEDPRICE,
    mec_itm_storeitem.STORETEMPPRICE,
    mec_itm_storeitem.PROMOTIONMARK,
    mec_itm_storeitem.DISCOUNTMARK,
    mec_itm_storeitem.ISALLOWNEGATIVE,
    mec_itm_storeitem.BUFFER,
    mec_itm_storeitem.SALESMANCODE,
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	mec_itm_item.TITLE AS TITLE,
        mec_itm_item.SCORE,
        mec_itm_item.SCOREPOPULARITY,
        mec_itm_item.PURCHASE,
        mec_itm_item.PURCHASEPOPULARITY,
        mec_itm_item.PRAISERATE,
        mec_itm_item.ONLINETIME,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
mec_itm_storeitem
join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join hct_merchant on mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
left join hsy_agent on mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
left join hsy_retailtype on mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_item.ISCONSIDERSTOCK=1 and
mec_itm_item.SKCCHECKSTATE in (1,3) and
mec_itm_storeitem.STORESALESTATE=0;















#线下在卖的全部每个柜台的sku详细信息(sku级别直接和价格相关,线下到门店看门店价格,线上才看统一价格)
drop view mec_vi_offline_selling_counter_sku_total;
create view mec_vi_offline_selling_counter_sku_total as
select
    mec_itm_storeitem.COUNTERCODE,
    mec_itm_storeitem.MEMBERPRICE,
    mec_itm_storeitem.STORECHECKEDPRICE,
    mec_itm_storeitem.STORETEMPPRICE,
    mec_itm_storeitem.PROMOTIONMARK,
    mec_itm_storeitem.DISCOUNTMARK,
    mec_itm_storeitem.ONLINESTATE,
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
mec_itm_storeitem
join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join hct_merchant on mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
left join hsy_agent on mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
left join hsy_retailtype on mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1 and
(mec_itm_item.ISCONSIDERSTOCK=0 or
(mec_itm_item.ISCONSIDERSTOCK=1 and
mec_itm_item.SKCCHECKSTATE in (1,3))) and
mec_itm_storeitem.STORESALESTATE=0;









#全部上线在卖的每个柜台的sku详细信息(sku级别直接和价格相关,线下到门店看门店价格,线上看统一价格)
drop view mec_vi_online_selling_counter_sku_total;
create view mec_vi_online_selling_counter_sku_total as
select
    mec_itm_storeitem.COUNTERCODE,
    mec_itm_storeitem.MEMBERPRICE,
    mec_itm_storeitem.STORECHECKEDPRICE,
    mec_itm_storeitem.STORETEMPPRICE,
    mec_itm_storeitem.PROMOTIONMARK,
    mec_itm_storeitem.DISCOUNTMARK,
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
    mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.TAXRATE AS TAXRATE,
    mec_itm_item.EXCISERATE AS EXCISERATE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SALESTATE AS SALESTATE,
    mec_itm_item.NETWEIGHT AS NETWEIGHT,
    mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.GRADE AS GRADE,
    mec_itm_item.COLOR AS COLOR,
    mec_itm_item.CASING AS CASING,
    mec_itm_item.DIMENSION AS DIMENSION,
    mec_itm_item.VOLUME AS VOLUME,
    mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
    mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
    mec_itm_item.SAFESTOCK AS SAFESTOCK,
    mec_itm_item.MAXSTOCK AS MAXSTOCK,
    mec_itm_item.MINSTOCK AS MINSTOCK,
    mec_itm_item.MAXORDER AS MAXORDER,
    mec_itm_item.MINORDER AS MINORDER,
    mec_itm_item.PROPERTY AS PROPERTY,
    mec_itm_item.CHECKSTATE AS CHECKSTATE,
    mec_itm_item.ERRORINFO AS ERRORINFO,
    mec_itm_item.INPUTPERSON AS INPUTPERSON,
    mec_itm_item.AGENTCODE AS AGENTCODE,
    mec_itm_item.TERM AS TERM,
    mec_itm_item.createdAt AS createdAt,
    mec_itm_item.updatedAt AS updatedAt,
    mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
    mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
    mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
    mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
    mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hct_merchant.MERCHANTNAME AS MERCHANTNAME,
    hsy_agent.AGENTNAME AS AGENTNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES
from
mec_itm_storeitem
join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join hct_merchant on mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
left join hsy_agent on mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
left join hsy_retailtype on mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_item.SELLINGSTATE=3 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_storeitem.ONLINESTATE=1;

















#可以修改的sku raw
drop view mec_vi_revisable_sku_raw;
create view mec_vi_revisable_sku_raw as
select
ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,
BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,
GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,
LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,
CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,createdAt,updatedAt,
ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,LASTOPERATEPERSON
from mec_itm_item_tmp1
where mec_itm_item_tmp1.TMPSTATE=0

union all

select
ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,
BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,
GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,
LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,
CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,createdAt,updatedAt,
ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,LASTOPERATEPERSON
from mec_itm_item_tmp1
where mec_itm_item_tmp1.TMPSTATE=2

union all

select
null as ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,
BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,
GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,
LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,
CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,createdAt,updatedAt,
ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,NULL as TMPSTATE,NULL as LASTOPERATEPERSON
from mec_itm_item
where mec_itm_item.CHECKSTATE=1;










#sku删除界面可以看到的所有sku
drop view mec_vi_deletable_sku;
create view mec_vi_deletable_sku as
select
ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,
BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,
GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,
LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,
CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,createdAt,updatedAt,
ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE
from mec_itm_item
where mec_itm_item.CHECKSTATE=1;











#sku删除界面可以看到的所有sku的详细信息
drop view mec_vi_deletable_sku_total;
create view mec_vi_deletable_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
FROM
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where mec_itm_item.CHECKSTATE=1;









#所有可以修改的sku
drop view mec_vi_revisable_sku;
create view mec_vi_revisable_sku as
select * from mec_vi_revisable_sku_raw as T group by ITEMCODE;












#所有可以修改的sku详细信息
drop view mec_vi_revisable_sku_total;
create view mec_vi_revisable_sku_total as
select
    mec_vi_revisable_sku.ID AS ID,
    mec_vi_revisable_sku.ITEMCODE AS ITEMCODE,
	mec_vi_revisable_sku.BARCODE AS BARCODE,
	mec_vi_revisable_sku.ITEMNAME AS ITEMNAME,
	mec_vi_revisable_sku.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_vi_revisable_sku.BRANDCODE AS BRANDCODE,
	mec_vi_revisable_sku.RETAILTYPECODE AS RETAILTYPECODE,
	mec_vi_revisable_sku.ITEMTYPECODE AS ITEMTYPECODE,
	mec_vi_revisable_sku.MERCHANTCODE AS MERCHANTCODE,
	mec_vi_revisable_sku.BUSINESSMODE AS BUSINESSMODE,
	mec_vi_revisable_sku.PRODUCINGAREA AS PRODUCINGAREA,
	mec_vi_revisable_sku.PRICE AS PRICE,
	mec_vi_revisable_sku.TEMPPRICE AS TEMPPRICE,
	mec_vi_revisable_sku.TAXRATE AS TAXRATE,
	mec_vi_revisable_sku.EXCISERATE AS EXCISERATE,
	mec_vi_revisable_sku.RETURNGOODS AS RETURNGOODS,
	mec_vi_revisable_sku.SALESTATE AS SALESTATE,
	mec_vi_revisable_sku.NETWEIGHT AS NETWEIGHT,
	mec_vi_revisable_sku.GROSSWEIGHT AS GROSSWEIGHT,
	mec_vi_revisable_sku.SPECIFICATION AS SPECIFICATION,
	mec_vi_revisable_sku.PRODUCTCODE AS PRODUCTCODE,
	mec_vi_revisable_sku.GRADE AS GRADE,
	mec_vi_revisable_sku.COLOR AS COLOR,
	mec_vi_revisable_sku.CASING AS CASING,
	mec_vi_revisable_sku.DIMENSION AS DIMENSION,
	mec_vi_revisable_sku.VOLUME AS VOLUME,
	mec_vi_revisable_sku.ITEMCODETYPE AS ITEMCODETYPE,
	mec_vi_revisable_sku.UNIT AS UNIT,
	mec_vi_revisable_sku.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_vi_revisable_sku.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_vi_revisable_sku.SAFESTOCK AS SAFESTOCK,
	mec_vi_revisable_sku.MAXSTOCK AS MAXSTOCK,
	mec_vi_revisable_sku.MINSTOCK AS MINSTOCK,
	mec_vi_revisable_sku.MAXORDER AS MAXORDER,
	mec_vi_revisable_sku.MINORDER AS MINORDER,
	mec_vi_revisable_sku.PROPERTY AS PROPERTY,
	mec_vi_revisable_sku.CHECKSTATE AS CHECKSTATE,
	mec_vi_revisable_sku.ERRORINFO AS ERRORINFO,
	mec_vi_revisable_sku.INPUTPERSON AS INPUTPERSON,
	mec_vi_revisable_sku.AGENTCODE AS AGENTCODE,
	mec_vi_revisable_sku.TERM AS TERM,
	mec_vi_revisable_sku.createdAt AS createdAt,
	mec_vi_revisable_sku.updatedAt AS updatedAt,
	mec_vi_revisable_sku.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_vi_revisable_sku.ISALLOWONLINE AS ISALLOWONLINE,
	mec_vi_revisable_sku.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_vi_revisable_sku.TMPSTATE AS TMPSTATE,
	mec_vi_revisable_sku.LASTOPERATEPERSON AS LASTOPERATEPERSON,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_vi_revisable_sku
						LEFT JOIN hct_brand ON (
							(
								mec_vi_revisable_sku.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_vi_revisable_sku.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_vi_revisable_sku.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_vi_revisable_sku.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_vi_revisable_sku.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	);











#所有待审核的sku的详细信息
drop view mec_vi_checkable_sku_total;
create view mec_vi_checkable_sku_total as
select
    mec_itm_item_tmp1.ID AS ID,
    mec_itm_item_tmp1.ITEMCODE AS ITEMCODE,
	mec_itm_item_tmp1.BARCODE AS BARCODE,
	mec_itm_item_tmp1.ITEMNAME AS ITEMNAME,
	mec_itm_item_tmp1.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item_tmp1.BRANDCODE AS BRANDCODE,
	mec_itm_item_tmp1.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item_tmp1.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item_tmp1.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item_tmp1.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item_tmp1.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item_tmp1.PRICE AS PRICE,
	mec_itm_item_tmp1.TEMPPRICE AS TEMPPRICE,
	mec_itm_item_tmp1.TAXRATE AS TAXRATE,
	mec_itm_item_tmp1.EXCISERATE AS EXCISERATE,
	mec_itm_item_tmp1.RETURNGOODS AS RETURNGOODS,
	mec_itm_item_tmp1.SALESTATE AS SALESTATE,
	mec_itm_item_tmp1.NETWEIGHT AS NETWEIGHT,
	mec_itm_item_tmp1.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item_tmp1.SPECIFICATION AS SPECIFICATION,
	mec_itm_item_tmp1.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item_tmp1.GRADE AS GRADE,
	mec_itm_item_tmp1.COLOR AS COLOR,
	mec_itm_item_tmp1.CASING AS CASING,
	mec_itm_item_tmp1.DIMENSION AS DIMENSION,
	mec_itm_item_tmp1.VOLUME AS VOLUME,
	mec_itm_item_tmp1.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item_tmp1.UNIT AS UNIT,
	mec_itm_item_tmp1.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item_tmp1.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item_tmp1.SAFESTOCK AS SAFESTOCK,
	mec_itm_item_tmp1.MAXSTOCK AS MAXSTOCK,
	mec_itm_item_tmp1.MINSTOCK AS MINSTOCK,
	mec_itm_item_tmp1.MAXORDER AS MAXORDER,
	mec_itm_item_tmp1.MINORDER AS MINORDER,
	mec_itm_item_tmp1.PROPERTY AS PROPERTY,
	mec_itm_item_tmp1.CHECKSTATE AS CHECKSTATE,
	mec_itm_item_tmp1.ERRORINFO AS ERRORINFO,
	mec_itm_item_tmp1.INPUTPERSON AS INPUTPERSON,
	mec_itm_item_tmp1.AGENTCODE AS AGENTCODE,
	mec_itm_item_tmp1.TERM AS TERM,
	mec_itm_item_tmp1.createdAt AS createdAt,
	mec_itm_item_tmp1.updatedAt AS updatedAt,
	mec_itm_item_tmp1.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item_tmp1.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item_tmp1.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item_tmp1.TMPSTATE AS TMPSTATE,
	mec_itm_item_tmp1.LASTOPERATEPERSON AS LASTOPERATEPERSON,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item_tmp1
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item_tmp1.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item_tmp1.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item_tmp1.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item_tmp1.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item_tmp1.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where TMPSTATE between 0 and 2;










#所有待审核的sku
drop view mec_vi_checkable_sku;
create view mec_vi_checkable_sku as
select
    mec_itm_item_tmp1.ID AS ID,
    mec_itm_item_tmp1.ITEMCODE AS ITEMCODE,
	mec_itm_item_tmp1.BARCODE AS BARCODE,
	mec_itm_item_tmp1.ITEMNAME AS ITEMNAME,
	mec_itm_item_tmp1.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item_tmp1.BRANDCODE AS BRANDCODE,
	mec_itm_item_tmp1.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item_tmp1.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item_tmp1.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item_tmp1.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item_tmp1.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item_tmp1.PRICE AS PRICE,
	mec_itm_item_tmp1.TEMPPRICE AS TEMPPRICE,
	mec_itm_item_tmp1.TAXRATE AS TAXRATE,
	mec_itm_item_tmp1.EXCISERATE AS EXCISERATE,
	mec_itm_item_tmp1.RETURNGOODS AS RETURNGOODS,
	mec_itm_item_tmp1.SALESTATE AS SALESTATE,
	mec_itm_item_tmp1.NETWEIGHT AS NETWEIGHT,
	mec_itm_item_tmp1.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item_tmp1.SPECIFICATION AS SPECIFICATION,
	mec_itm_item_tmp1.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item_tmp1.GRADE AS GRADE,
	mec_itm_item_tmp1.COLOR AS COLOR,
	mec_itm_item_tmp1.CASING AS CASING,
	mec_itm_item_tmp1.DIMENSION AS DIMENSION,
	mec_itm_item_tmp1.VOLUME AS VOLUME,
	mec_itm_item_tmp1.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item_tmp1.UNIT AS UNIT,
	mec_itm_item_tmp1.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item_tmp1.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item_tmp1.SAFESTOCK AS SAFESTOCK,
	mec_itm_item_tmp1.MAXSTOCK AS MAXSTOCK,
	mec_itm_item_tmp1.MINSTOCK AS MINSTOCK,
	mec_itm_item_tmp1.MAXORDER AS MAXORDER,
	mec_itm_item_tmp1.MINORDER AS MINORDER,
	mec_itm_item_tmp1.PROPERTY AS PROPERTY,
	mec_itm_item_tmp1.CHECKSTATE AS CHECKSTATE,
	mec_itm_item_tmp1.ERRORINFO AS ERRORINFO,
	mec_itm_item_tmp1.INPUTPERSON AS INPUTPERSON,
	mec_itm_item_tmp1.AGENTCODE AS AGENTCODE,
	mec_itm_item_tmp1.TERM AS TERM,
	mec_itm_item_tmp1.createdAt AS createdAt,
	mec_itm_item_tmp1.updatedAt AS updatedAt,
	mec_itm_item_tmp1.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item_tmp1.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item_tmp1.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item_tmp1.TMPSTATE AS TMPSTATE,
	mec_itm_item_tmp1.LASTOPERATEPERSON AS LASTOPERATEPERSON
from
mec_itm_item_tmp1
where TMPSTATE between 0 and 2;










#所有未添加skc的管库存的sku的详细信息
drop view mec_vi_skc_uninitial_sku_total;
create view mec_vi_skc_uninitial_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where ISCONSIDERSTOCK=1 and CHECKSTATE=1 and SKCCHECKSTATE=0;









#所有未添加skc的管库存的sku
drop view mec_vi_skc_uninitial_sku;
create view mec_vi_skc_uninitial_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE
from
mec_itm_item
where ISCONSIDERSTOCK=1 and CHECKSTATE=1 and SKCCHECKSTATE=0;









#更新skc页面可以看到的sku详细信息
drop view mec_vi_skc_renewable_sku_total;
create view mec_vi_skc_renewable_sku_total as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where ISCONSIDERSTOCK=1 and CHECKSTATE=1 and (SKCCHECKSTATE between 1 and 3);








#更新skc页面可以看到的sku
drop view mec_vi_skc_renewable_sku;
create view mec_vi_skc_renewable_sku as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE
from
mec_itm_item
where ISCONSIDERSTOCK=1 and CHECKSTATE=1 and (SKCCHECKSTATE between 1 and 3);











#审核skc信息界面可以看到的所有待审核skc的sku详细信息
drop view mec_vi_skc_checkable_sku_total;
create view mec_vi_skc_checkable_sku_total as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where ISCONSIDERSTOCK=1 and CHECKSTATE=1 and (SKCCHECKSTATE between 2 and 3);








#审核skc信息界面可以看到的所有待审核skc的sku
drop view mec_vi_skc_checkable_sku;
create view mec_vi_skc_checkable_sku as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.SKCCHECKSTATE AS SKCCHECKSTATE
from
mec_itm_item
where ISCONSIDERSTOCK=1 and CHECKSTATE=1 and (SKCCHECKSTATE between 2 and 3);











#所有允许上线且未添加过上线信息的sku的详细信息
drop view mec_vi_online_uninitial_sku_total;
create view mec_vi_online_uninitial_sku_total as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where ISALLOWONLINE=1 and CHECKSTATE=1 and ONLINECHECKSTATE=0;











#所有允许上线且未添加过上线信息的sku
drop view mec_vi_online_uninitial_sku;
create view mec_vi_online_uninitial_sku as
select
    mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE
from
mec_itm_item
where ISALLOWONLINE=1 and CHECKSTATE=1 and ONLINECHECKSTATE=0;












#更新上线信息界面可以看到的sku的详细信息
drop view mec_vi_online_renewable_sku_total;
create view mec_vi_online_renewable_sku_total as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where ISALLOWONLINE=1 and CHECKSTATE=1 and (ONLINECHECKSTATE between 1 and 3);











#更新上线信息界面可以看到的sku的
drop view mec_vi_online_renewable_sku;
create view mec_vi_online_renewable_sku as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE
from
mec_itm_item
where ISALLOWONLINE=1 and CHECKSTATE=1 and (ONLINECHECKSTATE between 1 and 3);











#上线信息审核界面可以看到的待审核的sku的详细信息
drop view mec_vi_online_checkable_sku_total;
create view mec_vi_online_checkable_sku_total as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
	hct_brand.BRANDNAME AS BRANDNAME,
	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
	hsy_agent.AGENTNAME AS AGENTNAME,
	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME
from
	(
		(
			(
				(
					(
						mec_itm_item
						LEFT JOIN hct_brand ON (
							(
								mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
							)
						)
					)
					LEFT JOIN hct_merchant ON (
						(
							mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
						)
					)
				)
				LEFT JOIN hsy_agent ON (
					(
						mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
					)
				)
			)
			LEFT JOIN hsy_itemtype ON (
				(
					mec_itm_item.ITEMTYPECODE = hsy_itemtype.ITEMTYPECODE
				)
			)
		)
		LEFT JOIN hsy_retailtype ON (
			(
				mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
			)
		)
	)
where ISALLOWONLINE=1 and CHECKSTATE=1 and (ONLINECHECKSTATE between 2 and 3);










#上线信息审核界面可以看到的待审核的sku
drop view mec_vi_online_checkable_sku;
create view mec_vi_online_checkable_sku as
select
  mec_itm_item.ITEMCODE AS ITEMCODE,
	mec_itm_item.BARCODE AS BARCODE,
	mec_itm_item.ITEMNAME AS ITEMNAME,
	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
	mec_itm_item.BRANDCODE AS BRANDCODE,
	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
	mec_itm_item.PRICE AS PRICE,
	mec_itm_item.TEMPPRICE AS TEMPPRICE,
	mec_itm_item.TAXRATE AS TAXRATE,
	mec_itm_item.EXCISERATE AS EXCISERATE,
	mec_itm_item.RETURNGOODS AS RETURNGOODS,
	mec_itm_item.SALESTATE AS SALESTATE,
	mec_itm_item.NETWEIGHT AS NETWEIGHT,
	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
	mec_itm_item.SPECIFICATION AS SPECIFICATION,
	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
	mec_itm_item.GRADE AS GRADE,
	mec_itm_item.COLOR AS COLOR,
	mec_itm_item.CASING AS CASING,
	mec_itm_item.DIMENSION AS DIMENSION,
	mec_itm_item.VOLUME AS VOLUME,
	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
	mec_itm_item.UNIT AS UNIT,
	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
	mec_itm_item.SAFESTOCK AS SAFESTOCK,
	mec_itm_item.MAXSTOCK AS MAXSTOCK,
	mec_itm_item.MINSTOCK AS MINSTOCK,
	mec_itm_item.MAXORDER AS MAXORDER,
	mec_itm_item.MINORDER AS MINORDER,
	mec_itm_item.PROPERTY AS PROPERTY,
	mec_itm_item.CHECKSTATE AS CHECKSTATE,
	mec_itm_item.ERRORINFO AS ERRORINFO,
	mec_itm_item.INPUTPERSON AS INPUTPERSON,
	mec_itm_item.AGENTCODE AS AGENTCODE,
	mec_itm_item.TERM AS TERM,
	mec_itm_item.createdAt AS createdAt,
	mec_itm_item.updatedAt AS updatedAt,
	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE
from
mec_itm_item
where ISALLOWONLINE=1 and CHECKSTATE=1 and (ONLINECHECKSTATE between 2 and 3);








#规则修改界面可以修改的规则raw
drop view mec_vi_revisable_rule_raw;
create view mec_vi_revisable_rule_raw as
select
ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,LASTOPERATEPERSON
from mec_prm_rule_tmp
where mec_prm_rule_tmp.TMPSTATE=0

union all

select
ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,LASTOPERATEPERSON
from mec_prm_rule_tmp
where mec_prm_rule_tmp.TMPSTATE=2

union all

select
null as ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,NULL as TMPSTATE,NULL as LASTOPERATEPERSON
from mec_prm_rule
where mec_prm_rule.RECORDSTATE=1;












#规则修改界面可以修改的规则
drop view mec_vi_revisable_rule;
create view mec_vi_revisable_rule as
select * from mec_vi_revisable_rule_raw as T group by RULEID;














#规则审核界面需要审核的规则
drop view mec_vi_checkable_rule;
create view mec_vi_checkable_rule as
select
ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,LASTOPERATEPERSON
from mec_prm_rule_tmp
where TMPSTATE between 0 and 2;












#规则删除界面看到的所有可以删除的规则
drop view mec_vi_deletable_rule;
create view mec_vi_deletable_rule as
select
RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE
from mec_prm_rule
where mec_prm_rule.RECORDSTATE=1;











#柜对应的所有skc的库存信息raw(包括从未进货的)
drop view mec_vi_counter_skc_stock_raw;
create view mec_vi_counter_skc_stock_raw as
select
mec_itm_storeitem.COUNTERCODE,
mec_itm_storeitem.ITEMCODE,
mec_itm_skc.SKCCODE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_skc.SIZE,
mec_itm_skc.COLOR,
0 as AMOUNT
from mec_itm_storeitem join mec_itm_skc on mec_itm_storeitem.ITEMCODE=mec_itm_skc.ITEMCODE
where mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_skc.RECORDSTATE=1

union all

select
mec_itm_stock.COUNTERCODE,
mec_itm_skc.ITEMCODE,
mec_itm_skc.SKCCODE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_skc.SIZE,
mec_itm_skc.COLOR,
mec_itm_stock.AMOUNT
from
mec_itm_stock join mec_itm_skc on mec_itm_stock.SKCCODE=mec_itm_skc.SKCCODE
where mec_itm_stock.RECORDSTATE=1 and
mec_itm_skc.RECORDSTATE=1;








#柜对应的所有skc的库存信息(包括从未进货的)
drop view mec_vi_counter_skc_stock;
create view mec_vi_counter_skc_stock as
select
mec_vi_counter_skc_stock_raw.COUNTERCODE,
mec_vi_counter_skc_stock_raw.ITEMCODE,
mec_vi_counter_skc_stock_raw.SKCCODE,
mec_vi_counter_skc_stock_raw.MERCHANTSKCCODE,
mec_vi_counter_skc_stock_raw.SIZE,
mec_vi_counter_skc_stock_raw.COLOR,
sum(AMOUNT) as AMOUNT
from mec_vi_counter_skc_stock_raw
group by mec_vi_counter_skc_stock_raw.COUNTERCODE,mec_vi_counter_skc_stock_raw.SKCCODE,mec_vi_counter_skc_stock_raw.ITEMCODE;












#门店对应的skc的总库存
drop view mec_vi_dept_skc_stock;
create view mec_vi_dept_skc_stock as
select
 mec_hct_counter.STORECODE as DEPTCODE,
 mec_itm_stock.SKCCODE,
 sum(mec_itm_stock.AMOUNT) as AMOUNT
from
mec_itm_stock join mec_hct_counter on mec_itm_stock.COUNTERCODE=mec_hct_counter.COUNTERCODE
where mec_itm_stock.RECORDSTATE=1 AND CONTRACTSTATE=2
GROUP BY mec_itm_stock.SKCCODE,mec_hct_counter.STORECODE;









#商城内每个skc的总库存
drop view mec_vi_skc_stock;
create view mec_vi_skc_stock as
select
 mec_itm_stock.SKCCODE,
 sum(mec_itm_stock.AMOUNT) as AMOUNT
from
mec_itm_stock
where mec_itm_stock.RECORDSTATE=1
GROUP BY mec_itm_stock.SKCCODE;













#所有可以上线/可以下线的商品和柜
drop view mec_vi_online_prepared_counter_sku;
create view mec_vi_online_prepared_counter_sku as
select
mec_itm_item.ITEMCODE,
mec_itm_stock.COUNTERCODE,
mec_hct_counter.STORECODE as DEPTCODE,
mec_itm_storeitem.ONLINESTATE
from
mec_itm_stock
join mec_itm_skc on mec_itm_stock.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
join mec_hct_counter on mec_itm_stock.COUNTERCODE=mec_hct_counter.COUNTERCODE
join mec_itm_storeitem on mec_itm_storeitem.COUNTERCODE=mec_itm_stock.COUNTERCODE and mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_stock.RECORDSTATE=1 AND
mec_itm_skc.RECORDSTATE=1 AND
mec_itm_item.CHECKSTATE=1 AND
mec_itm_item.ONLINECHECKSTATE=1 AND
mec_itm_item.SELLINGSTATE between 2 and 3 AND
mec_itm_storeitem.CHECKSTATE=1 AND
CONTRACTSTATE=2
group by mec_itm_item.ITEMCODE,mec_itm_stock.COUNTERCODE,mec_hct_counter.STORECODE;









#所有可以上线但还未上线的商品
drop view mec_vi_online_prepared_sku;
create view mec_vi_online_prepared_sku as
select
mec_itm_item.ITEMCODE
from
mec_itm_item
where
mec_itm_item.CHECKSTATE=1 AND
mec_itm_item.ONLINECHECKSTATE=1 AND
mec_itm_item.SELLINGSTATE between 2 and 3;











#所有可以上线/可以下线的商品详细信息
drop view mec_vi_online_prepared_sku_total;
create view mec_vi_online_prepared_sku_total as
select
mec_itm_item.ITEMCODE AS ITEMCODE,
 	mec_itm_item.BARCODE AS BARCODE,
 	mec_itm_item.ITEMNAME AS ITEMNAME,
 	mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
 	mec_itm_item.BRANDCODE AS BRANDCODE,
 	mec_itm_item.RETAILTYPECODE AS RETAILTYPECODE,
 	mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
 	mec_itm_item.MERCHANTCODE AS MERCHANTCODE,
 	mec_itm_item.BUSINESSMODE AS BUSINESSMODE,
 	mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
 	mec_itm_item.PRICE AS PRICE,
 	mec_itm_item.TEMPPRICE AS TEMPPRICE,
 	mec_itm_item.TAXRATE AS TAXRATE,
 	mec_itm_item.EXCISERATE AS EXCISERATE,
 	mec_itm_item.RETURNGOODS AS RETURNGOODS,
 	mec_itm_item.SALESTATE AS SALESTATE,
 	mec_itm_item.NETWEIGHT AS NETWEIGHT,
 	mec_itm_item.GROSSWEIGHT AS GROSSWEIGHT,
 	mec_itm_item.SPECIFICATION AS SPECIFICATION,
 	mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
 	mec_itm_item.GRADE AS GRADE,
 	mec_itm_item.COLOR AS COLOR,
 	mec_itm_item.CASING AS CASING,
 	mec_itm_item.DIMENSION AS DIMENSION,
 	mec_itm_item.VOLUME AS VOLUME,
 	mec_itm_item.ITEMCODETYPE AS ITEMCODETYPE,
 	mec_itm_item.UNIT AS UNIT,
 	mec_itm_item.LASTPURCHASEPRICE AS LASTPURCHASEPRICE,
 	mec_itm_item.PURCHASETAXRATE AS PURCHASETAXRATE,
 	mec_itm_item.SAFESTOCK AS SAFESTOCK,
 	mec_itm_item.MAXSTOCK AS MAXSTOCK,
 	mec_itm_item.MINSTOCK AS MINSTOCK,
 	mec_itm_item.MAXORDER AS MAXORDER,
 	mec_itm_item.MINORDER AS MINORDER,
 	mec_itm_item.PROPERTY AS PROPERTY,
 	mec_itm_item.CHECKSTATE AS CHECKSTATE,
 	mec_itm_item.ERRORINFO AS ERRORINFO,
 	mec_itm_item.INPUTPERSON AS INPUTPERSON,
 	mec_itm_item.AGENTCODE AS AGENTCODE,
 	mec_itm_item.TERM AS TERM,
 	mec_itm_item.createdAt AS createdAt,
 	mec_itm_item.updatedAt AS updatedAt,
 	mec_itm_item.ISCONSIDERSTOCK AS ISCONSIDERSTOCK,
 	mec_itm_item.ISALLOWONLINE AS ISALLOWONLINE,
 	mec_itm_item.ISALLOWNEGATIVE AS ISALLOWNEGATIVE,
 	mec_itm_item.ONLINECHECKSTATE AS ONLINECHECKSTATE,
 	mec_itm_item.SELLINGSTATE,
 	mec_itm_item.TITLE AS TITLE,
        mec_itm_item.SCORE,
        mec_itm_item.SCOREPOPULARITY,
        mec_itm_item.PURCHASE,
        mec_itm_item.PURCHASEPOPULARITY,
        mec_itm_item.PRAISERATE,
        mec_itm_item.ONLINETIME,
 	hct_brand.BRANDNAME AS BRANDNAME,
 	hct_merchant.MERCHANTNAME AS MERCHANTNAME,
 	hsy_agent.AGENTNAME AS AGENTNAME,
 	hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
 	hsy_retailtype.RETAILTYPENAME AS RETAILTYPENAME,
 	mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES
from
mec_itm_item
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join hct_merchant on mec_itm_item.MERCHANTCODE = hct_merchant.MERCHANTCODE
left join hsy_agent on mec_itm_item.AGENTCODE = hsy_agent.AGENTCODE
left join hsy_retailtype on mec_itm_item.RETAILTYPECODE = hsy_retailtype.RETAILTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_item.CHECKSTATE=1 AND
mec_itm_item.ONLINECHECKSTATE=1 AND
mec_itm_item.SELLINGSTATE  between 2 and 3;












#上线商品的柜-skc-库存信息
drop view mec_vi_online_counter_skc_stock;
create view mec_vi_online_counter_skc_stock as
select
	mec_itm_storeitem.COUNTERCODE,
	mec_itm_skc.SKCCODE,
	mec_itm_stock.AMOUNT
from
    mec_itm_storeitem
    join mec_itm_item on mec_itm_storeitem.ITEMCODE=mec_itm_item.ITEMCODE
    join mec_itm_skc on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
    join mec_itm_stock on mec_itm_stock.COUNTERCODE=mec_itm_storeitem.COUNTERCODE and mec_itm_stock.SKCCODE=mec_itm_skc.SKCCODE
where
mec_itm_item.CHECKSTATE=1 and
mec_itm_skc.RECORDSTATE=1 and
mec_itm_storeitem.CHECKSTATE=1 and
mec_itm_storeitem.ONLINESTATE=1 and
mec_itm_stock.RECORDSTATE=1;










#上线商品的counter_dept对应的skc的总库存
drop view mec_vi_online_counter_dept_skc_stock;
create view mec_vi_online_counter_dept_skc_stock as
select
    mec_hct_counter.STORECODE as DEPTCODE,
    mec_vi_online_counter_skc_stock.COUNTERCODE,
 	mec_vi_online_counter_skc_stock.SKCCODE,
    mec_vi_online_counter_skc_stock.AMOUNT
from
mec_vi_online_counter_skc_stock join mec_hct_counter on mec_vi_online_counter_skc_stock.COUNTERCODE=mec_hct_counter.COUNTERCODE
where CONTRACTSTATE=2;










#上线商品的门店对应的skc的总库存
drop view mec_vi_online_dept_skc_stock;
create view mec_vi_online_dept_skc_stock as
select
    mec_hct_counter.STORECODE as DEPTCODE,
 	mec_vi_online_counter_skc_stock.SKCCODE,
    sum(mec_vi_online_counter_skc_stock.AMOUNT) as AMOUNT
from
mec_vi_online_counter_skc_stock join mec_hct_counter on mec_vi_online_counter_skc_stock.COUNTERCODE=mec_hct_counter.COUNTERCODE
where CONTRACTSTATE=2
GROUP BY mec_hct_counter.STORECODE,mec_vi_online_counter_skc_stock.SKCCODE;









#上线商品的每个skc的总库存
drop view mec_vi_online_skc_stock;
create view mec_vi_online_skc_stock as
select
 	mec_vi_online_counter_skc_stock.SKCCODE,
    sum(mec_vi_online_counter_skc_stock.AMOUNT) as AMOUNT
from
mec_vi_online_counter_skc_stock
GROUP BY mec_vi_online_counter_skc_stock.SKCCODE;











#购物车商品信息预览skc全部信息
drop view mec_vi_shoppingcart_skc_total;
create view mec_vi_shoppingcart_skc_total as
select
mec_buy_shoppingcart.ID,
mec_buy_shoppingcart.USERCODE,
mec_buy_shoppingcart.SKCCODE,
mec_buy_shoppingcart.NUM,
mec_buy_shoppingcart.updatedAt as TIME,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES,
		mec_vi_online_skc_stock.AMOUNT
from
mec_buy_shoppingcart
join mec_itm_skc on mec_buy_shoppingcart.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on hct_brand.BRANDCODE=mec_itm_item.BRANDCODE
left join hsy_itemtype on hsy_itemtype.ITEMTYPECODE=mec_itm_item.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_online_skc_stock on mec_vi_online_skc_stock.SKCCODE=mec_buy_shoppingcart.SKCCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;











#购物车商品信息预览skc
drop view mec_vi_shoppingcart_skc;
create view mec_vi_shoppingcart_skc as
select
mec_buy_shoppingcart.ID,
mec_buy_shoppingcart.USERCODE,
mec_buy_shoppingcart.SKCCODE,
mec_buy_shoppingcart.NUM,
mec_buy_shoppingcart.updatedAt as TIME,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME
from
mec_buy_shoppingcart
join mec_itm_skc on mec_buy_shoppingcart.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;
















#app上看到的线上order级别信息
drop view mec_vi_online_order_total_forcustomer;
create view mec_vi_online_order_total_forcustomer as
select
mec_buy_onlineorder.ONLINEORDERCODE,
mec_buy_onlineorder.DELIVERYDEPTCODE,
mec_buy_onlineorder.DELIVERYMODE,
mec_buy_onlineorder.FINALPRICE,
mec_buy_onlineorder.FINALRULESTRING,
mec_buy_onlineorder.NOTE,
mec_buy_onlineorder.ORDERSTATE,
mec_buy_onlineorder.PAYMENTMODE,
mec_buy_onlineorder.SITEID,
mec_buy_onlineorder.USERCODE,
mec_buy_onlineorder.createdAt as TIME,
mec_ctm_site.PERSON,
mec_ctm_site.TELEPHONE,
mec_ctm_site.PROVINCE,
mec_ctm_site.CITY,
mec_ctm_site.DISTRICT,
mec_ctm_site.DETAIL,
mec_ctm_site.POSTCODE
from
mec_buy_onlineorder
left join mec_ctm_site on mec_buy_onlineorder.SITEID=mec_ctm_site.SITEID;











#柜营业员web看到的线上order级别信息
drop view mec_vi_online_order_total_forassistant;
create view mec_vi_online_order_total_forassistant as
select
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.ONLINECOUNTERCODE,
mec_buy_onlinecontent.CONFIRMSTATE,
mec_buy_onlinecontent.CONFIRMTIME,
mec_buy_onlinecontent.SALESMANCODE,
mec_buy_onlineorder.ONLINEORDERCODE,
mec_buy_onlineorder.RECEIVABLEAMT,
mec_buy_onlineorder.DELIVERYDEPTCODE,
mec_buy_onlineorder.DELIVERYMODE,
mec_buy_onlineorder.FINALPRICE,
mec_buy_onlineorder.FINALRULESTRING,
mec_buy_onlineorder.NOTE,
mec_buy_onlineorder.ORDERSTATE,
mec_buy_onlineorder.PAYMENTMODE,
mec_buy_onlineorder.SITEID,
mec_buy_onlineorder.USERCODE,
mec_buy_onlineorder.createdAt as TIME,
mec_buy_onlineorder.PLACETIME,
mec_buy_onlineorder.PAYTIME,
mec_buy_onlineorder.IFRETURN,
mec_buy_onlineorder.VIPCARDNO,
mec_ctm_customer.TELEPHONE,
mec_ctm_customer.NAME
#mec_ctm_site.PERSON,
#mec_ctm_site.TELEPHONE,
#mec_ctm_site.PROVINCE,
#mec_ctm_site.CITY,
#mec_ctm_site.DISTRICT,
#mec_ctm_site.DETAIL,
#mec_ctm_site.POSTCODE
from
mec_buy_onlinecontent
join mec_buy_onlineorder on mec_buy_onlinecontent.ONLINEORDERCODE=mec_buy_onlineorder.ONLINEORDERCODE
#left join mec_ctm_site on mec_buy_onlineorder.SITEID=mec_ctm_site.SITEID
left join mec_ctm_customer on mec_ctm_customer.USERCODE=mec_buy_onlineorder.USERCODE
group by mec_buy_onlinecontent.ONLINEORDERCODE, mec_buy_onlinecontent.COUNTERCODE;














#app上看到的或者柜营业员web看到的线下order级别的信息
drop view mec_vi_offline_order_total;
create view mec_vi_offline_order_total as
select
mec_buy_offlineorder.*,
mec_buy_offlineorder.createdAt as TIME,
mec_hct_counter.STORECODE as DEPTCODE,
mec_ctm_site.PERSON,
mec_ctm_site.TELEPHONE,
mec_ctm_site.PROVINCE,
mec_ctm_site.CITY,
mec_ctm_site.DISTRICT,
mec_ctm_site.DETAIL,
mec_ctm_site.POSTCODE
from
mec_buy_offlineorder
left join mec_ctm_site on mec_buy_offlineorder.SITEID=mec_ctm_site.SITEID
left join mec_hct_counter on mec_hct_counter.COUNTERCODE=mec_buy_offlineorder.COUNTERCODE
where CONTRACTSTATE=2;











#app上看到的或者柜营业员web看到的线下content级别全部信息
drop view mec_vi_offline_content_total;
create view mec_vi_offline_content_total as
select
mec_buy_offlinecontent.*,
mec_buy_offlineorder.SALESMANCODE,
mec_hsy_salesman.SALESMANNAME,
mec_itm_storeitem.MEMBERPRICE,
mec_itm_storeitem.STORECHECKEDPRICE,
mec_itm_storeitem.STORETEMPPRICE,
mec_itm_storeitem.DISCOUNTMARK,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES
from
mec_buy_offlinecontent
left join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
left join mec_itm_item on mec_buy_offlinecontent.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_itm_storeitem on mec_itm_storeitem.COUNTERCODE=mec_buy_offlinecontent.COUNTERCODE and mec_itm_storeitem.ITEMCODE= mec_buy_offlinecontent.ITEMCODE
left join mec_itm_skc on mec_buy_offlinecontent.SKCCODE=mec_itm_skc.SKCCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_hsy_salesman on mec_hsy_salesman.SALESMANCODE=mec_buy_offlineorder.SALESMANCODE;











#app上看到的或者柜营业员web看到的线下content
drop view mec_vi_offline_content;
create view mec_vi_offline_content as
select
mec_buy_offlinecontent.*,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA
from
mec_buy_offlinecontent
join mec_itm_item on mec_buy_offlinecontent.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_itm_skc on mec_buy_offlinecontent.SKCCODE=mec_itm_skc.SKCCODE
where
mec_itm_item.CHECKSTATE=1;












#app上看到content级别全部信息(订单内相同skc不同柜的会聚集在一起,ONLINECONTENTCODE是group by的第一个)
drop view mec_vi_online_content_total_forcustomer;
create view mec_vi_online_content_total_forcustomer as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.UNITPRICE,
SUM(mec_buy_onlinecontent.NUM) as NUM,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
hct_brand.BRANDNAME,
hsy_itemtype.ITEMTYPENAME,
mec_vi_first_imgpreview.IMGURL,
mec_vi_sku_categorynames.CATEGORYNAMES,
mec_vi_sku_regionnames.REGIONNAMES
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1
group by mec_buy_onlinecontent.ONLINEORDERCODE,mec_buy_onlinecontent.SKCCODE;












#app上看到线上content(订单内相同skc不同柜的会聚集在一起,ONLINECONTENTCODE是group by的第一个)
drop view mec_vi_online_content_forcustomer;
create view mec_vi_online_content_forcustomer as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.UNITPRICE,
SUM(mec_buy_onlinecontent.NUM) as NUM,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1
group by mec_buy_onlinecontent.ONLINEORDERCODE,mec_buy_onlinecontent.SKCCODE;












#柜营业员看到的线上content
drop view mec_vi_online_content_forassistant;
create view mec_vi_online_content_forassistant as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.UNITPRICE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;














#柜营业员看到content级别全部信息
drop view mec_vi_online_content_total_forassistant;
create view mec_vi_online_content_total_forassistant as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.UNITPRICE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
hct_brand.BRANDNAME,
hsy_itemtype.ITEMTYPENAME,
mec_vi_first_imgpreview.IMGURL,
mec_vi_sku_categorynames.CATEGORYNAMES,
mec_vi_sku_regionnames.REGIONNAMES
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;













#顾客提货看到不同柜台content级别
drop view mec_vi_online_content_forpick;
create view mec_vi_online_content_forpick as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.UNITPRICE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.PRICE
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;







#顾客提货看到不同柜台content级别全部信息
drop view mec_vi_online_content_total_forpick;
create view mec_vi_online_content_total_forpick as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.UNITPRICE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.PRICE,
hct_brand.BRANDNAME,
hsy_itemtype.ITEMTYPENAME,
mec_vi_first_imgpreview.IMGURL,
mec_vi_sku_categorynames.CATEGORYNAMES,
mec_vi_sku_regionnames.REGIONNAMES
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;














#pos看到content级别
drop view mec_vi_online_content_forpos;
create view mec_vi_online_content_forpos as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.UNITPRICE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.PRICE
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;












#pos看到content级别全部信息
drop view mec_vi_online_content_total_forpos;
create view mec_vi_online_content_total_forpos as
select
mec_buy_onlinecontent.ONLINEORDERCODE,
mec_buy_onlinecontent.ONLINECONTENTCODE,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.UNITPRICE,
mec_buy_onlinecontent.SALESMANCODE,
mec_hsy_salesman.SALESMANNAME,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.UNIT,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
hct_brand.BRANDNAME,
hsy_itemtype.ITEMTYPENAME,
mec_vi_first_imgpreview.IMGURL,
mec_vi_sku_categorynames.CATEGORYNAMES,
mec_vi_sku_regionnames.REGIONNAMES
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_hsy_salesman on mec_hsy_salesman.SALESMANCODE=mec_buy_onlinecontent.SALESMANCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;












#物流员管理的包裹内商品信息raw
drop view mec_vi_package_item_raw;
create view mec_vi_package_item_raw as
select
mec_buy_onlinecontent.ONLINEORDERCODE as ORDERCODE,
mec_lgt_packagecontent.PACKAGECODE,
mec_lgt_packagecontent.CONTENTCODE,
mec_lgt_packagecontent.ISONLINEORDER,
mec_buy_onlinecontent.COUNTERCODE,
mec_buy_onlinecontent.NUM,
mec_buy_onlinecontent.SKCCODE,
mec_itm_skc.ITEMCODE
from
mec_lgt_packagecontent
join mec_buy_onlinecontent on mec_lgt_packagecontent.CONTENTCODE=mec_buy_onlinecontent.ONLINECONTENTCODE
join mec_itm_skc on mec_itm_skc.SKCCODE=mec_buy_onlinecontent.SKCCODE
where mec_lgt_packagecontent.ISONLINEORDER=1 and mec_itm_skc.RECORDSTATE=1

union all

select
mec_buy_offlinecontent.OFFLINEORDERCODE as ORDERCODE,
mec_lgt_packagecontent.PACKAGECODE,
mec_lgt_packagecontent.CONTENTCODE,
mec_lgt_packagecontent.ISONLINEORDER,
mec_buy_offlineorder.COUNTERCODE,
mec_buy_offlinecontent.NUM,
mec_buy_offlinecontent.SKCCODE,
mec_buy_offlinecontent.ITEMCODE
from
mec_lgt_packagecontent
join mec_buy_offlinecontent on mec_lgt_packagecontent.CONTENTCODE=mec_buy_offlinecontent.OFFLINECONTENTCODE
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where mec_lgt_packagecontent.ISONLINEORDER=0;












#物流员管理的包裹内商品skc全部信息
drop  view mec_vi_package_item_total;
create view mec_vi_package_item_total as
select
mec_vi_package_item_raw.*,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA,
hct_brand.BRANDNAME,
hsy_itemtype.ITEMTYPENAME
from
mec_vi_package_item_raw
join mec_itm_item on mec_itm_item.ITEMCODE=mec_vi_package_item_raw.ITEMCODE
left join mec_itm_skc on mec_vi_package_item_raw.SKCCODE=mec_itm_skc.SKCCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;









#物流员管理的包裹内商品skc
drop view mec_vi_package_item;
create view mec_vi_package_item as
select
mec_vi_package_item_raw.*,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.ITEMNAME,
mec_itm_item.ITEMSHORTNAME,
mec_itm_item.BRANDCODE,
mec_itm_item.BARCODE,
mec_itm_item.ITEMTYPECODE,
mec_itm_item.PRICE,
mec_itm_item.TEMPPRICE,
mec_itm_item.PRODUCINGAREA
from
mec_vi_package_item_raw
join mec_itm_item on mec_itm_item.ITEMCODE=mec_vi_package_item_raw.ITEMCODE
left join mec_itm_skc on mec_vi_package_item_raw.SKCCODE=mec_itm_skc.SKCCODE
where mec_itm_skc.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;























#分类对应的商品的sku详细信息
drop view mec_vi_category_sku_total;
create view mec_vi_category_sku_total as
select
mec_itm_itemcategory.CATEGORYID,
mec_itm_category.CATEGORYNAME,
mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES
from
mec_itm_itemcategory
join mec_itm_item on mec_itm_itemcategory.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_itm_category on mec_itm_category.CATEGORYID=mec_itm_itemcategory.CATEGORYID
left join hct_brand on hct_brand.BRANDCODE=mec_itm_item.BRANDCODE
left join hsy_itemtype on hsy_itemtype.ITEMTYPECODE=mec_itm_item.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_category.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;










#分区对应的商品的sku详细信息
drop view mec_vi_region_sku_total;
create view mec_vi_region_sku_total as
select
mec_itm_itemregion.REGIONID,
mec_itm_region.REGIONNAME,
mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES
from
mec_itm_itemregion
join mec_itm_item on mec_itm_itemregion.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_itm_region on mec_itm_region.REGIONID=mec_itm_itemregion.REGIONID
left join hct_brand on hct_brand.BRANDCODE=mec_itm_item.BRANDCODE
left join hsy_itemtype on hsy_itemtype.ITEMTYPECODE=mec_itm_item.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
where
mec_itm_region.RECORDSTATE=1 and
mec_itm_item.CHECKSTATE=1;












drop view mec_vi_sku_online_counternum;
create view mec_vi_sku_online_counternum as
select ITEMCODE, count(COUNTERCODE) as COUNTERNUM
from mec_itm_storeitem
where
CHECKSTATE=1 and
ONLINESTATE=1
group by ITEMCODE;











drop  view mec_vi_sku_total_counternum;
create view mec_vi_sku_total_counternum as
select ITEMCODE, count(COUNTERCODE) as COUNTERNUM
from mec_itm_storeitem
where
CHECKSTATE=1
group by ITEMCODE;












drop view mec_vi_sku_hasstock_counternum;
create view mec_vi_sku_hasstock_counternum as
select ITEMCODE, count(COUNTERCODE) as COUNTERNUM
from mec_vi_offline_hasstock_selling_counter_sku
group by ITEMCODE;










drop view mec_vi_dept_sku;
create view mec_vi_dept_sku as
select
distinct
mec_itm_storeitem.ITEMCODE,
mec_hct_counter.STORECODE as DEPTCODE
from
mec_itm_storeitem
join mec_hct_counter on mec_itm_storeitem.COUNTERCODE=mec_hct_counter.COUNTERCODE
where mec_itm_storeitem.CHECKSTATE=1 AND CONTRACTSTATE=2;











#全部上线的skc详细信息(app希望看到的)
drop view mec_vi_online_selling_skc_forapp;
create view mec_vi_online_selling_skc_forapp as
SELECT
  mec_itm_skc.SKCCODE,
  mec_itm_skc.COLOR,
  mec_itm_skc.SIZE,
    mec_itm_item.ITEMCODE AS ITEMCODE,
    mec_itm_item.BARCODE AS BARCODE,
    mec_itm_item.ITEMNAME AS ITEMNAME,
    mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
    mec_itm_item.BRANDCODE AS BRANDCODE,
    mec_itm_item.ITEMTYPECODE AS ITEMTYPECODE,
    mec_itm_item.PRODUCINGAREA AS PRODUCINGAREA,
    mec_itm_item.PRICE AS PRICE,
    mec_itm_item.TEMPPRICE AS TEMPPRICE,
    mec_itm_item.RETURNGOODS AS RETURNGOODS,
    mec_itm_item.SPECIFICATION AS SPECIFICATION,
    mec_itm_item.PRODUCTCODE AS PRODUCTCODE,
    mec_itm_item.UNIT AS UNIT,
    mec_itm_item.TITLE AS TITLE,
    mec_itm_item.SCORE,
    mec_itm_item.SCOREPOPULARITY,
    mec_itm_item.PURCHASE,
    mec_itm_item.PURCHASEPOPULARITY,
    mec_itm_item.PRAISERATE,
    mec_itm_item.ONLINETIME,
    hct_brand.BRANDNAME AS BRANDNAME,
    hsy_itemtype.ITEMTYPENAME AS ITEMTYPENAME,
    mec_vi_first_imgpreview.IMGURL,
    mec_vi_sku_categorynames.CATEGORYNAMES,
    mec_vi_sku_regionnames.REGIONNAMES,
    mec_itm_item.createdAt,
    GREATEST(mec_itm_item.updatedAt,mec_vi_first_imgpreview.updatedAt,mec_vi_sku_categorynames.updatedAt,mec_vi_sku_regionnames.updatedAt) AS updatedAt,
    mec_vi_online_skc_stock.AMOUNT
FROM
mec_itm_skc
join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
left join hsy_itemtype on mec_itm_item.ITEMTYPECODE=hsy_itemtype.ITEMTYPECODE
left join mec_vi_first_imgpreview on mec_vi_first_imgpreview.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_categorynames on mec_vi_sku_categorynames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_sku_regionnames on mec_vi_sku_regionnames.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_vi_online_skc_stock on mec_vi_online_skc_stock.SKCCODE=mec_itm_skc.SKCCODE
WHERE
	mec_itm_item.CHECKSTATE = 1
AND mec_itm_item.SELLINGSTATE = 3
AND mec_itm_skc.RECORDSTATE=1 ;











#app端看到的提货信息(包括到柜提货和到物流部提货)
drop view mec_vi_lgt_pickinfo_forapp;
create view mec_vi_lgt_pickinfo_forapp as
select
mec_lgt_pickcounter.ORDERCODE,
mec_lgt_pickcounter.PICKCODE,
mec_lgt_pickcounter.PICKSTATE,
mec_hct_counter.STORECODE as DEPTCODE,
mec_lgt_pickcounter.COUNTERCODE,
mec_hct_counter.COUNTERNAME,
mec_hct_counter.COUNTERLOCATIONCODE
from
mec_lgt_pickcounter join mec_hct_counter on mec_lgt_pickcounter.COUNTERCODE=mec_hct_counter.COUNTERCODE
where CONTRACTSTATE=2

union all

select
mec_lgt_pickdept.ORDERCODE,
mec_lgt_pickdept.PICKCODE,
mec_lgt_pickdept.PICKSTATE,
mec_lgt_pickdept.DEPTCODE,
null as COUNTERCODE,
null as COUNTERNAME,
null as COUNTERLOCATIONCODE
from
mec_lgt_pickdept;











#查看收藏商品时的商品信息
drop view mec_vi_bhv_favoriteitem_total;
create view mec_vi_bhv_favoriteitem_total as
select
mec_bhv_favoriteitem.USERCODE as USERCODE,
mec_bhv_favoriteitem.ITEMCODE as ITEMCODE,
mec_itm_item.ITEMNAME as ITEMNAME,
mec_itm_item.PRICE as PRICE,
hct_brand.BRANDNAME as BRANDNAME,
mec_vi_first_imgpreview.IMGURL as IMGURL,
mec_bhv_favoriteitem.createdAt as CREATETIME
from
mec_bhv_favoriteitem
join mec_itm_item on mec_bhv_favoriteitem.ITEMCODE = mec_itm_item.ITEMCODE
join hct_brand on mec_itm_item.BRANDCODE = hct_brand.BRANDCODE
left join mec_vi_first_imgpreview on mec_bhv_favoriteitem.ITEMCODE = mec_vi_first_imgpreview.ITEMCODE;










#用户评论的商品详情评分等全部信息
drop view mec_vi_bhv_comment_total;
create view mec_vi_bhv_comment_total as
select
mec_bhv_comment.*,
mec_buy_onlinecontent.SKCCODE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_buy_onlineorder.createdAt as PLACEORDERTIME
from
mec_bhv_comment
left join mec_itm_item on mec_bhv_comment.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_buy_onlineorder on mec_buy_onlineorder.ONLINEORDERCODE=mec_bhv_comment.ORDERCODE
left join mec_buy_onlinecontent on mec_bhv_comment.CONTENTCODE=mec_buy_onlinecontent.ONLINECONTENTCODE
left join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE
where
mec_bhv_comment.ISONLINEORDER=1 AND
mec_itm_item.CHECKSTATE=1 AND
mec_itm_skc.RECORDSTATE=1

union all

select
mec_bhv_comment.*,
mec_buy_offlinecontent.SKCCODE,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_buy_offlineorder.createdAt as PLACEORDERTIME
from
mec_bhv_comment
left join mec_itm_item on mec_bhv_comment.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_buy_offlineorder on mec_buy_offlineorder.OFFLINEORDERCODE=mec_bhv_comment.ORDERCODE
left join mec_buy_offlinecontent on mec_bhv_comment.CONTENTCODE=mec_buy_offlinecontent.OFFLINECONTENTCODE
left join mec_itm_skc on mec_buy_offlinecontent.SKCCODE=mec_itm_skc.SKCCODE
where mec_bhv_comment.ISONLINEORDER=0 AND
mec_itm_item.CHECKSTATE=1 AND
mec_itm_skc.RECORDSTATE=1;












drop view  mec_vi_prm_order_content_params_raw;
create view  mec_vi_prm_order_content_params_raw as
SELECT
	`mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ordercode`,
	`mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `contentcode`,
	`mec_buy_offlinecontent`.`ITEMCODE` AS `itemcode`,
	`mec_buy_offlineorder`.`COUNTERCODE` AS `countercode`,
	`mec_buy_offlineorder`.`STORECODE` AS `deptcode`,
	`mec_buy_offlinecontent`.`NUM` AS `num`,
	`mec_buy_offlinecontent`.`UNITPRICE` AS `originprice`,
	`mec_buy_offlinecontent`.`PROMOTIONMARK` AS `promotionmark`,
	`mec_buy_offlinecontent`.`HANDAMT` AS `finalmanual`,
	(
		CASE
		WHEN (
			`mec_buy_offlineorder`.`PAYMENTSTATE` = 0
		) THEN
			1
		ELSE
			2
		END
	) AS `flag`,
	(
		CASE
		WHEN (
			`mec_buy_offlineorder`.`PAYMENTSTATE` = 0
		) THEN
			NULL
		WHEN (
			`mec_buy_offlineorder`.`PAYMENTSTATE` = 1
		) THEN
			`mec_buy_offlinecontent`.`RETAILAMT`
		ELSE
			`mec_buy_offlinecontent`.`RETAILAMT2`
		END
	) AS `finalprice`,
	`mec_buy_offlineorder`.`POSDEALNUM` AS `pos`
FROM
	(
		`mec_buy_offlinecontent`
		JOIN `mec_buy_offlineorder` ON (
			(
				`mec_buy_offlineorder`.`OFFLINEORDERCODE` = `mec_buy_offlinecontent`.`OFFLINEORDERCODE`
			)
		)
	)
UNION ALL
	SELECT
		`mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ordercode`,
		`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `contentcode`,
		`mec_itm_skc`.`ITEMCODE` AS `itemcode`,
		`mec_buy_onlinecontent`.`ONLINECOUNTERCODE` AS `countercode`,
		`mec_buy_onlineorder`.`STORECODE` AS `deptcode`,
		`mec_buy_onlinecontent`.`NUM` AS `num`,
		`mec_buy_onlinecontent`.`UNITPRICE` AS `originprice`,
		`mec_buy_onlinecontent`.`PROMOTIONMARK` AS `promotionmark`,
		NULL AS `finalmanual`,
		(
			CASE
			WHEN (
				`mec_buy_onlineorder`.`PAYMENTSTATE` = 0
			) THEN
				1
			ELSE
				2
			END
		) AS `flag`,
		(
			CASE
			WHEN (
				`mec_buy_onlineorder`.`PAYMENTSTATE` = 0
			) THEN
				NULL
			ELSE
				`mec_buy_onlinecontent`.`RETAILAMT`
			END
		) AS `finalprice`,
		`mec_buy_onlineorder`.`POSDEALNUM` AS `pos`
	FROM
		(
			(
				`mec_buy_onlinecontent`
				JOIN `mec_buy_onlineorder` ON (
					(
						`mec_buy_onlineorder`.`ONLINEORDERCODE` = `mec_buy_onlinecontent`.`ONLINEORDERCODE`
					)
				)
			)
			JOIN `mec_itm_skc` ON (
				(
					`mec_itm_skc`.`SKCCODE` = `mec_buy_onlinecontent`.`SKCCODE`
				)
			)
		);








drop view  mec_vi_prm_order_content_params;
create view  mec_vi_prm_order_content_params as
select * from mec_vi_prm_order_content_params_raw order by contentcode;










drop view mec_vi_pos_orderinfo;
create view mec_vi_pos_orderinfo as
select
ifnull(mec_buy_offlineorder.STORECODE,'') as storecode,
ifnull(mec_buy_offlineorder.OFFLINEORDERCODE,'') as ordercode,
ifnull(mec_buy_offlineorder.SALESMANCODE,'') as salemancode,
ifnull(mec_hsy_salesman.SALESMANNAME,'') as salemanname,
ifnull(mec_buy_offlineorder.VIPCARDNO,'') as vipcode, ##注意这里是卡号
mec_buy_offlineorder.IFRETURN as ifreturn,
0 as ifonline
from
mec_buy_offlineorder left join mec_hsy_salesman on mec_buy_offlineorder.SALESMANCODE=mec_hsy_salesman.SALESMANCODE
where ORDERSTATE=0 or ORDERSTATE=100

union all

select
ifnull(mec_buy_onlineorder.STORECODE,'') as storecode,
ifnull(mec_buy_onlineorder.ONLINEORDERCODE,'') as ordercode,
'' as salemancode,
'' as salemanname,
ifnull(mec_buy_onlineorder.VIPCARDNO,'') as vipcode, ##注意这里是卡号
mec_buy_onlineorder.IFRETURN as ifreturn,
1 as ifonline
from
mec_buy_onlineorder
where ORDERSTATE=1 or ORDERSTATE=100;








drop view mec_vi_order_tags;
create view mec_vi_order_tags as
select
mec_buy_offlineorder.STORECODE,
mec_buy_offlineorder.OFFLINEORDERCODE as ORDERCODE,
mec_buy_offlineorder.IFRETURN as IFRETURN,
0 as ISONLINEORDER
from mec_buy_offlineorder

union all

select
mec_buy_onlineorder.STORECODE,
mec_buy_onlineorder.ONLINEORDERCODE as ORDERCODE,
mec_buy_onlineorder.IFRETURN as IFRETURN,
1 as ISONLINEORDER
from mec_buy_onlineorder;












drop view mec_vi_pos_contentinfo_raw;
create view mec_vi_pos_contentinfo_raw as
select
ifnull(mec_buy_offlinecontent.OFFLINECONTENTCODE,'')as contentcode,
ifnull(mec_buy_offlinecontent.OFFLINEORDERCODE,'') as ordercode,
ifnull(mec_buy_offlinecontent.ITEMCODE,'') as itemcode,
ifnull(mec_itm_item.ITEMSHORTNAME,'') as itemname,
ifnull(mec_itm_item.UNIT,'') as unit,
ifnull(mec_buy_offlineorder.COUNTERCODE,'') as cabinet,
ifnull(mec_buy_offlinecontent.PROMOTIONMARK,'') as promotioncode,
ifnull(mec_buy_offlinecontent.NUM,0) as count,
ifnull(mec_buy_offlinecontent.UNITPRICE,0) as oriprice,
case when mec_buy_offlinecontent.REALVIPDISCOUNTRATE is null or mec_buy_offlinecontent.REALVIPDISCOUNTRATE=100 then 100 else mec_buy_offlinecontent.REALVIPDISCOUNTRATE end as discount,
case when mec_buy_offlinecontent.REALVIPDISCOUNTRATE is null or mec_buy_offlinecontent.REALVIPDISCOUNTRATE=100 then truncate(UNITPRICE,2) else truncate(UNITPRICE*REALVIPDISCOUNTRATE/100,2) end as discountprice,
case when mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.RETAILAMT when mec_buy_offlinecontent.REALVIPDISCOUNTRATE is null or mec_buy_offlinecontent.REALVIPDISCOUNTRATE=100 then UNITPRICE*NUM else truncate(UNITPRICE*REALVIPDISCOUNTRATE/100*NUM,0) end as actualprice,
case when mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.RETAILAMT else UNITPRICE*NUM-ifnull(mec_buy_offlinecontent.HANDAMT,0) end as totaloriprice,
ifnull(mec_buy_offlinecontent.HANDAMT,0) as handdiscount
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlineorder.OFFLINEORDERCODE=mec_buy_offlinecontent.OFFLINEORDERCODE
join mec_itm_item on mec_itm_item.ITEMCODE=mec_buy_offlinecontent.ITEMCODE

union all

select
ifnull(mec_buy_onlinecontent.ONLINECONTENTCODE,'') as contentcode,
ifnull(mec_buy_onlinecontent.ONLINEORDERCODE,'') as ordercode,
ifnull(mec_itm_item.ITEMCODE,'') as itemcode,
ifnull(mec_itm_item.ITEMSHORTNAME,'') as itemname,
ifnull(mec_itm_item.UNIT,'') as unit,
ifnull(mec_buy_onlinecontent.COUNTERCODE,'') as cabinet,
ifnull(mec_buy_onlinecontent.PROMOTIONMARK,'') as promotioncode,
ifnull(mec_buy_onlinecontent.NUM,0) as count,
ifnull(mec_buy_onlinecontent.UNITPRICE,0) as oriprice,
case when mec_buy_onlinecontent.REALVIPDISCOUNTRATE is null or mec_buy_onlinecontent.REALVIPDISCOUNTRATE=100 then 100 else mec_buy_onlinecontent.REALVIPDISCOUNTRATE end as discount,
case when mec_buy_onlinecontent.REALVIPDISCOUNTRATE is null or mec_buy_onlinecontent.REALVIPDISCOUNTRATE=100 then truncate(UNITPRICE,2) else truncate(UNITPRICE*REALVIPDISCOUNTRATE/100,2) end as discountprice,
case when mec_buy_onlineorder.IFRETURN=1 then mec_buy_onlinecontent.RETAILAMT when mec_buy_onlinecontent.REALVIPDISCOUNTRATE is null or mec_buy_onlinecontent.REALVIPDISCOUNTRATE=100 then UNITPRICE*NUM else truncate(UNITPRICE*REALVIPDISCOUNTRATE/100*NUM,0) end as actualprice,
case when mec_buy_onlineorder.IFRETURN=1 then mec_buy_onlinecontent.RETAILAMT else UNITPRICE*NUM-ifnull(mec_buy_onlinecontent.HANDAMT,0) end as totaloriprice,
ifnull(mec_buy_onlinecontent.HANDAMT,0) as handdiscount
from
mec_buy_onlinecontent
join mec_buy_onlineorder on mec_buy_onlineorder.ONLINEORDERCODE=mec_buy_onlinecontent.ONLINEORDERCODE
join mec_itm_skc on mec_itm_skc.SKCCODE=mec_buy_onlinecontent.SKCCODE
join mec_itm_item on mec_itm_item.ITEMCODE=mec_itm_skc.ITEMCODE;





drop view mec_vi_pos_contentinfo;
create view mec_vi_pos_contentinfo as
select * from mec_vi_pos_contentinfo_raw ORDER BY contentcode;





drop view mec_vi_pos_payprepareinfo;
create view mec_vi_pos_payprepareinfo as
select
ifnull(mec_buy_offlinecontent.OFFLINEORDERCODE,'') as ordercode,
ifnull(mec_buy_offlinecontent.ITEMCODE,'') as itemcode,
ifnull(mec_buy_offlinecontent.NUM,0) as amount,
ifnull(mec_buy_offlinecontent.UNITPRICE,0) as unitprice,
case when VIPDISCOUNTAMT is null then 0 else VIPDISCOUNTAMT end + case when VIPFLOORAMT is null then 0 else VIPFLOORAMT end as vipdiscount,
0 as handdiscount,
case when DISCOUNTOUTAMT is null then 0 else DISCOUNTOUTAMT end as promotiondiscount,
case when MERCHANTDISCOUTAMT is null then 0 else MERCHANTDISCOUTAMT end as merchantdiscount,
case when REALVIPCARDTYPE is null then '00' else REALVIPCARDTYPE end as vipcardtype,
convert(case when REALVIPDISCOUNTRATE is null then 100 else REALVIPDISCOUNTRATE end ,char) as vipdiscountstr,
case when RETAILAMT is null then 0 else RETAILAMT end as retailamt
from
mec_buy_offlinecontent

union all

select
ifnull(mec_buy_onlinecontent.ONLINEORDERCODE,'') as ordercode,
ifnull(mec_itm_skc.ITEMCODE,'') as itemcode,
ifnull(mec_buy_onlinecontent.NUM,0) as amount,
ifnull(mec_buy_onlinecontent.UNITPRICE,0) as unitprice,
case when VIPDISCOUNTAMT is null then 0 else VIPDISCOUNTAMT end + case when VIPFLOORAMT is null then 0 else VIPFLOORAMT end as vipdiscount,
0 as handdiscount,
case when DISCOUNTOUTAMT is null then 0 else DISCOUNTOUTAMT end as promotiondiscount,
case when MERCHANTDISCOUTAMT is null then 0 else MERCHANTDISCOUTAMT end as merchantdiscount,
case when REALVIPCARDTYPE is null then '00' else REALVIPCARDTYPE end as vipcardtype,
convert(case when REALVIPDISCOUNTRATE is null then 100 else REALVIPDISCOUNTRATE end ,char) as vipdiscountstr,
case when RETAILAMT is null then 0 else RETAILAMT end as retailamt
from
mec_buy_onlinecontent
join mec_itm_skc on mec_buy_onlinecontent.SKCCODE=mec_itm_skc.SKCCODE;












drop view mec_vi_paid_orderinfo;
create view mec_vi_paid_orderinfo as
select
case when PAYMENTSTATE=1 then mec_buy_offlineorder.OFFLINEORDERCODE else mec_buy_offlineorder.OFFLINEGROUPCODE end as orderorgroupcode,
case when PAYMENTSTATE=1 then mec_buy_offlineorder.OFFLINEORDERCODE else mec_buy_offlineorder.OFFLINEGROUPCODE end as groupid,
mec_buy_offlineorder.OFFLINEORDERCODE as ordercode,
mec_buy_offlineorder.IFRETURN as ifreturn,
0 as ordercodetype,
mec_buy_offlineorder.DELIVERYMODE as pickupmode,
mec_buy_offlineorder.PAYMENTMODE as paymenttype,
mec_buy_offlineorder.ORDERSTATE as status,
date_format(DATE_ADD(mec_buy_offlineorder.PLACETIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as orderdate,
date_format(DATE_ADD(mec_buy_offlineorder.AUDITTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as audittime,
date_format(DATE_ADD(mec_buy_offlineorder.PAYTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as paytime,
date_format(DATE_ADD(mec_buy_offlineorder.OUTTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as outtime,
date_format(DATE_ADD(mec_buy_offlineorder.FINISHTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as finishtime,
date_format(DATE_ADD(mec_buy_offlineorder.RECEIVABLETIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as receivabletime,
case when PAYMENTSTATE=1 then mec_buy_offlineorder.VIPCARDNO else mec_buy_offlineorder.VIPCARDNO2 end as vipcardNo,
mec_buy_offlineorder.CASHIER as cashier,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlineorder.RECEIVABLEAMT else mec_buy_offlineorder.RECEIVABLEAMT2 end as receivableamt,
mec_buy_offlineorder.REALSHIPPRICE as realshipprice,
mec_buy_offlineorder.REALPACKING as realpacking,
mec_buy_offlineorder.SHIPPRICE as shipprice,
mec_buy_offlineorder.PACKING as packing,
mec_ctm_site.PERSON as receivecontact,
mec_ctm_site.PERSON as receivename,
mec_ctm_site.TELEPHONE as receivephone,
mec_ctm_site.TELEPHONE as receivecellphone,
mec_ctm_site.DETAIL as receiveaddress,
mec_ctm_site.POSTCODE as receivezip,
mec_buy_offlineorder.STORECODE as storecode,
mec_buy_offlineorder.POSCODE poscode,
mec_buy_offlineorder.PAYLOCAL as paylocal,
mec_buy_offlineorder.POSDEALNUM as possalecode,
ifnull(mec_buy_offlineorder.GROUPLISTID,1) as grouplistid
from
mec_buy_offlineorder left join mec_ctm_site on mec_buy_offlineorder.SITEID=mec_ctm_site.SITEID
where mec_buy_offlineorder.PAYMENTSTATE between 1 and 2

union all

select
mec_buy_onlineorder.ONLINEORDERCODE as orderorgroupcode,
mec_buy_onlineorder.ONLINEORDERCODE as groupid,
mec_buy_onlineorder.ONLINEORDERCODE as ordercode,
mec_buy_onlineorder.IFRETURN as ifreturn,
1 as ordercodetype,
mec_buy_onlineorder.DELIVERYMODE as pickupmode,
mec_buy_onlineorder.PAYMENTMODE as paymenttype,
mec_buy_onlineorder.ORDERSTATE as status,
date_format(DATE_ADD(mec_buy_onlineorder.PLACETIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as orderdate,
date_format(DATE_ADD(mec_buy_onlineorder.AUDITTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as audittime,
date_format(DATE_ADD(mec_buy_onlineorder.PAYTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as paytime,
date_format(DATE_ADD(mec_buy_onlineorder.OUTTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as outtime,
date_format(DATE_ADD(mec_buy_onlineorder.FINISHTIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as finishtime,
date_format(DATE_ADD(mec_buy_onlineorder.RECEIVABLETIME,INTERVAL 8 HOUR), '%Y-%m-%d %H:%i:%S') as receivabletime,
mec_buy_onlineorder.VIPCARDNO as vipcardNo,
mec_buy_onlineorder.CASHIER as cashier,
mec_buy_onlineorder.RECEIVABLEAMT as receivableamt,
mec_buy_onlineorder.REALSHIPPRICE as realshipprice,
mec_buy_onlineorder.REALPACKING as realpacking,
mec_buy_onlineorder.SHIPPRICE as shipprice,
mec_buy_onlineorder.PACKING as packing,
mec_ctm_site.PERSON as receivecontact,
mec_ctm_site.PERSON as receivename,
mec_ctm_site.TELEPHONE as receivephone,
mec_ctm_site.TELEPHONE as receivecellphone,
mec_ctm_site.DETAIL as receiveaddress,
mec_ctm_site.POSTCODE as receivezip,
mec_buy_onlineorder.STORECODE as storecode,
mec_buy_onlineorder.POSCODE poscode,
mec_buy_onlineorder.PAYLOCAL as paylocal,
mec_buy_onlineorder.POSDEALNUM as possalecode,
1 as grouplistid
from
mec_buy_onlineorder left join mec_ctm_site on mec_buy_onlineorder.SITEID=mec_ctm_site.SITEID
where mec_buy_onlineorder.PAYMENTSTATE between 1 and 2;











drop  view mec_vi_paid_contentinfo;
create view mec_vi_paid_contentinfo as
select
case when PAYMENTSTATE=1 then mec_buy_offlineorder.OFFLINEORDERCODE else mec_buy_offlineorder.OFFLINEGROUPCODE end as orderorgroupcode,
mec_buy_offlineorder.OFFLINEORDERCODE as ordercode,
right(mec_buy_offlinecontent.OFFLINECONTENTCODE,3) as listid,
mec_buy_offlinecontent.ITEMCODE as sku,
mec_buy_offlinecontent.COUNTERCODE as billcountercode,
mec_buy_offlinecontent.COUNTERCODE as countercode,
mec_itm_item.ITEMNAME as itemname,
mec_buy_offlinecontent.PROMOTIONMARK as promotionmark,
mec_buy_offlinecontent.UNITPRICE as price,
mec_buy_offlinecontent.NUM as qty,
mec_buy_offlineorder.SALESMANCODE as saler,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then ifnull(mec_buy_offlinecontent.VIPDISCOUNTAMT,0)+ifnull(mec_buy_offlinecontent.VIPFLOORAMT,0) else ifnull(mec_buy_offlinecontent.VIPDISCOUNTAMT2,0)+ifnull(mec_buy_offlinecontent.VIPFLOORAMT2,0)  end as vipdiscountamt,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.DISCOUNTOUTAMT else mec_buy_offlinecontent.DISCOUNTOUTAMT2 end as discountoutamt,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.DISCOUNTINAMT else mec_buy_offlinecontent.DISCOUNTINAMT2 end as discountinamt,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.PRESENTSHAREQTY else mec_buy_offlinecontent.PRESENTSHAREQTY2 end as presentshareqty,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.MERCHANTDISCOUTAMT else mec_buy_offlinecontent.MERCHANTDISCOUTAMT2 end as mechantdiscounamt,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.SHIPPRICECHARGESHARE else mec_buy_offlinecontent.SHIPPRICECHARGESHARE2 end as shippricechargeshare,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.PACKINGCHARGESHARE else mec_buy_offlinecontent.PACKINGCHARGESHARE2 end as packingchargeshare,
case when PAYMENTSTATE=1 OR mec_buy_offlineorder.IFRETURN=1 then mec_buy_offlinecontent.RETAILAMT else mec_buy_offlinecontent.RETAILAMT2 end as retailamt,
mec_buy_offlinecontent.TEMPDISTRIBUTIONMARK as tempdistributionmark,
mec_buy_offlinecontent.ORIGINORDERCODE as returnordercode,
right(mec_buy_offlinecontent.ORIGINCONTENTCODE,3) as returnlistid,
mec_buy_offlinecontent.HANDAMT as handamt
FROM
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
left join mec_itm_item on mec_buy_offlinecontent.ITEMCODE=mec_itm_item.ITEMCODE
where mec_buy_offlineorder.PAYMENTSTATE between 1 and 2

union all

select
mec_buy_onlineorder.ONLINEORDERCODE as orderorgroupcode,
mec_buy_onlineorder.ONLINEORDERCODE as ordercode,
right(mec_buy_onlinecontent.ONLINECONTENTCODE,3) as listid,
mec_itm_item.ITEMCODE as sku,
mec_buy_onlinecontent.ONLINECOUNTERCODE as billcountercode,
mec_buy_onlinecontent.COUNTERCODE as countercode,
mec_itm_item.ITEMNAME as itemname,
mec_buy_onlinecontent.PROMOTIONMARK as promotionmark,
mec_buy_onlinecontent.UNITPRICE as price,
mec_buy_onlinecontent.NUM as qty,
mec_buy_onlinecontent.SALESMANCODE as saler,
ifnull(mec_buy_onlinecontent.VIPDISCOUNTAMT,0)+ifnull(mec_buy_onlinecontent.VIPFLOORAMT,0) as vipdiscountamt,
mec_buy_onlinecontent.DISCOUNTOUTAMT as discountoutamt,
mec_buy_onlinecontent.DISCOUNTINAMT as discountinamt,
mec_buy_onlinecontent.PRESENTSHAREQTY as presentshareqty,
mec_buy_onlinecontent.MERCHANTDISCOUTAMT as mechantdiscounamt,
mec_buy_onlinecontent.SHIPPRICECHARGESHARE as shippricechargeshare,
mec_buy_onlinecontent.PACKINGCHARGESHARE as packingchargeshare,
mec_buy_onlinecontent.RETAILAMT as retailamt,
0 as tempdistributionmark,
mec_buy_onlinecontent.ORIGINORDERCODE as returnordercode,
right(mec_buy_onlinecontent.ORIGINCONTENTCODE,3) as returnlistid,
null as handamt
FROM
mec_buy_onlinecontent
join mec_buy_onlineorder on mec_buy_onlinecontent.ONLINEORDERCODE=mec_buy_onlineorder.ONLINEORDERCODE
left join mec_itm_skc on mec_itm_skc.SKCCODE=mec_buy_onlinecontent.SKCCODE
left join mec_itm_item on mec_itm_skc.ITEMCODE=mec_itm_item.ITEMCODE
where mec_buy_onlineorder.PAYMENTSTATE between 1 and 2;








drop view mec_vi_paid_discountinfo;
create view mec_vi_paid_discountinfo as
select
case when mec_buy_offlineorder.PAYMENTSTATE=2 then mec_buy_offlineorder.OFFLINEGROUPCODE else mec_audit_discount.ORDERCODE end as orderorgroupcode,
mec_audit_discount.ORDERCODE as ordercode,
right(mec_audit_discount.CONTENTCODE,3) as itemlistid,
mec_audit_discount.DISCOUNTID as listid,
mec_audit_discount.DISCOUNTREASON as discountreason,
mec_audit_discount.DISCOUNTAMT as discountamt,
mec_audit_discount.VIPCARDTYPE as vipcardtype,
mec_audit_discount.DISCOUNTTYPE as discounttype
from
mec_audit_discount
left join mec_buy_offlineorder on mec_audit_discount.ORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE;







drop view mec_vi_paid_chargeinfo;
create view mec_vi_paid_chargeinfo as
select
case when mec_buy_offlineorder.PAYMENTSTATE=2 then mec_buy_offlineorder.OFFLINEGROUPCODE else mec_audit_charge.ORDERCODE end as orderorgroupcode,
mec_audit_charge.ORDERCODE as ordercode,
mec_audit_charge.CHARGEID as listid,
mec_audit_charge.CHARGECODE as chargecode,
mec_audit_charge.AMT as amt
from
mec_audit_charge
left join mec_buy_offlineorder on mec_audit_charge.ORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE;







drop view mec_vi_paid_payinfo;
create view mec_vi_paid_payinfo as
select
case when mec_audit_pay.GROUPCODE is null then mec_audit_pay.ORDERCODE else mec_audit_pay.GROUPCODE end as orderorgroupcode,
case when mec_audit_pay.GROUPCODE is null then mec_audit_pay.ORDERCODE else mec_audit_pay.GROUPCODE end as groupid,
mec_audit_pay.ORDERCODE as ordercode,
mec_audit_pay.PAYID as listid,
mec_audit_pay.PAYCODE as paycode,
mec_audit_pay.AMT as amt,
mec_audit_pay.CARDCODE as cardcode,
mec_audit_pay.PORTNO as portno,
mec_audit_pay.BANKCARDCODE as bankcardcode,
mec_audit_pay.FEERATECODE as feeratecode,
mec_audit_pay.IFRETURN as ifreturn
from
mec_audit_pay;







drop view mec_vi_lgt_pickcounter_total;
create view mec_vi_lgt_pickcounter_total as
select
mec_buy_offlineorder.POSDEALNUM,
mec_buy_offlineorder.POSTRANSCODE,
mec_buy_offlineorder.PLACETIME,
mec_buy_offlineorder.PAYTIME,
mec_buy_offlineorder.PAYMENTMODE,
mec_buy_offlineorder.PAYMENTSTATE,
mec_lgt_pickcounter.*
from mec_lgt_pickcounter join mec_buy_offlineorder on mec_lgt_pickcounter.ORDERCODE = mec_buy_offlineorder.OFFLINEORDERCODE
where mec_lgt_pickcounter.ISONLINEORDER=0

union all

select
mec_buy_onlineorder.POSDEALNUM,
mec_buy_onlineorder.POSTRANSCODE,
mec_buy_onlineorder.PLACETIME,
mec_buy_onlineorder.PAYTIME,
mec_buy_onlineorder.PAYMENTMODE,
mec_buy_onlineorder.PAYMENTSTATE,
mec_lgt_pickcounter.*
from mec_lgt_pickcounter join mec_buy_onlineorder on mec_lgt_pickcounter.ORDERCODE = mec_buy_onlineorder.ONLINEORDERCODE
where mec_lgt_pickcounter.ISONLINEORDER=1;








drop view mec_vi_category_brand;
create view mec_vi_category_brand as
SELECT
	`mec_itm_category_brand`.`ID` AS `ID`,
	`mec_itm_category_brand`.`BRANDCODE` AS `BRANDCODE`,
	`mec_itm_category_brand`.`CATEGORYID` AS `CATEGORYID`,
	`mec_itm_category`.`CATEGORYNAME` AS `CATEGORYNAME`,
	`hct_brand`.`BRANDNAME` AS `BRANDNAME`,
	`hct_brand`.`LOGO` AS `LOGO`
FROM
	(
		(
			`mec_itm_category_brand`
			JOIN `hct_brand` ON (
				(
					`mec_itm_category_brand`.`BRANDCODE` = `hct_brand`.`BRANDCODE`
				)
			)
		)
		LEFT JOIN `mec_itm_category` ON (
			(
				`mec_itm_category_brand`.`CATEGORYID` = `mec_itm_category`.`CATEGORYID`
			)
		)
	);







drop view mec_vi_ret_returnable_contentinfo;
create view mec_vi_ret_returnable_contentinfo as
SELECT
	`mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ORDERCODE`,
	 case when mec_buy_offlineorder.paymentstate=1 then mec_buy_offlineorder.VIPCARDNO else mec_buy_offlineorder.VIPCARDNO2 end as VIPCARDNO,
	`mec_buy_offlineorder`.`USERCODE` AS `USERCODE`,
	`mec_buy_offlineorder`.`POSDEALNUM` AS `POSDEALNUM`,
	`mec_buy_offlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,
	`mec_buy_offlineorder`.`COUNTERCODE` AS `COUNTERCODE`,
	`mec_buy_offlineorder`.`STORECODE` AS `STORECODE`,
	`mec_buy_offlineorder`.`PLACETIME` AS `PLACETIME`,
	`mec_buy_offlineorder`.`PAYTIME` AS `PAYTIME`,
	`mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `CONTENTCODE`,
	`mec_buy_offlinecontent`.`ITEMCODE` AS `ITEMCODE`,
	`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,
	`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,
	 mec_itm_item.BRANDCODE,
	 hct_brand.BRANDNAME,
	`mec_itm_skc`.`COLOR` AS `COLOR`,
	`mec_itm_skc`.`SIZE` AS `SIZE`,
	`mec_buy_offlinecontent`.`NUM` AS `NUM`,
	`mec_buy_offlinecontent`.`UNITPRICE` AS `UNITPRICE`,
	(
		`mec_buy_offlinecontent`.`NUM` * `mec_buy_offlinecontent`.`UNITPRICE`
	) AS `ORIGINAMT`,
	`mec_buy_offlinecontent`.`RETAILAMT` AS `RETAILAMT`,
	`mec_buy_offlinecontent`.`CASHPAYSHARE` AS `CASHPAYSHARE`,
	`mec_buy_offlinecontent`.`CREDITPAYSHARE` AS `CREDITPAYSHARE`,
	`mec_buy_offlinecontent`.`CASHCOUPONPAYSHARE` AS `CASHCOUPONPAYSHARE`,
	`mec_buy_offlinecontent`.`GOODSCOUPONPAYSHARE` AS `GOODSCOUPONPAYSHARE`,
	`mec_buy_offlinecontent`.`ECARDPAYSHARE` AS `ECARDPAYSHARE`,
	`mec_buy_offlinecontent`.`OTHERPAYSHARE` AS `OTHERPAYSHARE`,
	`mec_buy_offlinecontent`.`PREMIUMPAYSHARE` AS `PREMIUMPAYSHARE`
FROM
	(
		(
			(
				`mec_buy_offlinecontent`
				JOIN `mec_buy_offlineorder` ON (
					(
						`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`
					)
				)
			)
			LEFT JOIN `mec_itm_item` ON (
				(
					`mec_buy_offlinecontent`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`
				)
			)
		)
		LEFT JOIN `mec_itm_skc` ON (
			(
				`mec_buy_offlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`
			)
		)
	)
	left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
WHERE
	(
		(
			`mec_buy_offlineorder`.`ORDERSTATE` IN (4, 5, 6, 8)
		)
		AND (
			`mec_buy_offlineorder`.`IFRETURN` = 0
		)
		AND (
			`mec_buy_offlineorder`.`POSDEALNUM` IS NOT NULL
		)
	);










drop view mec_vi_ret_returnable_paylist_raw;
create view mec_vi_ret_returnable_paylist_raw as
select
mec_audit_pay.GROUPCODE,
mec_audit_pay.ORDERCODE,
mec_audit_pay.ISONLINEORDER,
mec_audit_pay.IFRETURN,
hsy_paymode.PAYMODECODE,
hsy_paymode.PAYMODENAME,
mec_audit_pay.AMT,
mec_audit_pay.CARDCODE,
mec_audit_pay.PORTNO,
mec_audit_pay.BANKCARDCODE,
mec_buy_offlineorder.POSTRANSCODE,
mec_buy_offlineorder.STORECODE
from
mec_audit_pay
join hsy_paymode on mec_audit_pay.PAYCODE=hsy_paymode.PAYMODECODE
join mec_buy_offlineorder on mec_audit_pay.ORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where mec_buy_offlineorder.IFRETURN=0

union ALL

select
mec_audit_pay.GROUPCODE,
mec_audit_pay.ORDERCODE,
mec_audit_pay.ISONLINEORDER,
mec_audit_pay.IFRETURN,
hsy_paymode.PAYMODECODE,
hsy_paymode.PAYMODENAME,
mec_audit_pay.AMT,
mec_audit_pay.CARDCODE,
mec_audit_pay.PORTNO,
mec_audit_pay.BANKCARDCODE,
mec_buy_offlinegroup.POSTRANSCODE,
mec_buy_offlinegroup.STORECODE
from
mec_audit_pay
join hsy_paymode on mec_audit_pay.PAYCODE=hsy_paymode.PAYMODECODE
join mec_buy_offlinegroup on mec_audit_pay.GROUPCODE=mec_buy_offlinegroup.OFFLINEGROUPCODE
where mec_buy_offlinegroup.IFRETURN=0

union all

select
mec_audit_pay.GROUPCODE,
mec_audit_pay.ORDERCODE,
mec_audit_pay.ISONLINEORDER,
mec_audit_pay.IFRETURN,
hsy_paymode.PAYMODECODE,
hsy_paymode.PAYMODENAME,
mec_audit_pay.AMT,
mec_audit_pay.CARDCODE,
mec_audit_pay.PORTNO,
mec_audit_pay.BANKCARDCODE,
mec_buy_onlineorder.POSTRANSCODE,
mec_buy_onlineorder.STORECODE
from
mec_audit_pay
join hsy_paymode on mec_audit_pay.PAYCODE=hsy_paymode.PAYMODECODE
join mec_buy_onlineorder on mec_audit_pay.ORDERCODE=mec_buy_onlineorder.ONLINEORDERCODE
where mec_buy_onlineorder.IFRETURN=0;







drop view mec_vi_ret_returnable_paylist;
create view mec_vi_ret_returnable_paylist as
select * from  mec_vi_ret_returnable_paylist_raw ORDER BY POSTRANSCODE, ORDERCODE;









#所有线下退货单的退货详情
drop view mec_vi_ret_offlinecontent_total;
create view mec_vi_ret_offlinecontent_total as
select
mec_buy_offlinecontent.COUNTERCODE,
mec_buy_offlinecontent.ITEMCODE,
mec_buy_offlinecontent.NUM,
mec_buy_offlinecontent.OFFLINECONTENTCODE,
mec_buy_offlinecontent.OFFLINEORDERCODE,
mec_buy_offlinecontent.ORIGINCONTENTCODE,
mec_buy_offlinecontent.ORIGINORDERCODE,
mec_buy_offlinecontent.PROMOTIONMARK,
mec_buy_offlinecontent.RETAILAMT,
mec_buy_offlinecontent.SKCCODE,
mec_buy_offlinecontent.UNITPRICE,
mec_buy_offlineorder.ORDERSTATE,
mec_buy_offlineorder.PLACETIME,
mec_buy_offlineorder.STORECODE,
mec_buy_offlineorder.RETUSERCODE,
mec_buy_offlineorder.RETBACKCOUPON,
mec_buy_offlineorder.RETORIPOSTRANSCODE,
mec_buy_offlineorder.RECEIVABLEAMT,
mec_itm_skc.COLOR,
mec_itm_skc.SIZE,
mec_itm_skc.MERCHANTSKCCODE,
mec_itm_item.BARCODE AS BARCODE,
mec_itm_item.ITEMNAME AS ITEMNAME,
mec_itm_item.ITEMSHORTNAME AS ITEMSHORTNAME,
mec_itm_item.BRANDCODE AS BRANDCODE,
mec_itm_item.UNIT AS UNIT,
hct_brand.BRANDNAME AS BRANDNAME
from
mec_buy_offlinecontent
left join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
left join mec_itm_item on mec_buy_offlinecontent.ITEMCODE=mec_itm_item.ITEMCODE
left join mec_itm_skc on mec_buy_offlinecontent.SKCCODE=mec_itm_skc.SKCCODE
left join hct_brand on mec_itm_item.BRANDCODE=hct_brand.BRANDCODE
where mec_buy_offlinecontent.IFRETURN=1;









#所有线下退货单到柜台信息raw
drop view mec_vi_ret_offlineorder_total_raw;
create view mec_vi_ret_offlineorder_total_raw as
select
mec_buy_offlinecontent.COUNTERCODE,
mec_buy_offlineorder.OFFLINEORDERCODE,
mec_buy_offlineorder.ORDERSTATE,
mec_buy_offlineorder.PLACETIME,
mec_buy_offlineorder.STORECODE,
mec_buy_offlineorder.RETUSERCODE,
mec_buy_offlineorder.RETBACKCOUPON,
mec_buy_offlineorder.RETORIPOSTRANSCODE,
mec_buy_offlineorder.RECEIVABLEAMT
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where mec_buy_offlinecontent.IFRETURN=1
group by mec_buy_offlinecontent.OFFLINEORDERCODE, mec_buy_offlinecontent.COUNTERCODE;








#所有线下退货单到柜台信息
drop view mec_vi_ret_offlineorder_total;
create view mec_vi_ret_offlineorder_total as
select
* ,
case when count(mec_vi_ret_offlineorder_total_raw.COUNTERCODE)=1 then 0 else 1 end as ISMULTICOUNTERS
from
mec_vi_ret_offlineorder_total_raw
group by mec_vi_ret_offlineorder_total_raw.OFFLINEORDERCODE;













# 柜内用户购买的订单记录
drop view mec_vi_order_counter_userbuy;
create view mec_vi_order_counter_userbuy as
select
mec_vi_offline_order_total.COUNTERCODE,
mec_vi_offline_order_total.SALESMANCODE,
mec_vi_offline_order_total.RECEIVABLEAMT,
mec_vi_offline_order_total.RECEIVABLEAMT2,
mec_vi_offline_order_total.DELIVERYMODE,
mec_vi_offline_order_total.OFFLINEORDERCODE as ORDERCODE,
mec_vi_offline_order_total.ORDERSTATE,
mec_vi_offline_order_total.PAYMENTMODE,
mec_vi_offline_order_total.PAYTIME,
mec_vi_offline_order_total.PLACETIME,
mec_vi_offline_order_total.VIPCARDNO,
mec_ctm_customer.USERCODE,
mec_ctm_customer.TELEPHONE,
mec_ctm_customer.VIPCODE
from mec_vi_offline_order_total join mec_ctm_customer on mec_vi_offline_order_total.USERCODE = mec_ctm_customer.USERCODE
where IFRETURN=0 and ORDERSTATE between 0 and 8

union ALL

select
mec_vi_online_order_total_forassistant.COUNTERCODE,
mec_vi_online_order_total_forassistant.SALESMANCODE,
mec_vi_online_order_total_forassistant.RECEIVABLEAMT,
null as RECEIVABLEAMT2,
mec_vi_online_order_total_forassistant.DELIVERYMODE,
mec_vi_online_order_total_forassistant.ONLINEORDERCODE AS ORDERCODE,
mec_vi_online_order_total_forassistant.ORDERSTATE,
mec_vi_online_order_total_forassistant.PAYMENTMODE,
mec_vi_online_order_total_forassistant.PAYTIME,
mec_vi_online_order_total_forassistant.PLACETIME,
mec_vi_online_order_total_forassistant.VIPCARDNO,
mec_ctm_customer.USERCODE,
mec_ctm_customer.TELEPHONE,
mec_ctm_customer.VIPCODE
from mec_vi_online_order_total_forassistant join mec_ctm_customer on mec_vi_online_order_total_forassistant.USERCODE = mec_ctm_customer.USERCODE
where IFRETURN=0 and ORDERSTATE between 0 and 8;