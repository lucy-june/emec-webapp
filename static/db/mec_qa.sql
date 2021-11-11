/*
Navicat MySQL Data Transfer

Source Server         : abc
Source Server Version : 50536
Source Host           : 202.120.40.140:3306
Source Database       : mec_qa

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-03-14 13:41:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hct_brand`
-- ----------------------------
DROP TABLE IF EXISTS `hct_brand`;
                          CREATE TABLE `hct_brand` (
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BRANDNAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CURRENTGRADE`  float(38,0) NULL DEFAULT NULL ,
`BRANDSTATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' ,
`FAMOUSCOMMENT`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ORIGIN`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`QUALITYCOMMENT`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`STYLECOMMENT`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`EXPERTCOMMENT`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`IMAGECOMMENT`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`HISTORY`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`POTENTIAL`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`OVERLAY`  float(5,2) NULL DEFAULT NULL ,
`BRANDCLASS`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECOMMENDMAN`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PRICELEVEL`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`REGISTERCAPITAL`  float(10,0) NULL DEFAULT NULL ,
`STOREYEARTURNOVER`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DESIGNPRODUCE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`AGENTSTRATEGY`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`IMAGECOUNTER`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DEALAREA`  float(6,2) NULL DEFAULT NULL ,
`SAMPLE`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`FUTURESALE`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`REMARK`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTDATE`  date NULL DEFAULT NULL ,
`CHECKPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHECKDATE`  date NULL DEFAULT NULL ,
PRIMARY KEY (`BRANDCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_hct_counter`
-- ----------------------------
DROP TABLE IF EXISTS `mec_hct_counter`;
CREATE TABLE `mec_hct_counter` (
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`COUNTERNAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`AGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUNTERLOCATIONCODE`  char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUNTERSTATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`STAFFCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BUSINESSTYPE`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`STORECODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUNTERTYPE`  float(1,0) NULL DEFAULT 0 ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTDATE`  date NULL DEFAULT NULL ,
`CHECKPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHECKDATE`  date NULL DEFAULT NULL ,
`SURROGATEMODE`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKNAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKACCOUNTNO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKNO`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GATHERINGADDRESS`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECKONAGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECKONLOCATIONCODE`  char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GRADE`  varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'C2' ,
PRIMARY KEY (`COUNTERCODE`),
INDEX `MERCHANTCODE` (`MERCHANTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hct_merchant`
-- ----------------------------
DROP TABLE IF EXISTS `hct_merchant`;
CREATE TABLE `hct_merchant` (
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MERCHANTNAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ALIAS`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LEGALPERSON`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COMPANYPROPERTY`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`REGISTEREDCAPITAL`  float(12,2) NULL DEFAULT NULL ,
`OPERTAIONBOUND`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`OPERTAIONZONE`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHANNEL`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`OPERTAIONMODE`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`FOUNDDATE`  date NULL DEFAULT NULL ,
`ENTRANCEDATE`  date NULL DEFAULT NULL ,
`TAXCODE`  varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COMPANYCODE`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKNAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKACCOUNTNO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LEGALPHONE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LEGALADDRESS`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`POSTALCODE`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MAILADDRESS`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`EMAIL`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`WEBSITE`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MERCHANTSTATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PURCHASETAXRATE`  float(4,2) NULL DEFAULT NULL ,
`WAREHOUSEADDRESS`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`FAX`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECOMMENDPERSON`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MERCHANTREMARK`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTDATE`  date NULL DEFAULT NULL ,
`CHECKPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHECKDATE`  date NULL DEFAULT NULL ,
PRIMARY KEY (`MERCHANTCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsl_promotion`
-- ----------------------------
DROP TABLE IF EXISTS `hsl_promotion`;
CREATE TABLE `hsl_promotion` (
`PROMOTIONID`  decimal(38,0) NULL DEFAULT NULL ,
`RULEID`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CONTENT`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`STARTTIME`  datetime NULL DEFAULT NULL ,
`ENDTIME`  datetime NULL DEFAULT NULL ,
`PROMOTIONSTATE`  decimal(1,0) NULL DEFAULT NULL ,
`DISCOUNTSTATE`  decimal(1,0) NULL DEFAULT NULL ,
`CLASSFILE`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`FILIALECODE`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DISCOUNTADDUP`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PRESENTSHAREADDUP`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_agent`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_agent`;
CREATE TABLE `hsy_agent` (
`AGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`AGENTNAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`STAFFCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`STATE`  float(1,0) NULL DEFAULT NULL ,
PRIMARY KEY (`AGENTCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_chargetype`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_chargetype`;
CREATE TABLE `hsy_chargetype` (
`CHARGETYPECODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHARGETYPENAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHARGEMODE`  decimal(1,0) NULL DEFAULT NULL ,
`TYPEBCODE`  decimal(4,0) NULL DEFAULT 1 ,
`TYPEACCODE`  decimal(4,0) NULL DEFAULT 1 ,
`TAXRATECODE`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '08' ,
`PRINTSTATE`  decimal(1,0) NULL DEFAULT 1 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_department`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_department`;
CREATE TABLE `hsy_department` (
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DEPTNAME`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DEPTSHORTNAME`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ADDRESSCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TELEPHONE`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`FAX`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MAILBOX`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MANAGER`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CONTACT`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DEPTTYPE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SUPERIORDEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`DEPTCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_itemtype`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_itemtype`;
CREATE TABLE `hsy_itemtype` (
`ITEMTYPECODE`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ITEMTYPENAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' ,
`EXCISERATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '07' ,
`PURCHASETAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' ,
PRIMARY KEY (`ITEMTYPECODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_paymode`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_paymode`;
CREATE TABLE `hsy_paymode` (
`PAYMODECODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PAYMODENAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ISCHARGE`  decimal(1,0) NULL DEFAULT NULL ,
`ISMAKEINVOICE`  decimal(1,0) NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_retailtype`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_retailtype`;
CREATE TABLE `hsy_retailtype` (
`RETAILTYPECODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RETAILTYPENAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`RETAILTYPECODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `hsy_taxrate`
-- ----------------------------
DROP TABLE IF EXISTS `hsy_taxrate`;
CREATE TABLE `hsy_taxrate` (
`TAXRATECODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TAXRATENAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TAXRATE`  float(3,2) NOT NULL ,
PRIMARY KEY (`TAXRATECODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `itm_item`
-- ----------------------------
DROP TABLE IF EXISTS `itm_item`;
CREATE TABLE `itm_item` (
`ITEMCODE`  char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BARCODE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ITEMNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ITEMSHORTNAME`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RETAILTYPECODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ITEMTYPECODE`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BUSINESSMODE`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PRODUCINGAREA`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`TEMPPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`TAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' ,
`EXCISERATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RETURNGOODS`  float(1,0) NULL DEFAULT NULL ,
`SALESTATE`  float(1,0) NULL DEFAULT NULL ,
`NETWEIGHT`  float(7,3) NULL DEFAULT NULL ,
`GROSSWEIGHT`  float(7,3) NULL DEFAULT NULL ,
`SPECIFICATION`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PRODUCTCODE`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GRADE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COLOR`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CASING`  float(5,0) NULL DEFAULT 1 ,
`DIMENSION`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`VOLUME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ITEMCODETYPE`  float(1,0) NOT NULL DEFAULT 0 ,
`UNIT`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LASTPURCHASEPRICE`  float(12,2) NULL DEFAULT NULL ,
`PURCHASETAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`SAFESTOCK`  float(5,0) NULL DEFAULT NULL ,
`MAXSTOCK`  float(5,0) NULL DEFAULT NULL ,
`MINSTOCK`  float(5,0) NULL DEFAULT NULL ,
`MAXORDER`  float(5,0) NULL DEFAULT NULL ,
`MINORDER`  float(5,0) NULL DEFAULT NULL ,
`PROPERTY`  float(1,0) NULL DEFAULT NULL ,
`CHECKSTATE`  float(1,0) NULL DEFAULT 2 ,
`ERRORINFO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`AGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TERM`  date NULL DEFAULT NULL ,
PRIMARY KEY (`ITEMCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `itm_storeitem`
-- ----------------------------
DROP TABLE IF EXISTS `itm_storeitem`;
CREATE TABLE `itm_storeitem` (
`ITEMCODE`  char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ID`  char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MEMBERPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`STORECHECKEDPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`STORETEMPPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`PROMOTIONMARK`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'X' ,
`DISCOUNTMARK`  float(1,0) NOT NULL DEFAULT 1 ,
`STORESALESTATE`  float(1,0) NULL DEFAULT NULL ,
`SAFESTOCK`  float(5,0) NULL DEFAULT 0 ,
`FULLSTOCK`  float(5,0) NULL DEFAULT 0 ,
`MAXSTOCK`  float(5,0) NULL DEFAULT 0 ,
`MINSTOCK`  float(5,0) NULL DEFAULT 0 ,
`MAXORDER`  float(5,0) NULL DEFAULT 0 ,
`MINORDER`  float(5,0) NULL DEFAULT 0 ,
`NEGATIVESTOCK`  float(1,0) NULL DEFAULT NULL ,
`TEMPDISTRIBUTIONMARK`  float(1,0) NULL DEFAULT 0 ,
`CHECKSTATE`  float(1,0) NULL DEFAULT NULL ,
`ERRORINFO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COSTMODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' ,
`DEDUCTAMT`  float(12,2) NOT NULL DEFAULT 0.00 ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `COUNTERCODE` (`COUNTERCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_adm_admin`
-- ----------------------------
DROP TABLE IF EXISTS `mec_adm_admin`;
CREATE TABLE `mec_adm_admin` (
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ROLE`  int(11) NOT NULL COMMENT '0-商城管理员 1-柜账号 2-业务员 3-物流管理员 9-超级管理员' ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TELEPHONE`  char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`EMAIL`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`NAME`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GENDER`  tinyint(1) NULL DEFAULT NULL ,
`HASH`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SALT`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 COMMENT '0-无效 1-有效' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`USERCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统管理员信息'

;

-- ----------------------------
-- Table structure for `mec_adm_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_adm_admin_log`;
CREATE TABLE `mec_adm_admin_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ROLE`  int(11) NOT NULL COMMENT '0-商城管理员 1-柜账号 2-业务员 3-物流管理员 9-超级管理员' ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TELEPHONE`  char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`EMAIL`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`NAME`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GENDER`  tinyint(1) NULL DEFAULT NULL ,
`HASH`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SALT`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统管理员信息'
AUTO_INCREMENT=37

;

-- ----------------------------
-- Table structure for `mec_hsy_salesman`
-- ----------------------------
DROP TABLE IF EXISTS `mec_hsy_salesman`;
CREATE TABLE `mec_hsy_salesman` (
`SALESMANCODE`  int(11) NOT NULL AUTO_INCREMENT ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`NAME`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`GENDER`  tinyint(1) NULL DEFAULT NULL ,
`IDNUMBER`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TELEPHONE`  char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`SALESMANCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Table structure for `mec_adm_assistant_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_adm_assistant_log`;
CREATE TABLE `mec_adm_assistant_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`SALESMANCODE`  int(11) NOT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`NAME`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`GENDER`  tinyint(1) NULL DEFAULT NULL ,
`IDNUMBER`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TELEPHONE`  char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=63

;

-- ----------------------------
-- Table structure for `mec_anl_hotbrand`
-- ----------------------------
DROP TABLE IF EXISTS `mec_anl_hotbrand`;
CREATE TABLE `mec_anl_hotbrand` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`WEIGHT`  int(11) NOT NULL DEFAULT 1 ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `mec_anl_hotbrand_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_anl_hotbrand_log`;
CREATE TABLE `mec_anl_hotbrand_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`WEIGHT`  int(11) NOT NULL DEFAULT 1 ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Table structure for `mec_anl_hotbuy`
-- ----------------------------
DROP TABLE IF EXISTS `mec_anl_hotbuy`;
CREATE TABLE `mec_anl_hotbuy` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL ,
`WEIGHT`  int(11) NOT NULL DEFAULT 1 ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `mec_anl_hotbuy_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_anl_hotbuy_log`;
CREATE TABLE `mec_anl_hotbuy_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`WEIGHT`  int(11) NOT NULL DEFAULT 1 ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Table structure for `mec_anl_hotsearch`
-- ----------------------------
DROP TABLE IF EXISTS `mec_anl_hotsearch`;
CREATE TABLE `mec_anl_hotsearch` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`KEYWORD`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`WEIGHT`  int(11) NOT NULL DEFAULT 1 ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `mec_anl_hotsearch_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_anl_hotsearch_log`;
CREATE TABLE `mec_anl_hotsearch_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`KEYWORD`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`WEIGHT`  int(11) NOT NULL DEFAULT 1 ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `mec_audit_charge`
-- ----------------------------
DROP TABLE IF EXISTS `mec_audit_charge`;
CREATE TABLE `mec_audit_charge` (
`CHARGEID`  int(11) NOT NULL AUTO_INCREMENT ,
`ISONLINEORDER`  int(1) NOT NULL ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CHARGECODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`AMT`  double NOT NULL COMMENT '费用金额（减免费用为负数；顾客应付费用为正数）' ,
`createdAt`  datetime NOT NULL ,
`updatedAt`  datetime NOT NULL ,
PRIMARY KEY (`CHARGEID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `mec_audit_discount`
-- ----------------------------
DROP TABLE IF EXISTS `mec_audit_discount`;
CREATE TABLE `mec_audit_discount` (
`DISCOUNTID`  int(11) NOT NULL AUTO_INCREMENT ,
`ISONLINEORDER`  int(1) NOT NULL ,
`GROUPCODE`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CONTENTCODE`  char(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DISCOUNTRESON`  int(11) NOT NULL ,
`DISCOUNTAMT`  decimal(12,2) NOT NULL ,
`VIPCARDTYPE`  int(11) NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL ,
`updatedAt`  datetime NOT NULL ,
PRIMARY KEY (`DISCOUNTID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `mec_audit_pay`
-- ----------------------------
DROP TABLE IF EXISTS `mec_audit_pay`;
CREATE TABLE `mec_audit_pay` (
`PAYID`  int(11) NOT NULL AUTO_INCREMENT ,
`PAYCODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ISONLINEORDER`  int(1) NOT NULL ,
`AMT`  double NOT NULL ,
`CARDCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PORTNO`  char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口号(10229--工行，30129--交行，10529--建行……)（线下）' ,
`BANKCARDCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '刷卡方式（外键）（手工、银联）（线下）' ,
`FEERATECODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL ,
`updatedAt`  datetime NOT NULL ,
PRIMARY KEY (`PAYID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `mec_bhv_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mec_bhv_comment`;
CREATE TABLE `mec_bhv_comment` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`CONTENTCODE`  char(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ISONLINEORDER`  int(1) NOT NULL ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`STARS`  int(1) NOT NULL DEFAULT 5 COMMENT '0-5颗星' ,
`COMMENT`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=39

;

-- ----------------------------
-- Table structure for `mec_bhv_favoritebrand`
-- ----------------------------
DROP TABLE IF EXISTS `mec_bhv_favoritebrand`;
CREATE TABLE `mec_bhv_favoritebrand` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `mec_bhv_favoriteitem`
-- ----------------------------
DROP TABLE IF EXISTS `mec_bhv_favoriteitem`;
CREATE TABLE `mec_bhv_favoriteitem` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=37

;

-- ----------------------------
-- Table structure for `mec_bhv_request`
-- ----------------------------
DROP TABLE IF EXISTS `mec_bhv_request`;
CREATE TABLE `mec_bhv_request` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`URL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `mec_bhv_search`
-- ----------------------------
DROP TABLE IF EXISTS `mec_bhv_search`;
CREATE TABLE `mec_bhv_search` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`KEYWORDS`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL ,
`updatedAt`  datetime NOT NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Table structure for `mec_buy_offlinecontent`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_offlinecontent`;
CREATE TABLE `mec_buy_offlinecontent` (
`OFFLINECONTENTCODE`  char(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`OFFLINEORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`NUM`  int(11) UNSIGNED NOT NULL ,
`UNITPRICE`  decimal(12,2) NOT NULL ,
`PROMOTIONMARK`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'X' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`FINALPRICELIST`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终过促销引擎后均摊价格' ,
`FINALRULELIST`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终适用规则，具体到每一个物品' ,
`FINALPRICELIST2`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼单付款的价格分摊' ,
`FINALRULELIST2`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼单付款的规则分摊' ,
`REALVIPCARDTYPE`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用该商品的实际vip卡类型' ,
`REALVIPDISCOUNT`  decimal(3,2) NULL DEFAULT NULL COMMENT '实际享受的vip折扣' ,
`RETAILAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '成交价（分摊后实际折后价）' ,
`RETAILAMT2`  decimal(12,2) NULL DEFAULT NULL COMMENT '拼单付款的成交价（分摊后实际折后价）' ,
`VIPDISCOUNTAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '汇金贵宾卡折扣' ,
`DISCOUNTOUTAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '支付前满减 - 折让' ,
`DISCOUNTINAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '赠券' ,
`PRESENTSHAREQTY`  decimal(12,2) NULL DEFAULT NULL COMMENT '赠礼' ,
`MERCHANTDISCOUTAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '供应商折扣' ,
`SHIPPRICECHARGESHARE`  decimal(12,2) NULL DEFAULT NULL COMMENT '运费差额均摊' ,
`PACKINGCHARGESHARE`  decimal(12,2) NULL DEFAULT NULL COMMENT '包装费差额均摊' ,
PRIMARY KEY (`OFFLINECONTENTCODE`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `ORDERID` (`OFFLINEORDERCODE`) USING BTREE ,
INDEX `SKCID` (`SKCCODE`) USING BTREE ,
INDEX `FINALRULE` (`FINALRULELIST`(255)) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_buy_offlinegroup`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_offlinegroup`;
CREATE TABLE `mec_buy_offlinegroup` (
`OFFLINEGROUPCODE`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PAYMENTMODE`  int(11) NOT NULL DEFAULT 0 COMMENT '0-现场支付，1-网上支付，3-到付' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`PAYMENTSTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-未支付 1-已经支付' ,
`FINALPRICE`  decimal(12,2) NULL DEFAULT NULL ,
`FINALRULESTRING`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TRANSID`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHRCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`POSDEALNUM`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos机交易序列号' ,
PRIMARY KEY (`OFFLINEGROUPCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_buy_offlineorder`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_offlineorder`;
CREATE TABLE `mec_buy_offlineorder` (
`OFFLINEORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`OFFLINEGROUPCODE`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TEMPDISTRIBUTIONMARK`  int(1) NOT NULL DEFAULT 0 COMMENT '临时销售标志 0-否 1-是' ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ORDERSTATE`  int(11) NOT NULL DEFAULT 0 COMMENT '见文档' ,
`PAYMENTMODE`  int(11) NULL DEFAULT NULL COMMENT '0-pos付款 1-网上付款' ,
`DELIVERYMODE`  int(11) NOT NULL DEFAULT 0 COMMENT '0-自提 1-物流配送' ,
`SITEID`  int(11) NULL DEFAULT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单最终自提货或发货点' ,
`STORECODE`  char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店号' ,
`SHIPPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '运费' ,
`PACKING`  decimal(12,2) NULL DEFAULT NULL COMMENT '包装费' ,
`SALESMANCODE`  int(11) NOT NULL COMMENT '下单营业员' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`FINALPRICE`  decimal(12,2) NULL DEFAULT NULL ,
`FINALRULESTRING`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`FINALPRICE2`  decimal(12,2) NULL DEFAULT NULL COMMENT '拼单付款的最终分摊价格' ,
`FINALRULESTRING2`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼单孵卵的规则分摊' ,
`TRANSID`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHRCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`VIPCARDNO`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贵宾卡卡号' ,
`RECEIVABLEAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '应收金额' ,
`PAYLOCAL`  int(11) NULL DEFAULT NULL COMMENT '0-pos机付款 1-app付款' ,
`POSDEALNUM`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos机交易序列号' ,
`POSCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos机号码' ,
`CASHIER`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收银员' ,
`REALSHIPPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '实付运费' ,
`REALPACKING`  decimal(12,2) NULL DEFAULT NULL COMMENT '实付包装费' ,
`PLACETIME`  date NULL DEFAULT NULL COMMENT '下单时间' ,
`AUDITTIME`  date NULL DEFAULT NULL COMMENT '订单审核时间' ,
`PAYTIME`  date NULL DEFAULT NULL COMMENT '订单支付时间' ,
`OUTTIME`  date NULL DEFAULT NULL COMMENT '订单出库时间' ,
`RECEIVABLETIME`  date NULL DEFAULT NULL COMMENT '货到付款收款时间' ,
`FINISHTIME`  date NULL DEFAULT NULL COMMENT '订单完成时间' ,
PRIMARY KEY (`OFFLINEORDERCODE`),
INDEX `USERID` (`USERCODE`) USING BTREE ,
INDEX `SITEID` (`SITEID`) USING BTREE ,
INDEX `DEPTCODE` (`COUNTERCODE`) USING BTREE ,
INDEX `PAYMENTGROUPID` (`OFFLINEGROUPCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_buy_offlineorder_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_offlineorder_log`;
CREATE TABLE `mec_buy_offlineorder_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`OFFLINEORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ORDERSTATE`  int(11) NOT NULL COMMENT '见文档' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3544

;

-- ----------------------------
-- Table structure for `mec_buy_onlinecontent`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_onlinecontent`;
CREATE TABLE `mec_buy_onlinecontent` (
`ONLINECONTENTCODE`  char(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ONLINEORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`NUM`  int(11) UNSIGNED NOT NULL ,
`UNITPRICE`  decimal(12,2) NOT NULL ,
`PROMOTIONMARK`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'X' ,
`ONLINECOUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚拟柜' ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实际扣库存的柜' ,
`CONFIRMSTATE`  int(11) NOT NULL DEFAULT 0 COMMENT '0-待确认 1-确认 2-拒绝' ,
`CONFIRMTIME`  datetime NULL DEFAULT NULL ,
`SALESMANCODE`  int(11) NULL DEFAULT NULL COMMENT '确认或拒绝操作的营业员' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`FINALPRICELIST`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终过促销引擎后均摊价格' ,
`FINALRULELIST`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终适用规则，具体到每一个物品' ,
`REALVIPCARDTYPE`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用该商品的实际vip卡类型' ,
`REALVIPDISCOUNT`  decimal(3,2) NULL DEFAULT NULL COMMENT '实际享受的vip折扣' ,
`RETAILAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '成交价（分摊后实际折后价）' ,
`VIPDISCOUNTAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '汇金贵宾卡折扣' ,
`DISCOUNTOUTAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '支付前满减 - 折让' ,
`DISCOUNTINAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '赠券' ,
`PRESENTSHAREQTY`  decimal(12,2) NULL DEFAULT NULL COMMENT '赠礼' ,
`MERCHANTDISCOUTAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '供应商折扣' ,
`SHIPPRICECHARGESHARE`  decimal(12,2) NULL DEFAULT NULL COMMENT '运费差额均摊' ,
`PACKINGCHARGESHARE`  decimal(12,2) NULL DEFAULT NULL COMMENT '包装费差额均摊' ,
PRIMARY KEY (`ONLINECONTENTCODE`),
INDEX `COUNTERCODE` (`COUNTERCODE`) USING BTREE ,
INDEX `ORDERID` (`ONLINEORDERCODE`) USING BTREE ,
INDEX `SKCID` (`SKCCODE`) USING BTREE ,
INDEX `FINALRULE` (`FINALRULELIST`(255)) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_buy_onlineorder`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_onlineorder`;
CREATE TABLE `mec_buy_onlineorder` (
`ONLINEORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ORDERSTATE`  int(11) NOT NULL DEFAULT 1 COMMENT '见文档' ,
`NOTE`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PAYMENTMODE`  int(11) NOT NULL DEFAULT 0 COMMENT '0-现场支付，1-网上支付，2-到付' ,
`DELIVERYMODE`  int(11) NOT NULL DEFAULT 0 COMMENT '0-自提 1-物流配送' ,
`SITEID`  int(11) NULL DEFAULT NULL ,
`DELIVERYDEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单最终自提货或发货点' ,
`SHIPPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '运费' ,
`PACKING`  decimal(12,2) NULL DEFAULT NULL COMMENT '包装费' ,
`STORECODE`  char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店号' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`FINALPRICE`  decimal(12,2) NULL DEFAULT NULL ,
`FINALRULESTRING`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TRANSID`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`CHRCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`VIPCARDNO`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贵宾卡卡号' ,
`RECEIVABLEAMT`  decimal(12,2) NULL DEFAULT NULL COMMENT '应收金额' ,
`PAYLOCAL`  int(11) NULL DEFAULT NULL COMMENT '0-pos机付款 1-app付款' ,
`POSCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos机号码' ,
`CASHIER`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收银员' ,
`REALSHIPPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '实付运费' ,
`REALPACKING`  decimal(12,2) NULL DEFAULT NULL COMMENT '实付包装费' ,
`POSDEALNUM`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'pos机交易序列号' ,
`PLACETIME`  date NULL DEFAULT NULL COMMENT '下单时间' ,
`AUDITTIME`  date NULL DEFAULT NULL COMMENT '订单审核时间' ,
`PAYTIME`  date NULL DEFAULT NULL COMMENT '订单支付时间' ,
`OUTTIME`  date NULL DEFAULT NULL COMMENT '订单出库时间' ,
`RECEIVABLETIME`  date NULL DEFAULT NULL COMMENT '收款时间' ,
`FINISHTIME`  date NULL DEFAULT NULL COMMENT '订单完成时间' ,
PRIMARY KEY (`ONLINEORDERCODE`),
INDEX `USERID` (`USERCODE`) USING BTREE ,
INDEX `SITEID` (`SITEID`) USING BTREE ,
INDEX `DEPTCODE` (`DELIVERYDEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_buy_onlineorder_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_onlineorder_log`;
CREATE TABLE `mec_buy_onlineorder_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ONLINEORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ORDERSTATE`  int(11) NOT NULL COMMENT '见文档' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=804

;

-- ----------------------------
-- Table structure for `mec_buy_shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `mec_buy_shoppingcart`;
CREATE TABLE `mec_buy_shoppingcart` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`NUM`  int(11) NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `USERCODE` (`USERCODE`) USING BTREE ,
INDEX `SKCCODE` (`SKCCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=98

;

-- ----------------------------
-- Table structure for `mec_ctm_bankcard`
-- ----------------------------
DROP TABLE IF EXISTS `mec_ctm_bankcard`;
CREATE TABLE `mec_ctm_bankcard` (
`BANKCARDID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKCARDNUMBER`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BANKCARDOWNER`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BANKCARDTYPE`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BANKNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`BANKCARDID`),
INDEX `FK_RELATIONSHIP_4` (`USERCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='顾客银行卡信息表'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `mec_ctm_customer`
-- ----------------------------
DROP TABLE IF EXISTS `mec_ctm_customer`;
CREATE TABLE `mec_ctm_customer` (
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TELEPHONE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`VIPCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`EMAIL`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`NAME`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GENDER`  tinyint(1) NULL DEFAULT NULL ,
`ICONURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`IDCARD`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`BIRTHDAY`  date NULL DEFAULT NULL ,
`SALT`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`HASH`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`USERCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='顾客信息表'

;

-- ----------------------------
-- Table structure for `mec_ctm_site`
-- ----------------------------
DROP TABLE IF EXISTS `mec_ctm_site`;
CREATE TABLE `mec_ctm_site` (
`SITEID`  int(11) NOT NULL AUTO_INCREMENT ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ISDEFAULT`  int(1) NOT NULL DEFAULT 0 COMMENT '是否为默认' ,
`PERSON`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人' ,
`TELEPHONE`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话' ,
`POSTCODE`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编' ,
`DETAIL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址' ,
`PROVINCE`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省' ,
`CITY`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市' ,
`DISTRICT`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`SITEID`),
INDEX `FK_RELATIONSHIP_3` (`USERCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='顾客收货地址信息表'
AUTO_INCREMENT=2538

;

-- ----------------------------
-- Table structure for `mec_itm_category`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_category`;
CREATE TABLE `mec_itm_category` (
`CATEGORYID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`CATEGORYNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名' ,
`SUPERCATEGORYID`  int(11) NULL DEFAULT NULL COMMENT '父分类编号' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`CATEGORYID`),
INDEX `PARENTID` (`SUPERCATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=296

;

-- ----------------------------
-- Table structure for `mec_itm_category_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_category_log`;
CREATE TABLE `mec_itm_category_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`CATEGORYID`  int(11) NOT NULL COMMENT '编号' ,
`CATEGORYNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名' ,
`SUPERCATEGORYID`  int(11) NULL DEFAULT NULL COMMENT '父分类编号' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `PARENTID` (`SUPERCATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=495

;

-- ----------------------------
-- Table structure for `mec_itm_imgdetail`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_imgdetail`;
CREATE TABLE `mec_itm_imgdetail` (
`ID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接\r\n            ' ,
`DESCRIPTION`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_8` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片链接'
AUTO_INCREMENT=78

;

-- ----------------------------
-- Table structure for `mec_itm_imgdetail_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_imgdetail_log`;
CREATE TABLE `mec_itm_imgdetail_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`__ID`  int(11) NULL DEFAULT NULL COMMENT '图片编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接\r\n            ' ,
`DESCRIPTION`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述' ,
`TMPSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_8` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片链接'
AUTO_INCREMENT=334

;

-- ----------------------------
-- Table structure for `mec_itm_imgdetail_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_imgdetail_tmp`;
CREATE TABLE `mec_itm_imgdetail_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NULL DEFAULT NULL COMMENT '图片编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接\r\n            ' ,
`DESCRIPTION`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_8` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片链接'
AUTO_INCREMENT=224

;

-- ----------------------------
-- Table structure for `mec_itm_imgpreview`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_imgpreview`;
CREATE TABLE `mec_itm_imgpreview` (
`ID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接\r\n            ' ,
`DESCRIPTION`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_8` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片链接'
AUTO_INCREMENT=62

;

-- ----------------------------
-- Table structure for `mec_itm_imgpreview_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_imgpreview_log`;
CREATE TABLE `mec_itm_imgpreview_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`__ID`  int(11) NULL DEFAULT NULL COMMENT '图片编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接\r\n            ' ,
`DESCRIPTION`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_8` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片链接'
AUTO_INCREMENT=255

;

-- ----------------------------
-- Table structure for `mec_itm_imgpreview_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_imgpreview_tmp`;
CREATE TABLE `mec_itm_imgpreview_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NULL DEFAULT NULL COMMENT '图片编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接\r\n            ' ,
`DESCRIPTION`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_8` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片链接'
AUTO_INCREMENT=185

;

-- ----------------------------
-- Table structure for `mec_itm_item`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_item`;
CREATE TABLE `mec_itm_item` (
`ITEMCODE`  int(8) NOT NULL AUTO_INCREMENT COMMENT '商品编码' ,
`BARCODE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条形码' ,
`ITEMNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品全称' ,
`ITEMSHORTNAME`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简称' ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌编码' ,
`RETAILTYPECODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售分类' ,
`ITEMTYPECODE`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类编码' ,
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码' ,
`BUSINESSMODE`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经营方式' ,
`PRODUCINGAREA`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地' ,
`PRICE`  decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '核定售价' ,
`TEMPPRICE`  decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '统一暂时售价' ,
`TAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' COMMENT '销项税率' ,
`EXCISERATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费税率' ,
`RETURNGOODS`  decimal(1,0) NULL DEFAULT NULL COMMENT '是否允许退货：0：不允许 ，1：允许' ,
`SALESTATE`  decimal(1,0) NULL DEFAULT NULL COMMENT '销售状态：0：正常 ，2：手工登记删除，3：合同到期自动登记删除' ,
`NETWEIGHT`  decimal(7,3) NULL DEFAULT NULL COMMENT '净重' ,
`GROSSWEIGHT`  decimal(7,3) NULL DEFAULT NULL COMMENT '毛重' ,
`SPECIFICATION`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格' ,
`PRODUCTCODE`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品货号' ,
`GRADE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品等级' ,
`COLOR`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品颜色' ,
`CASING`  decimal(5,0) NULL DEFAULT 1 COMMENT '包装规格' ,
`DIMENSION`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸' ,
`VOLUME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体积' ,
`ITEMCODETYPE`  decimal(1,0) NOT NULL DEFAULT 0 COMMENT '商品编码类型：0：正常商品编码，1：大类码' ,
`UNIT`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位' ,
`LASTPURCHASEPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '最后进价' ,
`PURCHASETAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进项税率' ,
`SAFESTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '安全库存' ,
`MAXSTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '最高存量' ,
`MINSTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '最低存量' ,
`MAXORDER`  decimal(5,0) NULL DEFAULT NULL COMMENT '最高订货量' ,
`MINORDER`  decimal(5,0) NULL DEFAULT NULL COMMENT '最低订货量' ,
`PROPERTY`  decimal(1,0) NULL DEFAULT NULL COMMENT '商品属性：0：普通商品， 1：黄金商品， 2：香烟商品' ,
`CHECKSTATE`  decimal(1,0) NULL DEFAULT 2 COMMENT '复查状态\r\n            0：复查不通过（可改价格、招商人员、商品分类）\r\n            1：复查通过（不可改价格、招商人员、商品分类）\r\n            2：输入\r\n            3：变更（不可改价格、招商人员、商品分类）\r\n            4 ：变更不通过（不可改价格、招商人员、商品分类）' ,
`ERRORINFO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息' ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入员编码' ,
`AGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招商人员编码（经销B必须）' ,
`TERM`  date NULL DEFAULT NULL COMMENT '质保期' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
`ISCONSIDERSTOCK`  int(1) NOT NULL DEFAULT 0 COMMENT '0-不管库存 1-管库存' ,
`ISALLOWONLINE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-线下 1-线上' ,
`ISALLOWNEGATIVE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-不允许负库存 1-允许' ,
`SKCCHECKSTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-未完善 1-审核通过 2-已完善待审核通过 3-已审核过又有更新' ,
`ONLINECHECKSTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-未完善 1-审核通过 2-已完善待审核通过 3-已审核过又有更新' ,
`SELLINGSTATE`  int(11) NOT NULL DEFAULT 0 COMMENT '0-尚未开始销售  1-线下不管库存销售中  2-线下管库存销售中  3-线上(肯定管库存)销售中' ,
`TITLE`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品上线的名称' ,
`SCORE`  double(6,5) NOT NULL DEFAULT 5.00000 COMMENT '评分 满分5分' ,
`SCOREPOPULARITY`  int(11) NOT NULL DEFAULT 0 COMMENT '评分人数' ,
`PURCHASE`  int(11) NOT NULL DEFAULT 0 COMMENT '购买数目' ,
`PURCHASEPOPULARITY`  int(11) NOT NULL DEFAULT 0 COMMENT '购买人数' ,
`PRAISERATE`  int(3) NOT NULL DEFAULT 100 COMMENT '好评率，单位是%' ,
`ONLINETIME`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`ITEMCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKU信息表'
AUTO_INCREMENT=1525269

;

-- ----------------------------
-- Table structure for `mec_itm_item_log1`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_item_log1`;
CREATE TABLE `mec_itm_item_log1` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`BARCODE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条形码' ,
`ITEMNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品全称' ,
`ITEMSHORTNAME`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简称' ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌编码' ,
`RETAILTYPECODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售分类' ,
`ITEMTYPECODE`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类编码' ,
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码' ,
`BUSINESSMODE`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经营方式' ,
`PRODUCINGAREA`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地' ,
`PRICE`  decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '核定售价' ,
`TEMPPRICE`  decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '统一暂时售价' ,
`TAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' COMMENT '销项税率' ,
`EXCISERATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费税率' ,
`RETURNGOODS`  decimal(1,0) NULL DEFAULT NULL COMMENT '是否允许退货：0：不允许 ，1：允许' ,
`SALESTATE`  decimal(1,0) NULL DEFAULT NULL COMMENT '销售状态：0：正常 ，2：手工登记删除，3：合同到期自动登记删除' ,
`NETWEIGHT`  decimal(7,3) NULL DEFAULT NULL COMMENT '净重' ,
`GROSSWEIGHT`  decimal(7,3) NULL DEFAULT NULL COMMENT '毛重' ,
`SPECIFICATION`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格' ,
`PRODUCTCODE`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品货号' ,
`GRADE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品等级' ,
`COLOR`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品颜色' ,
`CASING`  decimal(5,0) NULL DEFAULT 1 COMMENT '包装规格' ,
`DIMENSION`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸' ,
`VOLUME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体积' ,
`ITEMCODETYPE`  decimal(1,0) NOT NULL DEFAULT 0 COMMENT '商品编码类型：0：正常商品编码，1：大类码' ,
`UNIT`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位' ,
`LASTPURCHASEPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '最后进价' ,
`PURCHASETAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进项税率' ,
`SAFESTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '安全库存' ,
`MAXSTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '最高存量' ,
`MINSTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '最低存量' ,
`MAXORDER`  decimal(5,0) NULL DEFAULT NULL COMMENT '最高订货量' ,
`MINORDER`  decimal(5,0) NULL DEFAULT NULL COMMENT '最低订货量' ,
`PROPERTY`  decimal(1,0) NULL DEFAULT NULL COMMENT '商品属性：0：普通商品， 1：黄金商品， 2：香烟商品' ,
`CHECKSTATE`  decimal(1,0) NULL DEFAULT 2 COMMENT '复查状态\r\n            0：复查不通过（可改价格、招商人员、商品分类）\r\n            1：复查通过（不可改价格、招商人员、商品分类）\r\n            2：输入\r\n            3：变更（不可改价格、招商人员、商品分类）\r\n            4 ：变更不通过（不可改价格、招商人员、商品分类）' ,
`ERRORINFO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息' ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入员编码' ,
`AGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招商人员编码（经销B必须）' ,
`TERM`  date NULL DEFAULT NULL COMMENT '质保期' ,
`ISCONSIDERSTOCK`  int(1) NOT NULL DEFAULT 0 COMMENT '0-不管库存 1-管库存' ,
`ISALLOWONLINE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-线下 1-线上' ,
`ISALLOWNEGATIVE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-不允许负库存 1-允许' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKU信息表'
AUTO_INCREMENT=146

;

-- ----------------------------
-- Table structure for `mec_itm_item_log2`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_item_log2`;
CREATE TABLE `mec_itm_item_log2` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`TITLE`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKU信息表'
AUTO_INCREMENT=94

;

-- ----------------------------
-- Table structure for `mec_itm_item_tmp1`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_item_tmp1`;
CREATE TABLE `mec_itm_item_tmp1` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`BARCODE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条形码' ,
`ITEMNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品全称' ,
`ITEMSHORTNAME`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简称' ,
`BRANDCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌编码' ,
`RETAILTYPECODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售分类' ,
`ITEMTYPECODE`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类编码' ,
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码' ,
`BUSINESSMODE`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经营方式' ,
`PRODUCINGAREA`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地' ,
`PRICE`  decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '核定售价' ,
`TEMPPRICE`  decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '统一暂时售价' ,
`TAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' COMMENT '销项税率' ,
`EXCISERATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费税率' ,
`RETURNGOODS`  decimal(1,0) NULL DEFAULT NULL COMMENT '是否允许退货：0：不允许 ，1：允许' ,
`SALESTATE`  decimal(1,0) NULL DEFAULT NULL COMMENT '销售状态：0：正常 ，2：手工登记删除，3：合同到期自动登记删除' ,
`NETWEIGHT`  decimal(7,3) NULL DEFAULT NULL COMMENT '净重' ,
`GROSSWEIGHT`  decimal(7,3) NULL DEFAULT NULL COMMENT '毛重' ,
`SPECIFICATION`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格' ,
`PRODUCTCODE`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品货号' ,
`GRADE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品等级' ,
`COLOR`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品颜色' ,
`CASING`  decimal(5,0) NULL DEFAULT 1 COMMENT '包装规格' ,
`DIMENSION`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸' ,
`VOLUME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体积' ,
`ITEMCODETYPE`  decimal(1,0) NOT NULL DEFAULT 0 COMMENT '商品编码类型：0：正常商品编码，1：大类码' ,
`UNIT`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位' ,
`LASTPURCHASEPRICE`  decimal(12,2) NULL DEFAULT NULL COMMENT '最后进价' ,
`PURCHASETAXRATE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进项税率' ,
`SAFESTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '安全库存' ,
`MAXSTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '最高存量' ,
`MINSTOCK`  decimal(5,0) NULL DEFAULT NULL COMMENT '最低存量' ,
`MAXORDER`  decimal(5,0) NULL DEFAULT NULL COMMENT '最高订货量' ,
`MINORDER`  decimal(5,0) NULL DEFAULT NULL COMMENT '最低订货量' ,
`PROPERTY`  decimal(1,0) NULL DEFAULT NULL COMMENT '商品属性：0：普通商品， 1：黄金商品， 2：香烟商品' ,
`CHECKSTATE`  decimal(1,0) NULL DEFAULT 2 COMMENT '复查状态\r\n            0：复查不通过（可改价格、招商人员、商品分类）\r\n            1：复查通过（不可改价格、招商人员、商品分类）\r\n            2：输入\r\n            3：变更（不可改价格、招商人员、商品分类）\r\n            4 ：变更不通过（不可改价格、招商人员、商品分类）' ,
`ERRORINFO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息' ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入员编码' ,
`AGENTCODE`  char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招商人员编码（经销B必须）' ,
`TERM`  date NULL DEFAULT NULL COMMENT '质保期' ,
`ISCONSIDERSTOCK`  int(1) NOT NULL DEFAULT 0 COMMENT '0-不管库存 1-管库存' ,
`ISALLOWONLINE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-线下 1-线上' ,
`ISALLOWNEGATIVE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-不允许负库存 1-允许' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKU信息表'
AUTO_INCREMENT=65

;

-- ----------------------------
-- Table structure for `mec_itm_item_tmp2`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_item_tmp2`;
CREATE TABLE `mec_itm_item_tmp2` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`TITLE`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKU信息表'
AUTO_INCREMENT=69

;

-- ----------------------------
-- Table structure for `mec_itm_itemcategory`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_itemcategory`;
CREATE TABLE `mec_itm_itemcategory` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL ,
`CATEGORYID`  int(11) NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `CATEGORYID` (`CATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=68

;

-- ----------------------------
-- Table structure for `mec_itm_itemcategory_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_itemcategory_log`;
CREATE TABLE `mec_itm_itemcategory_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`__ID`  int(11) NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`CATEGORYID`  int(11) NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `CATEGORYID` (`CATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=269

;

-- ----------------------------
-- Table structure for `mec_itm_itemcategory_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_itemcategory_tmp`;
CREATE TABLE `mec_itm_itemcategory_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`CATEGORYID`  int(11) NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `CATEGORYID` (`CATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=194

;

-- ----------------------------
-- Table structure for `mec_itm_itemregion`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_itemregion`;
CREATE TABLE `mec_itm_itemregion` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL ,
`REGIONID`  int(11) NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `CATEGORYID` (`REGIONID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=57

;

-- ----------------------------
-- Table structure for `mec_itm_itemregion_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_itemregion_log`;
CREATE TABLE `mec_itm_itemregion_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`__ID`  int(11) NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`REGIONID`  int(11) NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `CATEGORYID` (`REGIONID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=263

;

-- ----------------------------
-- Table structure for `mec_itm_itemregion_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_itemregion_tmp`;
CREATE TABLE `mec_itm_itemregion_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`REGIONID`  int(11) NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `CATEGORYID` (`REGIONID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=183

;

-- ----------------------------
-- Table structure for `mec_itm_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_parameter`;
CREATE TABLE `mec_itm_parameter` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL ,
`ATTRIBUTE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`VALUE`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=118

;

-- ----------------------------
-- Table structure for `mec_itm_parameter_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_parameter_log`;
CREATE TABLE `mec_itm_parameter_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`__ID`  int(11) NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`ATTRIBUTE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`VALUE`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=277

;

-- ----------------------------
-- Table structure for `mec_itm_parameter_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_parameter_tmp`;
CREATE TABLE `mec_itm_parameter_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`ATTRIBUTE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`VALUE`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=217

;

-- ----------------------------
-- Table structure for `mec_itm_paramtemplate`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_paramtemplate`;
CREATE TABLE `mec_itm_paramtemplate` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`CATEGORYID`  int(11) NOT NULL ,
`ATTRIBUTE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `CATEGORYID` (`CATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=482

;

-- ----------------------------
-- Table structure for `mec_itm_paramtemplate_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_paramtemplate_log`;
CREATE TABLE `mec_itm_paramtemplate_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`CATEGORYID`  int(11) NOT NULL ,
`ATTRIBUTE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `CATEGORYID` (`CATEGORYID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=520

;

-- ----------------------------
-- Table structure for `mec_itm_region`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_region`;
CREATE TABLE `mec_itm_region` (
`REGIONID`  int(11) NOT NULL AUTO_INCREMENT ,
`REGIONNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SUPERREGIONID`  int(11) NULL DEFAULT NULL ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`REGIONID`),
INDEX `PARENTID` (`SUPERREGIONID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=440

;

-- ----------------------------
-- Table structure for `mec_itm_region_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_region_log`;
CREATE TABLE `mec_itm_region_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`REGIONID`  int(11) NOT NULL ,
`REGIONNAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`SUPERREGIONID`  int(11) NULL DEFAULT NULL ,
`IMGURL`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `PARENTID` (`SUPERREGIONID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=318

;

-- ----------------------------
-- Table structure for `mec_itm_skc`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_skc`;
CREATE TABLE `mec_itm_skc` (
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`MERCHANTSKCCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`SIZE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小' ,
`COLOR`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色' ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 COMMENT '0-作废 1-有效' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`SKCCODE`),
INDEX `FK_Relationship_7` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKC信息'

;

-- ----------------------------
-- Table structure for `mec_itm_skc_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_skc_log`;
CREATE TABLE `mec_itm_skc_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`MERCHANTSKCCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`SIZE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小' ,
`COLOR`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝' ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_7` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKC信息'
AUTO_INCREMENT=285

;

-- ----------------------------
-- Table structure for `mec_itm_skc_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_skc_tmp`;
CREATE TABLE `mec_itm_skc_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号' ,
`ITEMCODE`  int(8) NOT NULL COMMENT '商品编码' ,
`MERCHANTSKCCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`SIZE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小' ,
`COLOR`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色' ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `FK_Relationship_7` (`ITEMCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKC信息'
AUTO_INCREMENT=192

;

-- ----------------------------
-- Table structure for `mec_itm_stock`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_stock`;
CREATE TABLE `mec_itm_stock` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`AMOUNT`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=126

;

-- ----------------------------
-- Table structure for `mec_itm_stock_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_stock_log`;
CREATE TABLE `mec_itm_stock_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`SKCCODE`  char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`AMOUNT`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`DELTA`  int(11) NOT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8784

;

-- ----------------------------
-- Table structure for `mec_itm_storeitem`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_storeitem`;
CREATE TABLE `mec_itm_storeitem` (
`ID`  char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MISITEMCODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ITEMCODE`  int(8) NULL DEFAULT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`MEMBERPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`STORECHECKEDPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`STORETEMPPRICE`  float(12,2) NOT NULL DEFAULT 0.00 ,
`PROMOTIONMARK`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'X' ,
`DISCOUNTMARK`  float(1,0) NOT NULL DEFAULT 1 ,
`STORESALESTATE`  float(1,0) NULL DEFAULT NULL ,
`SAFESTOCK`  float(5,0) NULL DEFAULT 0 ,
`FULLSTOCK`  float(5,0) NULL DEFAULT 0 ,
`MAXSTOCK`  float(5,0) NULL DEFAULT 0 ,
`MINSTOCK`  float(5,0) NULL DEFAULT 0 ,
`MAXORDER`  float(5,0) NULL DEFAULT 0 ,
`MINORDER`  float(5,0) NULL DEFAULT 0 ,
`NEGATIVESTOCK`  float(1,0) NULL DEFAULT NULL ,
`TEMPDISTRIBUTIONMARK`  float(1,0) NULL DEFAULT 0 ,
`CHECKSTATE`  float(1,0) NULL DEFAULT NULL ,
`ERRORINFO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`INPUTPERSON`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COSTMODE`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01' ,
`DEDUCTAMT`  float(12,2) NOT NULL DEFAULT 0.00 ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`ONLINESTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-未上线 1-上线' ,
PRIMARY KEY (`ID`),
UNIQUE INDEX `ITEMCODE_2` (`ITEMCODE`, `COUNTERCODE`) USING BTREE ,
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `COUNTERCODE` (`COUNTERCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_itm_virtualstoreitem`
-- ----------------------------
DROP TABLE IF EXISTS `mec_itm_virtualstoreitem`;
CREATE TABLE `mec_itm_virtualstoreitem` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`MISITEMCODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ITEMCODE`  int(8) NOT NULL ,
`ONLINECOUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ONLINESTORECHECKEDPRICE`  float(12,2) NOT NULL ,
`ONLINESTORETEMPPRICE`  float(12,2) NOT NULL ,
`ONLINEPROMOTIONMARK`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `mec_lgt_logistics`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_logistics`;
CREATE TABLE `mec_lgt_logistics` (
`ID`  int(20) NOT NULL AUTO_INCREMENT ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ISONLINEORDER`  int(1) NOT NULL DEFAULT 0 ,
`LGTCOMPANY`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LGTNUMBER`  char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LGTSTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-待发货 1-发货途中 2-已收货' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`POSITIONCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部物流放到的位置' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=23

;

-- ----------------------------
-- Table structure for `mec_lgt_package`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_package`;
CREATE TABLE `mec_lgt_package` (
`PACKAGECODE`  char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ISONLINEORDER`  int(1) NOT NULL DEFAULT 0 ,
`PAYMENTMODE`  int(11) NOT NULL ,
`DELIVERYMODE`  int(11) NOT NULL ,
`DELIVERYDEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PACKAGESTATE`  int(11) NOT NULL ,
`POSITIONCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PLACEORDERTIME`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`PACKAGECODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_lgt_package_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_package_log`;
CREATE TABLE `mec_lgt_package_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`PACKAGECODE`  char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ISONLINEORDER`  int(1) NULL DEFAULT NULL ,
`PAYMENTMODE`  int(11) NULL DEFAULT NULL ,
`DELIVERYMODE`  int(11) NULL DEFAULT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DELIVERYDEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PACKAGESTATE`  int(11) NULL DEFAULT NULL ,
`POSITIONCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RECORDSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=447

;

-- ----------------------------
-- Table structure for `mec_lgt_packagecontent`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_packagecontent`;
CREATE TABLE `mec_lgt_packagecontent` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`PACKAGECODE`  char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CONTENTCODE`  char(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ISONLINEORDER`  int(1) NOT NULL DEFAULT 0 ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=134

;

-- ----------------------------
-- Table structure for `mec_lgt_pickcounter`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_pickcounter`;
CREATE TABLE `mec_lgt_pickcounter` (
`ID`  int(20) NOT NULL AUTO_INCREMENT ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ISONLINEORDER`  int(1) NOT NULL DEFAULT 0 ,
`COUNTERCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PICKCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PICKSTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-待自提 1-自提完成' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=24

;

-- ----------------------------
-- Table structure for `mec_lgt_pickdept`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_pickdept`;
CREATE TABLE `mec_lgt_pickdept` (
`ID`  int(20) NOT NULL AUTO_INCREMENT ,
`ORDERCODE`  char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PICKCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PICKSTATE`  int(1) NOT NULL DEFAULT 0 COMMENT '0-待自提  1-自提完成' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`POSITIONCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部物流放到的位置' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `mec_lgt_position`
-- ----------------------------
DROP TABLE IF EXISTS `mec_lgt_position`;
CREATE TABLE `mec_lgt_position` (
`POSITIONCODE`  char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DESCRIPTION`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10201' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`POSITIONCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_prm_itemrule`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_itemrule`;
CREATE TABLE `mec_prm_itemrule` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`ITEMCODE`  int(8) NOT NULL ,
`RULEID`  int(11) NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `ITEMCODE` (`ITEMCODE`) USING BTREE ,
INDEX `RULEID` (`RULEID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `mec_prm_prmrule`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_prmrule`;
CREATE TABLE `mec_prm_prmrule` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`RULECODE`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RULECONTENT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DATEEFFECTIVE`  datetime NOT NULL ,
`DATEEXPIRES`  datetime NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店' ,
`STATE`  int(1) NOT NULL DEFAULT 1 ,
`REDUCECONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`REDUCE`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUPONCONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUPON`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GIFTCONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GIFT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RULESCRIPT`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MODIFYSTATE`  int(11) NOT NULL DEFAULT 0 COMMENT '修改状态 0-未修改 1-修改待审核' ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 COMMENT '0-作废 1-有效' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `DEPTCODE` (`DEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `mec_prm_prmrule_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_prmrule_log`;
CREATE TABLE `mec_prm_prmrule_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`RULECODE`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RULECONTENT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DATEEFFECTIVE`  datetime NOT NULL ,
`DATEEXPIRES`  datetime NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店' ,
`STATE`  int(1) NOT NULL ,
`REDUCECONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`REDUCE`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUPONCONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUPON`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GIFTCONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GIFT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RULESCRIPT`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TMPSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `DEPTCODE` (`DEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `mec_prm_prmrule_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_prmrule_tmp`;
CREATE TABLE `mec_prm_prmrule_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`RULECODE`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RULECONTENT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DATEEFFECTIVE`  datetime NOT NULL ,
`DATEEXPIRES`  datetime NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店' ,
`STATE`  int(1) NOT NULL DEFAULT 1 COMMENT '规则状态，是否启用' ,
`REDUCECONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`REDUCE`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUPONCONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`COUPON`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GIFTCONVERT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GIFT`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RULESCRIPT`  varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TMPSTATE`  int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审3-增审过 4-删审过 5-改审过 6-拒绝' ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `DEPTCODE` (`DEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `mec_prm_rule`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_rule`;
CREATE TABLE `mec_prm_rule` (
`RULEID`  int(11) NOT NULL AUTO_INCREMENT ,
`RULENAME`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RULEDESCRIPTION`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RULESCRIPT`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DATE-EFFECTIVE`  datetime NOT NULL ,
`DATE-EXPIRES`  datetime NOT NULL ,
`SALIENCE`  int(11) NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店' ,
`RECORDSTATE`  int(11) NOT NULL DEFAULT 1 COMMENT '0-作废 1-有效' ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`RULEID`),
INDEX `DEPTCODE` (`DEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `mec_prm_rule_log`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_rule_log`;
CREATE TABLE `mec_prm_rule_log` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`_ID`  int(11) NOT NULL ,
`RULEID`  int(11) NOT NULL ,
`RULENAME`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RULEDESCRIPTION`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RULESCRIPT`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DATE-EFFECTIVE`  datetime NOT NULL ,
`DATE-EXPIRES`  datetime NOT NULL ,
`SALIENCE`  int(11) NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店' ,
`TMPSTATE`  int(11) NOT NULL ,
`OPERATION`  int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核' ,
`OPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `DEPTCODE` (`DEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=61

;

-- ----------------------------
-- Table structure for `mec_prm_rule_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `mec_prm_rule_tmp`;
CREATE TABLE `mec_prm_rule_tmp` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`RULEID`  int(11) NOT NULL ,
`RULENAME`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RULEDESCRIPTION`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RULESCRIPT`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DATE-EFFECTIVE`  datetime NOT NULL ,
`DATE-EXPIRES`  datetime NOT NULL ,
`SALIENCE`  int(11) NOT NULL ,
`DEPTCODE`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店' ,
`TMPSTATE`  int(11) NOT NULL ,
`LASTOPERATEPERSON`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`),
INDEX `DEPTCODE` (`DEPTCODE`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=61

;

-- ----------------------------
-- Table structure for `mec_vip_customercard`
-- ----------------------------
DROP TABLE IF EXISTS `mec_vip_customercard`;
CREATE TABLE `mec_vip_customercard` (
`ID`  int(11) NOT NULL ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CARDNUMBER`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `mec_vip_merchantcard`
-- ----------------------------
DROP TABLE IF EXISTS `mec_vip_merchantcard`;
CREATE TABLE `mec_vip_merchantcard` (
`MERCHANTCARDCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MERCHANTCODE`  char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`USERCODE`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
`updatedAt`  datetime NOT NULL DEFAULT '2000-01-01 00:00:00' ,
PRIMARY KEY (`MERCHANTCARDCODE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `test_function`
-- ----------------------------
DROP TABLE IF EXISTS `test_function`;
CREATE TABLE `test_function` (
`id`  int(11) NOT NULL ,
`aa`  int(11) NOT NULL ,
`bb`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `test_log`
-- ----------------------------
DROP TABLE IF EXISTS `test_log`;
CREATE TABLE `test_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`aa`  int(11) NOT NULL ,
`bb`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`operation`  int(1) NOT NULL DEFAULT 0 ,
`recordDatetime`  datetime NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14

;

-- ----------------------------
-- Table structure for `test_procedure`
-- ----------------------------
DROP TABLE IF EXISTS `test_procedure`;
CREATE TABLE `test_procedure` (
`id`  int(11) NOT NULL ,
`aa`  int(11) NOT NULL ,
`bb`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `test_trigger`
-- ----------------------------
DROP TABLE IF EXISTS `test_trigger`;
CREATE TABLE `test_trigger` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`aa`  int(11) NOT NULL ,
`bb`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=878

;
DROP TRIGGER IF EXISTS `mec_tr_adm_admin_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_adm_admin_afterinsert` AFTER INSERT ON `mec_adm_admin` FOR EACH ROW begin
insert into mec_adm_admin_log(USERCODE,ROLE,DEPTCODE,COUNTERCODE,TELEPHONE,EMAIL,NAME,GENDER,HASH,SALT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.USERCODE,new.ROLE,new.DEPTCODE,new.COUNTERCODE,new.TELEPHONE,new.EMAIL,new.NAME,new.GENDER,new.HASH,new.SALT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_adm_admin_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_adm_admin_afterupdate` AFTER UPDATE ON `mec_adm_admin` FOR EACH ROW begin
insert into mec_adm_admin_log(USERCODE,ROLE,DEPTCODE,COUNTERCODE,TELEPHONE,EMAIL,NAME,GENDER,HASH,SALT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.USERCODE,new.ROLE,new.DEPTCODE,new.COUNTERCODE,new.TELEPHONE,new.EMAIL,new.NAME,new.GENDER,new.HASH,new.SALT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_adm_admin_log`
-- ----------------------------
ALTER TABLE `mec_adm_admin_log` AUTO_INCREMENT=37;
DROP TRIGGER IF EXISTS `mec_tr_adm_assistant_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_adm_assistant_afterinsert` AFTER INSERT ON `mec_hsy_salesman` FOR EACH ROW begin
insert into mec_adm_assistant_log(SALESMANCODE,COUNTERCODE,NAME,GENDER,IDNUMBER,TELEPHONE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.SALESMANCODE,new.COUNTERCODE,new.NAME,new.GENDER,new.IDNUMBER,new.TELEPHONE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_adm_assistant_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_adm_assistant_afterupdate` AFTER UPDATE ON `mec_hsy_salesman` FOR EACH ROW begin
insert into mec_adm_assistant_log(SALESMANCODE,COUNTERCODE,NAME,GENDER,IDNUMBER,TELEPHONE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.SALESMANCODE,new.COUNTERCODE,new.NAME,new.GENDER,new.IDNUMBER,new.TELEPHONE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_hsy_salesman`
-- ----------------------------
ALTER TABLE `mec_hsy_salesman` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `mec_adm_assistant_log`
-- ----------------------------
ALTER TABLE `mec_adm_assistant_log` AUTO_INCREMENT=63;
DROP TRIGGER IF EXISTS `mec_tr_anl_hotbrand_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_anl_hotbrand_afterinsert` AFTER INSERT ON `mec_anl_hotbrand` FOR EACH ROW begin
insert into mec_anl_hotbrand_log(_ID,BRANDCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.BRANDCODE,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_anl_hotbrand_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_anl_hotbrand_afterupdate` AFTER UPDATE ON `mec_anl_hotbrand` FOR EACH ROW begin
insert into mec_anl_hotbrand_log(_ID,BRANDCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.BRANDCODE,new.WEIGHT,new.RECORDSTATE,22222222222222222222,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_anl_hotbrand`
-- ----------------------------
ALTER TABLE `mec_anl_hotbrand` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `mec_anl_hotbrand_log`
-- ----------------------------
ALTER TABLE `mec_anl_hotbrand_log` AUTO_INCREMENT=11;
DROP TRIGGER IF EXISTS `mec_tr_anl_hotbuy_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_anl_hotbuy_afterinsert` AFTER INSERT ON `mec_anl_hotbuy` FOR EACH ROW begin
insert into mec_anl_hotbuy_log(_ID,ITEMCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.ITEMCODE,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_anl_hotbuy_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_anl_hotbuy_afterupdate` AFTER UPDATE ON `mec_anl_hotbuy` FOR EACH ROW begin
insert into mec_anl_hotbuy_log(_ID,ITEMCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.ITEMCODE,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_anl_hotbuy`
-- ----------------------------
ALTER TABLE `mec_anl_hotbuy` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `mec_anl_hotbuy_log`
-- ----------------------------
ALTER TABLE `mec_anl_hotbuy_log` AUTO_INCREMENT=12;
DROP TRIGGER IF EXISTS `mec_tr_anl_hotsearch_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_anl_hotsearch_afterinsert` AFTER INSERT ON `mec_anl_hotsearch` FOR EACH ROW begin
insert into mec_anl_hotsearch_log(_ID,KEYWORD,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.KEYWORD,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_anl_hotsearch_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_anl_hotsearch_afterupdate` AFTER UPDATE ON `mec_anl_hotsearch` FOR EACH ROW begin
insert into mec_anl_hotsearch_log(_ID,KEYWORD,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.KEYWORD,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_anl_hotsearch`
-- ----------------------------
ALTER TABLE `mec_anl_hotsearch` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `mec_anl_hotsearch_log`
-- ----------------------------
ALTER TABLE `mec_anl_hotsearch_log` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `mec_audit_charge`
-- ----------------------------
ALTER TABLE `mec_audit_charge` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `mec_audit_discount`
-- ----------------------------
ALTER TABLE `mec_audit_discount` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `mec_audit_pay`
-- ----------------------------
ALTER TABLE `mec_audit_pay` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `mec_bhv_comment`
-- ----------------------------
ALTER TABLE `mec_bhv_comment` AUTO_INCREMENT=39;

-- ----------------------------
-- Auto increment value for `mec_bhv_favoritebrand`
-- ----------------------------
ALTER TABLE `mec_bhv_favoritebrand` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `mec_bhv_favoriteitem`
-- ----------------------------
ALTER TABLE `mec_bhv_favoriteitem` AUTO_INCREMENT=37;

-- ----------------------------
-- Auto increment value for `mec_bhv_request`
-- ----------------------------
ALTER TABLE `mec_bhv_request` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `mec_bhv_search`
-- ----------------------------
ALTER TABLE `mec_bhv_search` AUTO_INCREMENT=12;
DROP TRIGGER IF EXISTS `mec_tr_buy_offlinecontent_insert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_buy_offlinecontent_insert` AFTER INSERT ON `mec_buy_offlinecontent` FOR EACH ROW begin
#update mec_itm_stock set AMOUNT=cast(AMOUNT as signed)-cast(new.NUM as signed) where SKCCODE=new .SKCCODE and COUNTERCODE=new.COUNTERCODE;

#考虑到事务中order,content同时提交,提交前select也可以select到为提交的order行数据
declare ctcode char(6);
IF new.SKCCODE is not null THEN
select
mec_buy_offlineorder.COUNTERCODE
into ctcode
FROM
mec_buy_offlinecontent join mec_buy_offlineorder on mec_buy_offlinecontent.OFFLINEORDERCODE=mec_buy_offlineorder.OFFLINEORDERCODE
where OFFLINECONTENTCODE=new.OFFLINECONTENTCODE limit 1;
update mec_itm_stock set LASTOPERATEPERSON="system", AMOUNT=cast(AMOUNT as signed)-cast(new.NUM as signed) where SKCCODE=new .SKCCODE and COUNTERCODE=ctcode;
END IF;

end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_mec_offlineorder_insert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_mec_offlineorder_insert` AFTER INSERT ON `mec_buy_offlineorder` FOR EACH ROW begin
insert into mec_buy_offlineorder_log(OFFLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.OFFLINEORDERCODE,new.ORDERSTATE,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_mec_offlineorder_state_change`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_mec_offlineorder_state_change` AFTER UPDATE ON `mec_buy_offlineorder` FOR EACH ROW begin

#record state change write log
IF new.ORDERSTATE!=old.ORDERSTATE THEN
insert into mec_buy_offlineorder_log(OFFLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.OFFLINEORDERCODE,new.ORDERSTATE,now(),now());
END IF;

#rollback stock
IF new.ORDERSTATE in (9,11) THEN
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


#customer pay offline order which need logistics- generate package
ELSEIF (new.ORDERSTATE=4&&new.DELIVERYMODE=1) THEN
insert into mec_lgt_package(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,LASTOPERATEPERSON,createdAt,updatedAt,PLACEORDERTIME)
select
concat(mec_buy_offlineorder.OFFLINEORDERCODE,'-',mec_buy_offlineorder.COUNTERCODE)as PACKAGECODE,
mec_buy_offlineorder.OFFLINEORDERCODE as ORDERCODE,
0 as ISONLINEORDER,
mec_buy_offlineorder.PAYMENTMODE,
mec_buy_offlineorder.DELIVERYMODE,
mec_hct_counter.STORECODE as DELIVERYDEPTCODE,
mec_hct_counter.STORECODE as DEPTCODE,
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
join mec_hct_counter on mec_hct_counter.COUNTERCODE=mec_buy_offlineorder.COUNTERCODE
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
ELSEIF (new.ORDERSTATE=4&&new.DELIVERYMODE=0) THEN
insert into mec_lgt_pickcounter (ORDERCODE,ISONLINEORDER,COUNTERCODE,PICKCODE,PICKSTATE,OPERATEPERSON,updatedAt,createdAt)
values (new.OFFLINEORDERCODE,0,new.COUNTERCODE,right('000000'+ltrim(cast(rand()*9000000 as dec(18,0))),6),0,null,now(),now());


END IF;
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_buy_offlineorder_log`
-- ----------------------------
ALTER TABLE `mec_buy_offlineorder_log` AUTO_INCREMENT=3544;
DROP TRIGGER IF EXISTS `mec_tr_buy_onlinecontent_insert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_buy_onlinecontent_insert` AFTER INSERT ON `mec_buy_onlinecontent` FOR EACH ROW begin
update mec_itm_stock set LASTOPERATEPERSON="system",AMOUNT=cast(AMOUNT as signed)-cast(new.NUM as signed) where SKCCODE=new .SKCCODE and COUNTERCODE=new.COUNTERCODE;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_mec_onlineorder_insert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_mec_onlineorder_insert` AFTER INSERT ON `mec_buy_onlineorder` FOR EACH ROW begin
insert into mec_buy_onlineorder_log(ONLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.ONLINEORDERCODE,new.ORDERSTATE,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_mec_onlineorder_state_change`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_mec_onlineorder_state_change` AFTER UPDATE ON `mec_buy_onlineorder` FOR EACH ROW begin

#record state change write log
IF new.ORDERSTATE!=old.ORDERSTATE THEN
insert into mec_buy_onlineorder_log(ONLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.ONLINEORDERCODE,new.ORDERSTATE,now(),now());
END IF;

#rollback stock
IF new.ORDERSTATE in (9,10,11,12) THEN
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
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_buy_onlineorder_log`
-- ----------------------------
ALTER TABLE `mec_buy_onlineorder_log` AUTO_INCREMENT=804;

-- ----------------------------
-- Auto increment value for `mec_buy_shoppingcart`
-- ----------------------------
ALTER TABLE `mec_buy_shoppingcart` AUTO_INCREMENT=98;

-- ----------------------------
-- Auto increment value for `mec_ctm_bankcard`
-- ----------------------------
ALTER TABLE `mec_ctm_bankcard` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `mec_ctm_site`
-- ----------------------------
ALTER TABLE `mec_ctm_site` AUTO_INCREMENT=2538;
DROP TRIGGER IF EXISTS `mec_tr_itm_category_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_category_afterinsert` AFTER INSERT ON `mec_itm_category` FOR EACH ROW begin
insert into mec_itm_category_log(CATEGORYID,CATEGORYNAME,SUPERCATEGORYID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.CATEGORYID,new.CATEGORYNAME,new.SUPERCATEGORYID,new.IMGURL,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_category_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_category_afterupdate` AFTER UPDATE ON `mec_itm_category` FOR EACH ROW begin
insert into mec_itm_category_log(CATEGORYID,CATEGORYNAME,SUPERCATEGORYID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.CATEGORYID,new.CATEGORYNAME,new.SUPERCATEGORYID,new.IMGURL,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_category`
-- ----------------------------
ALTER TABLE `mec_itm_category` AUTO_INCREMENT=296;

-- ----------------------------
-- Auto increment value for `mec_itm_category_log`
-- ----------------------------
ALTER TABLE `mec_itm_category_log` AUTO_INCREMENT=495;

-- ----------------------------
-- Auto increment value for `mec_itm_imgdetail`
-- ----------------------------
ALTER TABLE `mec_itm_imgdetail` AUTO_INCREMENT=78;

-- ----------------------------
-- Auto increment value for `mec_itm_imgdetail_log`
-- ----------------------------
ALTER TABLE `mec_itm_imgdetail_log` AUTO_INCREMENT=334;
DROP TRIGGER IF EXISTS `mec_tr_itm_imgdetail_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_imgdetail_tmp_afterinsert` AFTER INSERT ON `mec_itm_imgdetail_tmp` FOR EACH ROW begin
insert into mec_itm_imgdetail_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_imgdetail_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_imgdetail_tmp_afterupdate` AFTER UPDATE ON `mec_itm_imgdetail_tmp` FOR EACH ROW begin
insert into mec_itm_imgdetail_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_imgdetail_tmp`
-- ----------------------------
ALTER TABLE `mec_itm_imgdetail_tmp` AUTO_INCREMENT=224;

-- ----------------------------
-- Auto increment value for `mec_itm_imgpreview`
-- ----------------------------
ALTER TABLE `mec_itm_imgpreview` AUTO_INCREMENT=62;

-- ----------------------------
-- Auto increment value for `mec_itm_imgpreview_log`
-- ----------------------------
ALTER TABLE `mec_itm_imgpreview_log` AUTO_INCREMENT=255;
DROP TRIGGER IF EXISTS `mec_tr_itm_imgpreview_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_imgpreview_tmp_afterinsert` AFTER INSERT ON `mec_itm_imgpreview_tmp` FOR EACH ROW begin
insert into mec_itm_imgpreview_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_imgpreview_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_imgpreview_tmp_afterupdate` AFTER UPDATE ON `mec_itm_imgpreview_tmp` FOR EACH ROW begin
insert into mec_itm_imgpreview_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_imgpreview_tmp`
-- ----------------------------
ALTER TABLE `mec_itm_imgpreview_tmp` AUTO_INCREMENT=185;

-- ----------------------------
-- Auto increment value for `mec_itm_item`
-- ----------------------------
ALTER TABLE `mec_itm_item` AUTO_INCREMENT=1525269;

-- ----------------------------
-- Auto increment value for `mec_itm_item_log1`
-- ----------------------------
ALTER TABLE `mec_itm_item_log1` AUTO_INCREMENT=146;

-- ----------------------------
-- Auto increment value for `mec_itm_item_log2`
-- ----------------------------
ALTER TABLE `mec_itm_item_log2` AUTO_INCREMENT=94;
DROP TRIGGER IF EXISTS `mec_tr_itm_item_tmp1_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_item_tmp1_afterinsert` AFTER INSERT ON `mec_itm_item_tmp1` FOR EACH ROW begin
insert into mec_itm_item_log1(_ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt)
values(new.ID,new.ITEMCODE,new.BARCODE,new.ITEMNAME,new.ITEMSHORTNAME,new.BRANDCODE,new.RETAILTYPECODE,new.ITEMTYPECODE,new.MERCHANTCODE,new.BUSINESSMODE,new.PRODUCINGAREA,new.PRICE,new.TEMPPRICE,new.TAXRATE,new.EXCISERATE,new.RETURNGOODS,new.SALESTATE,new.NETWEIGHT,new.GROSSWEIGHT,new.SPECIFICATION,new.PRODUCTCODE,new.GRADE,new.COLOR,new.CASING,new.DIMENSION,new.VOLUME,new.ITEMCODETYPE,new.UNIT,new.LASTPURCHASEPRICE,new.PURCHASETAXRATE,new.SAFESTOCK,new.MAXSTOCK,new.MINSTOCK,new.MAXORDER,new.MINORDER,new.PROPERTY,new.CHECKSTATE,new.ERRORINFO,new.INPUTPERSON,new.AGENTCODE,new.TERM,new.ISCONSIDERSTOCK,new.ISALLOWONLINE,new.ISALLOWNEGATIVE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_item_tmp1_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_item_tmp1_afterupdate` AFTER UPDATE ON `mec_itm_item_tmp1` FOR EACH ROW begin
insert into mec_itm_item_log1(_ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt)
values(new.ID,new.ITEMCODE,new.BARCODE,new.ITEMNAME,new.ITEMSHORTNAME,new.BRANDCODE,new.RETAILTYPECODE,new.ITEMTYPECODE,new.MERCHANTCODE,new.BUSINESSMODE,new.PRODUCINGAREA,new.PRICE,new.TEMPPRICE,new.TAXRATE,new.EXCISERATE,new.RETURNGOODS,new.SALESTATE,new.NETWEIGHT,new.GROSSWEIGHT,new.SPECIFICATION,new.PRODUCTCODE,new.GRADE,new.COLOR,new.CASING,new.DIMENSION,new.VOLUME,new.ITEMCODETYPE,new.UNIT,new.LASTPURCHASEPRICE,new.PURCHASETAXRATE,new.SAFESTOCK,new.MAXSTOCK,new.MINSTOCK,new.MAXORDER,new.MINORDER,new.PROPERTY,new.CHECKSTATE,new.ERRORINFO,new.INPUTPERSON,new.AGENTCODE,new.TERM,new.ISCONSIDERSTOCK,new.ISALLOWONLINE,new.ISALLOWNEGATIVE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_item_tmp1`
-- ----------------------------
ALTER TABLE `mec_itm_item_tmp1` AUTO_INCREMENT=65;
DROP TRIGGER IF EXISTS `mec_tr_itm_item_tmp2_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_item_tmp2_afterinsert` AFTER INSERT ON `mec_itm_item_tmp2` FOR EACH ROW begin
insert into mec_itm_item_log2(_ID,ITEMCODE,TITLE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.ITEMCODE,new.TITLE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_item_tmp2_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_item_tmp2_afterupdate` AFTER UPDATE ON `mec_itm_item_tmp2` FOR EACH ROW begin
insert into mec_itm_item_log2(_ID,ITEMCODE,TITLE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.ITEMCODE,new.TITLE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_item_tmp2`
-- ----------------------------
ALTER TABLE `mec_itm_item_tmp2` AUTO_INCREMENT=69;

-- ----------------------------
-- Auto increment value for `mec_itm_itemcategory`
-- ----------------------------
ALTER TABLE `mec_itm_itemcategory` AUTO_INCREMENT=68;

-- ----------------------------
-- Auto increment value for `mec_itm_itemcategory_log`
-- ----------------------------
ALTER TABLE `mec_itm_itemcategory_log` AUTO_INCREMENT=269;
DROP TRIGGER IF EXISTS `mec_tr_itm_itemcategory_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_itemcategory_tmp_afterinsert` AFTER INSERT ON `mec_itm_itemcategory_tmp` FOR EACH ROW begin
insert into mec_itm_itemcategory_log(_ID,__ID,ITEMCODE,CATEGORYID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.CATEGORYID,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_itemcategory_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_itemcategory_tmp_afterupdate` AFTER UPDATE ON `mec_itm_itemcategory_tmp` FOR EACH ROW begin
insert into mec_itm_itemcategory_log(_ID,__ID,ITEMCODE,CATEGORYID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.CATEGORYID,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_itemcategory_tmp`
-- ----------------------------
ALTER TABLE `mec_itm_itemcategory_tmp` AUTO_INCREMENT=194;

-- ----------------------------
-- Auto increment value for `mec_itm_itemregion`
-- ----------------------------
ALTER TABLE `mec_itm_itemregion` AUTO_INCREMENT=57;

-- ----------------------------
-- Auto increment value for `mec_itm_itemregion_log`
-- ----------------------------
ALTER TABLE `mec_itm_itemregion_log` AUTO_INCREMENT=263;
DROP TRIGGER IF EXISTS `mec_tr_itm_itemregion_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_itemregion_tmp_afterinsert` AFTER INSERT ON `mec_itm_itemregion_tmp` FOR EACH ROW begin
insert into mec_itm_itemregion_log(_ID,__ID,ITEMCODE,REGIONID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.REGIONID,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_itemregion_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_itemregion_tmp_afterupdate` AFTER UPDATE ON `mec_itm_itemregion_tmp` FOR EACH ROW begin
insert into mec_itm_itemregion_log(_ID,__ID,ITEMCODE,REGIONID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.REGIONID,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_itemregion_tmp`
-- ----------------------------
ALTER TABLE `mec_itm_itemregion_tmp` AUTO_INCREMENT=183;

-- ----------------------------
-- Auto increment value for `mec_itm_parameter`
-- ----------------------------
ALTER TABLE `mec_itm_parameter` AUTO_INCREMENT=118;

-- ----------------------------
-- Auto increment value for `mec_itm_parameter_log`
-- ----------------------------
ALTER TABLE `mec_itm_parameter_log` AUTO_INCREMENT=277;
DROP TRIGGER IF EXISTS `mec_tr_itm_parameter_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_parameter_tmp_afterinsert` AFTER INSERT ON `mec_itm_parameter_tmp` FOR EACH ROW begin
insert into mec_itm_parameter_log(_ID,__ID,ITEMCODE,ATTRIBUTE,VALUE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.ATTRIBUTE,new.VALUE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_parameter_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_parameter_tmp_afterupdate` AFTER UPDATE ON `mec_itm_parameter_tmp` FOR EACH ROW begin
insert into mec_itm_parameter_log(_ID,__ID,ITEMCODE,ATTRIBUTE,VALUE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.ATTRIBUTE,new.VALUE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_parameter_tmp`
-- ----------------------------
ALTER TABLE `mec_itm_parameter_tmp` AUTO_INCREMENT=217;
DROP TRIGGER IF EXISTS `mec_tr_itm_paramtemplate_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_paramtemplate_afterinsert` AFTER INSERT ON `mec_itm_paramtemplate` FOR EACH ROW begin
insert into mec_itm_paramtemplate_log(_ID,CATEGORYID,ATTRIBUTE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.CATEGORYID,new.ATTRIBUTE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_paramtemplate_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_paramtemplate_afterupdate` AFTER UPDATE ON `mec_itm_paramtemplate` FOR EACH ROW begin
insert into mec_itm_paramtemplate_log(_ID,CATEGORYID,ATTRIBUTE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.CATEGORYID,new.ATTRIBUTE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_paramtemplate`
-- ----------------------------
ALTER TABLE `mec_itm_paramtemplate` AUTO_INCREMENT=482;

-- ----------------------------
-- Auto increment value for `mec_itm_paramtemplate_log`
-- ----------------------------
ALTER TABLE `mec_itm_paramtemplate_log` AUTO_INCREMENT=520;
DROP TRIGGER IF EXISTS `mec_tr_itm_region_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_region_afterinsert` AFTER INSERT ON `mec_itm_region` FOR EACH ROW begin
insert into mec_itm_region_log(REGIONID,REGIONNAME,SUPERREGIONID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.REGIONID,new.REGIONNAME,new.SUPERREGIONID,new.IMGURL,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_region_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_region_afterupdate` AFTER UPDATE ON `mec_itm_region` FOR EACH ROW begin
insert into mec_itm_region_log(REGIONID,REGIONNAME,SUPERREGIONID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.REGIONID,new.REGIONNAME,new.SUPERREGIONID,new.IMGURL,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_region`
-- ----------------------------
ALTER TABLE `mec_itm_region` AUTO_INCREMENT=440;

-- ----------------------------
-- Auto increment value for `mec_itm_region_log`
-- ----------------------------
ALTER TABLE `mec_itm_region_log` AUTO_INCREMENT=318;

-- ----------------------------
-- Auto increment value for `mec_itm_skc_log`
-- ----------------------------
ALTER TABLE `mec_itm_skc_log` AUTO_INCREMENT=285;
DROP TRIGGER IF EXISTS `mec_tr_itm_skc_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_skc_tmp_afterinsert` AFTER INSERT ON `mec_itm_skc_tmp` FOR EACH ROW begin
insert into mec_itm_skc_log(_ID,SKCCODE,ITEMCODE,MERCHANTSKCCODE,SIZE,COLOR,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.SKCCODE,new.ITEMCODE,new.MERCHANTSKCCODE,new.SIZE,new.COLOR,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_skc_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_skc_tmp_afterupdate` AFTER UPDATE ON `mec_itm_skc_tmp` FOR EACH ROW begin
insert into mec_itm_skc_log(_ID,SKCCODE,ITEMCODE,MERCHANTSKCCODE,SIZE,COLOR,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.SKCCODE,new.ITEMCODE,new.MERCHANTSKCCODE,new.SIZE,new.COLOR,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_skc_tmp`
-- ----------------------------
ALTER TABLE `mec_itm_skc_tmp` AUTO_INCREMENT=192;
DROP TRIGGER IF EXISTS `mec_tr_itm_stock_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_stock_afterinsert` AFTER INSERT ON `mec_itm_stock` FOR EACH ROW begin
insert into mec_itm_stock_log(_ID,SKCCODE,COUNTERCODE,AMOUNT,DELTA,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.SKCCODE,new.COUNTERCODE,new.AMOUNT,new.AMOUNT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_itm_stock_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_itm_stock_afterupdate` AFTER UPDATE ON `mec_itm_stock` FOR EACH ROW begin
insert into mec_itm_stock_log(_ID,SKCCODE,COUNTERCODE,AMOUNT,DELTA,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.SKCCODE,new.COUNTERCODE,new.AMOUNT,cast(new.AMOUNT as signed)-cast(old.AMOUNT as signed),new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_itm_stock`
-- ----------------------------
ALTER TABLE `mec_itm_stock` AUTO_INCREMENT=126;

-- ----------------------------
-- Auto increment value for `mec_itm_stock_log`
-- ----------------------------
ALTER TABLE `mec_itm_stock_log` AUTO_INCREMENT=8784;

-- ----------------------------
-- Auto increment value for `mec_itm_virtualstoreitem`
-- ----------------------------
ALTER TABLE `mec_itm_virtualstoreitem` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `mec_lgt_logistics`
-- ----------------------------
ALTER TABLE `mec_lgt_logistics` AUTO_INCREMENT=23;
DROP TRIGGER IF EXISTS `mec_tr_lgt_package_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_lgt_package_afterinsert` AFTER INSERT ON `mec_lgt_package` FOR EACH ROW begin
insert into mec_lgt_package_log(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.PACKAGECODE,new.ORDERCODE,new.ISONLINEORDER,new.PAYMENTMODE,new.DELIVERYMODE,new.DELIVERYDEPTCODE,new.DEPTCODE,new.COUNTERCODE,new.PACKAGESTATE,new.POSITIONCODE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_lgt_package_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_lgt_package_afterupdate` AFTER UPDATE ON `mec_lgt_package` FOR EACH ROW begin
insert into mec_lgt_package_log(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.PACKAGECODE,new.ORDERCODE,new.ISONLINEORDER,new.PAYMENTMODE,new.DELIVERYMODE,new.DELIVERYDEPTCODE,new.DEPTCODE,new.COUNTERCODE,new.PACKAGESTATE,new.POSITIONCODE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_lgt_package_log`
-- ----------------------------
ALTER TABLE `mec_lgt_package_log` AUTO_INCREMENT=447;

-- ----------------------------
-- Auto increment value for `mec_lgt_packagecontent`
-- ----------------------------
ALTER TABLE `mec_lgt_packagecontent` AUTO_INCREMENT=134;

-- ----------------------------
-- Auto increment value for `mec_lgt_pickcounter`
-- ----------------------------
ALTER TABLE `mec_lgt_pickcounter` AUTO_INCREMENT=24;

-- ----------------------------
-- Auto increment value for `mec_lgt_pickdept`
-- ----------------------------
ALTER TABLE `mec_lgt_pickdept` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `mec_prm_itemrule`
-- ----------------------------
ALTER TABLE `mec_prm_itemrule` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `mec_prm_prmrule`
-- ----------------------------
ALTER TABLE `mec_prm_prmrule` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `mec_prm_prmrule_log`
-- ----------------------------
ALTER TABLE `mec_prm_prmrule_log` AUTO_INCREMENT=8;
DROP TRIGGER IF EXISTS `mec_tr_prm_prmrule_tmp_afterinset`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_prm_prmrule_tmp_afterinset` AFTER INSERT ON `mec_prm_prmrule_tmp` FOR EACH ROW begin
insert into mec_prm_prmrule_log(_ID,RULECODE,RULECONTENT,`DATEEFFECTIVE`,`DATEEXPIRES`,DEPTCODE,STATE,REDUCECONVERT,REDUCE,COUPONCONVERT,COUPON,GIFTCONVERT,GIFT,RULESCRIPT,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.RULECODE,new.RULECONTENT,new.`DATEEFFECTIVE`,new.`DATEEXPIRES`,new.DEPTCODE,new.STATE,new.REDUCECONVERT,new.REDUCE,new.COUPONCONVERT,new.COUPON,new.GIFTCONVERT,new.GIFT,new.RULESCRIPT,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_prm_prmrule_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_prm_prmrule_tmp_afterupdate` AFTER UPDATE ON `mec_prm_prmrule_tmp` FOR EACH ROW begin
insert into mec_prm_prmrule_log(_ID,RULECODE,RULECONTENT,`DATEEFFECTIVE`,`DATEEXPIRES`,DEPTCODE,STATE,REDUCECONVERT,REDUCE,COUPONCONVERT,COUPON,GIFTCONVERT,GIFT,RULESCRIPT,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.RULECODE,new.RULECONTENT,new.`DATEEFFECTIVE`,new.`DATEEXPIRES`,new.DEPTCODE,new.STATE,new.REDUCECONVERT,new.REDUCE,new.COUPONCONVERT,new.COUPON,new.GIFTCONVERT,new.GIFT,new.RULESCRIPT,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_prm_prmrule_tmp`
-- ----------------------------
ALTER TABLE `mec_prm_prmrule_tmp` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `mec_prm_rule`
-- ----------------------------
ALTER TABLE `mec_prm_rule` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `mec_prm_rule_log`
-- ----------------------------
ALTER TABLE `mec_prm_rule_log` AUTO_INCREMENT=61;
DROP TRIGGER IF EXISTS `mec_tr_prm_rule_tmp_afterinsert`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_prm_rule_tmp_afterinsert` AFTER INSERT ON `mec_prm_rule_tmp` FOR EACH ROW begin
insert into mec_prm_rule_log(_ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.RULEID,new.RULENAME,new.RULEDESCRIPTION,new.RULESCRIPT,new.`DATE-EFFECTIVE`,new.`DATE-EXPIRES`,new.SALIENCE,new.DEPTCODE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mec_tr_prm_rule_tmp_afterupdate`;
DELIMITER ;;
CREATE TRIGGER `mec_tr_prm_rule_tmp_afterupdate` AFTER UPDATE ON `mec_prm_rule_tmp` FOR EACH ROW begin
insert into mec_prm_rule_log(_ID,RULEID,RULENAME,RULEDESCRIPTION,RULESCRIPT,`DATE-EFFECTIVE`,`DATE-EXPIRES`,SALIENCE,DEPTCODE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.RULEID,new.RULENAME,new.RULEDESCRIPTION,new.RULESCRIPT,new.`DATE-EFFECTIVE`,new.`DATE-EXPIRES`,new.SALIENCE,new.DEPTCODE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `mec_prm_rule_tmp`
-- ----------------------------
ALTER TABLE `mec_prm_rule_tmp` AUTO_INCREMENT=61;

-- ----------------------------
-- Auto increment value for `test_log`
-- ----------------------------
ALTER TABLE `test_log` AUTO_INCREMENT=14;
DROP TRIGGER IF EXISTS `tr_test_tigger_insert`;
DELIMITER ;;
CREATE TRIGGER `tr_test_tigger_insert` AFTER INSERT ON `test_trigger` FOR EACH ROW begin
IF new.bb=88888  THEN  
        insert into test_log(aa,bb,operation,recordDatetime) values(new.aa,new.bb,1241234123412340,now());
ELSEIF new.bb=66666 THEN  
        insert into test_log(aa,bb,operation,recordDatetime) values(new.aa,new.bb,0,now());
ELSE  
        set @x=0; 
        insert into test_log(aa,bb,operation,recordDatetime) values(new.aa,@x,0,now()); 
END IF; 
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `test_trigger`
-- ----------------------------
ALTER TABLE `test_trigger` AUTO_INCREMENT=878;
