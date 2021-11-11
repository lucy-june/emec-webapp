drop trigger mec_tr_adm_admin_afterinsert;
create trigger mec_tr_adm_admin_afterinsert
after insert on mec_adm_admin
for each row
begin
insert into mec_adm_admin_log(USERCODE,ROLE,DEPTCODE,COUNTERCODE,TELEPHONE,EMAIL,NAME,GENDER,HASH,SALT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.USERCODE,new.ROLE,new.DEPTCODE,new.COUNTERCODE,new.TELEPHONE,new.EMAIL,new.NAME,new.GENDER,new.HASH,new.SALT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_adm_admin_afterupdate;
create trigger mec_tr_adm_admin_afterupdate
after update on mec_adm_admin
for each row
begin
insert into mec_adm_admin_log(USERCODE,ROLE,DEPTCODE,COUNTERCODE,TELEPHONE,EMAIL,NAME,GENDER,HASH,SALT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.USERCODE,new.ROLE,new.DEPTCODE,new.COUNTERCODE,new.TELEPHONE,new.EMAIL,new.NAME,new.GENDER,new.HASH,new.SALT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;



-- drop trigger mec_tr_adm_assistant_afterinsert;
-- create trigger mec_tr_adm_assistant_afterinsert
-- after insert on mec_hsy_salesman
-- for each row
-- begin
-- insert into mec_adm_assistant_log(ASSISTANTID,COUNTERCODE,NAME,GENDER,IDNUMBER,TELEPHONE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ASSISTANTID,new.COUNTERCODE,new.NAME,new.GENDER,new.IDNUMBER,new.TELEPHONE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
-- end
--
-- drop trigger mec_tr_adm_assistant_afterupdate;
-- create trigger mec_tr_adm_assistant_afterupdate
-- after update on mec_hsy_salesman
-- for each row
-- begin
-- insert into mec_adm_assistant_log(ASSISTANTID,COUNTERCODE,NAME,GENDER,IDNUMBER,TELEPHONE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ASSISTANTID,new.COUNTERCODE,new.NAME,new.GENDER,new.IDNUMBER,new.TELEPHONE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
-- end



drop trigger mec_tr_anl_hotbuy_afterinsert;
create trigger mec_tr_anl_hotbuy_afterinsert
after insert on mec_anl_hotbuy
for each row
begin
insert into mec_anl_hotbuy_log(_ID,ITEMCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.ITEMCODE,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_anl_hotbuy_afterupdate;
create trigger mec_tr_anl_hotbuy_afterupdate
after update on mec_anl_hotbuy
for each row
begin
insert into mec_anl_hotbuy_log(_ID,ITEMCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.ITEMCODE,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;




drop trigger mec_tr_anl_hotsearch_afterinsert;
create trigger mec_tr_anl_hotsearch_afterinsert
after insert on mec_anl_hotsearch
for each row
begin
insert into mec_anl_hotsearch_log(_ID,KEYWORD,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.KEYWORD,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_anl_hotsearch_afterupdate;
create trigger mec_tr_anl_hotsearch_afterupdate
after update on mec_anl_hotsearch
for each row
begin
insert into mec_anl_hotsearch_log(_ID,KEYWORD,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.KEYWORD,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;



drop trigger mec_tr_anl_hotbrand_afterinsert;
create trigger mec_tr_anl_hotbrand_afterinsert
after insert on mec_anl_hotbrand
for each row
begin
insert into mec_anl_hotbrand_log(_ID,BRANDCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.BRANDCODE,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_anl_hotbrand_afterupdate;
create trigger mec_tr_anl_hotbrand_afterupdate
after update on mec_anl_hotbrand
for each row
begin
insert into mec_anl_hotbrand_log(_ID,BRANDCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.BRANDCODE,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;




drop trigger mec_tr_itm_category_afterinsert;
create trigger mec_tr_itm_category_afterinsert
after insert on mec_itm_category
for each row
begin
insert into mec_itm_category_log(CATEGORYID,CATEGORYNAME,SUPERCATEGORYID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.CATEGORYID,new.CATEGORYNAME,new.SUPERCATEGORYID,new.IMGURL,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop  trigger mec_tr_itm_category_afterupdate;
create trigger mec_tr_itm_category_afterupdate
after update on mec_itm_category
for each row
begin
insert into mec_itm_category_log(CATEGORYID,CATEGORYNAME,SUPERCATEGORYID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.CATEGORYID,new.CATEGORYNAME,new.SUPERCATEGORYID,new.IMGURL,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;




drop trigger mec_tr_itm_region_afterinsert;
create trigger mec_tr_itm_region_afterinsert
after insert on mec_itm_region
for each row
begin
insert into mec_itm_region_log(REGIONID,REGIONNAME,SUPERREGIONID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.REGIONID,new.REGIONNAME,new.SUPERREGIONID,new.IMGURL,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_region_afterupdate;
create trigger mec_tr_itm_region_afterupdate
after update on mec_itm_region
for each row
begin
insert into mec_itm_region_log(REGIONID,REGIONNAME,SUPERREGIONID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.REGIONID,new.REGIONNAME,new.SUPERREGIONID,new.IMGURL,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;



drop trigger mec_tr_itm_paramtemplate_afterinsert;
create trigger mec_tr_itm_paramtemplate_afterinsert
after insert on mec_itm_paramtemplate
for each row
begin
insert into mec_itm_paramtemplate_log(_ID,CATEGORYID,ATTRIBUTE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.CATEGORYID,new.ATTRIBUTE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_paramtemplate_afterupdate;
create trigger mec_tr_itm_paramtemplate_afterupdate
after update on mec_itm_paramtemplate
for each row
begin
insert into mec_itm_paramtemplate_log(_ID,CATEGORYID,ATTRIBUTE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.CATEGORYID,new.ATTRIBUTE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;



drop trigger mec_tr_lgt_package_afterinsert;
create trigger mec_tr_lgt_package_afterinsert
after insert on mec_lgt_package
for each row
begin
insert into mec_lgt_package_log(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.PACKAGECODE,new.ORDERCODE,new.ISONLINEORDER,new.PAYMENTMODE,new.DELIVERYMODE,new.DELIVERYDEPTCODE,new.DEPTCODE,new.COUNTERCODE,new.PACKAGESTATE,new.POSITIONCODE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_lgt_package_afterupdate;
create trigger mec_tr_lgt_package_afterupdate
after update on mec_lgt_package
for each row
begin
insert into mec_lgt_package_log(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.PACKAGECODE,new.ORDERCODE,new.ISONLINEORDER,new.PAYMENTMODE,new.DELIVERYMODE,new.DELIVERYDEPTCODE,new.DEPTCODE,new.COUNTERCODE,new.PACKAGESTATE,new.POSITIONCODE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;




drop trigger mec_tr_itm_stock_afterinsert;
create trigger mec_tr_itm_stock_afterinsert
after insert on mec_itm_stock
for each row
begin
insert into mec_itm_stock_log(_ID,SKCCODE,COUNTERCODE,AMOUNT,DELTA,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.SKCCODE,new.COUNTERCODE,new.AMOUNT,new.AMOUNT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_stock_afterupdate;
create trigger mec_tr_itm_stock_afterupdate
after update on mec_itm_stock
for each row
begin
insert into mec_itm_stock_log(_ID,SKCCODE,COUNTERCODE,AMOUNT,DELTA,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.SKCCODE,new.COUNTERCODE,new.AMOUNT,cast(new.AMOUNT as signed)-cast(old.AMOUNT as signed),new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;























drop trigger mec_tr_itm_imgdetail_tmp_afterinsert;
create trigger mec_tr_itm_imgdetail_tmp_afterinsert
after insert on mec_itm_imgdetail_tmp
for each row
begin
insert into mec_itm_imgdetail_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_imgdetail_tmp_afterupdate;
create trigger mec_tr_itm_imgdetail_tmp_afterupdate
after update on mec_itm_imgdetail_tmp
for each row
begin
insert into mec_itm_imgdetail_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;




drop trigger mec_tr_itm_imgpreview_tmp_afterinsert;
create trigger mec_tr_itm_imgpreview_tmp_afterinsert
after insert on mec_itm_imgpreview_tmp
for each row
begin
insert into mec_itm_imgpreview_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop  trigger mec_tr_itm_imgpreview_tmp_afterupdate;
create trigger mec_tr_itm_imgpreview_tmp_afterupdate
after update on mec_itm_imgpreview_tmp
for each row
begin
insert into mec_itm_imgpreview_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;




drop trigger mec_tr_itm_item_tmp1_afterinsert;
create trigger mec_tr_itm_item_tmp1_afterinsert
after insert on mec_itm_item_tmp1
for each row
begin
insert into mec_itm_item_log1(_ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt)
values(new.ID,new.ITEMCODE,new.BARCODE,new.ITEMNAME,new.ITEMSHORTNAME,new.BRANDCODE,new.RETAILTYPECODE,new.ITEMTYPECODE,new.MERCHANTCODE,new.BUSINESSMODE,new.PRODUCINGAREA,new.PRICE,new.TEMPPRICE,new.TAXRATE,new.EXCISERATE,new.RETURNGOODS,new.SALESTATE,new.NETWEIGHT,new.GROSSWEIGHT,new.SPECIFICATION,new.PRODUCTCODE,new.GRADE,new.COLOR,new.CASING,new.DIMENSION,new.VOLUME,new.ITEMCODETYPE,new.UNIT,new.LASTPURCHASEPRICE,new.PURCHASETAXRATE,new.SAFESTOCK,new.MAXSTOCK,new.MINSTOCK,new.MAXORDER,new.MINORDER,new.PROPERTY,new.CHECKSTATE,new.ERRORINFO,new.INPUTPERSON,new.AGENTCODE,new.TERM,new.ISCONSIDERSTOCK,new.ISALLOWONLINE,new.ISALLOWNEGATIVE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_item_tmp1_afterupdate;
create trigger mec_tr_itm_item_tmp1_afterupdate
after update on mec_itm_item_tmp1
for each row
begin
insert into mec_itm_item_log1(_ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt)
values(new.ID,new.ITEMCODE,new.BARCODE,new.ITEMNAME,new.ITEMSHORTNAME,new.BRANDCODE,new.RETAILTYPECODE,new.ITEMTYPECODE,new.MERCHANTCODE,new.BUSINESSMODE,new.PRODUCINGAREA,new.PRICE,new.TEMPPRICE,new.TAXRATE,new.EXCISERATE,new.RETURNGOODS,new.SALESTATE,new.NETWEIGHT,new.GROSSWEIGHT,new.SPECIFICATION,new.PRODUCTCODE,new.GRADE,new.COLOR,new.CASING,new.DIMENSION,new.VOLUME,new.ITEMCODETYPE,new.UNIT,new.LASTPURCHASEPRICE,new.PURCHASETAXRATE,new.SAFESTOCK,new.MAXSTOCK,new.MINSTOCK,new.MAXORDER,new.MINORDER,new.PROPERTY,new.CHECKSTATE,new.ERRORINFO,new.INPUTPERSON,new.AGENTCODE,new.TERM,new.ISCONSIDERSTOCK,new.ISALLOWONLINE,new.ISALLOWNEGATIVE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;



drop trigger mec_tr_itm_item_tmp2_afterinsert;
create trigger mec_tr_itm_item_tmp2_afterinsert
after insert on mec_itm_item_tmp2
for each row
begin
insert into mec_itm_item_log2(_ID,ITEMCODE,TITLE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.ITEMCODE,new.TITLE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_item_tmp2_afterupdate;
create trigger mec_tr_itm_item_tmp2_afterupdate
after update on mec_itm_item_tmp2
for each row
begin
insert into mec_itm_item_log2(_ID,ITEMCODE,TITLE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.ITEMCODE,new.TITLE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;





drop trigger mec_tr_itm_itemcategory_tmp_afterinsert;
create trigger mec_tr_itm_itemcategory_tmp_afterinsert
after insert on mec_itm_itemcategory_tmp
for each row
begin
insert into mec_itm_itemcategory_log(_ID,__ID,ITEMCODE,CATEGORYID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.CATEGORYID,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_itemcategory_tmp_afterupdate;
create trigger mec_tr_itm_itemcategory_tmp_afterupdate
after update on mec_itm_itemcategory_tmp
for each row
begin
insert into mec_itm_itemcategory_log(_ID,__ID,ITEMCODE,CATEGORYID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.CATEGORYID,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;





drop trigger mec_tr_itm_itemregion_tmp_afterinsert;
create trigger mec_tr_itm_itemregion_tmp_afterinsert
after insert on mec_itm_itemregion_tmp
for each row
begin
insert into mec_itm_itemregion_log(_ID,__ID,ITEMCODE,REGIONID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.REGIONID,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_itemregion_tmp_afterupdate;
create trigger mec_tr_itm_itemregion_tmp_afterupdate
after update on mec_itm_itemregion_tmp
for each row
begin
insert into mec_itm_itemregion_log(_ID,__ID,ITEMCODE,REGIONID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.REGIONID,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;





drop trigger mec_tr_itm_parameter_tmp_afterinsert;
create trigger mec_tr_itm_parameter_tmp_afterinsert
after insert on mec_itm_parameter_tmp
for each row
begin
insert into mec_itm_parameter_log(_ID,__ID,ITEMCODE,ATTRIBUTE,VALUE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.ATTRIBUTE,new.VALUE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_parameter_tmp_afterupdate;
create trigger mec_tr_itm_parameter_tmp_afterupdate
after update on mec_itm_parameter_tmp
for each row
begin
insert into mec_itm_parameter_log(_ID,__ID,ITEMCODE,ATTRIBUTE,VALUE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.ATTRIBUTE,new.VALUE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;






drop trigger mec_tr_itm_skc_tmp_afterinsert;
create trigger mec_tr_itm_skc_tmp_afterinsert
after insert on mec_itm_skc_tmp
for each row
begin
insert into mec_itm_skc_log(_ID,SKCCODE,ITEMCODE,MERCHANTSKCCODE,SIZE,COLOR,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.SKCCODE,new.ITEMCODE,new.MERCHANTSKCCODE,new.SIZE,new.COLOR,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_itm_skc_tmp_afterupdate;
create trigger mec_tr_itm_skc_tmp_afterupdate
after update on mec_itm_skc_tmp
for each row
begin
insert into mec_itm_skc_log(_ID,SKCCODE,ITEMCODE,MERCHANTSKCCODE,SIZE,COLOR,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.SKCCODE,new.ITEMCODE,new.MERCHANTSKCCODE,new.SIZE,new.COLOR,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end;






drop trigger mec_tr_prm_rule_tmp_afterinsert;
create trigger mec_tr_prm_rule_tmp_afterinsert
after insert on mec_prm_rule_tmp
for each row
begin
insert into mec_prm_rule_log(_ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.RULEID,new.RULENAME,new.RULEDESCRIPTION,new.RULESCRIPT,new.`DATE-EFFECTIVE`,new.`DATE-EXPIRES`,new.SALIENCE,new.DEPTCODE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;

drop trigger mec_tr_prm_rule_tmp_afterupdate;
create trigger mec_tr_prm_rule_tmp_afterupdate
after update on mec_prm_rule_tmp
for each row
begin
insert into mec_prm_rule_log(_ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.RULEID,new.RULENAME,new.RULEDESCRIPTION,new.RULESCRIPT,new.`DATE-EFFECTIVE`,new.`DATE-EXPIRES`,new.SALIENCE,new.DEPTCODE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end;
























-- #添加线下订单content
-- drop trigger mec_tr_buy_offlinecontent_insert;
-- create trigger mec_tr_buy_offlinecontent_insert
-- after insert on mec_buy_offlinecontent
-- for each row
-- begin
-- #update mec_itm_stock set AMOUNT=cast(AMOUNT as signed)-cast(new.NUM as signed) where SKCCODE=new .SKCCODE and COUNTERCODE=new.COUNTERCODE;
-- 
-- #考虑到事务中order,content同时提交,提交前select也可以select到为提交的order行数据
-- declare ctcode char(6);
-- IF new.IFRETURN=0 THEN
-- IF new.SKCCODE is not null THEN
-- select
-- mec_buy_offlineorder.COUNTERCODE
-- into ctcode
-- FROM
-- mec_buy_offlinecontent join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
-- where OFFLINECONTENTCODE=new.OFFLINECONTENTCODE limit 1;
-- update mec_itm_stock set LASTOPERATEPERSON="system",AMOUNT=cast(AMOUNT as signed)-cast(new.NUM as signed) where SKCCODE=new .SKCCODE and COUNTERCODE=ctcode;
-- END IF;
-- END IF;
-- 
-- end;







-- #添加线上订单content
-- drop trigger mec_tr_buy_onlinecontent_insert;
-- create trigger mec_tr_buy_onlinecontent_insert
-- after insert on mec_buy_onlinecontent
-- for each row
-- begin
--        IF new.IFRETURN=0 THEN
--        update mec_itm_stock set LASTOPERATEPERSON="system",AMOUNT=cast(AMOUNT as signed)-cast(new.NUM as signed) where SKCCODE=new .SKCCODE and COUNTERCODE=new.COUNTERCODE;
--        END IF;
-- end;







#线上订单状态改变
drop trigger mec_tr_mec_onlineorder_state_change;
create trigger mec_tr_mec_onlineorder_state_change
after update on mec_buy_onlineorder
for each row
begin

#record state change write log
IF new.ORDERSTATE!=old.ORDERSTATE THEN
insert into mec_buy_onlineorder_log(ONLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.ONLINEORDERCODE,new.ORDERSTATE,now(),now());

#rollback stock
IF old.ORDERSTATE NOT in (9,10,11,12) AND new.ORDERSTATE in (9,10,11,12) AND (new.IFRETURN=0) THEN
update mec_itm_stock
set
LASTOPERATEPERSON="system",
mec_itm_stock.AMOUNT=
mec_itm_stock.AMOUNT+
(
select
mec_buy_onlinecontent.NUM
from
mec_buy_onlinecontent
where SKCCODE is not null  and mec_buy_onlinecontent.ONLINEORDERCODE=new.ONLINEORDERCODE  and mec_buy_onlinecontent.SKCCODE=mec_itm_stock.SKCCODE and mec_buy_onlinecontent.COUNTERCODE=mec_itm_stock.COUNTERCODE
)
where
(
mec_itm_stock.SKCCODE,
mec_itm_stock.COUNTERCODE
)
IN
(
select
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.COUNTERCODE
from
mec_buy_onlinecontent
where SKCCODE is not null  and mec_buy_onlinecontent.ONLINEORDERCODE=new.ONLINEORDERCODE
);


#rollforward stock
ELSEIF (old.ORDERSTATE in (9,10,11,12)) AND (new.ORDERSTATE=2) AND (new.IFRETURN=0) THEN
update mec_itm_stock
set
LASTOPERATEPERSON="system",
mec_itm_stock.AMOUNT=
mec_itm_stock.AMOUNT-
(
select
mec_buy_onlinecontent.NUM
from
mec_buy_onlinecontent
where SKCCODE is not null  and mec_buy_onlinecontent.ONLINEORDERCODE=new.ONLINEORDERCODE  and mec_buy_onlinecontent.SKCCODE=mec_itm_stock.SKCCODE and mec_buy_onlinecontent.COUNTERCODE=mec_itm_stock.COUNTERCODE
)
where
(
mec_itm_stock.SKCCODE,
mec_itm_stock.COUNTERCODE
)
IN
(
select
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.COUNTERCODE
from
mec_buy_onlinecontent
where SKCCODE is not null  and mec_buy_onlinecontent.ONLINEORDERCODE=new.ONLINEORDERCODE
);


#addback stock for return order
ELSEIF (old.ORDERSTATE<>101) AND (new.ORDERSTATE=101) AND (new.IFRETURN=1) THEN
update mec_itm_stock
set
LASTOPERATEPERSON="system",
mec_itm_stock.AMOUNT=
mec_itm_stock.AMOUNT+
(
select
mec_buy_onlinecontent.NUM
from
mec_buy_onlinecontent
where SKCCODE is not null  and mec_buy_onlinecontent.ONLINEORDERCODE=new.ONLINEORDERCODE  and mec_buy_onlinecontent.SKCCODE=mec_itm_stock.SKCCODE and mec_buy_onlinecontent.COUNTERCODE=mec_itm_stock.COUNTERCODE
)
where
(
mec_itm_stock.SKCCODE,
mec_itm_stock.COUNTERCODE
)
IN
(
select
mec_buy_onlinecontent.SKCCODE,
mec_buy_onlinecontent.COUNTERCODE
from
mec_buy_onlinecontent
where SKCCODE is not null  and mec_buy_onlinecontent.ONLINEORDERCODE=new.ONLINEORDERCODE
);



#assistant confirm online order - generate package
ELSEIF (new.ORDERSTATE=3&&(new.PAYMENTMODE!=0||new.DELIVERYMODE!=0)) THEN
insert into mec_lgt_package(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,LASTOPERATEPERSON,createdAt,updatedAt,PLACEORDERTIME)
select
concat(mec_buy_onlineorder.ONLINEORDERCODE,'-',mec_buy_onlinecontent.COUNTERCODE)as PACKAGECODE,
mec_buy_onlineorder.ONLINEORDERCODE as ORDERCODE,
1 as ISONLINEORDER,
mec_buy_onlineorder.PAYMENTMODE,
mec_buy_onlineorder.DELIVERYMODE,
mec_buy_onlineorder.DELIVERYDEPTCODE,
mec_hct_counter.STORECODE as DEPTCODE,
mec_buy_onlinecontent.COUNTERCODE,
0 as PACKAGESTATE,
'' as POSITIONCODE,
1 as RECORDSTATE,
null as LASTOPERATEPERSON,
now() as createdAt,
now() as updatedAt,
mec_buy_onlineorder.createdAt as PLACEORDERTIME
from
mec_buy_onlinecontent
join mec_buy_onlineorder on mec_buy_onlinecontent.ONLINEORDERCODE=mec_buy_onlineorder.ONLINEORDERCODE
join mec_hct_counter on mec_hct_counter.COUNTERCODE=mec_buy_onlinecontent.COUNTERCODE
where mec_buy_onlineorder.ONLINEORDERCODE=new.ONLINEORDERCODE
group by
mec_buy_onlineorder.ONLINEORDERCODE, mec_buy_onlinecontent.COUNTERCODE;

insert into mec_lgt_packagecontent(PACKAGECODE,CONTENTCODE,ISONLINEORDER,createdAt,updatedAt)
select
concat(mec_buy_onlineorder.ONLINEORDERCODE,'-',mec_buy_onlinecontent.COUNTERCODE)as PACKAGECODE,
mec_buy_onlinecontent.ONLINECONTENTCODE as CONTENTCODE,
1 as ISONLINEORDER,
now() as createdAt,
now() as updatedAt
from
mec_buy_onlinecontent
join mec_buy_onlineorder on mec_buy_onlinecontent.ONLINEORDERCODE=mec_buy_onlineorder.ONLINEORDERCODE
where mec_buy_onlineorder.ONLINEORDERCODE=new.ONLINEORDERCODE;


#assistant confirm online order(payment=0,delivery=0) - generate pickcounter
ELSEIF (new.ORDERSTATE=3&&(new.PAYMENTMODE=0 && new.DELIVERYMODE=0)) THEN
insert into mec_lgt_pickcounter (ORDERCODE,ISONLINEORDER,COUNTERCODE,PICKCODE,PICKSTATE,OPERATEPERSON,updatedAt,createdAt)
(
select
ONLINEORDERCODE as ORDERCODE,
1 as ISONLINEORDER,
COUNTERCODE as COUNTERCODE,
right('000000'+ltrim(cast(rand()*9000000 as dec(18,0))),6) as PICKCODE,
0 as PICKSTATE,
null as OPERATEPERSON,
now() as updatedAt,
now() as createdAt
from mec_buy_onlinecontent
where ONLINEORDERCODE=new.ONLINEORDERCODE group by ONLINEORDERCODE,COUNTERCODE  #'114113095567000315'
);

END IF;
END IF;
end;








#线下订单状态改变
drop trigger mec_tr_mec_offlineorder_state_change;
create trigger mec_tr_mec_offlineorder_state_change
after update on mec_buy_offlineorder
for each row
begin

#record state change write log
IF new.ORDERSTATE!=old.ORDERSTATE THEN
insert into mec_buy_offlineorder_log(OFFLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.OFFLINEORDERCODE,new.ORDERSTATE,now(),now());
END IF;

#rollback stock
IF old.ORDERSTATE not in (9,10,11) and new.ORDERSTATE in (9,10,11) THEN
update mec_itm_stock
set
LASTOPERATEPERSON="system",
mec_itm_stock.AMOUNT=
mec_itm_stock.AMOUNT+
(
select
mec_buy_offlinecontent.NUM
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where SKCCODE is not null  and mec_buy_offlinecontent.OFFLINEORDERCODE=new.OFFLINEORDERCODE  and mec_buy_offlinecontent.SKCCODE=mec_itm_stock.SKCCODE and mec_buy_offlineorder.COUNTERCODE=mec_itm_stock.COUNTERCODE
)
where
(
mec_itm_stock.SKCCODE,
mec_itm_stock.COUNTERCODE
)
IN
(
select
mec_buy_offlinecontent.SKCCODE,
mec_buy_offlineorder.COUNTERCODE
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where SKCCODE is not null  and mec_buy_offlinecontent.OFFLINEORDERCODE=new.OFFLINEORDERCODE
);


#rollforward stock
ELSEIF (old.ORDERSTATE in (9,10,11)) AND (new.ORDERSTATE=4) AND (new.IFRETURN=0) THEN
update mec_itm_stock
set
LASTOPERATEPERSON="system",
mec_itm_stock.AMOUNT=
mec_itm_stock.AMOUNT-
(
select
mec_buy_offlinecontent.NUM
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where SKCCODE is not null  and mec_buy_offlinecontent.OFFLINEORDERCODE=new.OFFLINEORDERCODE  and mec_buy_offlinecontent.SKCCODE=mec_itm_stock.SKCCODE and mec_buy_offlineorder.COUNTERCODE=mec_itm_stock.COUNTERCODE
)
where
(
mec_itm_stock.SKCCODE,
mec_itm_stock.COUNTERCODE
)
IN
(
select
mec_buy_offlinecontent.SKCCODE,
mec_buy_offlineorder.COUNTERCODE
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where SKCCODE is not null  and mec_buy_offlinecontent.OFFLINEORDERCODE=new.OFFLINEORDERCODE
);


#addback stock for return order
ELSEIF (old.ORDERSTATE<>101) AND (new.ORDERSTATE=101) AND (new.IFRETURN=1) THEN
update mec_itm_stock
set
LASTOPERATEPERSON="system",
mec_itm_stock.AMOUNT=
mec_itm_stock.AMOUNT+
(
select
mec_buy_offlinecontent.NUM
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where SKCCODE is not null  and mec_buy_offlinecontent.OFFLINEORDERCODE=new.OFFLINEORDERCODE  and mec_buy_offlinecontent.SKCCODE=mec_itm_stock.SKCCODE and mec_buy_offlinecontent.COUNTERCODE=mec_itm_stock.COUNTERCODE
)
where
(
mec_itm_stock.SKCCODE,
mec_itm_stock.COUNTERCODE
)
IN
(
select
mec_buy_offlinecontent.SKCCODE,
mec_buy_offlinecontent.COUNTERCODE
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where SKCCODE is not null  and mec_buy_offlinecontent.OFFLINEORDERCODE=new.OFFLINEORDERCODE
);



#customer pay offline order which need logistics- generate package
ELSEIF (old.ORDERSTATE<>4&&new.ORDERSTATE=4&&new.DELIVERYMODE=1) THEN
insert into mec_lgt_package(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,LASTOPERATEPERSON,createdAt,updatedAt,PLACEORDERTIME)
select
concat(mec_buy_offlineorder.OFFLINEORDERCODE,'-',mec_buy_offlineorder.COUNTERCODE)as PACKAGECODE,
mec_buy_offlineorder.OFFLINEORDERCODE as ORDERCODE,
0 as ISONLINEORDER,
mec_buy_offlineorder.PAYMENTMODE,
mec_buy_offlineorder.DELIVERYMODE,
hct_counter.STORECODE as DELIVERYDEPTCODE,
hct_counter.STORECODE as DEPTCODE,
mec_buy_offlineorder.COUNTERCODE,
0 as PACKAGESTATE,
'' as POSITIONCODE,
1 as RECORDSTATE,
null as LASTOPERATEPERSON,
now() as createdAt,
now() as updatedAt,
mec_buy_offlineorder.createdAt as PLACEORDERTIME
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
join hct_counter on hct_counter.COUNTERCODE=mec_buy_offlineorder.COUNTERCODE
left join mec_buy_offlinegroup on mec_buy_offlinegroup.OFFLINEGROUPCODE=mec_buy_offlineorder.OFFLINEGROUPCODE
where mec_buy_offlineorder.OFFLINEORDERCODE=new.OFFLINEORDERCODE    #"014072847427000000"
group by
mec_buy_offlineorder.OFFLINEORDERCODE, mec_buy_offlineorder.COUNTERCODE;

insert into mec_lgt_packagecontent(PACKAGECODE,CONTENTCODE,ISONLINEORDER,createdAt,updatedAt)
select
concat(mec_buy_offlineorder.OFFLINEORDERCODE,'-',mec_buy_offlineorder.COUNTERCODE)as PACKAGECODE,
mec_buy_offlinecontent.OFFLINECONTENTCODE as CONTENTCODE,
0 as ISONLINEORDER,
now() as createdAt,
now() as updatedAt
from
mec_buy_offlinecontent
join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where mec_buy_offlineorder.OFFLINEORDERCODE=new.OFFLINEORDERCODE;    #"014072847427000000"


#customer pay offline order which need pick,generate pickcounter code
ELSEIF (old.ORDERSTATE<>4&&new.ORDERSTATE=4&&new.DELIVERYMODE=0) THEN
insert into mec_lgt_pickcounter (ORDERCODE,ISONLINEORDER,COUNTERCODE,PICKCODE,PICKSTATE,OPERATEPERSON,updatedAt,createdAt)
values (new.OFFLINEORDERCODE,0,new.COUNTERCODE,right('000000'+ltrim(cast(rand()*9000000 as dec(18,0))),6),0,null,now(),now());


END IF;
end;









#线上订单创建
drop trigger mec_tr_mec_onlineorder_insert;
create trigger mec_tr_mec_onlineorder_insert
after insert on mec_buy_onlineorder
for each row
begin
insert into mec_buy_onlineorder_log(ONLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.ONLINEORDERCODE,new.ORDERSTATE,now(),now());
end;







#线下订单创建
drop trigger mec_tr_mec_offlineorder_insert;
create trigger mec_tr_mec_offlineorder_insert
after insert on mec_buy_offlineorder
for each row
begin
insert into mec_buy_offlineorder_log(OFFLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.OFFLINEORDERCODE,new.ORDERSTATE,now(),now());
end;






#ukey创建
drop trigger mec_tr_adm_ukey_afterinsert;
create trigger mec_tr_adm_ukey_afterinsert
after insert on mec_adm_ukey
for each row
begin
insert into mec_adm_ukey_log(KEYID,KEYTYPE,STATUS,KEYPATH,COUNTERCODE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.KEYID,new.KEYTYPE,new.STATUS,new.KEYPATH,new.COUNTERCODE,0,new.LASTOPERATEPERSON,now(),now());
end;






#ukey更新
drop trigger mec_tr_adm_ukey_afterupdate;
create trigger mec_tr_adm_ukey_afterupdate
after update on mec_adm_ukey
for each row
begin
insert into mec_adm_ukey_log(KEYID,KEYTYPE,STATUS,KEYPATH,COUNTERCODE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.KEYID,new.KEYTYPE,new.STATUS,new.KEYPATH,new.COUNTERCODE,2,new.LASTOPERATEPERSON,now(),now());
end;







#到柜插入-在库存表中添加记录
drop trigger mec_tr_itm_storeitem_afterinsert;
create trigger mec_tr_itm_storeitem_afterinsert
after insert on mec_itm_storeitem
for each row
begin
insert into mec_itm_stock(COUNTERCODE,SKCCODE,ISALLOWNEGATIVE,BUFFER) ( select new.COUNTERCODE as COUNTERCODE, mec_itm_skc.SKCCODE, new.ISALLOWNEGATIVE as ISALLOWNEGATIVE, new.BUFFER as BUFFER from mec_itm_skc where ITEMCODE=new.ITEMCODE );
end;





#skc插入-在库存表中添加记录
drop trigger mec_tr_itm_skc_afterinsert;
create trigger mec_tr_itm_skc_afterinsert
after insert on mec_itm_skc
for each row
begin
insert into mec_itm_stock(COUNTERCODE,SKCCODE,ISALLOWNEGATIVE,BUFFER) (select COUNTERCODE, new.SKCCODE as SKCCODE, ISALLOWNEGATIVE, BUFFER from mec_itm_storeitem where ITEMCODE=new.ITEMCODE);
end;