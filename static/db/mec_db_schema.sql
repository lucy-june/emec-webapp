DROP DATABASE `mec`;
CREATE DATABASE  IF NOT EXISTS `mec` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mec`;
-- ------------------------------------------------------
-- Server version	5.6.22-71.0-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- create db user for mec
grant all privileges on mec.* to mec_admin@'%' identified by 'plMqAz1571' with grant option;
grant all privileges on mec.* to mec_admin@'localhost' identified by 'plMqAz1571' with grant option;
--
-- Table structure for table `hct_brand`
--

DROP TABLE IF EXISTS `hct_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hct_brand` (
  `BRANDCODE` char(6) NOT NULL,
  `BRANDNAME` varchar(50) DEFAULT NULL,
  `CURRENTGRADE` float(38,0) DEFAULT NULL,
  `BRANDSTATE` char(2) DEFAULT '0',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '品牌Logo地址，added by kcq 2015.4.2',
  `LETTER` varchar(4) DEFAULT NULL,
  `FAMOUSCOMMENT` varchar(50) DEFAULT NULL,
  `ORIGIN` varchar(50) DEFAULT NULL,
  `QUALITYCOMMENT` varchar(50) DEFAULT NULL,
  `STYLECOMMENT` varchar(50) DEFAULT NULL,
  `EXPERTCOMMENT` varchar(50) DEFAULT NULL,
  `IMAGECOMMENT` varchar(50) DEFAULT NULL,
  `HISTORY` varchar(50) DEFAULT NULL,
  `POTENTIAL` varchar(50) DEFAULT NULL,
  `OVERLAY` float(5,2) DEFAULT NULL,
  `BRANDCLASS` varchar(50) DEFAULT NULL,
  `RECOMMENDMAN` varchar(20) DEFAULT NULL,
  `PRICELEVEL` varchar(10) DEFAULT NULL,
  `REGISTERCAPITAL` float(10,0) DEFAULT NULL,
  `STOREYEARTURNOVER` varchar(10) DEFAULT NULL,
  `DESIGNPRODUCE` varchar(20) DEFAULT NULL,
  `AGENTSTRATEGY` varchar(20) DEFAULT NULL,
  `IMAGECOUNTER` varchar(20) DEFAULT NULL,
  `DEALAREA` float(6,2) DEFAULT NULL,
  `SAMPLE` varchar(10) DEFAULT NULL,
  `FUTURESALE` varchar(10) DEFAULT NULL,
  `REMARK` varchar(150) DEFAULT NULL,
  `INPUTPERSON` char(6) DEFAULT NULL,
  `INPUTDATE` date DEFAULT NULL,
  `CHECKPERSON` char(6) DEFAULT NULL,
  `CHECKDATE` date DEFAULT NULL,
  PRIMARY KEY (`BRANDCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hct_merchant`
--

DROP TABLE IF EXISTS `hct_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hct_merchant` (
  `MERCHANTCODE` char(6) NOT NULL,
  `MERCHANTNAME` varchar(50) DEFAULT NULL,
  `ALIAS` varchar(50) DEFAULT NULL,
  `LEGALPERSON` varchar(10) DEFAULT NULL,
  `COMPANYPROPERTY` varchar(20) DEFAULT NULL,
  `REGISTEREDCAPITAL` float(12,2) DEFAULT NULL,
  `OPERTAIONBOUND` varchar(100) DEFAULT NULL,
  `OPERTAIONZONE` varchar(50) DEFAULT NULL,
  `CHANNEL` varchar(50) DEFAULT NULL,
  `OPERTAIONMODE` varchar(50) DEFAULT NULL,
  `FOUNDDATE` date DEFAULT NULL,
  `ENTRANCEDATE` date DEFAULT NULL,
  `TAXCODE` varchar(18) DEFAULT NULL,
  `COMPANYCODE` varchar(30) DEFAULT NULL,
  `BANKNAME` varchar(50) DEFAULT NULL,
  `BANKACCOUNTNO` varchar(50) DEFAULT NULL,
  `LEGALPHONE` varchar(20) DEFAULT NULL,
  `LEGALADDRESS` varchar(50) DEFAULT NULL,
  `POSTALCODE` varchar(6) DEFAULT NULL,
  `MAILADDRESS` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `WEBSITE` varchar(50) DEFAULT NULL,
  `MERCHANTSTATE` char(2) DEFAULT NULL,
  `PURCHASETAXRATE` float(4,2) DEFAULT NULL,
  `WAREHOUSEADDRESS` varchar(50) DEFAULT NULL,
  `FAX` varchar(50) DEFAULT NULL,
  `RECOMMENDPERSON` varchar(10) DEFAULT NULL,
  `MERCHANTREMARK` varchar(100) DEFAULT NULL,
  `INPUTPERSON` char(6) DEFAULT NULL,
  `INPUTDATE` date DEFAULT NULL,
  `CHECKPERSON` char(6) DEFAULT NULL,
  `CHECKDATE` date DEFAULT NULL,
  PRIMARY KEY (`MERCHANTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_agent`
--

DROP TABLE IF EXISTS `hsy_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_agent` (
  `AGENTCODE` char(3) NOT NULL,
  `AGENTNAME` varchar(20) DEFAULT NULL,
  `STAFFCODE` char(6) DEFAULT NULL,
  `STATE` float(1,0) DEFAULT NULL,
  PRIMARY KEY (`AGENTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_chargetype`
--

DROP TABLE IF EXISTS `hsy_chargetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_chargetype` (
  `CHARGETYPECODE` char(3) DEFAULT NULL,
  `CHARGETYPENAME` varchar(50) DEFAULT NULL,
  `CHARGEMODE` decimal(1,0) DEFAULT NULL,
  `TYPEBCODE` decimal(4,0) DEFAULT '1',
  `TYPEACCODE` decimal(4,0) DEFAULT '1',
  `TAXRATECODE` varchar(2) DEFAULT '08',
  `PRINTSTATE` decimal(1,0) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_department`
--

DROP TABLE IF EXISTS `hsy_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_department` (
  `DEPTCODE` varchar(8) NOT NULL,
  `DEPTNAME` varchar(30) DEFAULT NULL,
  `DEPTSHORTNAME` varchar(16) DEFAULT NULL,
  `ADDRESSCODE` char(3) DEFAULT NULL,
  `TELEPHONE` varchar(50) DEFAULT NULL,
  `FAX` varchar(50) DEFAULT NULL,
  `MAILBOX` varchar(50) DEFAULT NULL,
  `MANAGER` char(6) DEFAULT NULL,
  `CONTACT` char(6) DEFAULT NULL,
  `DEPTTYPE` char(2) NOT NULL,
  `SUPERIORDEPTCODE` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`DEPTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_itemtype`
--

DROP TABLE IF EXISTS `hsy_itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_itemtype` (
  `ITEMTYPECODE` char(5) NOT NULL,
  `ITEMTYPENAME` varchar(20) DEFAULT NULL,
  `TAXRATE` char(2) NOT NULL DEFAULT '01',
  `EXCISERATE` char(2) NOT NULL DEFAULT '07',
  `PURCHASETAXRATE` char(2) NOT NULL DEFAULT '01',
  PRIMARY KEY (`ITEMTYPECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_paymode`
--

DROP TABLE IF EXISTS `hsy_paymode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_paymode` (
  `PAYMODECODE` char(2) DEFAULT NULL,
  `PAYMODENAME` varchar(20) DEFAULT NULL,
  `ISCHARGE` decimal(1,0) DEFAULT NULL,
  `ISMAKEINVOICE` decimal(1,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_retailtype`
--

DROP TABLE IF EXISTS `hsy_retailtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_retailtype` (
  `RETAILTYPECODE` char(3) NOT NULL,
  `RETAILTYPENAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RETAILTYPECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hsy_taxrate`
--

DROP TABLE IF EXISTS `hsy_taxrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsy_taxrate` (
  `TAXRATECODE` char(2) NOT NULL,
  `TAXRATENAME` varchar(20) DEFAULT NULL,
  `TAXRATE` float(3,2) NOT NULL,
  PRIMARY KEY (`TAXRATECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_adm_admin`
--

DROP TABLE IF EXISTS `mec_adm_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_adm_admin` (
  `USERCODE` char(32) NOT NULL,
  `ROLE` int(11) NOT NULL COMMENT '0-商城管理员 1-柜账号 2-业务员 3-物流管理员 9-超级管理员',
  `DEPTCODE` varchar(8) DEFAULT NULL,
  `COUNTERCODE` char(6) DEFAULT NULL,
  `TELEPHONE` char(11) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `HASH` varchar(128) NOT NULL,
  `SALT` varchar(64) NOT NULL,
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1' COMMENT '0-无效 1-有效',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`USERCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理员信息';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_adm_admin_afterinsert
after insert on mec_adm_admin
for each row
begin
insert into mec_adm_admin_log(USERCODE,ROLE,DEPTCODE,COUNTERCODE,TELEPHONE,EMAIL,NAME,GENDER,HASH,SALT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.USERCODE,new.ROLE,new.DEPTCODE,new.COUNTERCODE,new.TELEPHONE,new.EMAIL,new.NAME,new.GENDER,new.HASH,new.SALT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_adm_admin_afterupdate
after update on mec_adm_admin
for each row
begin
insert into mec_adm_admin_log(USERCODE,ROLE,DEPTCODE,COUNTERCODE,TELEPHONE,EMAIL,NAME,GENDER,HASH,SALT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.USERCODE,new.ROLE,new.DEPTCODE,new.COUNTERCODE,new.TELEPHONE,new.EMAIL,new.NAME,new.GENDER,new.HASH,new.SALT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_adm_admin_log`
--

DROP TABLE IF EXISTS `mec_adm_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_adm_admin_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) NOT NULL,
  `ROLE` int(11) NOT NULL COMMENT '0-商城管理员 1-柜账号 2-业务员 3-物流管理员 9-超级管理员',
  `DEPTCODE` varchar(8) DEFAULT NULL,
  `COUNTERCODE` char(6) DEFAULT NULL,
  `TELEPHONE` char(11) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `HASH` varchar(128) NOT NULL,
  `SALT` varchar(64) NOT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='系统管理员信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_adm_assistant`
--

DROP TABLE IF EXISTS `mec_adm_assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_adm_assistant` (
  `ASSISTANTID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTERCODE` char(6) NOT NULL,
  `NAME` varchar(10) NOT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `IDNUMBER` char(18) DEFAULT NULL,
  `TELEPHONE` char(11) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ASSISTANTID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_adm_assistant_afterinsert` AFTER INSERT ON `mec_adm_assistant`
FOR EACH ROW begin
insert into mec_adm_assistant_log(ASSISTANTID,COUNTERCODE,NAME,GENDER,IDNUMBER,TELEPHONE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ASSISTANTID,new.COUNTERCODE,new.NAME,new.GENDER,new.IDNUMBER,new.TELEPHONE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_adm_assistant_afterupdate` AFTER UPDATE ON `mec_adm_assistant`
FOR EACH ROW begin
insert into mec_adm_assistant_log(ASSISTANTID,COUNTERCODE,NAME,GENDER,IDNUMBER,TELEPHONE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ASSISTANTID,new.COUNTERCODE,new.NAME,new.GENDER,new.IDNUMBER,new.TELEPHONE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_adm_assistant_log`
--

DROP TABLE IF EXISTS `mec_adm_assistant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_adm_assistant_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSISTANTID` int(11) NOT NULL,
  `COUNTERCODE` char(6) NOT NULL,
  `NAME` varchar(10) NOT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `IDNUMBER` char(18) DEFAULT NULL,
  `TELEPHONE` char(11) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_adm_ukey`
--

DROP TABLE IF EXISTS `mec_adm_ukey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_adm_ukey` (
  `KEYID` varchar(20) NOT NULL,
  `KEYTYPE` tinyint(4) DEFAULT '0',
  `STATUS` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'U盾的状态，1有效，2挂失，3注销',
  `KEYPATH` varchar(255) DEFAULT NULL,
  `COUNTERCODE` char(6) NOT NULL,
  `LASTOPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建日期',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`KEYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_adm_ukey_afterinsert` AFTER INSERT ON `mec_adm_ukey`
FOR EACH ROW begin
insert into mec_adm_ukey_log(KEYID,KEYTYPE,STATUS,KEYPATH,COUNTERCODE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.KEYID,new.KEYTYPE,new.STATUS,new.KEYPATH,new.COUNTERCODE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_adm_ukey_afterupdate` AFTER UPDATE ON `mec_adm_ukey`
FOR EACH ROW begin
insert into mec_adm_ukey_log(KEYID,KEYTYPE,STATUS,KEYPATH,COUNTERCODE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.KEYID,new.KEYTYPE,new.STATUS,new.KEYPATH,new.COUNTERCODE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_adm_ukey_log`
--

DROP TABLE IF EXISTS `mec_adm_ukey_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_adm_ukey_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEYID` varchar(20) NOT NULL,
  `KEYTYPE` tinyint(4) DEFAULT '0',
  `STATUS` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'U盾的状态，1有效，2挂失，3注销',
  `KEYPATH` varchar(255) DEFAULT NULL,
  `COUNTERCODE` char(6) NOT NULL,
  `OPERATION` int(11) NOT NULL DEFAULT '0',
  `OPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_anl_hotbrand`
--

DROP TABLE IF EXISTS `mec_anl_hotbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_anl_hotbrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRANDCODE` char(6) NOT NULL,
  `WEIGHT` int(11) NOT NULL DEFAULT '1',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_anl_hotbrand_afterinsert
after insert on mec_anl_hotbrand
for each row
begin
insert into mec_anl_hotbrand_log(_ID,BRANDCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.BRANDCODE,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_anl_hotbrand_afterupdate` AFTER UPDATE ON `mec_anl_hotbrand`
FOR EACH ROW begin
insert into mec_anl_hotbrand_log(_ID,BRANDCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.BRANDCODE,new.WEIGHT,new.RECORDSTATE,22222222222222222222,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_anl_hotbrand_log`
--

DROP TABLE IF EXISTS `mec_anl_hotbrand_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_anl_hotbrand_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `BRANDCODE` char(6) NOT NULL,
  `WEIGHT` int(11) NOT NULL DEFAULT '1',
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_anl_hotbuy`
--

DROP TABLE IF EXISTS `mec_anl_hotbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_anl_hotbuy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL,
  `WEIGHT` int(11) NOT NULL DEFAULT '1',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_anl_hotbuy_afterinsert
after insert on mec_anl_hotbuy
for each row
begin
insert into mec_anl_hotbuy_log(_ID,ITEMCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.ITEMCODE,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_anl_hotbuy_afterupdate
after update on mec_anl_hotbuy
for each row
begin
insert into mec_anl_hotbuy_log(_ID,ITEMCODE,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.ITEMCODE,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_anl_hotbuy_log`
--

DROP TABLE IF EXISTS `mec_anl_hotbuy_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_anl_hotbuy_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `WEIGHT` int(11) NOT NULL DEFAULT '1',
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_anl_hotsearch`
--

DROP TABLE IF EXISTS `mec_anl_hotsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_anl_hotsearch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEYWORD` varchar(128) NOT NULL,
  `WEIGHT` int(11) NOT NULL DEFAULT '1',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_anl_hotsearch_afterinsert
after insert on mec_anl_hotsearch
for each row
begin
insert into mec_anl_hotsearch_log(_ID,KEYWORD,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.KEYWORD,new.WEIGHT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_anl_hotsearch_afterupdate
after update on mec_anl_hotsearch
for each row
begin
insert into mec_anl_hotsearch_log(_ID,KEYWORD,WEIGHT,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.KEYWORD,new.WEIGHT,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_anl_hotsearch_log`
--

DROP TABLE IF EXISTS `mec_anl_hotsearch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_anl_hotsearch_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `KEYWORD` varchar(128) NOT NULL,
  `WEIGHT` int(11) NOT NULL DEFAULT '1',
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_app_activity`
--

DROP TABLE IF EXISTS `mec_app_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_app_activity` (
  `ACTIVITYID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PIC` varchar(255) DEFAULT NULL,
  `VALID` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0无效，1有效',
  `LASTOPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ACTIVITYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_app_home`
--

DROP TABLE IF EXISTS `mec_app_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_app_home` (
  `BUNDLEID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:独立一个，1:左一右一，2：左二右一，3：左一右二',
  `ACTIVITYID1` int(11) NOT NULL COMMENT '第一个活动',
  `PIC1` varchar(255) DEFAULT NULL,
  `ACTIVITYID2` int(11) DEFAULT NULL,
  `PIC2` varchar(255) DEFAULT NULL,
  `ACTIVITYID3` int(11) DEFAULT NULL,
  `PIC3` varchar(255) DEFAULT NULL,
  `VALID` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0:无效，1：有效',
  `PRIORITY` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `STARTTIME` datetime DEFAULT NULL,
  `ENDTIME` datetime DEFAULT NULL,
  `LASTOPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`BUNDLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_app_home_afterinsert` AFTER INSERT ON `mec_app_home` FOR EACH ROW begin
insert into mec_app_home_log(BUNDLEID,TYPE,ACTIVITYID1,PIC1,ACTIVITYID2,PIC2,ACTIVITYID3,PIC3,VALID,PRIORITY,STARTTIME,ENDTIME,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.BUNDLEID,new.TYPE,new.ACTIVITYID1,new.PIC1,new.ACTIVITYID2,new.PIC2,new.ACTIVITYID3,new.PIC3,new.VALID,new.PRIORITY,new.STARTTIME,new.ENDTIME,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_app_home_afterupdate` AFTER UPDATE ON `mec_app_home` FOR EACH ROW begin
insert into mec_app_home_log(BUNDLEID,TYPE,ACTIVITYID1,PIC1,ACTIVITYID2,PIC2,ACTIVITYID3,PIC3,VALID,PRIORITY,STARTTIMR,ENDTIME,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.BUNDLEID,new.TYPE,new.ACTIVITYID1,new.PIC1,new.ACTIVITYID2,new.PIC2,new.ACTIVITYID3,new.PIC3,new.VALID,new.PRIORITY,new.STARTTIME,new.ENDTIME,1,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_app_home_log`
--

DROP TABLE IF EXISTS `mec_app_home_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_app_home_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUNDLEID` int(11) NOT NULL,
  `TYPE` tinyint(4) NOT NULL,
  `ACTIVITYID1` int(11) NOT NULL,
  `PIC1` varchar(255) DEFAULT NULL,
  `ACTIVITYID2` int(11) DEFAULT NULL,
  `PIC2` varchar(255) DEFAULT NULL,
  `ACTIVITYID3` int(11) DEFAULT NULL,
  `PIC3` varchar(255) DEFAULT NULL,
  `VALID` tinyint(2) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STARTTIME` datetime NOT NULL,
  `ENDTIME` datetime DEFAULT NULL,
  `OPERATION` int(255) NOT NULL DEFAULT '0',
  `OPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_audit_charge`
--

DROP TABLE IF EXISTS `mec_audit_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_audit_charge` (
  `CHARGEID` int(11) NOT NULL AUTO_INCREMENT,
  `ISONLINEORDER` int(1) NOT NULL,
  `ORDERCODE` char(18) NOT NULL,
  `CHARGECODE` char(2) NOT NULL,
  `AMT` double NOT NULL COMMENT '费用金额（减免费用为负数；顾客应付费用为正数）',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`CHARGEID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_audit_discount`
--

DROP TABLE IF EXISTS `mec_audit_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_audit_discount` (
  `DISCOUNTID` int(11) NOT NULL AUTO_INCREMENT,
  `ISONLINEORDER` int(1) NOT NULL,
  `GROUPCODE` char(20) DEFAULT NULL COMMENT '组号，区分是否是拼单',
  `ORDERCODE` char(18) NOT NULL,
  `CONTENTCODE` char(26) NOT NULL,
  `DISCOUNTREASON` int(11) NOT NULL,
  `DISCOUNTTYPE` int(11) DEFAULT NULL COMMENT '1-折让；2-折扣；3-增礼；4-手工折扣；5-供应商活动',
  `DISCOUNTAMT` decimal(12,2) NOT NULL,
  `VIPCARDTYPE` char(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`DISCOUNTID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_audit_pay`
--

DROP TABLE IF EXISTS `mec_audit_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_audit_pay` (
  `PAYID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYCODE` char(2) NOT NULL,
  `GROUPCODE` char(20) DEFAULT NULL COMMENT '支付组号， 不是拼单情况下与ORDERCODE相同',
  `ORDERCODE` char(18) DEFAULT NULL,
  `ISONLINEORDER` int(1) NOT NULL,
  `AMT` double NOT NULL,
  `CARDCODE` char(32) DEFAULT NULL,
  `PORTNO` char(8) DEFAULT NULL COMMENT '端口号(10229--工行，30129--交行，10529--建行……)（线下）',
  `BANKCARDCODE` char(32) DEFAULT NULL COMMENT '刷卡方式（外键）（手工、银联）（线下）',
  `FEERATECODE` char(2) DEFAULT NULL,
  `IFRETURN` int(1) NOT NULL DEFAULT '0' COMMENT '0-非退货 1-退货',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`PAYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_bhv_comment`
--

DROP TABLE IF EXISTS `mec_bhv_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_bhv_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENTCODE` char(26) NOT NULL,
  `ISONLINEORDER` int(1) NOT NULL,
  `ORDERCODE` char(18) NOT NULL,
  `USERCODE` char(32) NOT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `STARS` int(1) NOT NULL DEFAULT '5' COMMENT '0-5颗星',
  `COMMENT` varchar(256) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_bhv_favoritebrand`
--

DROP TABLE IF EXISTS `mec_bhv_favoritebrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_bhv_favoritebrand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) NOT NULL,
  `BRANDCODE` char(6) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_bhv_favoriteitem`
--

DROP TABLE IF EXISTS `mec_bhv_favoriteitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_bhv_favoriteitem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) NOT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_bhv_request`
--

DROP TABLE IF EXISTS `mec_bhv_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_bhv_request` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) DEFAULT NULL,
  `URL` varchar(256) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_bhv_search`
--

DROP TABLE IF EXISTS `mec_bhv_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_bhv_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) DEFAULT NULL,
  `KEYWORDS` varchar(128) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_buy_offlinecontent`
--

DROP TABLE IF EXISTS `mec_buy_offlinecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_offlinecontent` (
  `OFFLINECONTENTCODE` char(26) NOT NULL,
  `OFFLINEORDERCODE` char(18) NOT NULL,
  `COUNTERCODE` char(6) NOT NULL DEFAULT '',
  `ITEMCODE` char(8) NOT NULL,
  `SKCCODE` char(10) DEFAULT NULL,
  `NUM` int(11) NOT NULL DEFAULT '0',
  `UNITPRICE` decimal(12,2) NOT NULL DEFAULT '0.00',
  `PROMOTIONMARK` char(1) NOT NULL DEFAULT 'X',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `FINALPRICELIST` varchar(256) DEFAULT NULL COMMENT '最终过促销引擎后均摊价格',
  `FINALPRICELIST2` varchar(256) DEFAULT NULL COMMENT '拼单付款的价格分摊',
  `FINALRULELIST` varchar(256) DEFAULT NULL COMMENT '最终适用规则，具体到每一个物品',
  `FINALRULELIST2` varchar(256) DEFAULT NULL COMMENT '拼单付款的规则分摊',
  `RETAILAMT` decimal(12,2) DEFAULT '0.00' COMMENT '成交价（分摊后实际折后价）',
  `RETAILAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '拼单付款的成交价（分摊后实际折后价）',
  `REALVIPCARDTYPE` varchar(6) DEFAULT '00' COMMENT 'vip卡类型((给pos)',
  `REALVIPCARDTYPE2` varchar(6) DEFAULT '00' COMMENT 'vip卡类型((给pos)',
  `REALVIPDISCOUNTRATE` decimal(12,2) DEFAULT '100.00' COMMENT '实际享受的vip折扣，金卡对某些商品可能不打折(给pos)',
  `REALVIPDISCOUNTRATE2` decimal(12,2) DEFAULT '100.00' COMMENT '实际享受的vip折扣，金卡对某些商品可能不打折(给pos)',
  `VIPDISCOUNTAMT` decimal(12,2) DEFAULT '0.00' COMMENT '汇金贵宾卡折扣',
  `VIPDISCOUNTAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '汇金贵宾卡折扣',
  `VIPFLOORAMT` decimal(12,2) DEFAULT '0.00' COMMENT '汇金贵宾卡折扣',
  `VIPFLOORAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '汇金贵宾卡折扣',
  `DISCOUNTOUTAMT` decimal(12,2) DEFAULT '0.00' COMMENT '支付前满减 - 折让',
  `DISCOUNTOUTAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '支付前满减 - 折让',
  `DISCOUNTINAMT` decimal(12,2) DEFAULT '0.00' COMMENT '赠券',
  `DISCOUNTINAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '赠券',
  `PRESENTSHAREQTY` decimal(12,2) DEFAULT '0.00' COMMENT '赠礼',
  `PRESENTSHAREQTY2` decimal(12,2) DEFAULT '0.00' COMMENT '赠礼',
  `MERCHANTDISCOUTAMT` decimal(12,2) DEFAULT '0.00' COMMENT '供应商折扣',
  `MERCHANTDISCOUTAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '供应商折扣',
  `HANDAMT` decimal(12,2) DEFAULT NULL,
  `HANDAMT2` decimal(12,2) DEFAULT NULL,
  `SHIPPRICECHARGESHARE` decimal(12,2) DEFAULT '0.00' COMMENT '运费差额均摊',
  `SHIPPRICECHARGESHARE2` decimal(12,2) DEFAULT '0.00' COMMENT '运费差额均摊',
  `PACKINGCHARGESHARE` decimal(12,2) DEFAULT '0.00' COMMENT '包装费差额均摊',
  `PACKINGCHARGESHARE2` decimal(12,2) DEFAULT '0.00' COMMENT '包装费差额均摊',
  `CASHPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的现金支付份额',
  `CREDITPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的刷卡支付份额',
  `CASHCOUPONPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的现金券支付份额',
  `GOODSCOUPONPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的商品券支付份额',
  `ECARDPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的电子卡消费卡错卡支付份额',
  `OTHERPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的其他支付份额',
  `PREMIUMPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的溢价份额(认为是负的)',
  `ORIGINORDERCODE` char(18) DEFAULT NULL COMMENT '退货单的原始订单号码',
  `ORIGINCONTENTCODE` char(26) DEFAULT NULL COMMENT '退货订单的原始明细编号',
  `IFRETURN` int(1) NOT NULL DEFAULT '0' COMMENT '0-普通单 1-退货单',
  `TEMPDISTRIBUTIONMARK` int(1) NOT NULL DEFAULT '0' COMMENT '临时销售标志 0-否 1-是',
  PRIMARY KEY (`OFFLINECONTENTCODE`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `ORDERID` (`OFFLINEORDERCODE`),
  KEY `SKCID` (`SKCCODE`),
  KEY `FINALRULE` (`FINALRULELIST`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_buy_offlinegroup`
--

DROP TABLE IF EXISTS `mec_buy_offlinegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_offlinegroup` (
  `OFFLINEGROUPCODE` char(20) NOT NULL,
  `PAYMENTMODE` int(11) NOT NULL DEFAULT '0' COMMENT '0-现场支付，1-网上支付，3-到付',
  `STORECODE` char(8) DEFAULT NULL COMMENT '门店号',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `FINALPRICE` decimal(12,2) DEFAULT NULL,
  `FINALRULESTRING` varchar(1024) DEFAULT NULL,
  `TRANSID` char(32) DEFAULT NULL,
  `CHRCODE` char(32) DEFAULT NULL,
  `VIPCARDNO` varchar(8) DEFAULT NULL COMMENT '贵宾卡卡号',
  `RECEIVABLEAMT` decimal(12,2) DEFAULT NULL COMMENT '应收金额',
  `PAYLOCAL` int(11) DEFAULT NULL COMMENT '0-pos机付款 1-app付款',
  `POSDEALNUM` varchar(32) DEFAULT NULL COMMENT 'pos机交易序列号',
  `POSCODE` char(6) DEFAULT NULL COMMENT 'pos机号码',
  `POSTRANSCODE` varchar(32) DEFAULT NULL,
  `CASHIER` char(6) DEFAULT NULL COMMENT '收银员',
  `PAYMENTSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-未支付 1-已经支付',
  `PAYTIME` date DEFAULT NULL COMMENT '订单支付时间',
  `IFRETURN` int(1) NOT NULL DEFAULT '0' COMMENT '是否是退货单组，0-普通单 1-退货单',
  PRIMARY KEY (`OFFLINEGROUPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_buy_offlineorder`
--

DROP TABLE IF EXISTS `mec_buy_offlineorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_offlineorder` (
  `OFFLINEORDERCODE` char(18) NOT NULL,
  `OFFLINEGROUPCODE` char(20) DEFAULT NULL,
  `TEMPDISTRIBUTIONMARK` int(1) NOT NULL DEFAULT '0' COMMENT '临时销售标志 0-否 1-是',
  `USERCODE` char(32) DEFAULT NULL,
  `ORDERSTATE` int(11) NOT NULL DEFAULT '0' COMMENT '见文档',
  `PAYMENTMODE` int(11) DEFAULT NULL COMMENT '0-pos付款 1-网上付款',
  `DELIVERYMODE` int(11) NOT NULL DEFAULT '0' COMMENT '0-自提 1-物流配送',
  `SITEID` int(11) DEFAULT NULL,
  `COUNTERCODE` char(6) NOT NULL COMMENT '订单最终自提货或发货点',
  `STORECODE` char(8) DEFAULT NULL COMMENT '门店号',
  `SHIPPRICE` decimal(12,2) DEFAULT '0.00' COMMENT '运费',
  `REALSHIPPRICE` decimal(12,2) DEFAULT '0.00' COMMENT '实付运费',
  `PACKING` decimal(12,2) DEFAULT '0.00' COMMENT '包装费',
  `REALPACKING` decimal(12,2) DEFAULT '0.00' COMMENT '实付包装费',
  `SALESMANCODE` char(11) NOT NULL COMMENT '下单营业员',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `FINALPRICE` decimal(12,2) DEFAULT NULL,
  `FINALRULESTRING` varchar(512) DEFAULT NULL,
  `FINALPRICE2` decimal(12,2) DEFAULT NULL COMMENT '拼单付款的最终分摊价格',
  `FINALRULESTRING2` varchar(512) DEFAULT NULL COMMENT '拼单付款的规则分摊',
  `TRANSID` char(32) DEFAULT NULL,
  `CHRCODE` char(32) DEFAULT NULL,
  `VIPCARDNO` varchar(32) DEFAULT NULL COMMENT '贵宾卡卡号',
  `VIPCARDNO2` varchar(32) DEFAULT NULL COMMENT '贵宾卡卡号',
  `VIPCODE` varchar(8) DEFAULT NULL COMMENT 'vip账户号',
  `VIPCODE2` varchar(8) DEFAULT NULL COMMENT 'vip账户号',
  `VIPCARDTYPE` varchar(4) DEFAULT '00' COMMENT 'vip卡类型',
  `VIPCARDTYPE2` varchar(4) DEFAULT '00' COMMENT 'vip卡类型',
  `VIPDISCOUNTRATE` decimal(12,2) DEFAULT '100.00' COMMENT 'vip折扣值',
  `VIPDISCOUNTRATE2` decimal(12,2) DEFAULT '100.00' COMMENT 'vip折扣值',
  `RECEIVABLEAMT` decimal(12,2) DEFAULT '0.00' COMMENT '应收金额',
  `RECEIVABLEAMT2` decimal(12,2) DEFAULT '0.00' COMMENT '应收金额',
  `PAYMENTSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-未支付 1-单一订单支付完成 2-拼单支付完成',
  `PAYLOCAL` int(11) DEFAULT NULL COMMENT '0-pos机付款 1-app付款',
  `POSDEALNUM` varchar(32) DEFAULT NULL COMMENT 'pos机交易序列号',
  `POSCODE` char(6) DEFAULT NULL COMMENT 'pos机号码',
  `POSTRANSCODE` varchar(32) DEFAULT NULL,
  `CASHIER` char(6) DEFAULT NULL COMMENT '收银员',
  `TIMEOUTTIME` datetime DEFAULT NULL COMMENT '订单超时作废时间',
  `PLACETIME` datetime DEFAULT NULL COMMENT '下单时间',
  `AUDITTIME` datetime DEFAULT NULL COMMENT '订单审核时间',
  `PAYTIME` datetime DEFAULT NULL COMMENT '订单支付时间',
  `OUTTIME` datetime DEFAULT NULL COMMENT '订单出库时间',
  `RECEIVABLETIME` datetime DEFAULT NULL COMMENT '货到付款收款时间',
  `FINISHTIME` datetime DEFAULT NULL COMMENT '订单完成时间',
  `IFRETURN` int(1) NOT NULL DEFAULT '0' COMMENT '是否是退货单 0是普通订单 1退货订单',
  `RETORIPOSTRANSCODE` varchar(32) DEFAULT NULL,
  `RETUSERCODE` char(32) DEFAULT NULL COMMENT '退货人员编码',
  `RETBACKCOUPON` decimal(12,2) DEFAULT NULL COMMENT '退货后收回的现金券',
  `GROUPLISTID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OFFLINEORDERCODE`),
  KEY `USERID` (`USERCODE`),
  KEY `SITEID` (`SITEID`),
  KEY `DEPTCODE` (`COUNTERCODE`),
  KEY `PAYMENTGROUPID` (`OFFLINEGROUPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec`.`mec_tr_mec_offlineorder_insert`
AFTER INSERT ON `mec`.`mec_buy_offlineorder`
FOR EACH ROW
begin
insert into mec_buy_offlineorder_log(OFFLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.OFFLINEORDERCODE,new.ORDERSTATE,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_mec_offlineorder_state_change` AFTER UPDATE ON `mec_buy_offlineorder`
FOR EACH ROW begin

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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_buy_offlineorder_log`
--

DROP TABLE IF EXISTS `mec_buy_offlineorder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_offlineorder_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFLINEORDERCODE` char(18) NOT NULL,
  `ORDERSTATE` int(11) NOT NULL COMMENT '见文档',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_buy_onlinecontent`
--

DROP TABLE IF EXISTS `mec_buy_onlinecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_onlinecontent` (
  `ONLINECONTENTCODE` char(26) NOT NULL DEFAULT '',
  `ONLINEORDERCODE` char(18) NOT NULL,
  `SKCCODE` char(10) NOT NULL,
  `NUM` int(11) NOT NULL DEFAULT '0',
  `UNITPRICE` decimal(12,2) NOT NULL DEFAULT '0.00',
  `PROMOTIONMARK` char(1) NOT NULL DEFAULT 'X',
  `ONLINECOUNTERCODE` char(6) DEFAULT NULL COMMENT '虚拟柜',
  `COUNTERCODE` char(6) NOT NULL COMMENT '实际扣库存的柜',
  `CONFIRMSTATE` int(11) NOT NULL DEFAULT '0' COMMENT '0-待确认 1-确认 2-拒绝',
  `CONFIRMTIME` datetime DEFAULT NULL,
  `SALESMANCODE` char(6) DEFAULT NULL COMMENT '确认或拒绝操作的营业员',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `FINALPRICELIST` varchar(256) DEFAULT NULL COMMENT '最终过促销引擎后均摊价格',
  `FINALRULELIST` varchar(256) DEFAULT NULL COMMENT '最终适用规则，具体到每一个物品',
  `REALVIPCARDTYPE` varchar(6) DEFAULT '00' COMMENT '适用该商品的实际vip卡类型',
  `REALVIPDISCOUNTRATE` decimal(12,2) DEFAULT '100.00' COMMENT '实际享受的vip折扣',
  `RETAILAMT` decimal(12,2) DEFAULT '0.00' COMMENT '成交价（分摊后实际折后价）',
  `VIPDISCOUNTAMT` decimal(12,2) DEFAULT '0.00' COMMENT '汇金贵宾卡折扣',
  `VIPFLOORAMT` decimal(12,2) DEFAULT '0.00' COMMENT '汇金贵宾卡折扣',
  `DISCOUNTOUTAMT` decimal(12,2) DEFAULT '0.00' COMMENT '支付前满减 - 折让',
  `DISCOUNTINAMT` decimal(12,2) DEFAULT '0.00' COMMENT '赠券',
  `PRESENTSHAREQTY` decimal(12,2) DEFAULT '0.00' COMMENT '赠礼',
  `MERCHANTDISCOUTAMT` decimal(12,2) DEFAULT '0.00' COMMENT '供应商折扣',
  `HANDAMT` decimal(12,2) DEFAULT NULL,
  `SHIPPRICECHARGESHARE` decimal(12,2) DEFAULT '0.00' COMMENT '运费差额均摊',
  `PACKINGCHARGESHARE` decimal(12,2) DEFAULT '0.00' COMMENT '包装费差额均摊',
  `CASHPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的现金支付份额',
  `CREDITPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的刷卡支付份额',
  `CASHCOUPONPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的现金券支付份额',
  `GOODSCOUPONPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的商品券支付份额',
  `ECARDPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的电子卡消费卡错卡支付份额',
  `OTHERPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的其他支付份额',
  `PREMIUMPAYSHARE` decimal(12,2) DEFAULT '0.00' COMMENT '支付完成后 finalprice 的溢价份额(认为是负的)',
  `ORIGINORDERCODE` char(18) DEFAULT NULL COMMENT '退货单的原始订单号码',
  `ORIGINCONTENTCODE` char(26) DEFAULT NULL COMMENT '退货单的原始明细号码',
  `IFRETURN` int(1) NOT NULL DEFAULT '0' COMMENT '0-普通单 1-退货单',
  `RETUSERCODE` char(32) DEFAULT NULL COMMENT '退货接单人员',
  PRIMARY KEY (`ONLINECONTENTCODE`),
  KEY `COUNTERCODE` (`COUNTERCODE`),
  KEY `ORDERID` (`ONLINEORDERCODE`),
  KEY `SKCID` (`SKCCODE`),
  KEY `FINALRULE` (`FINALRULELIST`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_buy_onlineorder`
--

DROP TABLE IF EXISTS `mec_buy_onlineorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_onlineorder` (
  `ONLINEORDERCODE` char(18) NOT NULL,
  `USERCODE` char(32) NOT NULL,
  `ORDERSTATE` int(11) NOT NULL DEFAULT '1' COMMENT '见文档',
  `NOTE` varchar(256) DEFAULT NULL,
  `PAYMENTMODE` int(11) NOT NULL DEFAULT '0' COMMENT '0-现场支付，1-网上支付，2-到付',
  `DELIVERYMODE` int(11) NOT NULL DEFAULT '0' COMMENT '0-自提 1-物流配送',
  `SITEID` int(11) DEFAULT NULL,
  `DELIVERYDEPTCODE` varchar(8) NOT NULL COMMENT '订单最终自提货或发货点',
  `SHIPPRICE` decimal(12,2) DEFAULT '0.00' COMMENT '运费',
  `PACKING` decimal(12,2) DEFAULT '0.00' COMMENT '包装费',
  `STORECODE` char(8) DEFAULT NULL COMMENT '门店号',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `FINALPRICE` decimal(12,2) DEFAULT NULL,
  `FINALRULESTRING` varchar(1024) DEFAULT NULL,
  `TRANSID` char(32) DEFAULT NULL,
  `CHRCODE` char(32) DEFAULT NULL,
  `VIPCARDNO` varchar(8) DEFAULT NULL COMMENT '贵宾卡卡号',
  `VIPCODE` varchar(8) DEFAULT NULL COMMENT 'vip账户号',
  `VIPCARDTYPE` varchar(4) DEFAULT '00' COMMENT 'vip卡类型',
  `VIPDISCOUNTRATE` decimal(12,2) DEFAULT '100.00' COMMENT 'vip折扣值',
  `RECEIVABLEAMT` decimal(12,2) DEFAULT '0.00' COMMENT '应收金额',
  `PAYMENTSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-未支付 1-单一订单支付完成 2-拼单支付完成',
  `PAYLOCAL` int(11) DEFAULT NULL COMMENT '0-pos机付款 1-app付款',
  `POSDEALNUM` varchar(32) DEFAULT NULL COMMENT 'pos机交易序列号',
  `POSCODE` char(6) DEFAULT NULL COMMENT 'pos机号码',
  `POSTRANSCODE` varchar(32) DEFAULT NULL,
  `CASHIER` char(6) DEFAULT NULL COMMENT '收银员',
  `REALSHIPPRICE` decimal(12,2) DEFAULT '0.00' COMMENT '实付运费',
  `REALPACKING` decimal(12,2) DEFAULT '0.00' COMMENT '实付包装费',
  `TIMEOUTTIME` datetime DEFAULT NULL COMMENT '订单超时作废时间',
  `PLACETIME` datetime DEFAULT NULL COMMENT '下单时间',
  `AUDITTIME` datetime DEFAULT NULL COMMENT '订单审核时间',
  `PAYTIME` datetime DEFAULT NULL COMMENT '订单支付时间',
  `OUTTIME` datetime DEFAULT NULL COMMENT '订单出库时间',
  `RECEIVABLETIME` datetime DEFAULT NULL COMMENT '收款时间',
  `FINISHTIME` datetime DEFAULT NULL COMMENT '订单完成时间',
  `IFRETURN` int(1) NOT NULL DEFAULT '0' COMMENT '是否是退货单 0是普通订单 1退货订单',
  PRIMARY KEY (`ONLINEORDERCODE`),
  KEY `USERID` (`USERCODE`),
  KEY `SITEID` (`SITEID`),
  KEY `DEPTCODE` (`DELIVERYDEPTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_mec_onlineorder_insert
after insert on mec_buy_onlineorder
for each row
begin
insert into mec_buy_onlineorder_log(ONLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.ONLINEORDERCODE,new.ORDERSTATE,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_mec_onlineorder_state_change` AFTER UPDATE ON `mec_buy_onlineorder`
FOR EACH ROW begin


IF new.ORDERSTATE!=old.ORDERSTATE THEN
insert into mec_buy_onlineorder_log(ONLINEORDERCODE,ORDERSTATE,createdAt,updatedAt) values(new.ONLINEORDERCODE,new.ORDERSTATE,now(),now());


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



ELSEIF (old.ORDERSTATE<>102) AND (new.ORDERSTATE=102) AND (new.IFRETURN=1) THEN
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
where ONLINEORDERCODE=new.ONLINEORDERCODE group by ONLINEORDERCODE,COUNTERCODE  
);

END IF;
END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_buy_onlineorder_log`
--

DROP TABLE IF EXISTS `mec_buy_onlineorder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_onlineorder_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ONLINEORDERCODE` char(18) NOT NULL,
  `ORDERSTATE` int(11) NOT NULL COMMENT '见文档',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_buy_shoppingcart`
--

DROP TABLE IF EXISTS `mec_buy_shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_buy_shoppingcart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) NOT NULL,
  `SKCCODE` char(10) NOT NULL,
  `NUM` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `USERCODE` (`USERCODE`) USING BTREE,
  KEY `SKCCODE` (`SKCCODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_ctm_bankcard`
--

DROP TABLE IF EXISTS `mec_ctm_bankcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_ctm_bankcard` (
  `BANKCARDID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) DEFAULT NULL,
  `BANKCARDNUMBER` varchar(64) NOT NULL,
  `BANKCARDOWNER` varchar(32) NOT NULL,
  `BANKCARDTYPE` varchar(16) DEFAULT NULL,
  `BANKNAME` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`BANKCARDID`),
  KEY `FK_RELATIONSHIP_4` (`USERCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='顾客银行卡信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_ctm_customer`
--

DROP TABLE IF EXISTS `mec_ctm_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_ctm_customer` (
  `USERCODE` char(32) NOT NULL,
  `TELEPHONE` char(16) NOT NULL,
  `VIPCODE` char(32) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `ICONURL` varchar(256) DEFAULT NULL,
  `IDCARD` char(32) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `SALT` varchar(64) NOT NULL,
  `HASH` varchar(128) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`USERCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_ctm_site`
--

DROP TABLE IF EXISTS `mec_ctm_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_ctm_site` (
  `SITEID` int(11) NOT NULL AUTO_INCREMENT,
  `USERCODE` char(32) DEFAULT NULL,
  `ISDEFAULT` int(1) NOT NULL DEFAULT '0' COMMENT '是否为默认',
  `PERSON` varchar(32) NOT NULL COMMENT '收货人',
  `TELEPHONE` varchar(16) NOT NULL COMMENT '收货人电话',
  `POSTCODE` varchar(16) DEFAULT NULL COMMENT '收货人邮编',
  `DETAIL` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `PROVINCE` varchar(16) DEFAULT NULL COMMENT '省',
  `CITY` varchar(32) DEFAULT NULL COMMENT '市',
  `DISTRICT` varchar(32) DEFAULT NULL COMMENT '区',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`SITEID`),
  KEY `FK_RELATIONSHIP_3` (`USERCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='顾客收货地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_hct_counter`
--

DROP TABLE IF EXISTS `mec_hct_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_hct_counter` (
  `COUNTERCODE` char(6) NOT NULL,
  `COUNTERNAME` varchar(50) DEFAULT NULL,
  `AGENTCODE` char(3) DEFAULT NULL,
  `MERCHANTCODE` char(6) DEFAULT NULL,
  `COUNTERLOCATIONCODE` char(7) DEFAULT NULL,
  `COUNTERSTATE` char(2) DEFAULT NULL,
  `STAFFCODE` char(6) DEFAULT NULL,
  `BUSINESSTYPE` char(1) DEFAULT NULL,
  `STORECODE` varchar(8) DEFAULT NULL,
  `COUNTERTYPE` float(1,0) DEFAULT '0',
  `INPUTPERSON` char(6) DEFAULT NULL,
  `INPUTDATE` date DEFAULT NULL,
  `CHECKPERSON` char(6) DEFAULT NULL,
  `CHECKDATE` date DEFAULT NULL,
  `SURROGATEMODE` char(1) DEFAULT NULL,
  `BANKNAME` varchar(50) DEFAULT NULL,
  `BANKACCOUNTNO` varchar(50) DEFAULT NULL,
  `BANKNO` varchar(30) DEFAULT NULL,
  `GATHERINGADDRESS` varchar(60) DEFAULT NULL,
  `RECKONAGENTCODE` char(3) DEFAULT NULL,
  `RECKONLOCATIONCODE` char(7) DEFAULT NULL,
  `GRADE` varchar(3) DEFAULT 'C2',
  `ISONLINE` char(1) DEFAULT NULL COMMENT '是否线上柜：0-否；1-是',
  `ONLINECOUNTER` char(6) DEFAULT NULL COMMENT '如果是线下柜对应的线上柜',
  `CONTRACTSTATE` char(1) DEFAULT '0' COMMENT '柜合同状态：0-无合同；1-新建合同未生效；2-合同生效；3-合同终止',
  PRIMARY KEY (`COUNTERCODE`),
  KEY `MERCHANTCODE` (`MERCHANTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_hsy_salesman`
--

DROP TABLE IF EXISTS `mec_hsy_salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_hsy_salesman` (
  `SALESMANCODE` char(6) NOT NULL,
  `SALESMANNAME` varchar(10) NOT NULL,
  `GENDER` int(1) DEFAULT '0',
  `STORECODE` char(5) DEFAULT NULL,
  `AREACODE` varchar(8) DEFAULT NULL,
  `COUNTERCODE` char(6) DEFAULT NULL,
  PRIMARY KEY (`SALESMANCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_category`
--

DROP TABLE IF EXISTS `mec_itm_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_category` (
  `CATEGORYID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CATEGORYNAME` varchar(32) NOT NULL COMMENT '分类名',
  `SUPERCATEGORYID` int(11) DEFAULT NULL COMMENT '父分类编号',
  `IMGURL` varchar(256) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`CATEGORYID`),
  KEY `PARENTID` (`SUPERCATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_category_afterinsert
after insert on mec_itm_category
for each row
begin
insert into mec_itm_category_log(CATEGORYID,CATEGORYNAME,SUPERCATEGORYID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.CATEGORYID,new.CATEGORYNAME,new.SUPERCATEGORYID,new.IMGURL,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_category_afterupdate
after update on mec_itm_category
for each row
begin
insert into mec_itm_category_log(CATEGORYID,CATEGORYNAME,SUPERCATEGORYID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.CATEGORYID,new.CATEGORYNAME,new.SUPERCATEGORYID,new.IMGURL,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_category_brand`
--

DROP TABLE IF EXISTS `mec_itm_category_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_category_brand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRANDCODE` char(6) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `LASTOPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_itm_category_brand_afterinsert` AFTER INSERT ON `mec_itm_category_brand`
FOR EACH ROW begin
insert into mec_itm_category_brand_log(CBID, BRANDCODE, CATEGORYID, OPERATION, OPERATEPERSON, createdAt,updatedAt) values(new.ID, new.BRANDCODE, new.CATEGORYID, 0, new.LASTOPERATEPERSON, now(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_itm_category_brand_afterupdate` AFTER UPDATE ON `mec_itm_category_brand`
FOR EACH ROW begin
insert into mec_itm_category_brand_log(CBID, BRANDCODE, CATEGORYID, OPERATION, OPERATEPERSON, createdAt,updatedAt) values(new.ID, new.BRANDCODE, new.CATEGORYID, 2, new.LASTOPERATEPERSON, now(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_category_brand_log`
--

DROP TABLE IF EXISTS `mec_itm_category_brand_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_category_brand_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CBID` int(11) NOT NULL,
  `BRANDCODE` char(6) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_category_log`
--

DROP TABLE IF EXISTS `mec_itm_category_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_category_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORYID` int(11) NOT NULL COMMENT '编号',
  `CATEGORYNAME` varchar(32) NOT NULL COMMENT '分类名',
  `SUPERCATEGORYID` int(11) DEFAULT NULL COMMENT '父分类编号',
  `IMGURL` varchar(256) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `PARENTID` (`SUPERCATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_imgdetail`
--

DROP TABLE IF EXISTS `mec_itm_imgdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_imgdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `IMGURL` varchar(256) NOT NULL COMMENT '图片链接\r\n            ',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '图片描述',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_8` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品图片链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_imgdetail_log`
--

DROP TABLE IF EXISTS `mec_itm_imgdetail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_imgdetail_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `__ID` int(11) DEFAULT NULL COMMENT '图片编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `IMGURL` varchar(256) NOT NULL COMMENT '图片链接\r\n            ',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '图片描述',
  `TMPSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_8` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品图片链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_imgdetail_tmp`
--

DROP TABLE IF EXISTS `mec_itm_imgdetail_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_imgdetail_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) DEFAULT NULL COMMENT '图片编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `IMGURL` varchar(256) NOT NULL COMMENT '图片链接\r\n            ',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '图片描述',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_8` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品图片链接';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_imgdetail_tmp_afterinsert
after insert on mec_itm_imgdetail_tmp
for each row
begin
insert into mec_itm_imgdetail_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_imgdetail_tmp_afterupdate
after update on mec_itm_imgdetail_tmp
for each row
begin
insert into mec_itm_imgdetail_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_imgpreview`
--

DROP TABLE IF EXISTS `mec_itm_imgpreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_imgpreview` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `IMGURL` varchar(256) NOT NULL COMMENT '图片链接\r\n            ',
  `DESCRIPTION` varchar(1024) DEFAULT NULL COMMENT '图片描述',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_8` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品图片链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_imgpreview_log`
--

DROP TABLE IF EXISTS `mec_itm_imgpreview_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_imgpreview_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `__ID` int(11) DEFAULT NULL COMMENT '图片编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `IMGURL` varchar(256) NOT NULL COMMENT '图片链接\r\n            ',
  `DESCRIPTION` varchar(16) DEFAULT NULL COMMENT '图片描述',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_8` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品图片链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_imgpreview_tmp`
--

DROP TABLE IF EXISTS `mec_itm_imgpreview_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_imgpreview_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) DEFAULT NULL COMMENT '图片编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `IMGURL` varchar(256) NOT NULL COMMENT '图片链接\r\n            ',
  `DESCRIPTION` varchar(16) DEFAULT NULL COMMENT '图片描述',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_8` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品图片链接';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_imgpreview_tmp_afterinsert
after insert on mec_itm_imgpreview_tmp
for each row
begin
insert into mec_itm_imgpreview_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_imgpreview_tmp_afterupdate
after update on mec_itm_imgpreview_tmp
for each row
begin
insert into mec_itm_imgpreview_log(_ID,__ID,ITEMCODE,IMGURL,DESCRIPTION,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new._ID,new.ITEMCODE,new.IMGURL,new.DESCRIPTION,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_item`
--

DROP TABLE IF EXISTS `mec_itm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_item` (
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码(mis系统编码)',
  `ITEMID` int(11) DEFAULT NULL COMMENT '商品信息系统编码',
  `BARCODE` varchar(20) DEFAULT NULL COMMENT '条形码',
  `ITEMNAME` varchar(32) DEFAULT NULL COMMENT '商品全称',
  `ITEMSHORTNAME` varchar(12) DEFAULT NULL COMMENT '商品简称',
  `BRANDCODE` char(6) DEFAULT NULL COMMENT '品牌编码',
  `RETAILTYPECODE` char(3) DEFAULT NULL COMMENT '销售分类',
  `ITEMTYPECODE` char(5) DEFAULT NULL COMMENT '商品分类编码',
  `MERCHANTCODE` char(6) DEFAULT NULL COMMENT '供应商编码',
  `BUSINESSMODE` char(1) NOT NULL COMMENT '经营方式',
  `PRODUCINGAREA` varchar(20) DEFAULT NULL COMMENT '产地',
  `PRICE` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '核定售价',
  `TEMPPRICE` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '统一暂时售价',
  `TAXRATE` char(2) NOT NULL DEFAULT '01' COMMENT '销项税率',
  `EXCISERATE` char(2) DEFAULT NULL COMMENT '消费税率',
  `RETURNGOODS` decimal(1,0) DEFAULT NULL COMMENT '是否允许退货：0：不允许 ，1：允许',
  `SALESTATE` decimal(1,0) DEFAULT NULL COMMENT '销售状态：0：正常 ，2：手工登记删除，3：合同到期自动登记删除',
  `NETWEIGHT` decimal(7,3) DEFAULT NULL COMMENT '净重',
  `GROSSWEIGHT` decimal(7,3) DEFAULT NULL COMMENT '毛重',
  `SPECIFICATION` varchar(30) DEFAULT NULL COMMENT '商品规格',
  `PRODUCTCODE` varchar(30) DEFAULT NULL COMMENT '商品货号',
  `GRADE` varchar(20) DEFAULT NULL COMMENT '商品等级',
  `COLOR` varchar(20) DEFAULT NULL COMMENT '商品颜色',
  `CASING` decimal(5,0) DEFAULT '1' COMMENT '包装规格',
  `DIMENSION` varchar(20) DEFAULT NULL COMMENT '尺寸',
  `VOLUME` varchar(20) DEFAULT NULL COMMENT '体积',
  `ITEMCODETYPE` decimal(1,0) NOT NULL DEFAULT '0' COMMENT '商品编码类型：0：正常商品编码，1：大类码',
  `UNIT` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `LASTPURCHASEPRICE` decimal(12,2) DEFAULT NULL COMMENT '最后进价',
  `PURCHASETAXRATE` char(2) DEFAULT NULL COMMENT '进项税率',
  `SAFESTOCK` decimal(5,0) DEFAULT NULL COMMENT '安全库存',
  `MAXSTOCK` decimal(5,0) DEFAULT NULL COMMENT '最高存量',
  `MINSTOCK` decimal(5,0) DEFAULT NULL COMMENT '最低存量',
  `MAXORDER` decimal(5,0) DEFAULT NULL COMMENT '最高订货量',
  `MINORDER` decimal(5,0) DEFAULT NULL COMMENT '最低订货量',
  `PROPERTY` decimal(1,0) DEFAULT NULL COMMENT '商品属性：0：普通商品， 1：黄金商品， 2：香烟商品',
  `CHECKSTATE` decimal(1,0) DEFAULT '2' COMMENT '复查状态\r\n            0：复查不通过（可改价格、招商人员、商品分类）\r\n            1：复查通过（不可改价格、招商人员、商品分类）\r\n            2：输入\r\n            3：变更（不可改价格、招商人员、商品分类）\r\n            4 ：变更不通过（不可改价格、招商人员、商品分类）',
  `ERRORINFO` varchar(50) DEFAULT NULL COMMENT '错误信息',
  `INPUTPERSON` char(6) DEFAULT NULL COMMENT '输入员编码',
  `AGENTCODE` char(3) DEFAULT NULL COMMENT '招商人员编码（经销B必须）',
  `TERM` date DEFAULT NULL COMMENT '质保期',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  `ISCONSIDERSTOCK` int(1) NOT NULL DEFAULT '0' COMMENT '0-不管库存 1-管库存',
  `ISALLOWONLINE` int(1) NOT NULL DEFAULT '0' COMMENT '0-线下 1-线上',
  `ISALLOWNEGATIVE` int(1) NOT NULL DEFAULT '0' COMMENT '0-不允许负库存 1-允许',
  `SKCCHECKSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-未完善 1-审核通过 2-已完善待审核通过 3-已审核过又有更新',
  `ONLINECHECKSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-未完善 1-审核通过 2-已完善待审核通过 3-已审核过又有更新',
  `SELLINGSTATE` int(11) NOT NULL DEFAULT '0' COMMENT '0-尚未开始销售  1-线下不管库存销售中  2-线下管库存销售中  3-线上(肯定管库存)销售中',
  `TITLE` varchar(128) DEFAULT NULL COMMENT '商品上线的名称',
  `SCORE` double(6,5) NOT NULL DEFAULT '5.00000' COMMENT '评分 满分5分',
  `SCOREPOPULARITY` int(11) NOT NULL DEFAULT '0' COMMENT '评分人数',
  `PURCHASE` int(11) NOT NULL DEFAULT '0' COMMENT '购买数目',
  `PURCHASEPOPULARITY` int(11) NOT NULL DEFAULT '0' COMMENT '购买人数',
  `PRAISERATE` int(3) NOT NULL DEFAULT '100' COMMENT '好评率，单位是%',
  `ONLINETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ITEMCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品SKU信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_item_log1`
--

DROP TABLE IF EXISTS `mec_itm_item_log1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_item_log1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `BARCODE` varchar(20) DEFAULT NULL COMMENT '条形码',
  `ITEMNAME` varchar(32) DEFAULT NULL COMMENT '商品全称',
  `ITEMSHORTNAME` varchar(12) DEFAULT NULL COMMENT '商品简称',
  `BRANDCODE` char(6) DEFAULT NULL COMMENT '品牌编码',
  `RETAILTYPECODE` char(3) DEFAULT NULL COMMENT '销售分类',
  `ITEMTYPECODE` char(5) DEFAULT NULL COMMENT '商品分类编码',
  `MERCHANTCODE` char(6) DEFAULT NULL COMMENT '供应商编码',
  `BUSINESSMODE` char(1) NOT NULL COMMENT '经营方式',
  `PRODUCINGAREA` varchar(20) DEFAULT NULL COMMENT '产地',
  `PRICE` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '核定售价',
  `TEMPPRICE` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '统一暂时售价',
  `TAXRATE` char(2) NOT NULL DEFAULT '01' COMMENT '销项税率',
  `EXCISERATE` char(2) DEFAULT NULL COMMENT '消费税率',
  `RETURNGOODS` decimal(1,0) DEFAULT NULL COMMENT '是否允许退货：0：不允许 ，1：允许',
  `SALESTATE` decimal(1,0) DEFAULT NULL COMMENT '销售状态：0：正常 ，2：手工登记删除，3：合同到期自动登记删除',
  `NETWEIGHT` decimal(7,3) DEFAULT NULL COMMENT '净重',
  `GROSSWEIGHT` decimal(7,3) DEFAULT NULL COMMENT '毛重',
  `SPECIFICATION` varchar(30) DEFAULT NULL COMMENT '商品规格',
  `PRODUCTCODE` varchar(30) DEFAULT NULL COMMENT '商品货号',
  `GRADE` varchar(20) DEFAULT NULL COMMENT '商品等级',
  `COLOR` varchar(20) DEFAULT NULL COMMENT '商品颜色',
  `CASING` decimal(5,0) DEFAULT '1' COMMENT '包装规格',
  `DIMENSION` varchar(20) DEFAULT NULL COMMENT '尺寸',
  `VOLUME` varchar(20) DEFAULT NULL COMMENT '体积',
  `ITEMCODETYPE` decimal(1,0) NOT NULL DEFAULT '0' COMMENT '商品编码类型：0：正常商品编码，1：大类码',
  `UNIT` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `LASTPURCHASEPRICE` decimal(12,2) DEFAULT NULL COMMENT '最后进价',
  `PURCHASETAXRATE` char(2) DEFAULT NULL COMMENT '进项税率',
  `SAFESTOCK` decimal(5,0) DEFAULT NULL COMMENT '安全库存',
  `MAXSTOCK` decimal(5,0) DEFAULT NULL COMMENT '最高存量',
  `MINSTOCK` decimal(5,0) DEFAULT NULL COMMENT '最低存量',
  `MAXORDER` decimal(5,0) DEFAULT NULL COMMENT '最高订货量',
  `MINORDER` decimal(5,0) DEFAULT NULL COMMENT '最低订货量',
  `PROPERTY` decimal(1,0) DEFAULT NULL COMMENT '商品属性：0：普通商品， 1：黄金商品， 2：香烟商品',
  `CHECKSTATE` decimal(1,0) DEFAULT '2' COMMENT '复查状态\r\n            0：复查不通过（可改价格、招商人员、商品分类）\r\n            1：复查通过（不可改价格、招商人员、商品分类）\r\n            2：输入\r\n            3：变更（不可改价格、招商人员、商品分类）\r\n            4 ：变更不通过（不可改价格、招商人员、商品分类）',
  `ERRORINFO` varchar(50) DEFAULT NULL COMMENT '错误信息',
  `INPUTPERSON` char(6) DEFAULT NULL COMMENT '输入员编码',
  `AGENTCODE` char(3) DEFAULT NULL COMMENT '招商人员编码（经销B必须）',
  `TERM` date DEFAULT NULL COMMENT '质保期',
  `ISCONSIDERSTOCK` int(1) NOT NULL DEFAULT '0' COMMENT '0-不管库存 1-管库存',
  `ISALLOWONLINE` int(1) NOT NULL DEFAULT '0' COMMENT '0-线下 1-线上',
  `ISALLOWNEGATIVE` int(1) NOT NULL DEFAULT '0' COMMENT '0-不允许负库存 1-允许',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品SKU信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_item_log2`
--

DROP TABLE IF EXISTS `mec_itm_item_log2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_item_log2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `TITLE` varchar(128) DEFAULT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品SKU信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_item_tmp1`
--

DROP TABLE IF EXISTS `mec_itm_item_tmp1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_item_tmp1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `BARCODE` varchar(20) DEFAULT NULL COMMENT '条形码',
  `ITEMNAME` varchar(32) DEFAULT NULL COMMENT '商品全称',
  `ITEMSHORTNAME` varchar(12) DEFAULT NULL COMMENT '商品简称',
  `BRANDCODE` char(6) DEFAULT NULL COMMENT '品牌编码',
  `RETAILTYPECODE` char(3) DEFAULT NULL COMMENT '销售分类',
  `ITEMTYPECODE` char(5) DEFAULT NULL COMMENT '商品分类编码',
  `MERCHANTCODE` char(6) DEFAULT NULL COMMENT '供应商编码',
  `BUSINESSMODE` char(1) NOT NULL DEFAULT '1' COMMENT '经营方式',
  `PRODUCINGAREA` varchar(20) DEFAULT NULL COMMENT '产地',
  `PRICE` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '核定售价',
  `TEMPPRICE` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '统一暂时售价',
  `TAXRATE` char(2) NOT NULL DEFAULT '01' COMMENT '销项税率',
  `EXCISERATE` char(2) DEFAULT NULL COMMENT '消费税率',
  `RETURNGOODS` decimal(1,0) DEFAULT NULL COMMENT '是否允许退货：0：不允许 ，1：允许',
  `SALESTATE` decimal(1,0) DEFAULT NULL COMMENT '销售状态：0：正常 ，2：手工登记删除，3：合同到期自动登记删除',
  `NETWEIGHT` decimal(7,3) DEFAULT NULL COMMENT '净重',
  `GROSSWEIGHT` decimal(7,3) DEFAULT NULL COMMENT '毛重',
  `SPECIFICATION` varchar(30) DEFAULT NULL COMMENT '商品规格',
  `PRODUCTCODE` varchar(30) DEFAULT NULL COMMENT '商品货号',
  `GRADE` varchar(20) DEFAULT NULL COMMENT '商品等级',
  `COLOR` varchar(20) DEFAULT NULL COMMENT '商品颜色',
  `CASING` decimal(5,0) DEFAULT '1' COMMENT '包装规格',
  `DIMENSION` varchar(20) DEFAULT NULL COMMENT '尺寸',
  `VOLUME` varchar(20) DEFAULT NULL COMMENT '体积',
  `ITEMCODETYPE` decimal(1,0) NOT NULL DEFAULT '0' COMMENT '商品编码类型：0：正常商品编码，1：大类码',
  `UNIT` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `LASTPURCHASEPRICE` decimal(12,2) DEFAULT NULL COMMENT '最后进价',
  `PURCHASETAXRATE` char(2) DEFAULT NULL COMMENT '进项税率',
  `SAFESTOCK` decimal(5,0) DEFAULT NULL COMMENT '安全库存',
  `MAXSTOCK` decimal(5,0) DEFAULT NULL COMMENT '最高存量',
  `MINSTOCK` decimal(5,0) DEFAULT NULL COMMENT '最低存量',
  `MAXORDER` decimal(5,0) DEFAULT NULL COMMENT '最高订货量',
  `MINORDER` decimal(5,0) DEFAULT NULL COMMENT '最低订货量',
  `PROPERTY` decimal(1,0) DEFAULT NULL COMMENT '商品属性：0：普通商品， 1：黄金商品， 2：香烟商品',
  `CHECKSTATE` decimal(1,0) DEFAULT '2' COMMENT '复查状态\r\n            0：复查不通过（可改价格、招商人员、商品分类）\r\n            1：复查通过（不可改价格、招商人员、商品分类）\r\n            2：输入\r\n            3：变更（不可改价格、招商人员、商品分类）\r\n            4 ：变更不通过（不可改价格、招商人员、商品分类）',
  `ERRORINFO` varchar(50) DEFAULT NULL COMMENT '错误信息',
  `INPUTPERSON` char(6) DEFAULT NULL COMMENT '输入员编码',
  `AGENTCODE` char(3) DEFAULT NULL COMMENT '招商人员编码（经销B必须）',
  `TERM` date DEFAULT NULL COMMENT '质保期',
  `ISCONSIDERSTOCK` int(1) NOT NULL DEFAULT '0' COMMENT '0-不管库存 1-管库存',
  `ISALLOWONLINE` int(1) NOT NULL DEFAULT '0' COMMENT '0-线下 1-线上',
  `ISALLOWNEGATIVE` int(1) NOT NULL DEFAULT '0' COMMENT '0-不允许负库存 1-允许',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品SKU信息表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_item_tmp1_afterinsert
after insert on mec_itm_item_tmp1
for each row
begin
insert into mec_itm_item_log1(_ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt)
values(new.ID,new.ITEMCODE,new.BARCODE,new.ITEMNAME,new.ITEMSHORTNAME,new.BRANDCODE,new.RETAILTYPECODE,new.ITEMTYPECODE,new.MERCHANTCODE,new.BUSINESSMODE,new.PRODUCINGAREA,new.PRICE,new.TEMPPRICE,new.TAXRATE,new.EXCISERATE,new.RETURNGOODS,new.SALESTATE,new.NETWEIGHT,new.GROSSWEIGHT,new.SPECIFICATION,new.PRODUCTCODE,new.GRADE,new.COLOR,new.CASING,new.DIMENSION,new.VOLUME,new.ITEMCODETYPE,new.UNIT,new.LASTPURCHASEPRICE,new.PURCHASETAXRATE,new.SAFESTOCK,new.MAXSTOCK,new.MINSTOCK,new.MAXORDER,new.MINORDER,new.PROPERTY,new.CHECKSTATE,new.ERRORINFO,new.INPUTPERSON,new.AGENTCODE,new.TERM,new.ISCONSIDERSTOCK,new.ISALLOWONLINE,new.ISALLOWNEGATIVE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_item_tmp1_afterupdate
after update on mec_itm_item_tmp1
for each row
begin
insert into mec_itm_item_log1(_ID,ITEMCODE,BARCODE,ITEMNAME,ITEMSHORTNAME,BRANDCODE,RETAILTYPECODE,ITEMTYPECODE,MERCHANTCODE,BUSINESSMODE,PRODUCINGAREA,PRICE,TEMPPRICE,TAXRATE,EXCISERATE,RETURNGOODS,SALESTATE,NETWEIGHT,GROSSWEIGHT,SPECIFICATION,PRODUCTCODE,GRADE,COLOR,CASING,DIMENSION,VOLUME,ITEMCODETYPE,UNIT,LASTPURCHASEPRICE,PURCHASETAXRATE,SAFESTOCK,MAXSTOCK,MINSTOCK,MAXORDER,MINORDER,PROPERTY,CHECKSTATE,ERRORINFO,INPUTPERSON,AGENTCODE,TERM,ISCONSIDERSTOCK,ISALLOWONLINE,ISALLOWNEGATIVE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt)
values(new.ID,new.ITEMCODE,new.BARCODE,new.ITEMNAME,new.ITEMSHORTNAME,new.BRANDCODE,new.RETAILTYPECODE,new.ITEMTYPECODE,new.MERCHANTCODE,new.BUSINESSMODE,new.PRODUCINGAREA,new.PRICE,new.TEMPPRICE,new.TAXRATE,new.EXCISERATE,new.RETURNGOODS,new.SALESTATE,new.NETWEIGHT,new.GROSSWEIGHT,new.SPECIFICATION,new.PRODUCTCODE,new.GRADE,new.COLOR,new.CASING,new.DIMENSION,new.VOLUME,new.ITEMCODETYPE,new.UNIT,new.LASTPURCHASEPRICE,new.PURCHASETAXRATE,new.SAFESTOCK,new.MAXSTOCK,new.MINSTOCK,new.MAXORDER,new.MINORDER,new.PROPERTY,new.CHECKSTATE,new.ERRORINFO,new.INPUTPERSON,new.AGENTCODE,new.TERM,new.ISCONSIDERSTOCK,new.ISALLOWONLINE,new.ISALLOWNEGATIVE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_item_tmp2`
--

DROP TABLE IF EXISTS `mec_itm_item_tmp2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_item_tmp2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `TITLE` varchar(128) DEFAULT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品SKU信息表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_item_tmp2_afterinsert
after insert on mec_itm_item_tmp2
for each row
begin
insert into mec_itm_item_log2(_ID,ITEMCODE,TITLE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.ITEMCODE,new.TITLE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_item_tmp2_afterupdate
after update on mec_itm_item_tmp2
for each row
begin
insert into mec_itm_item_log2(_ID,ITEMCODE,TITLE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.ITEMCODE,new.TITLE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_itemcategory`
--

DROP TABLE IF EXISTS `mec_itm_itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_itemcategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `CATEGORYID` (`CATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_itemcategory_log`
--

DROP TABLE IF EXISTS `mec_itm_itemcategory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_itemcategory_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `__ID` int(11) DEFAULT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `CATEGORYID` (`CATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_itemcategory_tmp`
--

DROP TABLE IF EXISTS `mec_itm_itemcategory_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_itemcategory_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) DEFAULT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `CATEGORYID` (`CATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_itemcategory_tmp_afterinsert
after insert on mec_itm_itemcategory_tmp
for each row
begin
insert into mec_itm_itemcategory_log(_ID,__ID,ITEMCODE,CATEGORYID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.CATEGORYID,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_itemcategory_tmp_afterupdate
after update on mec_itm_itemcategory_tmp
for each row
begin
insert into mec_itm_itemcategory_log(_ID,__ID,ITEMCODE,CATEGORYID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.CATEGORYID,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_itemregion`
--

DROP TABLE IF EXISTS `mec_itm_itemregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_itemregion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL,
  `REGIONID` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `CATEGORYID` (`REGIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_itemregion_log`
--

DROP TABLE IF EXISTS `mec_itm_itemregion_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_itemregion_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `__ID` int(11) DEFAULT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `REGIONID` int(11) NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `CATEGORYID` (`REGIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_itemregion_tmp`
--

DROP TABLE IF EXISTS `mec_itm_itemregion_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_itemregion_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) DEFAULT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `REGIONID` int(11) NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `CATEGORYID` (`REGIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_itemregion_tmp_afterinsert
after insert on mec_itm_itemregion_tmp
for each row
begin
insert into mec_itm_itemregion_log(_ID,__ID,ITEMCODE,REGIONID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.REGIONID,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_itemregion_tmp_afterupdate
after update on mec_itm_itemregion_tmp
for each row
begin
insert into mec_itm_itemregion_log(_ID,__ID,ITEMCODE,REGIONID,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.REGIONID,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_parameter`
--

DROP TABLE IF EXISTS `mec_itm_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_parameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL,
  `ATTRIBUTE` varchar(32) NOT NULL,
  `VALUE` varchar(128) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_parameter_log`
--

DROP TABLE IF EXISTS `mec_itm_parameter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_parameter_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `__ID` int(11) DEFAULT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `ATTRIBUTE` varchar(32) NOT NULL,
  `VALUE` varchar(128) NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_parameter_tmp`
--

DROP TABLE IF EXISTS `mec_itm_parameter_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_parameter_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) DEFAULT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `ATTRIBUTE` varchar(32) NOT NULL,
  `VALUE` varchar(128) NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_parameter_tmp_afterinsert
after insert on mec_itm_parameter_tmp
for each row
begin
insert into mec_itm_parameter_log(_ID,__ID,ITEMCODE,ATTRIBUTE,VALUE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.ATTRIBUTE,new.VALUE,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_parameter_tmp_afterupdate
after update on mec_itm_parameter_tmp
for each row
begin
insert into mec_itm_parameter_log(_ID,__ID,ITEMCODE,ATTRIBUTE,VALUE,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new._ID,new.ITEMCODE,new.ATTRIBUTE,new.VALUE,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_paramtemplate`
--

DROP TABLE IF EXISTS `mec_itm_paramtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_paramtemplate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORYID` int(11) NOT NULL,
  `ATTRIBUTE` varchar(32) NOT NULL,
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `CATEGORYID` (`CATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_paramtemplate_afterinsert
after insert on mec_itm_paramtemplate
for each row
begin
insert into mec_itm_paramtemplate_log(_ID,CATEGORYID,ATTRIBUTE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.CATEGORYID,new.ATTRIBUTE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_itm_paramtemplate_afterupdate` AFTER UPDATE ON `mec_itm_paramtemplate`
FOR EACH ROW begin
insert into mec_itm_paramtemplate_log(_ID,CATEGORYID,ATTRIBUTE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.CATEGORYID,new.ATTRIBUTE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_paramtemplate_log`
--

DROP TABLE IF EXISTS `mec_itm_paramtemplate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_paramtemplate_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `ATTRIBUTE` varchar(32) NOT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `CATEGORYID` (`CATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_region`
--

DROP TABLE IF EXISTS `mec_itm_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_region` (
  `REGIONID` int(11) NOT NULL AUTO_INCREMENT,
  `REGIONNAME` varchar(32) NOT NULL,
  `SUPERREGIONID` int(11) DEFAULT NULL,
  `IMGURL` varchar(256) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`REGIONID`),
  KEY `PARENTID` (`SUPERREGIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_region_afterinsert
after insert on mec_itm_region
for each row
begin
insert into mec_itm_region_log(REGIONID,REGIONNAME,SUPERREGIONID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.REGIONID,new.REGIONNAME,new.SUPERREGIONID,new.IMGURL,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_region_afterupdate
after update on mec_itm_region
for each row
begin
insert into mec_itm_region_log(REGIONID,REGIONNAME,SUPERREGIONID,IMGURL,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.REGIONID,new.REGIONNAME,new.SUPERREGIONID,new.IMGURL,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_region_log`
--

DROP TABLE IF EXISTS `mec_itm_region_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_region_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REGIONID` int(11) NOT NULL,
  `REGIONNAME` varchar(32) NOT NULL,
  `SUPERREGIONID` int(11) DEFAULT NULL,
  `IMGURL` varchar(256) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `PARENTID` (`SUPERREGIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_skc`
--

DROP TABLE IF EXISTS `mec_itm_skc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_skc` (
  `SKCCODE` varchar(30) NOT NULL COMMENT '编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `MERCHANTSKCCODE` varchar(50) DEFAULT NULL,
  `SIZE` varchar(32) DEFAULT NULL COMMENT '大小',
  `COLOR` varchar(32) DEFAULT NULL COMMENT '颜色',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1' COMMENT '0-作废 1-有效',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`SKCCODE`,`ITEMCODE`),
  KEY `FK_Relationship_7` (`ITEMCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品SKC信息';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `trigger mec_tr_itm_skc_afterinsert` AFTER INSERT ON `mec_itm_skc`
FOR EACH ROW begin
insert into mec_itm_stock(COUNTERCODE,SKCCODE,ISALLOWNEGATIVE,BUFFER) (select COUNTERCODE, new.SKCCODE as SKCCODE, ISALLOWNEGATIVE, BUFFER from mec_itm_storeitem where ITEMCODE=new.ITEMCODE);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_skc_log`
--

DROP TABLE IF EXISTS `mec_itm_skc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_skc_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `SKCCODE` varchar(30) NOT NULL COMMENT '编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `MERCHANTSKCCODE` char(16) DEFAULT NULL,
  `SIZE` varchar(32) DEFAULT NULL COMMENT '大小',
  `COLOR` varchar(32) DEFAULT NULL COMMENT '颜色',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审 3-增审过 4-删审过 5-改审过  6-拒绝',
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_7` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品SKC信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_skc_tmp`
--

DROP TABLE IF EXISTS `mec_itm_skc_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_skc_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SKCCODE` char(10) NOT NULL COMMENT '编号',
  `ITEMCODE` char(8) NOT NULL COMMENT '商品编码',
  `MERCHANTSKCCODE` char(16) DEFAULT NULL,
  `SIZE` varchar(32) DEFAULT NULL COMMENT '大小',
  `COLOR` varchar(32) DEFAULT NULL COMMENT '颜色',
  `TMPSTATE` int(11) NOT NULL COMMENT '0-实际数据待审核 1-占位数据待审核 2-实际数据审核通过 3-占位数据审核通过 4-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_7` (`ITEMCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='商品SKC信息';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_skc_tmp_afterinsert
after insert on mec_itm_skc_tmp
for each row
begin
insert into mec_itm_skc_log(_ID,SKCCODE,ITEMCODE,MERCHANTSKCCODE,SIZE,COLOR,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.SKCCODE,new.ITEMCODE,new.MERCHANTSKCCODE,new.SIZE,new.COLOR,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_skc_tmp_afterupdate
after update on mec_itm_skc_tmp
for each row
begin
insert into mec_itm_skc_log(_ID,SKCCODE,ITEMCODE,MERCHANTSKCCODE,SIZE,COLOR,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values (new.ID,new.SKCCODE,new.ITEMCODE,new.MERCHANTSKCCODE,new.SIZE,new.COLOR,new.TMPSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_stock`
--

DROP TABLE IF EXISTS `mec_itm_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_stock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SKCCODE` varchar(30) NOT NULL,
  `COUNTERCODE` char(6) NOT NULL,
  `AMOUNT` int(11) NOT NULL DEFAULT '0',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `ISALLOWNEGATIVE` int(11) NOT NULL DEFAULT '1' COMMENT '是否允许负库存 0-不允许 1-允许',
  `BUFFER` int(11) NOT NULL DEFAULT '99999999' COMMENT '库存缓冲',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SKCCODE` (`SKCCODE`,`COUNTERCODE`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_itm_stock_afterinsert
after insert on mec_itm_stock
for each row
begin
insert into mec_itm_stock_log(_ID,SKCCODE,COUNTERCODE,AMOUNT,DELTA,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.SKCCODE,new.COUNTERCODE,new.AMOUNT,new.AMOUNT,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_itm_stock_afterupdate` AFTER UPDATE ON `mec_itm_stock`
FOR EACH ROW begin
insert into mec_itm_stock_log(_ID,SKCCODE,COUNTERCODE,AMOUNT,DELTA,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.ID,new.SKCCODE,new.COUNTERCODE,new.AMOUNT,cast(new.AMOUNT as signed)-cast(old.AMOUNT as signed),new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_stock_log`
--

DROP TABLE IF EXISTS `mec_itm_stock_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_stock_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `SKCCODE` varchar(30) NOT NULL,
  `COUNTERCODE` char(6) NOT NULL,
  `AMOUNT` int(11) NOT NULL DEFAULT '0',
  `DELTA` int(11) NOT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL,
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_itm_storeitem`
--

DROP TABLE IF EXISTS `mec_itm_storeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_storeitem` (
  `ID` char(12) NOT NULL,
  `ITEMCODE` char(8) DEFAULT NULL,
  `COUNTERCODE` char(6) DEFAULT NULL,
  `MEMBERPRICE` float(12,2) NOT NULL DEFAULT '0.00',
  `STORECHECKEDPRICE` float(12,2) NOT NULL DEFAULT '0.00',
  `STORETEMPPRICE` float(12,2) NOT NULL DEFAULT '0.00',
  `PROMOTIONMARK` char(1) NOT NULL DEFAULT 'X',
  `DISCOUNTMARK` float(1,0) NOT NULL DEFAULT '1',
  `STORESALESTATE` float(1,0) DEFAULT NULL COMMENT '0-可以卖 其他不能卖',
  `SAFESTOCK` float(5,0) DEFAULT '0',
  `FULLSTOCK` float(5,0) DEFAULT '0',
  `MAXSTOCK` float(5,0) DEFAULT '0',
  `MINSTOCK` float(5,0) DEFAULT '0',
  `MAXORDER` float(5,0) DEFAULT '0',
  `MINORDER` float(5,0) DEFAULT '0',
  `NEGATIVESTOCK` float(1,0) DEFAULT NULL,
  `TEMPDISTRIBUTIONMARK` float(1,0) DEFAULT '0',
  `CHECKSTATE` float(1,0) DEFAULT NULL,
  `ERRORINFO` varchar(50) DEFAULT NULL,
  `INPUTPERSON` char(6) DEFAULT NULL,
  `COSTMODE` char(2) NOT NULL DEFAULT '01',
  `DEDUCTAMT` float(12,2) NOT NULL DEFAULT '0.00',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `ONLINESTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-未上线 1-上线',
  `ISALLOWNEGATIVE` int(11) NOT NULL DEFAULT '1' COMMENT '是否允许负库存 0-不允许 1-允许',
  `BUFFER` int(11) NOT NULL DEFAULT '99999999' COMMENT '库存缓冲',
  `SALESMANCODE` char(6) DEFAULT NULL COMMENT '负库存信息的修改营业员',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ITEMCODE_2` (`ITEMCODE`,`COUNTERCODE`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `COUNTERCODE` (`COUNTERCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_itm_storeitem_afterinsert` AFTER INSERT ON `mec_itm_storeitem`
FOR EACH ROW begin
insert into mec_itm_stock(COUNTERCODE,SKCCODE,ISALLOWNEGATIVE,BUFFER) ( select new.COUNTERCODE as COUNTERCODE, mec_itm_skc.SKCCODE, new.ISALLOWNEGATIVE as ISALLOWNEGATIVE, new.BUFFER as BUFFER from mec_itm_skc where ITEMCODE=new.ITEMCODE );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_itm_virtualstoreitem`
--

DROP TABLE IF EXISTS `mec_itm_virtualstoreitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_itm_virtualstoreitem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MISITEMCODE` varchar(32) NOT NULL,
  `ITEMCODE` char(8) NOT NULL,
  `ONLINECOUNTERCODE` char(6) NOT NULL,
  `ONLINESTORECHECKEDPRICE` float(12,2) NOT NULL,
  `ONLINESTORETEMPPRICE` float(12,2) NOT NULL,
  `ONLINEPROMOTIONMARK` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_lgt_logistics`
--

DROP TABLE IF EXISTS `mec_lgt_logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_logistics` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `ORDERCODE` char(18) NOT NULL,
  `ISONLINEORDER` int(1) NOT NULL DEFAULT '0',
  `LGTCOMPANY` char(32) DEFAULT NULL,
  `LGTNUMBER` char(64) DEFAULT NULL,
  `LGTSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-待发货 1-发货途中 2-已收货',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `DEPTCODE` varchar(8) NOT NULL,
  `POSITIONCODE` char(16) DEFAULT NULL COMMENT '内部物流放到的位置',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_lgt_package`
--

DROP TABLE IF EXISTS `mec_lgt_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_package` (
  `PACKAGECODE` char(30) NOT NULL,
  `ORDERCODE` char(18) NOT NULL,
  `ISONLINEORDER` int(1) NOT NULL DEFAULT '0',
  `PAYMENTMODE` int(11) NOT NULL,
  `DELIVERYMODE` int(11) NOT NULL,
  `DELIVERYDEPTCODE` varchar(8) NOT NULL,
  `DEPTCODE` varchar(8) NOT NULL,
  `COUNTERCODE` char(6) NOT NULL,
  `PACKAGESTATE` int(11) NOT NULL,
  `POSITIONCODE` char(16) NOT NULL DEFAULT '',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `PLACEORDERTIME` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`PACKAGECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_lgt_package_afterinsert
after insert on mec_lgt_package
for each row
begin
insert into mec_lgt_package_log(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.PACKAGECODE,new.ORDERCODE,new.ISONLINEORDER,new.PAYMENTMODE,new.DELIVERYMODE,new.DELIVERYDEPTCODE,new.DEPTCODE,new.COUNTERCODE,new.PACKAGESTATE,new.POSITIONCODE,new.RECORDSTATE,0,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 trigger mec_tr_lgt_package_afterupdate
after update on mec_lgt_package
for each row
begin
insert into mec_lgt_package_log(PACKAGECODE,ORDERCODE,ISONLINEORDER,PAYMENTMODE,DELIVERYMODE,DELIVERYDEPTCODE,DEPTCODE,COUNTERCODE,PACKAGESTATE,POSITIONCODE,RECORDSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt) values(new.PACKAGECODE,new.ORDERCODE,new.ISONLINEORDER,new.PAYMENTMODE,new.DELIVERYMODE,new.DELIVERYDEPTCODE,new.DEPTCODE,new.COUNTERCODE,new.PACKAGESTATE,new.POSITIONCODE,new.RECORDSTATE,2,new.LASTOPERATEPERSON,now(),now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mec_lgt_package_log`
--

DROP TABLE IF EXISTS `mec_lgt_package_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_package_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PACKAGECODE` char(30) DEFAULT NULL,
  `ORDERCODE` char(18) DEFAULT NULL,
  `ISONLINEORDER` int(1) DEFAULT NULL,
  `PAYMENTMODE` int(11) DEFAULT NULL,
  `DELIVERYMODE` int(11) DEFAULT NULL,
  `DEPTCODE` varchar(8) DEFAULT NULL,
  `COUNTERCODE` char(6) DEFAULT NULL,
  `DELIVERYDEPTCODE` varchar(8) DEFAULT NULL,
  `PACKAGESTATE` int(11) DEFAULT NULL,
  `POSITIONCODE` char(16) DEFAULT NULL,
  `RECORDSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_lgt_packagecontent`
--

DROP TABLE IF EXISTS `mec_lgt_packagecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_packagecontent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PACKAGECODE` char(30) NOT NULL,
  `CONTENTCODE` char(26) NOT NULL,
  `ISONLINEORDER` int(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_lgt_pickcounter`
--

DROP TABLE IF EXISTS `mec_lgt_pickcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_pickcounter` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `ORDERCODE` char(18) NOT NULL,
  `ISONLINEORDER` int(1) NOT NULL DEFAULT '0',
  `COUNTERCODE` char(6) NOT NULL,
  `PICKCODE` char(6) NOT NULL,
  `PICKSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-待自提 1-自提完成',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_lgt_pickdept`
--

DROP TABLE IF EXISTS `mec_lgt_pickdept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_pickdept` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `ORDERCODE` char(18) NOT NULL,
  `PICKCODE` char(6) NOT NULL,
  `PICKSTATE` int(1) NOT NULL DEFAULT '0' COMMENT '0-待自提  1-自提完成',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `DEPTCODE` varchar(8) NOT NULL,
  `POSITIONCODE` char(16) DEFAULT NULL COMMENT '内部物流放到的位置',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_lgt_position`
--

DROP TABLE IF EXISTS `mec_lgt_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_lgt_position` (
  `POSITIONCODE` char(16) NOT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  `DEPTCODE` varchar(8) NOT NULL DEFAULT '10201',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`POSITIONCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_prm_itemrule`
--

DROP TABLE IF EXISTS `mec_prm_itemrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_prm_itemrule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCODE` char(8) NOT NULL,
  `RULEID` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `ITEMCODE` (`ITEMCODE`),
  KEY `RULEID` (`RULEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_prm_prmrule`
--

DROP TABLE IF EXISTS `mec_prm_prmrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_prm_prmrule` (
  `ID` int(11) NOT NULL,
  `RULECODE` varchar(100) NOT NULL,
  `RULECONTENT` varchar(1024) DEFAULT NULL,
  `DATEEFFECTIVE` datetime NOT NULL,
  `DATEEXPIRES` datetime NOT NULL,
  `DEPTCODE` varchar(8) DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店',
  `STATE` int(1) NOT NULL DEFAULT '1',
  `REDUCECONVERT` varchar(1024) DEFAULT NULL,
  `REDUCE` varchar(1024) DEFAULT NULL,
  `COUPONCONVERT` varchar(1024) DEFAULT NULL,
  `COUPON` varchar(1024) DEFAULT NULL,
  `GIFTCONVERT` varchar(1024) DEFAULT NULL,
  `GIFT` varchar(1024) DEFAULT NULL,
  `RULESCRIPT` text NOT NULL,
  `MODIFYSTATE` int(11) NOT NULL DEFAULT '0' COMMENT '修改状态 0-未修改 1-修改待审核',
  `RECORDSTATE` int(11) NOT NULL DEFAULT '1' COMMENT '0-作废 1-有效',
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `VIPSALIENCE` int(1) NOT NULL DEFAULT '1',
  `COUPONVIPGRADE` int(1) NOT NULL DEFAULT '0' COMMENT '赠券vip等级要求  0-无要求 1-普卡 2-金卡',
  `COUPONPOSACCU` int(1) NOT NULL DEFAULT '0' COMMENT '赠券pos条是否累计  0-不累计  1-累计',
  `COUPONVIPMORE` int(11) DEFAULT '0' COMMENT 'VIP赠券多赠',
  `COUPONALLOWERROR` int(11) DEFAULT '0' COMMENT '赠券允许计算误差',
  `GIFTVIPGRADE` int(1) NOT NULL DEFAULT '0' COMMENT '赠礼vip等级要求  0-无要求 1-普卡 2-金卡',
  `GIFTPOSACCU` int(1) NOT NULL DEFAULT '0' COMMENT '赠礼pos条是否累计  0-不累计  1-累计',
  `GIFTVIPMORE` int(11) DEFAULT '0',
  `GIFTALLOWERROR` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DEPTCODE` (`DEPTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_prm_prmrule_log`
--

DROP TABLE IF EXISTS `mec_prm_prmrule_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_prm_prmrule_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `_ID` int(11) NOT NULL,
  `RULECODE` varchar(11) NOT NULL,
  `RULECONTENT` varchar(1024) DEFAULT NULL,
  `DATEEFFECTIVE` datetime NOT NULL,
  `DATEEXPIRES` datetime NOT NULL,
  `DEPTCODE` varchar(8) DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店',
  `STATE` int(1) NOT NULL,
  `REDUCECONVERT` varchar(1024) DEFAULT NULL,
  `REDUCE` varchar(1024) DEFAULT NULL,
  `COUPONCONVERT` varchar(1024) DEFAULT NULL,
  `COUPON` varchar(1024) DEFAULT NULL,
  `GIFTCONVERT` varchar(1024) DEFAULT NULL,
  `GIFT` varchar(1024) DEFAULT NULL,
  `RULESCRIPT` text NOT NULL,
  `TMPSTATE` int(11) NOT NULL,
  `OPERATION` int(11) NOT NULL COMMENT '0-增 1-删 2-改 3-查 4-增加通过审核 5-删除通过审核 6-修改通过审核',
  `OPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `VIPSALIENCE` int(1) NOT NULL,
  `COUPONVIPGRADE` int(1) NOT NULL DEFAULT '0' COMMENT '赠券vip等级要求  0-无要求 1-普卡 2-金卡',
  `COUPONPOSACCU` int(1) NOT NULL DEFAULT '0' COMMENT '赠券pos条是否累计  0-不累计  1-累计',
  `COUPONVIPMORE` int(11) DEFAULT '0' COMMENT 'VIP赠券多赠',
  `COUPONALLOWERROR` int(11) DEFAULT '0' COMMENT '赠券允许计算误差',
  `GIFTVIPGRADE` int(1) NOT NULL DEFAULT '0' COMMENT '赠礼vip等级要求  0-无要求 1-普卡 2-金卡',
  `GIFTPOSACCU` int(1) NOT NULL DEFAULT '0' COMMENT '赠礼pos条是否累计  0-不累计  1-累计',
  `GIFTVIPMORE` int(11) DEFAULT '0',
  `GIFTALLOWERROR` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DEPTCODE` (`DEPTCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_prm_prmrule_tmp`
--

DROP TABLE IF EXISTS `mec_prm_prmrule_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_prm_prmrule_tmp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULECODE` varchar(11) NOT NULL,
  `RULECONTENT` varchar(1024) DEFAULT NULL,
  `DATEEFFECTIVE` datetime NOT NULL,
  `DATEEXPIRES` datetime NOT NULL,
  `DEPTCODE` varchar(8) DEFAULT NULL COMMENT '规则适用门店，可以为抽象的网上门店，null为全部门店',
  `STATE` int(1) NOT NULL DEFAULT '1' COMMENT '规则状态，是否启用',
  `REDUCECONVERT` varchar(1024) DEFAULT NULL,
  `REDUCE` varchar(1024) DEFAULT NULL,
  `COUPONCONVERT` varchar(1024) DEFAULT NULL,
  `COUPON` varchar(1024) DEFAULT NULL,
  `GIFTCONVERT` varchar(1024) DEFAULT NULL,
  `GIFT` varchar(1024) DEFAULT NULL,
  `RULESCRIPT` text NOT NULL,
  `TMPSTATE` int(11) NOT NULL COMMENT '0-增待审 1-删待审 2-改待审3-增审过 4-删审过 5-改审过 6-拒绝',
  `LASTOPERATEPERSON` char(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `VIPSALIENCE` int(1) NOT NULL DEFAULT '1' COMMENT 'VIP优先级 0-先满减 1-先VIP打折',
  `COUPONVIPGRADE` int(1) NOT NULL DEFAULT '0' COMMENT '赠券vip等级要求  0-无要求 1-普卡 2-金卡',
  `COUPONPOSACCU` int(1) NOT NULL DEFAULT '0' COMMENT '赠券pos条是否累计  0-不累计  1-累计',
  `COUPONVIPMORE` int(11) DEFAULT '0' COMMENT 'VIP赠券多赠',
  `COUPONALLOWERROR` int(11) DEFAULT '0' COMMENT '赠券允许计算误差',
  `GIFTVIPGRADE` int(1) NOT NULL DEFAULT '0' COMMENT '赠礼vip等级要求  0-无要求 1-普卡 2-金卡',
  `GIFTPOSACCU` int(1) NOT NULL DEFAULT '0' COMMENT '赠礼pos条是否累计  0-不累计  1-累计',
  `GIFTVIPMORE` int(11) DEFAULT '0' COMMENT 'VIP多赠',
  `GIFTALLOWERROR` int(11) DEFAULT '0' COMMENT '允许计算误差',
  PRIMARY KEY (`ID`),
  KEY `DEPTCODE` (`DEPTCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_prm_prmrule_tmp_afterinset` AFTER INSERT ON `mec_prm_prmrule_tmp`
FOR EACH ROW begin
insert into mec_prm_prmrule_log(_ID,RULECODE,RULECONTENT,`DATEEFFECTIVE`,`DATEEXPIRES`,DEPTCODE,STATE,REDUCECONVERT,REDUCE,COUPONCONVERT,COUPON,GIFTCONVERT,GIFT,RULESCRIPT,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt,VIPSALIENCE,COUPONVIPGRADE,COUPONPOSACCU,COUPONVIPMORE,COUPONALLOWERROR,GIFTVIPGRADE,GIFTPOSACCU,GIFTVIPMORE,GIFTALLOWERROR) values (new.ID,new.RULECODE,new.RULECONTENT,new.`DATEEFFECTIVE`,new.`DATEEXPIRES`,new.DEPTCODE,new.STATE,new.REDUCECONVERT,new.REDUCE,new.COUPONCONVERT,new.COUPON,new.GIFTCONVERT,new.GIFT,new.RULESCRIPT,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now(),new.VIPSALIENCE,new.COUPONVIPGRADE,new.COUPONPOSACCU,new.COUPONVIPMORE,new.COUPONALLOWERROR,new.GIFTVIPGRADE,new.GIFTPOSACCU,new.GIFTVIPMORE,new.GIFTALLOWERROR);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mec_admin`@`%`*/ /*!50003 TRIGGER `mec_tr_prm_prmrule_tmp_afterupdate` AFTER UPDATE ON `mec_prm_prmrule_tmp`
FOR EACH ROW begin
insert into mec_prm_prmrule_log(_ID,RULECODE,RULECONTENT,`DATEEFFECTIVE`,`DATEEXPIRES`,DEPTCODE,STATE,REDUCECONVERT,REDUCE,COUPONCONVERT,COUPON,GIFTCONVERT,GIFT,RULESCRIPT,TMPSTATE,OPERATION,OPERATEPERSON,createdAt,updatedAt,VIPSALIENCE,COUPONVIPGRADE,COUPONPOSACCU,COUPONVIPMORE,COUPONALLOWERROR,GIFTVIPGRADE,GIFTPOSACCU,GIFTVIPMORE,GIFTALLOWERROR) values (new.ID,new.RULECODE,new.RULECONTENT,new.`DATEEFFECTIVE`,new.`DATEEXPIRES`,new.DEPTCODE,new.STATE,new.REDUCECONVERT,new.REDUCE,new.COUPONCONVERT,new.COUPON,new.GIFTCONVERT,new.GIFT,new.RULESCRIPT,new.TMPSTATE,0,new.LASTOPERATEPERSON,now(),now(),new.VIPSALIENCE,new.COUPONVIPGRADE,new.COUPONPOSACCU,new.COUPONVIPMORE,new.COUPONALLOWERROR,new.GIFTVIPGRADE,new.GIFTPOSACCU,new.GIFTVIPMORE,new.GIFTALLOWERROR);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;


--
-- Table structure for table `mec_sys_businesssetting`
--

DROP TABLE IF EXISTS `mec_sys_businesssetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_sys_businesssetting` (
  `KEY` varchar(32) NOT NULL,
  `VALUE` varchar(16) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `mec_vi_bhv_comment_total`
--

DROP TABLE IF EXISTS `mec_vi_bhv_comment_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_bhv_comment_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_bhv_comment_total` AS SELECT 
 1 AS `ID`,
 1 AS `CONTENTCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `ORDERCODE`,
 1 AS `USERCODE`,
 1 AS `ITEMCODE`,
 1 AS `STARS`,
 1 AS `COMMENT`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `SKCCODE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `PLACEORDERTIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_bhv_favoriteitem_total`
--

DROP TABLE IF EXISTS `mec_vi_bhv_favoriteitem_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_bhv_favoriteitem_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_bhv_favoriteitem_total` AS SELECT 
 1 AS `USERCODE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `PRICE`,
 1 AS `BRANDNAME`,
 1 AS `IMGURL`,
 1 AS `CREATETIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_category_brand`
--

DROP TABLE IF EXISTS `mec_vi_category_brand`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_category_brand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_category_brand` AS SELECT 
 1 AS `ID`,
 1 AS `BRANDCODE`,
 1 AS `CATEGORYID`,
 1 AS `CATEGORYNAME`,
 1 AS `BRANDNAME`,
 1 AS `LOGO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_category_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_category_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_category_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_category_sku_total` AS SELECT 
 1 AS `CATEGORYID`,
 1 AS `CATEGORYNAME`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `RETURNGOODS`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `UNIT`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;



--
-- Temporary view structure for view `mec_vi_checkable_sku`
--

DROP TABLE IF EXISTS `mec_vi_checkable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_checkable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_checkable_sku` AS SELECT 
 1 AS `ID`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `TMPSTATE`,
 1 AS `LASTOPERATEPERSON`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_checkable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_checkable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_checkable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_checkable_sku_total` AS SELECT 
 1 AS `ID`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `TMPSTATE`,
 1 AS `LASTOPERATEPERSON`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_counter_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_counter_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_counter_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_counter_skc_stock` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `ITEMCODE`,
 1 AS `SKCCODE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `SIZE`,
 1 AS `COLOR`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_counter_skc_stock_raw`
--

DROP TABLE IF EXISTS `mec_vi_counter_skc_stock_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_counter_skc_stock_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_counter_skc_stock_raw` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `ITEMCODE`,
 1 AS `SKCCODE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `SIZE`,
 1 AS `COLOR`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;



--
-- Temporary view structure for view `mec_vi_deletable_sku`
--

DROP TABLE IF EXISTS `mec_vi_deletable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_deletable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_deletable_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_deletable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_deletable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_deletable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_deletable_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_dept_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_dept_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_dept_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_dept_skc_stock` AS SELECT 
 1 AS `DEPTCODE`,
 1 AS `SKCCODE`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_dept_sku`
--

DROP TABLE IF EXISTS `mec_vi_dept_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_dept_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_dept_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `DEPTCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_first_imgpreview`
--

DROP TABLE IF EXISTS `mec_vi_first_imgpreview`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_first_imgpreview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_first_imgpreview` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `IMGURL`,
 1 AS `createdAt`,
 1 AS `updatedAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_lgt_pickcounter_total`
--

DROP TABLE IF EXISTS `mec_vi_lgt_pickcounter_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_lgt_pickcounter_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_lgt_pickcounter_total` AS SELECT 
 1 AS `POSDEALNUM`,
 1 AS `POSTRANSCODE`,
 1 AS `PLACETIME`,
 1 AS `PAYTIME`,
 1 AS `PAYMENTMODE`,
 1 AS `PAYMENTSTATE`,
 1 AS `ID`,
 1 AS `ORDERCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `COUNTERCODE`,
 1 AS `PICKCODE`,
 1 AS `PICKSTATE`,
 1 AS `OPERATEPERSON`,
 1 AS `updatedAt`,
 1 AS `createdAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_lgt_pickinfo_forapp`
--

DROP TABLE IF EXISTS `mec_vi_lgt_pickinfo_forapp`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_lgt_pickinfo_forapp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_lgt_pickinfo_forapp` AS SELECT 
 1 AS `ORDERCODE`,
 1 AS `PICKCODE`,
 1 AS `PICKSTATE`,
 1 AS `DEPTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `COUNTERNAME`,
 1 AS `COUNTERLOCATIONCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_content`
--

DROP TABLE IF EXISTS `mec_vi_offline_content`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_content`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_content` AS SELECT 
 1 AS `OFFLINECONTENTCODE`,
 1 AS `OFFLINEORDERCODE`,
 1 AS `ITEMCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `FINALPRICELIST`,
 1 AS `FINALPRICELIST2`,
 1 AS `FINALRULELIST`,
 1 AS `FINALRULELIST2`,
 1 AS `RETAILAMT`,
 1 AS `RETAILAMT2`,
 1 AS `REALVIPCARDTYPE`,
 1 AS `REALVIPCARDTYPE2`,
 1 AS `REALVIPDISCOUNTRATE`,
 1 AS `REALVIPDISCOUNTRATE2`,
 1 AS `VIPDISCOUNTAMT`,
 1 AS `VIPDISCOUNTAMT2`,
 1 AS `VIPFLOORAMT`,
 1 AS `VIPFLOORAMT2`,
 1 AS `DISCOUNTOUTAMT`,
 1 AS `DISCOUNTOUTAMT2`,
 1 AS `DISCOUNTINAMT`,
 1 AS `DISCOUNTINAMT2`,
 1 AS `PRESENTSHAREQTY`,
 1 AS `PRESENTSHAREQTY2`,
 1 AS `MERCHANTDISCOUTAMT`,
 1 AS `MERCHANTDISCOUTAMT2`,
 1 AS `SHIPPRICECHARGESHARE`,
 1 AS `SHIPPRICECHARGESHARE2`,
 1 AS `PACKINGCHARGESHARE`,
 1 AS `PACKINGCHARGESHARE2`,
 1 AS `CASHPAYSHARE`,
 1 AS `CREDITPAYSHARE`,
 1 AS `CASHCOUPONPAYSHARE`,
 1 AS `GOODSCOUPONPAYSHARE`,
 1 AS `ECARDPAYSHARE`,
 1 AS `OTHERPAYSHARE`,
 1 AS `PREMIUMPAYSHARE`,
 1 AS `ORIGINCONTENTCODE`,
 1 AS `IFRETURN`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_content_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_content_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_content_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_content_total` AS SELECT 
 1 AS `OFFLINECONTENTCODE`,
 1 AS `OFFLINEORDERCODE`,
 1 AS `COUNTERCODE`,
 1 AS `ITEMCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `FINALPRICELIST`,
 1 AS `FINALPRICELIST2`,
 1 AS `FINALRULELIST`,
 1 AS `FINALRULELIST2`,
 1 AS `RETAILAMT`,
 1 AS `RETAILAMT2`,
 1 AS `REALVIPCARDTYPE`,
 1 AS `REALVIPCARDTYPE2`,
 1 AS `REALVIPDISCOUNTRATE`,
 1 AS `REALVIPDISCOUNTRATE2`,
 1 AS `VIPDISCOUNTAMT`,
 1 AS `VIPDISCOUNTAMT2`,
 1 AS `VIPFLOORAMT`,
 1 AS `VIPFLOORAMT2`,
 1 AS `DISCOUNTOUTAMT`,
 1 AS `DISCOUNTOUTAMT2`,
 1 AS `DISCOUNTINAMT`,
 1 AS `DISCOUNTINAMT2`,
 1 AS `PRESENTSHAREQTY`,
 1 AS `PRESENTSHAREQTY2`,
 1 AS `MERCHANTDISCOUTAMT`,
 1 AS `MERCHANTDISCOUTAMT2`,
 1 AS `HANDAMT`,
 1 AS `HANDAMT2`,
 1 AS `SHIPPRICECHARGESHARE`,
 1 AS `SHIPPRICECHARGESHARE2`,
 1 AS `PACKINGCHARGESHARE`,
 1 AS `PACKINGCHARGESHARE2`,
 1 AS `CASHPAYSHARE`,
 1 AS `CREDITPAYSHARE`,
 1 AS `CASHCOUPONPAYSHARE`,
 1 AS `GOODSCOUPONPAYSHARE`,
 1 AS `ECARDPAYSHARE`,
 1 AS `OTHERPAYSHARE`,
 1 AS `PREMIUMPAYSHARE`,
 1 AS `ORIGINORDERCODE`,
 1 AS `ORIGINCONTENTCODE`,
 1 AS `IFRETURN`,
 1 AS `TEMPDISTRIBUTIONMARK`,
 1 AS `SALESMANCODE`,
 1 AS `SALESMANNAME`,
 1 AS `MEMBERPRICE`,
 1 AS `STORECHECKEDPRICE`,
 1 AS `STORETEMPPRICE`,
 1 AS `DISCOUNTMARK`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `RETURNGOODS`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `UNIT`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_hasstock_counter_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_hasstock_counter_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_counter_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_hasstock_counter_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_hasstock_counter_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_hasstock_counter_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_counter_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_hasstock_counter_sku_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `MEMBERPRICE`,
 1 AS `STORECHECKEDPRICE`,
 1 AS `STORETEMPPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `DISCOUNTMARK`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `BUFFER`,
 1 AS `SALESMANCODE`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_hasstock_selling_counter_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_hasstock_selling_counter_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_counter_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_hasstock_selling_counter_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_hasstock_selling_counter_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_hasstock_selling_counter_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_counter_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_hasstock_selling_counter_sku_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `MEMBERPRICE`,
 1 AS `STORECHECKEDPRICE`,
 1 AS `STORETEMPPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `DISCOUNTMARK`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_hasstock_selling_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_hasstock_selling_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_hasstock_selling_sku` AS SELECT 
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_hasstock_selling_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_hasstock_selling_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_hasstock_selling_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_nostock_selling_counter_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_nostock_selling_counter_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_counter_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_nostock_selling_counter_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_nostock_selling_counter_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_nostock_selling_counter_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_counter_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_nostock_selling_counter_sku_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `MEMBERPRICE`,
 1 AS `STORECHECKEDPRICE`,
 1 AS `STORETEMPPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `DISCOUNTMARK`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_nostock_selling_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_nostock_selling_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_nostock_selling_sku` AS SELECT 
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_nostock_selling_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_nostock_selling_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_nostock_selling_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_order_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_order_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_order_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_order_total` AS SELECT 
 1 AS `OFFLINEORDERCODE`,
 1 AS `OFFLINEGROUPCODE`,
 1 AS `TEMPDISTRIBUTIONMARK`,
 1 AS `USERCODE`,
 1 AS `ORDERSTATE`,
 1 AS `PAYMENTMODE`,
 1 AS `DELIVERYMODE`,
 1 AS `SITEID`,
 1 AS `COUNTERCODE`,
 1 AS `STORECODE`,
 1 AS `SHIPPRICE`,
 1 AS `REALSHIPPRICE`,
 1 AS `PACKING`,
 1 AS `REALPACKING`,
 1 AS `SALESMANCODE`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `FINALPRICE`,
 1 AS `FINALRULESTRING`,
 1 AS `FINALPRICE2`,
 1 AS `FINALRULESTRING2`,
 1 AS `TRANSID`,
 1 AS `CHRCODE`,
 1 AS `VIPCARDNO`,
 1 AS `VIPCARDNO2`,
 1 AS `VIPCODE`,
 1 AS `VIPCODE2`,
 1 AS `VIPCARDTYPE`,
 1 AS `VIPCARDTYPE2`,
 1 AS `VIPDISCOUNTRATE`,
 1 AS `VIPDISCOUNTRATE2`,
 1 AS `RECEIVABLEAMT`,
 1 AS `RECEIVABLEAMT2`,
 1 AS `PAYMENTSTATE`,
 1 AS `PAYLOCAL`,
 1 AS `POSDEALNUM`,
 1 AS `POSCODE`,
 1 AS `POSTRANSCODE`,
 1 AS `CASHIER`,
 1 AS `TIMEOUTTIME`,
 1 AS `PLACETIME`,
 1 AS `AUDITTIME`,
 1 AS `PAYTIME`,
 1 AS `OUTTIME`,
 1 AS `RECEIVABLETIME`,
 1 AS `FINISHTIME`,
 1 AS `IFRETURN`,
 1 AS `RETUSERCODE`,
 1 AS `TIME`,
 1 AS `DEPTCODE`,
 1 AS `PERSON`,
 1 AS `TELEPHONE`,
 1 AS `PROVINCE`,
 1 AS `CITY`,
 1 AS `DISTRICT`,
 1 AS `DETAIL`,
 1 AS `POSTCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_selling_counter_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_selling_counter_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_counter_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_selling_counter_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_selling_counter_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_selling_counter_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_counter_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_selling_counter_sku_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `MEMBERPRICE`,
 1 AS `STORECHECKEDPRICE`,
 1 AS `STORETEMPPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `DISCOUNTMARK`,
 1 AS `ONLINESTATE`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_selling_sku`
--

DROP TABLE IF EXISTS `mec_vi_offline_selling_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_selling_sku` AS SELECT 
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_offline_selling_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_offline_selling_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_offline_selling_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_checkable_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_checkable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_checkable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_checkable_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_checkable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_online_checkable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_checkable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_checkable_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_forassistant`
--

DROP TABLE IF EXISTS `mec_vi_online_content_forassistant`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forassistant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_forassistant` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_forcustomer`
--

DROP TABLE IF EXISTS `mec_vi_online_content_forcustomer`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forcustomer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_forcustomer` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `SKCCODE`,
 1 AS `UNITPRICE`,
 1 AS `NUM`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_forpick`
--

DROP TABLE IF EXISTS `mec_vi_online_content_forpick`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forpick`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_forpick` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `PRICE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_forpos`
--

DROP TABLE IF EXISTS `mec_vi_online_content_forpos`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forpos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_forpos` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `PRICE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_total_forassistant`
--

DROP TABLE IF EXISTS `mec_vi_online_content_total_forassistant`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forassistant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_total_forassistant` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_total_forcustomer`
--

DROP TABLE IF EXISTS `mec_vi_online_content_total_forcustomer`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forcustomer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_total_forcustomer` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `SKCCODE`,
 1 AS `UNITPRICE`,
 1 AS `NUM`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_total_forpick`
--

DROP TABLE IF EXISTS `mec_vi_online_content_total_forpick`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forpick`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_total_forpick` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `PRICE`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_content_total_forpos`
--

DROP TABLE IF EXISTS `mec_vi_online_content_total_forpos`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forpos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_content_total_forpos` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `ONLINECONTENTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `SALESMANCODE`,
 1 AS `SALESMANNAME`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `UNIT`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_counter_dept_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_online_counter_dept_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_counter_dept_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_counter_dept_skc_stock` AS SELECT 
 1 AS `DEPTCODE`,
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_counter_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_online_counter_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_counter_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_counter_skc_stock` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `SKCCODE`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_dept_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_online_dept_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_dept_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_dept_skc_stock` AS SELECT 
 1 AS `DEPTCODE`,
 1 AS `SKCCODE`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_order_total_forassistant`
--

DROP TABLE IF EXISTS `mec_vi_online_order_total_forassistant`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_order_total_forassistant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_order_total_forassistant` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `ONLINECOUNTERCODE`,
 1 AS `CONFIRMSTATE`,
 1 AS `CONFIRMTIME`,
 1 AS `SALESMANCODE`,
 1 AS `ONLINEORDERCODE`,
 1 AS `RECEIVABLEAMT`,
 1 AS `DELIVERYDEPTCODE`,
 1 AS `DELIVERYMODE`,
 1 AS `FINALPRICE`,
 1 AS `FINALRULESTRING`,
 1 AS `NOTE`,
 1 AS `ORDERSTATE`,
 1 AS `PAYMENTMODE`,
 1 AS `SITEID`,
 1 AS `USERCODE`,
 1 AS `TIME`,
 1 AS `PLACETIME`,
 1 AS `PAYTIME`,
 1 AS `IFRETURN`,
 1 AS `VIPCARDNO`,
 1 AS `TELEPHONE`,
 1 AS `NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_order_total_forcustomer`
--

DROP TABLE IF EXISTS `mec_vi_online_order_total_forcustomer`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_order_total_forcustomer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_order_total_forcustomer` AS SELECT 
 1 AS `ONLINEORDERCODE`,
 1 AS `DELIVERYDEPTCODE`,
 1 AS `DELIVERYMODE`,
 1 AS `FINALPRICE`,
 1 AS `FINALRULESTRING`,
 1 AS `NOTE`,
 1 AS `ORDERSTATE`,
 1 AS `PAYMENTMODE`,
 1 AS `SITEID`,
 1 AS `USERCODE`,
 1 AS `TIME`,
 1 AS `PERSON`,
 1 AS `TELEPHONE`,
 1 AS `PROVINCE`,
 1 AS `CITY`,
 1 AS `DISTRICT`,
 1 AS `DETAIL`,
 1 AS `POSTCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_prepared_counter_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_prepared_counter_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_prepared_counter_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_prepared_counter_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERCODE`,
 1 AS `DEPTCODE`,
 1 AS `ONLINESTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_prepared_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_prepared_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_prepared_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_prepared_sku` AS SELECT 
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_prepared_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_online_prepared_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_prepared_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_prepared_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `SELLINGSTATE`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_renewable_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_renewable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_renewable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_renewable_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_renewable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_online_renewable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_renewable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_renewable_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_selling_counter_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_selling_counter_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_counter_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_selling_counter_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_selling_counter_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_online_selling_counter_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_counter_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_selling_counter_sku_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `MEMBERPRICE`,
 1 AS `STORECHECKEDPRICE`,
 1 AS `STORETEMPPRICE`,
 1 AS `PROMOTIONMARK`,
 1 AS `DISCOUNTMARK`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_selling_skc_forapp`
--

DROP TABLE IF EXISTS `mec_vi_online_selling_skc_forapp`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_skc_forapp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_selling_skc_forapp` AS SELECT 
 1 AS `SKCCODE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `RETURNGOODS`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `UNIT`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_selling_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_selling_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_selling_sku` AS SELECT 
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_selling_sku_forapp`
--

DROP TABLE IF EXISTS `mec_vi_online_selling_sku_forapp`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_sku_forapp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_selling_sku_forapp` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `RETURNGOODS`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `UNIT`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`,
 1 AS `createdAt`,
 1 AS `updatedAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_selling_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_online_selling_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_selling_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_online_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_skc_stock` AS SELECT 
 1 AS `SKCCODE`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_uninitial_sku`
--

DROP TABLE IF EXISTS `mec_vi_online_uninitial_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_uninitial_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_uninitial_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_online_uninitial_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_online_uninitial_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_online_uninitial_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_online_uninitial_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_order_counter_userbuy`
--

DROP TABLE IF EXISTS `mec_vi_order_counter_userbuy`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_order_counter_userbuy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_order_counter_userbuy` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `SALESMANCODE`,
 1 AS `RECEIVABLEAMT`,
 1 AS `RECEIVABLEAMT2`,
 1 AS `DELIVERYMODE`,
 1 AS `ORDERCODE`,
 1 AS `ORDERSTATE`,
 1 AS `PAYMENTMODE`,
 1 AS `PAYTIME`,
 1 AS `PLACETIME`,
 1 AS `VIPCARDNO`,
 1 AS `USERCODE`,
 1 AS `TELEPHONE`,
 1 AS `VIPCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_order_tags`
--

DROP TABLE IF EXISTS `mec_vi_order_tags`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_order_tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_order_tags` AS SELECT 
 1 AS `STORECODE`,
 1 AS `ORDERCODE`,
 1 AS `IFRETURN`,
 1 AS `ISONLINEORDER`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_package_item`
--

DROP TABLE IF EXISTS `mec_vi_package_item`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_package_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_package_item` AS SELECT 
 1 AS `ORDERCODE`,
 1 AS `PACKAGECODE`,
 1 AS `CONTENTCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `COUNTERCODE`,
 1 AS `NUM`,
 1 AS `SKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_package_item_raw`
--

DROP TABLE IF EXISTS `mec_vi_package_item_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_package_item_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_package_item_raw` AS SELECT 
 1 AS `ORDERCODE`,
 1 AS `PACKAGECODE`,
 1 AS `CONTENTCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `COUNTERCODE`,
 1 AS `NUM`,
 1 AS `SKCCODE`,
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_package_item_total`
--

DROP TABLE IF EXISTS `mec_vi_package_item_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_package_item_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_package_item_total` AS SELECT 
 1 AS `ORDERCODE`,
 1 AS `PACKAGECODE`,
 1 AS `CONTENTCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `COUNTERCODE`,
 1 AS `NUM`,
 1 AS `SKCCODE`,
 1 AS `ITEMCODE`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_paid_chargeinfo`
--

DROP TABLE IF EXISTS `mec_vi_paid_chargeinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_chargeinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_paid_chargeinfo` AS SELECT 
 1 AS `orderorgroupcode`,
 1 AS `ordercode`,
 1 AS `listid`,
 1 AS `chargecode`,
 1 AS `amt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_paid_contentinfo`
--

DROP TABLE IF EXISTS `mec_vi_paid_contentinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_contentinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_paid_contentinfo` AS SELECT 
 1 AS `orderorgroupcode`,
 1 AS `ordercode`,
 1 AS `listid`,
 1 AS `sku`,
 1 AS `billcountercode`,
 1 AS `countercode`,
 1 AS `itemname`,
 1 AS `promotionmark`,
 1 AS `price`,
 1 AS `qty`,
 1 AS `saler`,
 1 AS `vipdiscountamt`,
 1 AS `discountoutamt`,
 1 AS `discountinamt`,
 1 AS `presentshareqty`,
 1 AS `mechantdiscounamt`,
 1 AS `shippricechargeshare`,
 1 AS `packingchargeshare`,
 1 AS `retailamt`,
 1 AS `tempdistributionmark`,
 1 AS `returnordercode`,
 1 AS `returnlistid`,
 1 AS `handamt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_paid_discountinfo`
--

DROP TABLE IF EXISTS `mec_vi_paid_discountinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_discountinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_paid_discountinfo` AS SELECT 
 1 AS `orderorgroupcode`,
 1 AS `ordercode`,
 1 AS `itemlistid`,
 1 AS `listid`,
 1 AS `discountreason`,
 1 AS `discountamt`,
 1 AS `vipcardtype`,
 1 AS `discounttype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_paid_orderinfo`
--

DROP TABLE IF EXISTS `mec_vi_paid_orderinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_orderinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_paid_orderinfo` AS SELECT 
 1 AS `orderorgroupcode`,
 1 AS `groupid`,
 1 AS `ordercode`,
 1 AS `ifreturn`,
 1 AS `ordercodetype`,
 1 AS `pickupmode`,
 1 AS `paymenttype`,
 1 AS `status`,
 1 AS `orderdate`,
 1 AS `audittime`,
 1 AS `paytime`,
 1 AS `outtime`,
 1 AS `finishtime`,
 1 AS `receivabletime`,
 1 AS `vipcardNo`,
 1 AS `cashier`,
 1 AS `receivableamt`,
 1 AS `realshipprice`,
 1 AS `realpacking`,
 1 AS `shipprice`,
 1 AS `packing`,
 1 AS `receivecontact`,
 1 AS `receivename`,
 1 AS `receivephone`,
 1 AS `receivecellphone`,
 1 AS `receiveaddress`,
 1 AS `receivezip`,
 1 AS `storecode`,
 1 AS `poscode`,
 1 AS `paylocal`,
 1 AS `possalecode`,
 1 AS `grouplistid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_paid_payinfo`
--

DROP TABLE IF EXISTS `mec_vi_paid_payinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_payinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_paid_payinfo` AS SELECT 
 1 AS `orderorgroupcode`,
 1 AS `groupid`,
 1 AS `ordercode`,
 1 AS `listid`,
 1 AS `paycode`,
 1 AS `amt`,
 1 AS `cardcode`,
 1 AS `portno`,
 1 AS `bankcardcode`,
 1 AS `feeratecode`,
 1 AS `ifreturn`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_pos_contentinfo`
--

DROP TABLE IF EXISTS `mec_vi_pos_contentinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_contentinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_pos_contentinfo` AS SELECT 
 1 AS `contentcode`,
 1 AS `ordercode`,
 1 AS `itemcode`,
 1 AS `itemname`,
 1 AS `unit`,
 1 AS `cabinet`,
 1 AS `promotioncode`,
 1 AS `count`,
 1 AS `oriprice`,
 1 AS `discount`,
 1 AS `discountprice`,
 1 AS `actualprice`,
 1 AS `totaloriprice`,
 1 AS `handdiscount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_pos_contentinfo_raw`
--

DROP TABLE IF EXISTS `mec_vi_pos_contentinfo_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_contentinfo_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_pos_contentinfo_raw` AS SELECT 
 1 AS `contentcode`,
 1 AS `ordercode`,
 1 AS `itemcode`,
 1 AS `itemname`,
 1 AS `unit`,
 1 AS `cabinet`,
 1 AS `promotioncode`,
 1 AS `count`,
 1 AS `oriprice`,
 1 AS `discount`,
 1 AS `discountprice`,
 1 AS `actualprice`,
 1 AS `totaloriprice`,
 1 AS `handdiscount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_pos_orderinfo`
--

DROP TABLE IF EXISTS `mec_vi_pos_orderinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_orderinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_pos_orderinfo` AS SELECT 
 1 AS `storecode`,
 1 AS `ordercode`,
 1 AS `salemancode`,
 1 AS `salemanname`,
 1 AS `vipcode`,
 1 AS `ifreturn`,
 1 AS `ifonline`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_pos_payprepareinfo`
--

DROP TABLE IF EXISTS `mec_vi_pos_payprepareinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_payprepareinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_pos_payprepareinfo` AS SELECT 
 1 AS `ordercode`,
 1 AS `itemcode`,
 1 AS `amount`,
 1 AS `unitprice`,
 1 AS `vipdiscount`,
 1 AS `handdiscount`,
 1 AS `promotiondiscount`,
 1 AS `merchantdiscount`,
 1 AS `vipcardtype`,
 1 AS `vipdiscountstr`,
 1 AS `retailamt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_prm_order_content_params`
--

DROP TABLE IF EXISTS `mec_vi_prm_order_content_params`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_prm_order_content_params`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_prm_order_content_params` AS SELECT 
 1 AS `ordercode`,
 1 AS `contentcode`,
 1 AS `itemcode`,
 1 AS `countercode`,
 1 AS `deptcode`,
 1 AS `num`,
 1 AS `originprice`,
 1 AS `promotionmark`,
 1 AS `finalmanual`,
 1 AS `flag`,
 1 AS `finalprice`,
 1 AS `pos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_prm_order_content_params_raw`
--

DROP TABLE IF EXISTS `mec_vi_prm_order_content_params_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_prm_order_content_params_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_prm_order_content_params_raw` AS SELECT 
 1 AS `ordercode`,
 1 AS `contentcode`,
 1 AS `itemcode`,
 1 AS `countercode`,
 1 AS `deptcode`,
 1 AS `num`,
 1 AS `originprice`,
 1 AS `promotionmark`,
 1 AS `finalmanual`,
 1 AS `flag`,
 1 AS `finalprice`,
 1 AS `pos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_region_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_region_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_region_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_region_sku_total` AS SELECT 
 1 AS `REGIONID`,
 1 AS `REGIONNAME`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `RETURNGOODS`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `UNIT`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_ret_offlinecontent_total`
--

DROP TABLE IF EXISTS `mec_vi_ret_offlinecontent_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_offlinecontent_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_ret_offlinecontent_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `ITEMCODE`,
 1 AS `NUM`,
 1 AS `OFFLINECONTENTCODE`,
 1 AS `OFFLINEORDERCODE`,
 1 AS `ORIGINCONTENTCODE`,
 1 AS `ORIGINORDERCODE`,
 1 AS `PROMOTIONMARK`,
 1 AS `RETAILAMT`,
 1 AS `SKCCODE`,
 1 AS `UNITPRICE`,
 1 AS `ORDERSTATE`,
 1 AS `PLACETIME`,
 1 AS `STORECODE`,
 1 AS `RETUSERCODE`,
 1 AS `RETBACKCOUPON`,
 1 AS `RETORIPOSTRANSCODE`,
 1 AS `RECEIVABLEAMT`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `MERCHANTSKCCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `UNIT`,
 1 AS `BRANDNAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_ret_offlineorder_total`
--

DROP TABLE IF EXISTS `mec_vi_ret_offlineorder_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_offlineorder_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_ret_offlineorder_total` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `OFFLINEORDERCODE`,
 1 AS `ORDERSTATE`,
 1 AS `PLACETIME`,
 1 AS `STORECODE`,
 1 AS `RETUSERCODE`,
 1 AS `RETBACKCOUPON`,
 1 AS `RETORIPOSTRANSCODE`,
 1 AS `RECEIVABLEAMT`,
 1 AS `ISMULTICOUNTERS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_ret_offlineorder_total_raw`
--

DROP TABLE IF EXISTS `mec_vi_ret_offlineorder_total_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_offlineorder_total_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_ret_offlineorder_total_raw` AS SELECT 
 1 AS `COUNTERCODE`,
 1 AS `OFFLINEORDERCODE`,
 1 AS `ORDERSTATE`,
 1 AS `PLACETIME`,
 1 AS `STORECODE`,
 1 AS `RETUSERCODE`,
 1 AS `RETBACKCOUPON`,
 1 AS `RETORIPOSTRANSCODE`,
 1 AS `RECEIVABLEAMT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_ret_returnable_contentinfo`
--

DROP TABLE IF EXISTS `mec_vi_ret_returnable_contentinfo`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_returnable_contentinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_ret_returnable_contentinfo` AS SELECT 
 1 AS `ORDERCODE`,
 1 AS `VIPCARDNO`,
 1 AS `USERCODE`,
 1 AS `POSDEALNUM`,
 1 AS `POSTRANSCODE`,
 1 AS `COUNTERCODE`,
 1 AS `STORECODE`,
 1 AS `PLACETIME`,
 1 AS `PAYTIME`,
 1 AS `CONTENTCODE`,
 1 AS `ITEMCODE`,
 1 AS `SKCCODE`,
 1 AS `ITEMNAME`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `NUM`,
 1 AS `UNITPRICE`,
 1 AS `ORIGINAMT`,
 1 AS `RETAILAMT`,
 1 AS `CASHPAYSHARE`,
 1 AS `CREDITPAYSHARE`,
 1 AS `CASHCOUPONPAYSHARE`,
 1 AS `GOODSCOUPONPAYSHARE`,
 1 AS `ECARDPAYSHARE`,
 1 AS `OTHERPAYSHARE`,
 1 AS `PREMIUMPAYSHARE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_ret_returnable_paylist`
--

DROP TABLE IF EXISTS `mec_vi_ret_returnable_paylist`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_returnable_paylist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_ret_returnable_paylist` AS SELECT 
 1 AS `GROUPCODE`,
 1 AS `ORDERCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `IFRETURN`,
 1 AS `PAYMODECODE`,
 1 AS `PAYMODENAME`,
 1 AS `AMT`,
 1 AS `CARDCODE`,
 1 AS `PORTNO`,
 1 AS `BANKCARDCODE`,
 1 AS `POSTRANSCODE`,
 1 AS `STORECODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_ret_returnable_paylist_raw`
--

DROP TABLE IF EXISTS `mec_vi_ret_returnable_paylist_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_returnable_paylist_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_ret_returnable_paylist_raw` AS SELECT 
 1 AS `GROUPCODE`,
 1 AS `ORDERCODE`,
 1 AS `ISONLINEORDER`,
 1 AS `IFRETURN`,
 1 AS `PAYMODECODE`,
 1 AS `PAYMODENAME`,
 1 AS `AMT`,
 1 AS `CARDCODE`,
 1 AS `PORTNO`,
 1 AS `BANKCARDCODE`,
 1 AS `POSTRANSCODE`,
 1 AS `STORECODE`*/;
SET character_set_client = @saved_cs_client;




--
-- Temporary view structure for view `mec_vi_revisable_sku`
--

DROP TABLE IF EXISTS `mec_vi_revisable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_revisable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_revisable_sku` AS SELECT 
 1 AS `ID`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `TMPSTATE`,
 1 AS `LASTOPERATEPERSON`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_revisable_sku_raw`
--

DROP TABLE IF EXISTS `mec_vi_revisable_sku_raw`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_revisable_sku_raw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_revisable_sku_raw` AS SELECT 
 1 AS `ID`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `TMPSTATE`,
 1 AS `LASTOPERATEPERSON`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_revisable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_revisable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_revisable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_revisable_sku_total` AS SELECT 
 1 AS `ID`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `TMPSTATE`,
 1 AS `LASTOPERATEPERSON`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_shoppingcart_skc`
--

DROP TABLE IF EXISTS `mec_vi_shoppingcart_skc`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_shoppingcart_skc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_shoppingcart_skc` AS SELECT 
 1 AS `ID`,
 1 AS `USERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `TIME`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `ITEMCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `PRODUCINGAREA`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_shoppingcart_skc_total`
--

DROP TABLE IF EXISTS `mec_vi_shoppingcart_skc_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_shoppingcart_skc_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_shoppingcart_skc_total` AS SELECT 
 1 AS `ID`,
 1 AS `USERCODE`,
 1 AS `SKCCODE`,
 1 AS `NUM`,
 1 AS `TIME`,
 1 AS `COLOR`,
 1 AS `SIZE`,
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `RETURNGOODS`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `UNIT`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `IMGURL`,
 1 AS `CATEGORYNAMES`,
 1 AS `REGIONNAMES`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_checkable_sku`
--

DROP TABLE IF EXISTS `mec_vi_skc_checkable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_checkable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_checkable_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_checkable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_skc_checkable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_checkable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_checkable_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_renewable_sku`
--

DROP TABLE IF EXISTS `mec_vi_skc_renewable_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_renewable_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_renewable_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_renewable_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_skc_renewable_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_renewable_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_renewable_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_stock`
--

DROP TABLE IF EXISTS `mec_vi_skc_stock`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_stock` AS SELECT 
 1 AS `SKCCODE`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_uninitial_sku`
--

DROP TABLE IF EXISTS `mec_vi_skc_uninitial_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_uninitial_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_uninitial_sku` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_skc_uninitial_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_skc_uninitial_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_uninitial_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_skc_uninitial_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku`
--

DROP TABLE IF EXISTS `mec_vi_sku`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku` AS SELECT 
 1 AS `ITEMCODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku_categorynames`
--

DROP TABLE IF EXISTS `mec_vi_sku_categorynames`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_categorynames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku_categorynames` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `CATEGORYNAMES`,
 1 AS `createdAt`,
 1 AS `updatedAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku_hasstock_counternum`
--

DROP TABLE IF EXISTS `mec_vi_sku_hasstock_counternum`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_hasstock_counternum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku_hasstock_counternum` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERNUM`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku_online_counternum`
--

DROP TABLE IF EXISTS `mec_vi_sku_online_counternum`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_online_counternum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku_online_counternum` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERNUM`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku_regionnames`
--

DROP TABLE IF EXISTS `mec_vi_sku_regionnames`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_regionnames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku_regionnames` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `REGIONNAMES`,
 1 AS `createdAt`,
 1 AS `updatedAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku_total`
--

DROP TABLE IF EXISTS `mec_vi_sku_total`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku_total` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `BARCODE`,
 1 AS `ITEMNAME`,
 1 AS `ITEMSHORTNAME`,
 1 AS `BRANDCODE`,
 1 AS `RETAILTYPECODE`,
 1 AS `ITEMTYPECODE`,
 1 AS `MERCHANTCODE`,
 1 AS `BUSINESSMODE`,
 1 AS `PRODUCINGAREA`,
 1 AS `PRICE`,
 1 AS `TEMPPRICE`,
 1 AS `TAXRATE`,
 1 AS `EXCISERATE`,
 1 AS `RETURNGOODS`,
 1 AS `SALESTATE`,
 1 AS `NETWEIGHT`,
 1 AS `GROSSWEIGHT`,
 1 AS `SPECIFICATION`,
 1 AS `PRODUCTCODE`,
 1 AS `GRADE`,
 1 AS `COLOR`,
 1 AS `CASING`,
 1 AS `DIMENSION`,
 1 AS `VOLUME`,
 1 AS `ITEMCODETYPE`,
 1 AS `UNIT`,
 1 AS `LASTPURCHASEPRICE`,
 1 AS `PURCHASETAXRATE`,
 1 AS `SAFESTOCK`,
 1 AS `MAXSTOCK`,
 1 AS `MINSTOCK`,
 1 AS `MAXORDER`,
 1 AS `MINORDER`,
 1 AS `PROPERTY`,
 1 AS `CHECKSTATE`,
 1 AS `ERRORINFO`,
 1 AS `INPUTPERSON`,
 1 AS `AGENTCODE`,
 1 AS `TERM`,
 1 AS `createdAt`,
 1 AS `updatedAt`,
 1 AS `ISCONSIDERSTOCK`,
 1 AS `ISALLOWONLINE`,
 1 AS `ISALLOWNEGATIVE`,
 1 AS `SKCCHECKSTATE`,
 1 AS `ONLINECHECKSTATE`,
 1 AS `SELLINGSTATE`,
 1 AS `TITLE`,
 1 AS `SCORE`,
 1 AS `SCOREPOPULARITY`,
 1 AS `PURCHASE`,
 1 AS `PURCHASEPOPULARITY`,
 1 AS `PRAISERATE`,
 1 AS `ONLINETIME`,
 1 AS `BRANDNAME`,
 1 AS `MERCHANTNAME`,
 1 AS `AGENTNAME`,
 1 AS `ITEMTYPENAME`,
 1 AS `RETAILTYPENAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mec_vi_sku_total_counternum`
--

DROP TABLE IF EXISTS `mec_vi_sku_total_counternum`;
/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_total_counternum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mec_vi_sku_total_counternum` AS SELECT 
 1 AS `ITEMCODE`,
 1 AS `COUNTERNUM`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mec_vip_customercard`
--

DROP TABLE IF EXISTS `mec_vip_customercard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_vip_customercard` (
  `ID` int(11) NOT NULL,
  `USERCODE` char(32) NOT NULL,
  `CARDNUMBER` char(32) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mec_vip_merchantcard`
--

DROP TABLE IF EXISTS `mec_vip_merchantcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec_vip_merchantcard` (
  `MERCHANTCARDCODE` char(32) NOT NULL,
  `MERCHANTCODE` char(6) NOT NULL,
  `USERCODE` char(32) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  `updatedAt` datetime NOT NULL DEFAULT '2015-07-01 00:00:00',
  PRIMARY KEY (`MERCHANTCARDCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `mec_vi_bhv_comment_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_bhv_comment_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_bhv_comment_total` AS select `mec_bhv_comment`.`ID` AS `ID`,`mec_bhv_comment`.`CONTENTCODE` AS `CONTENTCODE`,`mec_bhv_comment`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_bhv_comment`.`ORDERCODE` AS `ORDERCODE`,`mec_bhv_comment`.`USERCODE` AS `USERCODE`,`mec_bhv_comment`.`ITEMCODE` AS `ITEMCODE`,`mec_bhv_comment`.`STARS` AS `STARS`,`mec_bhv_comment`.`COMMENT` AS `COMMENT`,`mec_bhv_comment`.`createdAt` AS `createdAt`,`mec_bhv_comment`.`updatedAt` AS `updatedAt`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_buy_onlineorder`.`createdAt` AS `PLACEORDERTIME` from ((((`mec_bhv_comment` left join `mec_itm_item` on((`mec_bhv_comment`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_buy_onlineorder` on((`mec_buy_onlineorder`.`ONLINEORDERCODE` = `mec_bhv_comment`.`ORDERCODE`))) left join `mec_buy_onlinecontent` on((`mec_bhv_comment`.`CONTENTCODE` = `mec_buy_onlinecontent`.`ONLINECONTENTCODE`))) left join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) where ((`mec_bhv_comment`.`ISONLINEORDER` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1)) union all select `mec_bhv_comment`.`ID` AS `ID`,`mec_bhv_comment`.`CONTENTCODE` AS `CONTENTCODE`,`mec_bhv_comment`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_bhv_comment`.`ORDERCODE` AS `ORDERCODE`,`mec_bhv_comment`.`USERCODE` AS `USERCODE`,`mec_bhv_comment`.`ITEMCODE` AS `ITEMCODE`,`mec_bhv_comment`.`STARS` AS `STARS`,`mec_bhv_comment`.`COMMENT` AS `COMMENT`,`mec_bhv_comment`.`createdAt` AS `createdAt`,`mec_bhv_comment`.`updatedAt` AS `updatedAt`,`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_buy_offlineorder`.`createdAt` AS `PLACEORDERTIME` from ((((`mec_bhv_comment` left join `mec_itm_item` on((`mec_bhv_comment`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_buy_offlineorder` on((`mec_buy_offlineorder`.`OFFLINEORDERCODE` = `mec_bhv_comment`.`ORDERCODE`))) left join `mec_buy_offlinecontent` on((`mec_bhv_comment`.`CONTENTCODE` = `mec_buy_offlinecontent`.`OFFLINECONTENTCODE`))) left join `mec_itm_skc` on((`mec_buy_offlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) where ((`mec_bhv_comment`.`ISONLINEORDER` = 0) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_bhv_favoriteitem_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_bhv_favoriteitem_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_bhv_favoriteitem_total` AS select `mec_bhv_favoriteitem`.`USERCODE` AS `USERCODE`,`mec_bhv_favoriteitem`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`PRICE` AS `PRICE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_bhv_favoriteitem`.`createdAt` AS `CREATETIME` from (((`mec_bhv_favoriteitem` join `mec_itm_item` on((`mec_bhv_favoriteitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `mec_vi_first_imgpreview` on((`mec_bhv_favoriteitem`.`ITEMCODE` = `mec_vi_first_imgpreview`.`ITEMCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_category_brand`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_category_brand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_category_brand` AS select `mec_itm_category_brand`.`ID` AS `ID`,`mec_itm_category_brand`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_category_brand`.`CATEGORYID` AS `CATEGORYID`,`mec_itm_category`.`CATEGORYNAME` AS `CATEGORYNAME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_brand`.`LOGO` AS `LOGO` from ((`mec_itm_category_brand` join `hct_brand` on((`mec_itm_category_brand`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `mec_itm_category` on((`mec_itm_category_brand`.`CATEGORYID` = `mec_itm_category`.`CATEGORYID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_category_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_category_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_category_sku_total` AS select `mec_itm_itemcategory`.`CATEGORYID` AS `CATEGORYID`,`mec_itm_category`.`CATEGORYNAME` AS `CATEGORYNAME`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from (((((((`mec_itm_itemcategory` join `mec_itm_item` on((`mec_itm_itemcategory`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_itm_category` on((`mec_itm_category`.`CATEGORYID` = `mec_itm_itemcategory`.`CATEGORYID`))) left join `hct_brand` on((`hct_brand`.`BRANDCODE` = `mec_itm_item`.`BRANDCODE`))) left join `hsy_itemtype` on((`hsy_itemtype`.`ITEMTYPECODE` = `mec_itm_item`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_category`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;


--
-- Final view structure for view `mec_vi_checkable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_checkable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_checkable_sku` AS select `mec_itm_item_tmp1`.`ID` AS `ID`,`mec_itm_item_tmp1`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item_tmp1`.`BARCODE` AS `BARCODE`,`mec_itm_item_tmp1`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item_tmp1`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item_tmp1`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item_tmp1`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item_tmp1`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item_tmp1`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item_tmp1`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item_tmp1`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item_tmp1`.`PRICE` AS `PRICE`,`mec_itm_item_tmp1`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item_tmp1`.`TAXRATE` AS `TAXRATE`,`mec_itm_item_tmp1`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item_tmp1`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item_tmp1`.`SALESTATE` AS `SALESTATE`,`mec_itm_item_tmp1`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item_tmp1`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item_tmp1`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item_tmp1`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item_tmp1`.`GRADE` AS `GRADE`,`mec_itm_item_tmp1`.`COLOR` AS `COLOR`,`mec_itm_item_tmp1`.`CASING` AS `CASING`,`mec_itm_item_tmp1`.`DIMENSION` AS `DIMENSION`,`mec_itm_item_tmp1`.`VOLUME` AS `VOLUME`,`mec_itm_item_tmp1`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item_tmp1`.`UNIT` AS `UNIT`,`mec_itm_item_tmp1`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item_tmp1`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item_tmp1`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item_tmp1`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item_tmp1`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item_tmp1`.`MAXORDER` AS `MAXORDER`,`mec_itm_item_tmp1`.`MINORDER` AS `MINORDER`,`mec_itm_item_tmp1`.`PROPERTY` AS `PROPERTY`,`mec_itm_item_tmp1`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item_tmp1`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item_tmp1`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item_tmp1`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item_tmp1`.`TERM` AS `TERM`,`mec_itm_item_tmp1`.`createdAt` AS `createdAt`,`mec_itm_item_tmp1`.`updatedAt` AS `updatedAt`,`mec_itm_item_tmp1`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item_tmp1`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item_tmp1`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item_tmp1`.`TMPSTATE` AS `TMPSTATE`,`mec_itm_item_tmp1`.`LASTOPERATEPERSON` AS `LASTOPERATEPERSON` from `mec_itm_item_tmp1` where (`mec_itm_item_tmp1`.`TMPSTATE` between 0 and 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_checkable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_checkable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_checkable_sku_total` AS select `mec_itm_item_tmp1`.`ID` AS `ID`,`mec_itm_item_tmp1`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item_tmp1`.`BARCODE` AS `BARCODE`,`mec_itm_item_tmp1`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item_tmp1`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item_tmp1`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item_tmp1`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item_tmp1`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item_tmp1`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item_tmp1`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item_tmp1`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item_tmp1`.`PRICE` AS `PRICE`,`mec_itm_item_tmp1`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item_tmp1`.`TAXRATE` AS `TAXRATE`,`mec_itm_item_tmp1`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item_tmp1`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item_tmp1`.`SALESTATE` AS `SALESTATE`,`mec_itm_item_tmp1`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item_tmp1`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item_tmp1`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item_tmp1`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item_tmp1`.`GRADE` AS `GRADE`,`mec_itm_item_tmp1`.`COLOR` AS `COLOR`,`mec_itm_item_tmp1`.`CASING` AS `CASING`,`mec_itm_item_tmp1`.`DIMENSION` AS `DIMENSION`,`mec_itm_item_tmp1`.`VOLUME` AS `VOLUME`,`mec_itm_item_tmp1`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item_tmp1`.`UNIT` AS `UNIT`,`mec_itm_item_tmp1`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item_tmp1`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item_tmp1`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item_tmp1`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item_tmp1`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item_tmp1`.`MAXORDER` AS `MAXORDER`,`mec_itm_item_tmp1`.`MINORDER` AS `MINORDER`,`mec_itm_item_tmp1`.`PROPERTY` AS `PROPERTY`,`mec_itm_item_tmp1`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item_tmp1`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item_tmp1`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item_tmp1`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item_tmp1`.`TERM` AS `TERM`,`mec_itm_item_tmp1`.`createdAt` AS `createdAt`,`mec_itm_item_tmp1`.`updatedAt` AS `updatedAt`,`mec_itm_item_tmp1`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item_tmp1`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item_tmp1`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item_tmp1`.`TMPSTATE` AS `TMPSTATE`,`mec_itm_item_tmp1`.`LASTOPERATEPERSON` AS `LASTOPERATEPERSON`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item_tmp1` left join `hct_brand` on((`mec_itm_item_tmp1`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item_tmp1`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item_tmp1`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item_tmp1`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item_tmp1`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where (`mec_itm_item_tmp1`.`TMPSTATE` between 0 and 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_counter_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_counter_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_counter_skc_stock` AS select `mec_vi_counter_skc_stock_raw`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_counter_skc_stock_raw`.`ITEMCODE` AS `ITEMCODE`,`mec_vi_counter_skc_stock_raw`.`SKCCODE` AS `SKCCODE`,`mec_vi_counter_skc_stock_raw`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_vi_counter_skc_stock_raw`.`SIZE` AS `SIZE`,`mec_vi_counter_skc_stock_raw`.`COLOR` AS `COLOR`,sum(`mec_vi_counter_skc_stock_raw`.`AMOUNT`) AS `AMOUNT` from `mec_vi_counter_skc_stock_raw` group by `mec_vi_counter_skc_stock_raw`.`COUNTERCODE`,`mec_vi_counter_skc_stock_raw`.`SKCCODE`,`mec_vi_counter_skc_stock_raw`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_counter_skc_stock_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_counter_skc_stock_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_counter_skc_stock_raw` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_storeitem`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_skc`.`SKCCODE` AS `SKCCODE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`COLOR` AS `COLOR`,0 AS `AMOUNT` from (`mec_itm_storeitem` join `mec_itm_skc` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_skc`.`ITEMCODE`))) where ((`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1)) union all select `mec_itm_stock`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_skc`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_skc`.`SKCCODE` AS `SKCCODE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_stock`.`AMOUNT` AS `AMOUNT` from (`mec_itm_stock` join `mec_itm_skc` on((`mec_itm_stock`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) where ((`mec_itm_stock`.`RECORDSTATE` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;



--
-- Final view structure for view `mec_vi_deletable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_deletable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_deletable_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE` from `mec_itm_item` where (`mec_itm_item`.`CHECKSTATE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_deletable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_deletable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_deletable_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where (`mec_itm_item`.`CHECKSTATE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_dept_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_dept_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_dept_skc_stock` AS select `mec_hct_counter`.`STORECODE` AS `DEPTCODE`,`mec_itm_stock`.`SKCCODE` AS `SKCCODE`,sum(`mec_itm_stock`.`AMOUNT`) AS `AMOUNT` from (`mec_itm_stock` join `mec_hct_counter` on((`mec_itm_stock`.`COUNTERCODE` = `mec_hct_counter`.`COUNTERCODE`))) where ((`mec_itm_stock`.`RECORDSTATE` = 1) and (`mec_hct_counter`.`CONTRACTSTATE` = 2)) group by `mec_itm_stock`.`SKCCODE`,`mec_hct_counter`.`STORECODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_dept_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_dept_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_dept_sku` AS select distinct `mec_itm_storeitem`.`ITEMCODE` AS `ITEMCODE`,`mec_hct_counter`.`STORECODE` AS `DEPTCODE` from (`mec_itm_storeitem` join `mec_hct_counter` on((`mec_itm_storeitem`.`COUNTERCODE` = `mec_hct_counter`.`COUNTERCODE`))) where ((`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_hct_counter`.`CONTRACTSTATE` = 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_first_imgpreview`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_first_imgpreview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_first_imgpreview` AS select `mec_itm_imgpreview`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_imgpreview`.`IMGURL` AS `IMGURL`,`mec_itm_imgpreview`.`createdAt` AS `createdAt`,`mec_itm_imgpreview`.`updatedAt` AS `updatedAt` from `mec_itm_imgpreview` group by `mec_itm_imgpreview`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_lgt_pickcounter_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_lgt_pickcounter_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_lgt_pickcounter_total` AS select `mec_buy_offlineorder`.`POSDEALNUM` AS `POSDEALNUM`,`mec_buy_offlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_offlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_offlineorder`.`PAYTIME` AS `PAYTIME`,`mec_buy_offlineorder`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_buy_offlineorder`.`PAYMENTSTATE` AS `PAYMENTSTATE`,`mec_lgt_pickcounter`.`ID` AS `ID`,`mec_lgt_pickcounter`.`ORDERCODE` AS `ORDERCODE`,`mec_lgt_pickcounter`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_lgt_pickcounter`.`COUNTERCODE` AS `COUNTERCODE`,`mec_lgt_pickcounter`.`PICKCODE` AS `PICKCODE`,`mec_lgt_pickcounter`.`PICKSTATE` AS `PICKSTATE`,`mec_lgt_pickcounter`.`OPERATEPERSON` AS `OPERATEPERSON`,`mec_lgt_pickcounter`.`updatedAt` AS `updatedAt`,`mec_lgt_pickcounter`.`createdAt` AS `createdAt` from (`mec_lgt_pickcounter` join `mec_buy_offlineorder` on((`mec_lgt_pickcounter`.`ORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) where (`mec_lgt_pickcounter`.`ISONLINEORDER` = 0) union all select `mec_buy_onlineorder`.`POSDEALNUM` AS `POSDEALNUM`,`mec_buy_onlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_onlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_onlineorder`.`PAYTIME` AS `PAYTIME`,`mec_buy_onlineorder`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_buy_onlineorder`.`PAYMENTSTATE` AS `PAYMENTSTATE`,`mec_lgt_pickcounter`.`ID` AS `ID`,`mec_lgt_pickcounter`.`ORDERCODE` AS `ORDERCODE`,`mec_lgt_pickcounter`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_lgt_pickcounter`.`COUNTERCODE` AS `COUNTERCODE`,`mec_lgt_pickcounter`.`PICKCODE` AS `PICKCODE`,`mec_lgt_pickcounter`.`PICKSTATE` AS `PICKSTATE`,`mec_lgt_pickcounter`.`OPERATEPERSON` AS `OPERATEPERSON`,`mec_lgt_pickcounter`.`updatedAt` AS `updatedAt`,`mec_lgt_pickcounter`.`createdAt` AS `createdAt` from (`mec_lgt_pickcounter` join `mec_buy_onlineorder` on((`mec_lgt_pickcounter`.`ORDERCODE` = `mec_buy_onlineorder`.`ONLINEORDERCODE`))) where (`mec_lgt_pickcounter`.`ISONLINEORDER` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_lgt_pickinfo_forapp`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_lgt_pickinfo_forapp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_lgt_pickinfo_forapp` AS select `mec_lgt_pickcounter`.`ORDERCODE` AS `ORDERCODE`,`mec_lgt_pickcounter`.`PICKCODE` AS `PICKCODE`,`mec_lgt_pickcounter`.`PICKSTATE` AS `PICKSTATE`,`mec_hct_counter`.`STORECODE` AS `DEPTCODE`,`mec_lgt_pickcounter`.`COUNTERCODE` AS `COUNTERCODE`,`mec_hct_counter`.`COUNTERNAME` AS `COUNTERNAME`,`mec_hct_counter`.`COUNTERLOCATIONCODE` AS `COUNTERLOCATIONCODE` from (`mec_lgt_pickcounter` join `mec_hct_counter` on((`mec_lgt_pickcounter`.`COUNTERCODE` = `mec_hct_counter`.`COUNTERCODE`))) where (`mec_hct_counter`.`CONTRACTSTATE` = 2) union all select `mec_lgt_pickdept`.`ORDERCODE` AS `ORDERCODE`,`mec_lgt_pickdept`.`PICKCODE` AS `PICKCODE`,`mec_lgt_pickdept`.`PICKSTATE` AS `PICKSTATE`,`mec_lgt_pickdept`.`DEPTCODE` AS `DEPTCODE`,NULL AS `COUNTERCODE`,NULL AS `COUNTERNAME`,NULL AS `COUNTERLOCATIONCODE` from `mec_lgt_pickdept` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_content`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_content`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_content` AS select `mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `OFFLINECONTENTCODE`,`mec_buy_offlinecontent`.`OFFLINEORDERCODE` AS `OFFLINEORDERCODE`,`mec_buy_offlinecontent`.`ITEMCODE` AS `ITEMCODE`,`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_offlinecontent`.`NUM` AS `NUM`,`mec_buy_offlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_buy_offlinecontent`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_buy_offlinecontent`.`createdAt` AS `createdAt`,`mec_buy_offlinecontent`.`updatedAt` AS `updatedAt`,`mec_buy_offlinecontent`.`FINALPRICELIST` AS `FINALPRICELIST`,`mec_buy_offlinecontent`.`FINALPRICELIST2` AS `FINALPRICELIST2`,`mec_buy_offlinecontent`.`FINALRULELIST` AS `FINALRULELIST`,`mec_buy_offlinecontent`.`FINALRULELIST2` AS `FINALRULELIST2`,`mec_buy_offlinecontent`.`RETAILAMT` AS `RETAILAMT`,`mec_buy_offlinecontent`.`RETAILAMT2` AS `RETAILAMT2`,`mec_buy_offlinecontent`.`REALVIPCARDTYPE` AS `REALVIPCARDTYPE`,`mec_buy_offlinecontent`.`REALVIPCARDTYPE2` AS `REALVIPCARDTYPE2`,`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` AS `REALVIPDISCOUNTRATE`,`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE2` AS `REALVIPDISCOUNTRATE2`,`mec_buy_offlinecontent`.`VIPDISCOUNTAMT` AS `VIPDISCOUNTAMT`,`mec_buy_offlinecontent`.`VIPDISCOUNTAMT2` AS `VIPDISCOUNTAMT2`,`mec_buy_offlinecontent`.`VIPFLOORAMT` AS `VIPFLOORAMT`,`mec_buy_offlinecontent`.`VIPFLOORAMT2` AS `VIPFLOORAMT2`,`mec_buy_offlinecontent`.`DISCOUNTOUTAMT` AS `DISCOUNTOUTAMT`,`mec_buy_offlinecontent`.`DISCOUNTOUTAMT2` AS `DISCOUNTOUTAMT2`,`mec_buy_offlinecontent`.`DISCOUNTINAMT` AS `DISCOUNTINAMT`,`mec_buy_offlinecontent`.`DISCOUNTINAMT2` AS `DISCOUNTINAMT2`,`mec_buy_offlinecontent`.`PRESENTSHAREQTY` AS `PRESENTSHAREQTY`,`mec_buy_offlinecontent`.`PRESENTSHAREQTY2` AS `PRESENTSHAREQTY2`,`mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT` AS `MERCHANTDISCOUTAMT`,`mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT2` AS `MERCHANTDISCOUTAMT2`,`mec_buy_offlinecontent`.`SHIPPRICECHARGESHARE` AS `SHIPPRICECHARGESHARE`,`mec_buy_offlinecontent`.`SHIPPRICECHARGESHARE2` AS `SHIPPRICECHARGESHARE2`,`mec_buy_offlinecontent`.`PACKINGCHARGESHARE` AS `PACKINGCHARGESHARE`,`mec_buy_offlinecontent`.`PACKINGCHARGESHARE2` AS `PACKINGCHARGESHARE2`,`mec_buy_offlinecontent`.`CASHPAYSHARE` AS `CASHPAYSHARE`,`mec_buy_offlinecontent`.`CREDITPAYSHARE` AS `CREDITPAYSHARE`,`mec_buy_offlinecontent`.`CASHCOUPONPAYSHARE` AS `CASHCOUPONPAYSHARE`,`mec_buy_offlinecontent`.`GOODSCOUPONPAYSHARE` AS `GOODSCOUPONPAYSHARE`,`mec_buy_offlinecontent`.`ECARDPAYSHARE` AS `ECARDPAYSHARE`,`mec_buy_offlinecontent`.`OTHERPAYSHARE` AS `OTHERPAYSHARE`,`mec_buy_offlinecontent`.`PREMIUMPAYSHARE` AS `PREMIUMPAYSHARE`,`mec_buy_offlinecontent`.`ORIGINCONTENTCODE` AS `ORIGINCONTENTCODE`,`mec_buy_offlinecontent`.`IFRETURN` AS `IFRETURN`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA` from ((`mec_buy_offlinecontent` join `mec_itm_item` on((`mec_buy_offlinecontent`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_itm_skc` on((`mec_buy_offlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) where (`mec_itm_item`.`CHECKSTATE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_content_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_content_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_content_total` AS select `mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `OFFLINECONTENTCODE`,`mec_buy_offlinecontent`.`OFFLINEORDERCODE` AS `OFFLINEORDERCODE`,`mec_buy_offlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_offlinecontent`.`ITEMCODE` AS `ITEMCODE`,`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_offlinecontent`.`NUM` AS `NUM`,`mec_buy_offlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_buy_offlinecontent`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_buy_offlinecontent`.`createdAt` AS `createdAt`,`mec_buy_offlinecontent`.`updatedAt` AS `updatedAt`,`mec_buy_offlinecontent`.`FINALPRICELIST` AS `FINALPRICELIST`,`mec_buy_offlinecontent`.`FINALPRICELIST2` AS `FINALPRICELIST2`,`mec_buy_offlinecontent`.`FINALRULELIST` AS `FINALRULELIST`,`mec_buy_offlinecontent`.`FINALRULELIST2` AS `FINALRULELIST2`,`mec_buy_offlinecontent`.`RETAILAMT` AS `RETAILAMT`,`mec_buy_offlinecontent`.`RETAILAMT2` AS `RETAILAMT2`,`mec_buy_offlinecontent`.`REALVIPCARDTYPE` AS `REALVIPCARDTYPE`,`mec_buy_offlinecontent`.`REALVIPCARDTYPE2` AS `REALVIPCARDTYPE2`,`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` AS `REALVIPDISCOUNTRATE`,`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE2` AS `REALVIPDISCOUNTRATE2`,`mec_buy_offlinecontent`.`VIPDISCOUNTAMT` AS `VIPDISCOUNTAMT`,`mec_buy_offlinecontent`.`VIPDISCOUNTAMT2` AS `VIPDISCOUNTAMT2`,`mec_buy_offlinecontent`.`VIPFLOORAMT` AS `VIPFLOORAMT`,`mec_buy_offlinecontent`.`VIPFLOORAMT2` AS `VIPFLOORAMT2`,`mec_buy_offlinecontent`.`DISCOUNTOUTAMT` AS `DISCOUNTOUTAMT`,`mec_buy_offlinecontent`.`DISCOUNTOUTAMT2` AS `DISCOUNTOUTAMT2`,`mec_buy_offlinecontent`.`DISCOUNTINAMT` AS `DISCOUNTINAMT`,`mec_buy_offlinecontent`.`DISCOUNTINAMT2` AS `DISCOUNTINAMT2`,`mec_buy_offlinecontent`.`PRESENTSHAREQTY` AS `PRESENTSHAREQTY`,`mec_buy_offlinecontent`.`PRESENTSHAREQTY2` AS `PRESENTSHAREQTY2`,`mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT` AS `MERCHANTDISCOUTAMT`,`mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT2` AS `MERCHANTDISCOUTAMT2`,`mec_buy_offlinecontent`.`HANDAMT` AS `HANDAMT`,`mec_buy_offlinecontent`.`HANDAMT2` AS `HANDAMT2`,`mec_buy_offlinecontent`.`SHIPPRICECHARGESHARE` AS `SHIPPRICECHARGESHARE`,`mec_buy_offlinecontent`.`SHIPPRICECHARGESHARE2` AS `SHIPPRICECHARGESHARE2`,`mec_buy_offlinecontent`.`PACKINGCHARGESHARE` AS `PACKINGCHARGESHARE`,`mec_buy_offlinecontent`.`PACKINGCHARGESHARE2` AS `PACKINGCHARGESHARE2`,`mec_buy_offlinecontent`.`CASHPAYSHARE` AS `CASHPAYSHARE`,`mec_buy_offlinecontent`.`CREDITPAYSHARE` AS `CREDITPAYSHARE`,`mec_buy_offlinecontent`.`CASHCOUPONPAYSHARE` AS `CASHCOUPONPAYSHARE`,`mec_buy_offlinecontent`.`GOODSCOUPONPAYSHARE` AS `GOODSCOUPONPAYSHARE`,`mec_buy_offlinecontent`.`ECARDPAYSHARE` AS `ECARDPAYSHARE`,`mec_buy_offlinecontent`.`OTHERPAYSHARE` AS `OTHERPAYSHARE`,`mec_buy_offlinecontent`.`PREMIUMPAYSHARE` AS `PREMIUMPAYSHARE`,`mec_buy_offlinecontent`.`ORIGINORDERCODE` AS `ORIGINORDERCODE`,`mec_buy_offlinecontent`.`ORIGINCONTENTCODE` AS `ORIGINCONTENTCODE`,`mec_buy_offlinecontent`.`IFRETURN` AS `IFRETURN`,`mec_buy_offlinecontent`.`TEMPDISTRIBUTIONMARK` AS `TEMPDISTRIBUTIONMARK`,`mec_buy_offlineorder`.`SALESMANCODE` AS `SALESMANCODE`,`mec_hsy_salesman`.`SALESMANNAME` AS `SALESMANNAME`,`mec_itm_storeitem`.`MEMBERPRICE` AS `MEMBERPRICE`,`mec_itm_storeitem`.`STORECHECKEDPRICE` AS `STORECHECKEDPRICE`,`mec_itm_storeitem`.`STORETEMPPRICE` AS `STORETEMPPRICE`,`mec_itm_storeitem`.`DISCOUNTMARK` AS `DISCOUNTMARK`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from ((((((((((`mec_buy_offlinecontent` left join `mec_buy_offlineorder` on((`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) left join `mec_itm_item` on((`mec_buy_offlinecontent`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_itm_storeitem` on(((`mec_itm_storeitem`.`COUNTERCODE` = `mec_buy_offlinecontent`.`COUNTERCODE`) and (`mec_itm_storeitem`.`ITEMCODE` = `mec_buy_offlinecontent`.`ITEMCODE`)))) left join `mec_itm_skc` on((`mec_buy_offlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_hsy_salesman` on((`mec_hsy_salesman`.`SALESMANCODE` = `mec_buy_offlineorder`.`SALESMANCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_hasstock_counter_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_counter_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_hasstock_counter_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE` from (`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` in (1,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_hasstock_counter_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_counter_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_hasstock_counter_sku_total` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_storeitem`.`MEMBERPRICE` AS `MEMBERPRICE`,`mec_itm_storeitem`.`STORECHECKEDPRICE` AS `STORECHECKEDPRICE`,`mec_itm_storeitem`.`STORETEMPPRICE` AS `STORETEMPPRICE`,`mec_itm_storeitem`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_itm_storeitem`.`DISCOUNTMARK` AS `DISCOUNTMARK`,`mec_itm_storeitem`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_storeitem`.`BUFFER` AS `BUFFER`,`mec_itm_storeitem`.`SALESMANCODE` AS `SALESMANCODE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from ((((((`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` in (1,3)) and (`mec_itm_storeitem`.`STORESALESTATE` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_hasstock_selling_counter_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_counter_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_hasstock_selling_counter_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE` from (`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` in (1,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_hasstock_selling_counter_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_counter_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_hasstock_selling_counter_sku_total` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_storeitem`.`MEMBERPRICE` AS `MEMBERPRICE`,`mec_itm_storeitem`.`STORECHECKEDPRICE` AS `STORECHECKEDPRICE`,`mec_itm_storeitem`.`STORETEMPPRICE` AS `STORETEMPPRICE`,`mec_itm_storeitem`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_itm_storeitem`.`DISCOUNTMARK` AS `DISCOUNTMARK`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from ((((((`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` in (1,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_hasstock_selling_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_hasstock_selling_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE` from `mec_itm_item` where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_hasstock_selling_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_hasstock_selling_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_hasstock_selling_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_nostock_selling_counter_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_counter_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_nostock_selling_counter_sku` AS select `mec_itm_storeitem`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE` from (`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_nostock_selling_counter_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_counter_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_nostock_selling_counter_sku_total` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_storeitem`.`MEMBERPRICE` AS `MEMBERPRICE`,`mec_itm_storeitem`.`STORECHECKEDPRICE` AS `STORECHECKEDPRICE`,`mec_itm_storeitem`.`STORETEMPPRICE` AS `STORETEMPPRICE`,`mec_itm_storeitem`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_itm_storeitem`.`DISCOUNTMARK` AS `DISCOUNTMARK`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from ((((((`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_nostock_selling_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_nostock_selling_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE` from `mec_itm_item` where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_nostock_selling_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_nostock_selling_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_nostock_selling_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_order_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_order_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_order_total` AS select `mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `OFFLINEORDERCODE`,`mec_buy_offlineorder`.`OFFLINEGROUPCODE` AS `OFFLINEGROUPCODE`,`mec_buy_offlineorder`.`TEMPDISTRIBUTIONMARK` AS `TEMPDISTRIBUTIONMARK`,`mec_buy_offlineorder`.`USERCODE` AS `USERCODE`,`mec_buy_offlineorder`.`ORDERSTATE` AS `ORDERSTATE`,`mec_buy_offlineorder`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_buy_offlineorder`.`DELIVERYMODE` AS `DELIVERYMODE`,`mec_buy_offlineorder`.`SITEID` AS `SITEID`,`mec_buy_offlineorder`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_offlineorder`.`STORECODE` AS `STORECODE`,`mec_buy_offlineorder`.`SHIPPRICE` AS `SHIPPRICE`,`mec_buy_offlineorder`.`REALSHIPPRICE` AS `REALSHIPPRICE`,`mec_buy_offlineorder`.`PACKING` AS `PACKING`,`mec_buy_offlineorder`.`REALPACKING` AS `REALPACKING`,`mec_buy_offlineorder`.`SALESMANCODE` AS `SALESMANCODE`,`mec_buy_offlineorder`.`createdAt` AS `createdAt`,`mec_buy_offlineorder`.`updatedAt` AS `updatedAt`,`mec_buy_offlineorder`.`FINALPRICE` AS `FINALPRICE`,`mec_buy_offlineorder`.`FINALRULESTRING` AS `FINALRULESTRING`,`mec_buy_offlineorder`.`FINALPRICE2` AS `FINALPRICE2`,`mec_buy_offlineorder`.`FINALRULESTRING2` AS `FINALRULESTRING2`,`mec_buy_offlineorder`.`TRANSID` AS `TRANSID`,`mec_buy_offlineorder`.`CHRCODE` AS `CHRCODE`,`mec_buy_offlineorder`.`VIPCARDNO` AS `VIPCARDNO`,`mec_buy_offlineorder`.`VIPCARDNO2` AS `VIPCARDNO2`,`mec_buy_offlineorder`.`VIPCODE` AS `VIPCODE`,`mec_buy_offlineorder`.`VIPCODE2` AS `VIPCODE2`,`mec_buy_offlineorder`.`VIPCARDTYPE` AS `VIPCARDTYPE`,`mec_buy_offlineorder`.`VIPCARDTYPE2` AS `VIPCARDTYPE2`,`mec_buy_offlineorder`.`VIPDISCOUNTRATE` AS `VIPDISCOUNTRATE`,`mec_buy_offlineorder`.`VIPDISCOUNTRATE2` AS `VIPDISCOUNTRATE2`,`mec_buy_offlineorder`.`RECEIVABLEAMT` AS `RECEIVABLEAMT`,`mec_buy_offlineorder`.`RECEIVABLEAMT2` AS `RECEIVABLEAMT2`,`mec_buy_offlineorder`.`PAYMENTSTATE` AS `PAYMENTSTATE`,`mec_buy_offlineorder`.`PAYLOCAL` AS `PAYLOCAL`,`mec_buy_offlineorder`.`POSDEALNUM` AS `POSDEALNUM`,`mec_buy_offlineorder`.`POSCODE` AS `POSCODE`,`mec_buy_offlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_offlineorder`.`CASHIER` AS `CASHIER`,`mec_buy_offlineorder`.`TIMEOUTTIME` AS `TIMEOUTTIME`,`mec_buy_offlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_offlineorder`.`AUDITTIME` AS `AUDITTIME`,`mec_buy_offlineorder`.`PAYTIME` AS `PAYTIME`,`mec_buy_offlineorder`.`OUTTIME` AS `OUTTIME`,`mec_buy_offlineorder`.`RECEIVABLETIME` AS `RECEIVABLETIME`,`mec_buy_offlineorder`.`FINISHTIME` AS `FINISHTIME`,`mec_buy_offlineorder`.`IFRETURN` AS `IFRETURN`,`mec_buy_offlineorder`.`RETUSERCODE` AS `RETUSERCODE`,`mec_buy_offlineorder`.`createdAt` AS `TIME`,`mec_hct_counter`.`STORECODE` AS `DEPTCODE`,`mec_ctm_site`.`PERSON` AS `PERSON`,`mec_ctm_site`.`TELEPHONE` AS `TELEPHONE`,`mec_ctm_site`.`PROVINCE` AS `PROVINCE`,`mec_ctm_site`.`CITY` AS `CITY`,`mec_ctm_site`.`DISTRICT` AS `DISTRICT`,`mec_ctm_site`.`DETAIL` AS `DETAIL`,`mec_ctm_site`.`POSTCODE` AS `POSTCODE` from ((`mec_buy_offlineorder` left join `mec_ctm_site` on((`mec_buy_offlineorder`.`SITEID` = `mec_ctm_site`.`SITEID`))) left join `mec_hct_counter` on((`mec_hct_counter`.`COUNTERCODE` = `mec_buy_offlineorder`.`COUNTERCODE`))) where (`mec_hct_counter`.`CONTRACTSTATE` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_selling_counter_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_counter_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_selling_counter_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE` from (`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and ((`mec_itm_item`.`ISCONSIDERSTOCK` = 0) or ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` in (1,3))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_selling_counter_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_counter_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_selling_counter_sku_total` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_storeitem`.`MEMBERPRICE` AS `MEMBERPRICE`,`mec_itm_storeitem`.`STORECHECKEDPRICE` AS `STORECHECKEDPRICE`,`mec_itm_storeitem`.`STORETEMPPRICE` AS `STORETEMPPRICE`,`mec_itm_storeitem`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_itm_storeitem`.`DISCOUNTMARK` AS `DISCOUNTMARK`,`mec_itm_storeitem`.`ONLINESTATE` AS `ONLINESTATE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from ((((((`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and ((`mec_itm_item`.`ISCONSIDERSTOCK` = 0) or ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` in (1,3)))) and (`mec_itm_storeitem`.`STORESALESTATE` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_selling_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_selling_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE` from `mec_itm_item` where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_offline_selling_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_offline_selling_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_offline_selling_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_checkable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_checkable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_checkable_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE` from `mec_itm_item` where ((`mec_itm_item`.`ISALLOWONLINE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_checkable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_checkable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_checkable_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`ISALLOWONLINE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_forassistant`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forassistant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_forassistant` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME` from ((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_forcustomer`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forcustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_forcustomer` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,sum(`mec_buy_onlinecontent`.`NUM`) AS `NUM`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME` from ((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) group by `mec_buy_onlinecontent`.`ONLINEORDERCODE`,`mec_buy_onlinecontent`.`SKCCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_forpick`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forpick`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_forpick` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`PRICE` AS `PRICE` from ((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_forpos`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_forpos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_forpos` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`PRICE` AS `PRICE` from ((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_total_forassistant`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forassistant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_total_forassistant` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from (((((((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_total_forcustomer`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forcustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_total_forcustomer` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,sum(`mec_buy_onlinecontent`.`NUM`) AS `NUM`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from (((((((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) group by `mec_buy_onlinecontent`.`ONLINEORDERCODE`,`mec_buy_onlinecontent`.`SKCCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_total_forpick`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forpick`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_total_forpick` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`PRICE` AS `PRICE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from (((((((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_content_total_forpos`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_content_total_forpos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_content_total_forpos` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `ONLINECONTENTCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_buy_onlinecontent`.`SALESMANCODE` AS `SALESMANCODE`,`mec_hsy_salesman`.`SALESMANNAME` AS `SALESMANNAME`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from ((((((((`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_hsy_salesman` on((`mec_hsy_salesman`.`SALESMANCODE` = `mec_buy_onlinecontent`.`SALESMANCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_counter_dept_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_counter_dept_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_counter_dept_skc_stock` AS select `mec_hct_counter`.`STORECODE` AS `DEPTCODE`,`mec_vi_online_counter_skc_stock`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_online_counter_skc_stock`.`SKCCODE` AS `SKCCODE`,`mec_vi_online_counter_skc_stock`.`AMOUNT` AS `AMOUNT` from (`mec_vi_online_counter_skc_stock` join `mec_hct_counter` on((`mec_vi_online_counter_skc_stock`.`COUNTERCODE` = `mec_hct_counter`.`COUNTERCODE`))) where (`mec_hct_counter`.`CONTRACTSTATE` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_counter_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_counter_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_counter_skc_stock` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_skc`.`SKCCODE` AS `SKCCODE`,`mec_itm_stock`.`AMOUNT` AS `AMOUNT` from (((`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) join `mec_itm_skc` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) join `mec_itm_stock` on(((`mec_itm_stock`.`COUNTERCODE` = `mec_itm_storeitem`.`COUNTERCODE`) and (`mec_itm_stock`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`)))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`ONLINESTATE` = 1) and (`mec_itm_stock`.`RECORDSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_dept_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_dept_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_dept_skc_stock` AS select `mec_hct_counter`.`STORECODE` AS `DEPTCODE`,`mec_vi_online_counter_skc_stock`.`SKCCODE` AS `SKCCODE`,sum(`mec_vi_online_counter_skc_stock`.`AMOUNT`) AS `AMOUNT` from (`mec_vi_online_counter_skc_stock` join `mec_hct_counter` on((`mec_vi_online_counter_skc_stock`.`COUNTERCODE` = `mec_hct_counter`.`COUNTERCODE`))) where (`mec_hct_counter`.`CONTRACTSTATE` = 2) group by `mec_hct_counter`.`STORECODE`,`mec_vi_online_counter_skc_stock`.`SKCCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_order_total_forassistant`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_order_total_forassistant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_order_total_forassistant` AS select `mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`ONLINECOUNTERCODE` AS `ONLINECOUNTERCODE`,`mec_buy_onlinecontent`.`CONFIRMSTATE` AS `CONFIRMSTATE`,`mec_buy_onlinecontent`.`CONFIRMTIME` AS `CONFIRMTIME`,`mec_buy_onlinecontent`.`SALESMANCODE` AS `SALESMANCODE`,`mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlineorder`.`RECEIVABLEAMT` AS `RECEIVABLEAMT`,`mec_buy_onlineorder`.`DELIVERYDEPTCODE` AS `DELIVERYDEPTCODE`,`mec_buy_onlineorder`.`DELIVERYMODE` AS `DELIVERYMODE`,`mec_buy_onlineorder`.`FINALPRICE` AS `FINALPRICE`,`mec_buy_onlineorder`.`FINALRULESTRING` AS `FINALRULESTRING`,`mec_buy_onlineorder`.`NOTE` AS `NOTE`,`mec_buy_onlineorder`.`ORDERSTATE` AS `ORDERSTATE`,`mec_buy_onlineorder`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_buy_onlineorder`.`SITEID` AS `SITEID`,`mec_buy_onlineorder`.`USERCODE` AS `USERCODE`,`mec_buy_onlineorder`.`createdAt` AS `TIME`,`mec_buy_onlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_onlineorder`.`PAYTIME` AS `PAYTIME`,`mec_buy_onlineorder`.`IFRETURN` AS `IFRETURN`,`mec_buy_onlineorder`.`VIPCARDNO` AS `VIPCARDNO`,`mec_ctm_customer`.`TELEPHONE` AS `TELEPHONE`,`mec_ctm_customer`.`NAME` AS `NAME` from ((`mec_buy_onlinecontent` join `mec_buy_onlineorder` on((`mec_buy_onlinecontent`.`ONLINEORDERCODE` = `mec_buy_onlineorder`.`ONLINEORDERCODE`))) left join `mec_ctm_customer` on((`mec_ctm_customer`.`USERCODE` = `mec_buy_onlineorder`.`USERCODE`))) group by `mec_buy_onlinecontent`.`ONLINEORDERCODE`,`mec_buy_onlinecontent`.`COUNTERCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_order_total_forcustomer`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_order_total_forcustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_order_total_forcustomer` AS select `mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ONLINEORDERCODE`,`mec_buy_onlineorder`.`DELIVERYDEPTCODE` AS `DELIVERYDEPTCODE`,`mec_buy_onlineorder`.`DELIVERYMODE` AS `DELIVERYMODE`,`mec_buy_onlineorder`.`FINALPRICE` AS `FINALPRICE`,`mec_buy_onlineorder`.`FINALRULESTRING` AS `FINALRULESTRING`,`mec_buy_onlineorder`.`NOTE` AS `NOTE`,`mec_buy_onlineorder`.`ORDERSTATE` AS `ORDERSTATE`,`mec_buy_onlineorder`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_buy_onlineorder`.`SITEID` AS `SITEID`,`mec_buy_onlineorder`.`USERCODE` AS `USERCODE`,`mec_buy_onlineorder`.`createdAt` AS `TIME`,`mec_ctm_site`.`PERSON` AS `PERSON`,`mec_ctm_site`.`TELEPHONE` AS `TELEPHONE`,`mec_ctm_site`.`PROVINCE` AS `PROVINCE`,`mec_ctm_site`.`CITY` AS `CITY`,`mec_ctm_site`.`DISTRICT` AS `DISTRICT`,`mec_ctm_site`.`DETAIL` AS `DETAIL`,`mec_ctm_site`.`POSTCODE` AS `POSTCODE` from (`mec_buy_onlineorder` left join `mec_ctm_site` on((`mec_buy_onlineorder`.`SITEID` = `mec_ctm_site`.`SITEID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_prepared_counter_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_prepared_counter_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_prepared_counter_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_stock`.`COUNTERCODE` AS `COUNTERCODE`,`mec_hct_counter`.`STORECODE` AS `DEPTCODE`,`mec_itm_storeitem`.`ONLINESTATE` AS `ONLINESTATE` from ((((`mec_itm_stock` join `mec_itm_skc` on((`mec_itm_stock`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) join `mec_hct_counter` on((`mec_itm_stock`.`COUNTERCODE` = `mec_hct_counter`.`COUNTERCODE`))) join `mec_itm_storeitem` on(((`mec_itm_storeitem`.`COUNTERCODE` = `mec_itm_stock`.`COUNTERCODE`) and (`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`)))) where ((`mec_itm_stock`.`RECORDSTATE` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` between 2 and 3) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_hct_counter`.`CONTRACTSTATE` = 2)) group by `mec_itm_item`.`ITEMCODE`,`mec_itm_stock`.`COUNTERCODE`,`mec_hct_counter`.`STORECODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_prepared_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_prepared_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_prepared_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE` from `mec_itm_item` where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_prepared_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_prepared_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_prepared_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`mec_itm_item`.`SELLINGSTATE` AS `SELLINGSTATE`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from ((((((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_renewable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_renewable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_renewable_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE` from `mec_itm_item` where ((`mec_itm_item`.`ISALLOWONLINE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` between 1 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_renewable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_renewable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_renewable_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`ISALLOWONLINE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` between 1 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_selling_counter_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_counter_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_selling_counter_sku` AS select `mec_itm_storeitem`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE` from (`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 3) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`ONLINESTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_selling_counter_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_counter_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_selling_counter_sku_total` AS select `mec_itm_storeitem`.`COUNTERCODE` AS `COUNTERCODE`,`mec_itm_storeitem`.`MEMBERPRICE` AS `MEMBERPRICE`,`mec_itm_storeitem`.`STORECHECKEDPRICE` AS `STORECHECKEDPRICE`,`mec_itm_storeitem`.`STORETEMPPRICE` AS `STORETEMPPRICE`,`mec_itm_storeitem`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_itm_storeitem`.`DISCOUNTMARK` AS `DISCOUNTMARK`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from (((((((((`mec_itm_storeitem` join `mec_itm_item` on((`mec_itm_storeitem`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 3) and (`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`ONLINESTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_selling_skc_forapp`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_skc_forapp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_selling_skc_forapp` AS select `mec_itm_skc`.`SKCCODE` AS `SKCCODE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES`,`mec_itm_item`.`createdAt` AS `createdAt`,greatest(`mec_itm_item`.`updatedAt`,`mec_vi_first_imgpreview`.`updatedAt`,`mec_vi_sku_categorynames`.`updatedAt`,`mec_vi_sku_regionnames`.`updatedAt`) AS `updatedAt`,`mec_vi_online_skc_stock`.`AMOUNT` AS `AMOUNT` from (((((((`mec_itm_skc` join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_online_skc_stock` on((`mec_vi_online_skc_stock`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 3) and (`mec_itm_skc`.`RECORDSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_selling_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_selling_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE` from `mec_itm_item` where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_selling_sku_forapp`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_sku_forapp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_selling_sku_forapp` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES`,`mec_itm_item`.`createdAt` AS `createdAt`,greatest(`mec_itm_item`.`updatedAt`,`mec_vi_first_imgpreview`.`updatedAt`,`mec_vi_sku_categorynames`.`updatedAt`,`mec_vi_sku_regionnames`.`updatedAt`) AS `updatedAt` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_selling_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_selling_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_selling_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from ((((((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SELLINGSTATE` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_skc_stock` AS select `mec_vi_online_counter_skc_stock`.`SKCCODE` AS `SKCCODE`,sum(`mec_vi_online_counter_skc_stock`.`AMOUNT`) AS `AMOUNT` from `mec_vi_online_counter_skc_stock` group by `mec_vi_online_counter_skc_stock`.`SKCCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_uninitial_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_uninitial_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_uninitial_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE` from `mec_itm_item` where ((`mec_itm_item`.`ISALLOWONLINE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_online_uninitial_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_online_uninitial_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_online_uninitial_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`ISALLOWONLINE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`ONLINECHECKSTATE` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_order_counter_userbuy`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_order_counter_userbuy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_order_counter_userbuy` AS select `mec_vi_offline_order_total`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_offline_order_total`.`SALESMANCODE` AS `SALESMANCODE`,`mec_vi_offline_order_total`.`RECEIVABLEAMT` AS `RECEIVABLEAMT`,`mec_vi_offline_order_total`.`RECEIVABLEAMT2` AS `RECEIVABLEAMT2`,`mec_vi_offline_order_total`.`DELIVERYMODE` AS `DELIVERYMODE`,`mec_vi_offline_order_total`.`OFFLINEORDERCODE` AS `ORDERCODE`,`mec_vi_offline_order_total`.`ORDERSTATE` AS `ORDERSTATE`,`mec_vi_offline_order_total`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_vi_offline_order_total`.`PAYTIME` AS `PAYTIME`,`mec_vi_offline_order_total`.`PLACETIME` AS `PLACETIME`,`mec_vi_offline_order_total`.`VIPCARDNO` AS `VIPCARDNO`,`mec_ctm_customer`.`USERCODE` AS `USERCODE`,`mec_ctm_customer`.`TELEPHONE` AS `TELEPHONE`,`mec_ctm_customer`.`VIPCODE` AS `VIPCODE` from (`mec_vi_offline_order_total` join `mec_ctm_customer` on((`mec_vi_offline_order_total`.`USERCODE` = `mec_ctm_customer`.`USERCODE`))) where ((`mec_vi_offline_order_total`.`IFRETURN` = 0) and (`mec_vi_offline_order_total`.`ORDERSTATE` between 0 and 8)) union all select `mec_vi_online_order_total_forassistant`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_online_order_total_forassistant`.`SALESMANCODE` AS `SALESMANCODE`,`mec_vi_online_order_total_forassistant`.`RECEIVABLEAMT` AS `RECEIVABLEAMT`,NULL AS `RECEIVABLEAMT2`,`mec_vi_online_order_total_forassistant`.`DELIVERYMODE` AS `DELIVERYMODE`,`mec_vi_online_order_total_forassistant`.`ONLINEORDERCODE` AS `ORDERCODE`,`mec_vi_online_order_total_forassistant`.`ORDERSTATE` AS `ORDERSTATE`,`mec_vi_online_order_total_forassistant`.`PAYMENTMODE` AS `PAYMENTMODE`,`mec_vi_online_order_total_forassistant`.`PAYTIME` AS `PAYTIME`,`mec_vi_online_order_total_forassistant`.`PLACETIME` AS `PLACETIME`,`mec_vi_online_order_total_forassistant`.`VIPCARDNO` AS `VIPCARDNO`,`mec_ctm_customer`.`USERCODE` AS `USERCODE`,`mec_ctm_customer`.`TELEPHONE` AS `TELEPHONE`,`mec_ctm_customer`.`VIPCODE` AS `VIPCODE` from (`mec_vi_online_order_total_forassistant` join `mec_ctm_customer` on((`mec_vi_online_order_total_forassistant`.`USERCODE` = `mec_ctm_customer`.`USERCODE`))) where ((`mec_vi_online_order_total_forassistant`.`IFRETURN` = 0) and (`mec_vi_online_order_total_forassistant`.`ORDERSTATE` between 0 and 8)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_order_tags`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_order_tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_order_tags` AS select `mec_buy_offlineorder`.`STORECODE` AS `STORECODE`,`mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ORDERCODE`,`mec_buy_offlineorder`.`IFRETURN` AS `IFRETURN`,0 AS `ISONLINEORDER` from `mec_buy_offlineorder` union all select `mec_buy_onlineorder`.`STORECODE` AS `STORECODE`,`mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ORDERCODE`,`mec_buy_onlineorder`.`IFRETURN` AS `IFRETURN`,1 AS `ISONLINEORDER` from `mec_buy_onlineorder` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_package_item`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_package_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_package_item` AS select `mec_vi_package_item_raw`.`ORDERCODE` AS `ORDERCODE`,`mec_vi_package_item_raw`.`PACKAGECODE` AS `PACKAGECODE`,`mec_vi_package_item_raw`.`CONTENTCODE` AS `CONTENTCODE`,`mec_vi_package_item_raw`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_vi_package_item_raw`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_package_item_raw`.`NUM` AS `NUM`,`mec_vi_package_item_raw`.`SKCCODE` AS `SKCCODE`,`mec_vi_package_item_raw`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA` from ((`mec_vi_package_item_raw` join `mec_itm_item` on((`mec_itm_item`.`ITEMCODE` = `mec_vi_package_item_raw`.`ITEMCODE`))) left join `mec_itm_skc` on((`mec_vi_package_item_raw`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_package_item_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_package_item_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_package_item_raw` AS select `mec_buy_onlinecontent`.`ONLINEORDERCODE` AS `ORDERCODE`,`mec_lgt_packagecontent`.`PACKAGECODE` AS `PACKAGECODE`,`mec_lgt_packagecontent`.`CONTENTCODE` AS `CONTENTCODE`,`mec_lgt_packagecontent`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_onlinecontent`.`NUM` AS `NUM`,`mec_buy_onlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_itm_skc`.`ITEMCODE` AS `ITEMCODE` from ((`mec_lgt_packagecontent` join `mec_buy_onlinecontent` on((`mec_lgt_packagecontent`.`CONTENTCODE` = `mec_buy_onlinecontent`.`ONLINECONTENTCODE`))) join `mec_itm_skc` on((`mec_itm_skc`.`SKCCODE` = `mec_buy_onlinecontent`.`SKCCODE`))) where ((`mec_lgt_packagecontent`.`ISONLINEORDER` = 1) and (`mec_itm_skc`.`RECORDSTATE` = 1)) union all select `mec_buy_offlinecontent`.`OFFLINEORDERCODE` AS `ORDERCODE`,`mec_lgt_packagecontent`.`PACKAGECODE` AS `PACKAGECODE`,`mec_lgt_packagecontent`.`CONTENTCODE` AS `CONTENTCODE`,`mec_lgt_packagecontent`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_buy_offlineorder`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_offlinecontent`.`NUM` AS `NUM`,`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_offlinecontent`.`ITEMCODE` AS `ITEMCODE` from ((`mec_lgt_packagecontent` join `mec_buy_offlinecontent` on((`mec_lgt_packagecontent`.`CONTENTCODE` = `mec_buy_offlinecontent`.`OFFLINECONTENTCODE`))) join `mec_buy_offlineorder` on((`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) where (`mec_lgt_packagecontent`.`ISONLINEORDER` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_package_item_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_package_item_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_package_item_total` AS select `mec_vi_package_item_raw`.`ORDERCODE` AS `ORDERCODE`,`mec_vi_package_item_raw`.`PACKAGECODE` AS `PACKAGECODE`,`mec_vi_package_item_raw`.`CONTENTCODE` AS `CONTENTCODE`,`mec_vi_package_item_raw`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_vi_package_item_raw`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_package_item_raw`.`NUM` AS `NUM`,`mec_vi_package_item_raw`.`SKCCODE` AS `SKCCODE`,`mec_vi_package_item_raw`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME` from ((((`mec_vi_package_item_raw` join `mec_itm_item` on((`mec_itm_item`.`ITEMCODE` = `mec_vi_package_item_raw`.`ITEMCODE`))) left join `mec_itm_skc` on((`mec_vi_package_item_raw`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_paid_chargeinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_chargeinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_paid_chargeinfo` AS select (case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 2) then `mec_buy_offlineorder`.`OFFLINEGROUPCODE` else `mec_audit_charge`.`ORDERCODE` end) AS `orderorgroupcode`,`mec_audit_charge`.`ORDERCODE` AS `ordercode`,`mec_audit_charge`.`CHARGEID` AS `listid`,`mec_audit_charge`.`CHARGECODE` AS `chargecode`,`mec_audit_charge`.`AMT` AS `amt` from (`mec_audit_charge` left join `mec_buy_offlineorder` on((`mec_audit_charge`.`ORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_paid_contentinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_contentinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_paid_contentinfo` AS select (case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) then `mec_buy_offlineorder`.`OFFLINEORDERCODE` else `mec_buy_offlineorder`.`OFFLINEGROUPCODE` end) AS `orderorgroupcode`,`mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ordercode`,right(`mec_buy_offlinecontent`.`OFFLINECONTENTCODE`,3) AS `listid`,`mec_buy_offlinecontent`.`ITEMCODE` AS `sku`,`mec_buy_offlinecontent`.`COUNTERCODE` AS `billcountercode`,`mec_buy_offlinecontent`.`COUNTERCODE` AS `countercode`,`mec_itm_item`.`ITEMNAME` AS `itemname`,`mec_buy_offlinecontent`.`PROMOTIONMARK` AS `promotionmark`,`mec_buy_offlinecontent`.`UNITPRICE` AS `price`,`mec_buy_offlinecontent`.`NUM` AS `qty`,`mec_buy_offlineorder`.`SALESMANCODE` AS `saler`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then (ifnull(`mec_buy_offlinecontent`.`VIPDISCOUNTAMT`,0) + ifnull(`mec_buy_offlinecontent`.`VIPFLOORAMT`,0)) else (ifnull(`mec_buy_offlinecontent`.`VIPDISCOUNTAMT2`,0) + ifnull(`mec_buy_offlinecontent`.`VIPFLOORAMT2`,0)) end) AS `vipdiscountamt`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`DISCOUNTOUTAMT` else `mec_buy_offlinecontent`.`DISCOUNTOUTAMT2` end) AS `discountoutamt`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`DISCOUNTINAMT` else `mec_buy_offlinecontent`.`DISCOUNTINAMT2` end) AS `discountinamt`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`PRESENTSHAREQTY` else `mec_buy_offlinecontent`.`PRESENTSHAREQTY2` end) AS `presentshareqty`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT` else `mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT2` end) AS `mechantdiscounamt`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`SHIPPRICECHARGESHARE` else `mec_buy_offlinecontent`.`SHIPPRICECHARGESHARE2` end) AS `shippricechargeshare`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`PACKINGCHARGESHARE` else `mec_buy_offlinecontent`.`PACKINGCHARGESHARE2` end) AS `packingchargeshare`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlinecontent`.`IFRETURN` = 1)) then `mec_buy_offlinecontent`.`RETAILAMT` else `mec_buy_offlinecontent`.`RETAILAMT2` end) AS `retailamt`,`mec_buy_offlinecontent`.`TEMPDISTRIBUTIONMARK` AS `tempdistributionmark`,`mec_buy_offlinecontent`.`ORIGINORDERCODE` AS `returnordercode`,right(`mec_buy_offlinecontent`.`ORIGINCONTENTCODE`,3) AS `returnlistid`,`mec_buy_offlinecontent`.`HANDAMT` AS `handamt` from ((`mec_buy_offlinecontent` join `mec_buy_offlineorder` on((`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) left join `mec_itm_item` on((`mec_buy_offlinecontent`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where (`mec_buy_offlineorder`.`PAYMENTSTATE` between 1 and 2) union all select `mec_buy_onlineorder`.`ONLINEORDERCODE` AS `orderorgroupcode`,`mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ordercode`,right(`mec_buy_onlinecontent`.`ONLINECONTENTCODE`,3) AS `listid`,`mec_itm_item`.`ITEMCODE` AS `sku`,`mec_buy_onlinecontent`.`ONLINECOUNTERCODE` AS `billcountercode`,`mec_buy_onlinecontent`.`COUNTERCODE` AS `countercode`,`mec_itm_item`.`ITEMNAME` AS `itemname`,`mec_buy_onlinecontent`.`PROMOTIONMARK` AS `promotionmark`,`mec_buy_onlinecontent`.`UNITPRICE` AS `price`,`mec_buy_onlinecontent`.`NUM` AS `qty`,`mec_buy_onlinecontent`.`SALESMANCODE` AS `saler`,(ifnull(`mec_buy_onlinecontent`.`VIPDISCOUNTAMT`,0) + ifnull(`mec_buy_onlinecontent`.`VIPFLOORAMT`,0)) AS `vipdiscountamt`,`mec_buy_onlinecontent`.`DISCOUNTOUTAMT` AS `discountoutamt`,`mec_buy_onlinecontent`.`DISCOUNTINAMT` AS `discountinamt`,`mec_buy_onlinecontent`.`PRESENTSHAREQTY` AS `presentshareqty`,`mec_buy_onlinecontent`.`MERCHANTDISCOUTAMT` AS `mechantdiscounamt`,`mec_buy_onlinecontent`.`SHIPPRICECHARGESHARE` AS `shippricechargeshare`,`mec_buy_onlinecontent`.`PACKINGCHARGESHARE` AS `packingchargeshare`,`mec_buy_onlinecontent`.`RETAILAMT` AS `retailamt`,0 AS `tempdistributionmark`,`mec_buy_onlinecontent`.`ORIGINORDERCODE` AS `returnordercode`,right(`mec_buy_onlinecontent`.`ORIGINCONTENTCODE`,3) AS `returnlistid`,NULL AS `handamt` from (((`mec_buy_onlinecontent` join `mec_buy_onlineorder` on((`mec_buy_onlinecontent`.`ONLINEORDERCODE` = `mec_buy_onlineorder`.`ONLINEORDERCODE`))) left join `mec_itm_skc` on((`mec_itm_skc`.`SKCCODE` = `mec_buy_onlinecontent`.`SKCCODE`))) left join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where (`mec_buy_onlineorder`.`PAYMENTSTATE` between 1 and 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_paid_discountinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_discountinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_paid_discountinfo` AS select (case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 2) then `mec_buy_offlineorder`.`OFFLINEGROUPCODE` else `mec_audit_discount`.`ORDERCODE` end) AS `orderorgroupcode`,`mec_audit_discount`.`ORDERCODE` AS `ordercode`,right(`mec_audit_discount`.`CONTENTCODE`,3) AS `itemlistid`,`mec_audit_discount`.`DISCOUNTID` AS `listid`,`mec_audit_discount`.`DISCOUNTREASON` AS `discountreason`,`mec_audit_discount`.`DISCOUNTAMT` AS `discountamt`,`mec_audit_discount`.`VIPCARDTYPE` AS `vipcardtype`,`mec_audit_discount`.`DISCOUNTTYPE` AS `discounttype` from (`mec_audit_discount` left join `mec_buy_offlineorder` on((`mec_audit_discount`.`ORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_paid_orderinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_orderinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_paid_orderinfo` AS select (case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) then `mec_buy_offlineorder`.`OFFLINEORDERCODE` else `mec_buy_offlineorder`.`OFFLINEGROUPCODE` end) AS `orderorgroupcode`,(case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) then `mec_buy_offlineorder`.`OFFLINEORDERCODE` else `mec_buy_offlineorder`.`OFFLINEGROUPCODE` end) AS `groupid`,`mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ordercode`,`mec_buy_offlineorder`.`IFRETURN` AS `ifreturn`,0 AS `ordercodetype`,`mec_buy_offlineorder`.`DELIVERYMODE` AS `pickupmode`,`mec_buy_offlineorder`.`PAYMENTMODE` AS `paymenttype`,`mec_buy_offlineorder`.`ORDERSTATE` AS `status`,date_format(`mec_buy_offlineorder`.`PLACETIME`,'%Y-%m-%d %H:%i:%S') AS `orderdate`,date_format(`mec_buy_offlineorder`.`AUDITTIME`,'%Y-%m-%d %H:%i:%S') AS `audittime`,date_format(`mec_buy_offlineorder`.`PAYTIME`,'%Y-%m-%d %H:%i:%S') AS `paytime`,date_format(`mec_buy_offlineorder`.`OUTTIME`,'%Y-%m-%d %H:%i:%S') AS `outtime`,date_format(`mec_buy_offlineorder`.`FINISHTIME`,'%Y-%m-%d %H:%i:%S') AS `finishtime`,date_format(`mec_buy_offlineorder`.`RECEIVABLETIME`,'%Y-%m-%d %H:%i:%S') AS `receivabletime`,(case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) then `mec_buy_offlineorder`.`VIPCARDNO` else `mec_buy_offlineorder`.`VIPCARDNO2` end) AS `vipcardNo`,`mec_buy_offlineorder`.`CASHIER` AS `cashier`,(case when ((`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) or (`mec_buy_offlineorder`.`IFRETURN` = 1)) then `mec_buy_offlineorder`.`RECEIVABLEAMT` else `mec_buy_offlineorder`.`RECEIVABLEAMT2` end) AS `receivableamt`,`mec_buy_offlineorder`.`REALSHIPPRICE` AS `realshipprice`,`mec_buy_offlineorder`.`REALPACKING` AS `realpacking`,`mec_buy_offlineorder`.`SHIPPRICE` AS `shipprice`,`mec_buy_offlineorder`.`PACKING` AS `packing`,`mec_ctm_site`.`PERSON` AS `receivecontact`,`mec_ctm_site`.`PERSON` AS `receivename`,`mec_ctm_site`.`TELEPHONE` AS `receivephone`,`mec_ctm_site`.`TELEPHONE` AS `receivecellphone`,`mec_ctm_site`.`DETAIL` AS `receiveaddress`,`mec_ctm_site`.`POSTCODE` AS `receivezip`,`mec_buy_offlineorder`.`STORECODE` AS `storecode`,`mec_buy_offlineorder`.`POSCODE` AS `poscode`,`mec_buy_offlineorder`.`PAYLOCAL` AS `paylocal`,`mec_buy_offlineorder`.`POSDEALNUM` AS `possalecode`,ifnull(`mec_buy_offlineorder`.`GROUPLISTID`,1) AS `grouplistid` from (`mec_buy_offlineorder` left join `mec_ctm_site` on((`mec_buy_offlineorder`.`SITEID` = `mec_ctm_site`.`SITEID`))) where (`mec_buy_offlineorder`.`PAYMENTSTATE` between 1 and 2) union all select `mec_buy_onlineorder`.`ONLINEORDERCODE` AS `orderorgroupcode`,`mec_buy_onlineorder`.`ONLINEORDERCODE` AS `groupid`,`mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ordercode`,`mec_buy_onlineorder`.`IFRETURN` AS `ifreturn`,1 AS `ordercodetype`,`mec_buy_onlineorder`.`DELIVERYMODE` AS `pickupmode`,`mec_buy_onlineorder`.`PAYMENTMODE` AS `paymenttype`,`mec_buy_onlineorder`.`ORDERSTATE` AS `status`,date_format(`mec_buy_onlineorder`.`PLACETIME`,'%Y-%m-%d %H:%i:%S') AS `orderdate`,date_format(`mec_buy_onlineorder`.`AUDITTIME`,'%Y-%m-%d %H:%i:%S') AS `audittime`,date_format(`mec_buy_onlineorder`.`PAYTIME`,'%Y-%m-%d %H:%i:%S') AS `paytime`,date_format(`mec_buy_onlineorder`.`OUTTIME`,'%Y-%m-%d %H:%i:%S') AS `outtime`,date_format(`mec_buy_onlineorder`.`FINISHTIME`,'%Y-%m-%d %H:%i:%S') AS `finishtime`,date_format(`mec_buy_onlineorder`.`RECEIVABLETIME`,'%Y-%m-%d %H:%i:%S') AS `receivabletime`,`mec_buy_onlineorder`.`VIPCARDNO` AS `vipcardNo`,`mec_buy_onlineorder`.`CASHIER` AS `cashier`,`mec_buy_onlineorder`.`RECEIVABLEAMT` AS `receivableamt`,`mec_buy_onlineorder`.`REALSHIPPRICE` AS `realshipprice`,`mec_buy_onlineorder`.`REALPACKING` AS `realpacking`,`mec_buy_onlineorder`.`SHIPPRICE` AS `shipprice`,`mec_buy_onlineorder`.`PACKING` AS `packing`,`mec_ctm_site`.`PERSON` AS `receivecontact`,`mec_ctm_site`.`PERSON` AS `receivename`,`mec_ctm_site`.`TELEPHONE` AS `receivephone`,`mec_ctm_site`.`TELEPHONE` AS `receivecellphone`,`mec_ctm_site`.`DETAIL` AS `receiveaddress`,`mec_ctm_site`.`POSTCODE` AS `receivezip`,`mec_buy_onlineorder`.`STORECODE` AS `storecode`,`mec_buy_onlineorder`.`POSCODE` AS `poscode`,`mec_buy_onlineorder`.`PAYLOCAL` AS `paylocal`,`mec_buy_onlineorder`.`POSDEALNUM` AS `possalecode`,1 AS `grouplistid` from (`mec_buy_onlineorder` left join `mec_ctm_site` on((`mec_buy_onlineorder`.`SITEID` = `mec_ctm_site`.`SITEID`))) where (`mec_buy_onlineorder`.`PAYMENTSTATE` between 1 and 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_paid_payinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_paid_payinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_paid_payinfo` AS select (case when isnull(`mec_audit_pay`.`GROUPCODE`) then `mec_audit_pay`.`ORDERCODE` else `mec_audit_pay`.`GROUPCODE` end) AS `orderorgroupcode`,(case when isnull(`mec_audit_pay`.`GROUPCODE`) then `mec_audit_pay`.`ORDERCODE` else `mec_audit_pay`.`GROUPCODE` end) AS `groupid`,`mec_audit_pay`.`ORDERCODE` AS `ordercode`,`mec_audit_pay`.`PAYID` AS `listid`,`mec_audit_pay`.`PAYCODE` AS `paycode`,`mec_audit_pay`.`AMT` AS `amt`,`mec_audit_pay`.`CARDCODE` AS `cardcode`,`mec_audit_pay`.`PORTNO` AS `portno`,`mec_audit_pay`.`BANKCARDCODE` AS `bankcardcode`,`mec_audit_pay`.`FEERATECODE` AS `feeratecode`,`mec_audit_pay`.`IFRETURN` AS `ifreturn` from `mec_audit_pay` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_pos_contentinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_contentinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_pos_contentinfo` AS select `mec_vi_pos_contentinfo_raw`.`contentcode` AS `contentcode`,`mec_vi_pos_contentinfo_raw`.`ordercode` AS `ordercode`,`mec_vi_pos_contentinfo_raw`.`itemcode` AS `itemcode`,`mec_vi_pos_contentinfo_raw`.`itemname` AS `itemname`,`mec_vi_pos_contentinfo_raw`.`unit` AS `unit`,`mec_vi_pos_contentinfo_raw`.`cabinet` AS `cabinet`,`mec_vi_pos_contentinfo_raw`.`promotioncode` AS `promotioncode`,`mec_vi_pos_contentinfo_raw`.`count` AS `count`,`mec_vi_pos_contentinfo_raw`.`oriprice` AS `oriprice`,`mec_vi_pos_contentinfo_raw`.`discount` AS `discount`,`mec_vi_pos_contentinfo_raw`.`discountprice` AS `discountprice`,`mec_vi_pos_contentinfo_raw`.`actualprice` AS `actualprice`,`mec_vi_pos_contentinfo_raw`.`totaloriprice` AS `totaloriprice`,`mec_vi_pos_contentinfo_raw`.`handdiscount` AS `handdiscount` from `mec_vi_pos_contentinfo_raw` order by `mec_vi_pos_contentinfo_raw`.`contentcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_pos_contentinfo_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_contentinfo_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_pos_contentinfo_raw` AS select ifnull(`mec_buy_offlinecontent`.`OFFLINECONTENTCODE`,'') AS `contentcode`,ifnull(`mec_buy_offlinecontent`.`OFFLINEORDERCODE`,'') AS `ordercode`,ifnull(`mec_buy_offlinecontent`.`ITEMCODE`,'') AS `itemcode`,ifnull(`mec_itm_item`.`ITEMSHORTNAME`,'') AS `itemname`,ifnull(`mec_itm_item`.`UNIT`,'') AS `unit`,ifnull(`mec_buy_offlineorder`.`COUNTERCODE`,'') AS `cabinet`,ifnull(`mec_buy_offlinecontent`.`PROMOTIONMARK`,'') AS `promotioncode`,ifnull(`mec_buy_offlinecontent`.`NUM`,0) AS `count`,ifnull(`mec_buy_offlinecontent`.`UNITPRICE`,0) AS `oriprice`,(case when (isnull(`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE`) or (`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` = 100)) then 100 else `mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` end) AS `discount`,(case when (isnull(`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE`) or (`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` = 100)) then truncate(`mec_buy_offlinecontent`.`UNITPRICE`,2) else truncate(((`mec_buy_offlinecontent`.`UNITPRICE` * `mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE`) / 100),2) end) AS `discountprice`,(case when (`mec_buy_offlineorder`.`IFRETURN` = 1) then `mec_buy_offlinecontent`.`RETAILAMT` when (isnull(`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE`) or (`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` = 100)) then (`mec_buy_offlinecontent`.`UNITPRICE` * `mec_buy_offlinecontent`.`NUM`) else truncate((((`mec_buy_offlinecontent`.`UNITPRICE` * `mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE`) / 100) * `mec_buy_offlinecontent`.`NUM`),0) end) AS `actualprice`,(case when (`mec_buy_offlineorder`.`IFRETURN` = 1) then `mec_buy_offlinecontent`.`RETAILAMT` else ((`mec_buy_offlinecontent`.`UNITPRICE` * `mec_buy_offlinecontent`.`NUM`) - ifnull(`mec_buy_offlinecontent`.`HANDAMT`,0)) end) AS `totaloriprice`,ifnull(`mec_buy_offlinecontent`.`HANDAMT`,0) AS `handdiscount` from ((`mec_buy_offlinecontent` join `mec_buy_offlineorder` on((`mec_buy_offlineorder`.`OFFLINEORDERCODE` = `mec_buy_offlinecontent`.`OFFLINEORDERCODE`))) join `mec_itm_item` on((`mec_itm_item`.`ITEMCODE` = `mec_buy_offlinecontent`.`ITEMCODE`))) union all select ifnull(`mec_buy_onlinecontent`.`ONLINECONTENTCODE`,'') AS `contentcode`,ifnull(`mec_buy_onlinecontent`.`ONLINEORDERCODE`,'') AS `ordercode`,ifnull(`mec_itm_item`.`ITEMCODE`,'') AS `itemcode`,ifnull(`mec_itm_item`.`ITEMSHORTNAME`,'') AS `itemname`,ifnull(`mec_itm_item`.`UNIT`,'') AS `unit`,ifnull(`mec_buy_onlinecontent`.`COUNTERCODE`,'') AS `cabinet`,ifnull(`mec_buy_onlinecontent`.`PROMOTIONMARK`,'') AS `promotioncode`,ifnull(`mec_buy_onlinecontent`.`NUM`,0) AS `count`,ifnull(`mec_buy_onlinecontent`.`UNITPRICE`,0) AS `oriprice`,(case when (isnull(`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE`) or (`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE` = 100)) then 100 else `mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE` end) AS `discount`,(case when (isnull(`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE`) or (`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE` = 100)) then truncate(`mec_buy_onlinecontent`.`UNITPRICE`,2) else truncate(((`mec_buy_onlinecontent`.`UNITPRICE` * `mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE`) / 100),2) end) AS `discountprice`,(case when (`mec_buy_onlineorder`.`IFRETURN` = 1) then `mec_buy_onlinecontent`.`RETAILAMT` when (isnull(`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE`) or (`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE` = 100)) then (`mec_buy_onlinecontent`.`UNITPRICE` * `mec_buy_onlinecontent`.`NUM`) else truncate((((`mec_buy_onlinecontent`.`UNITPRICE` * `mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE`) / 100) * `mec_buy_onlinecontent`.`NUM`),0) end) AS `actualprice`,(case when (`mec_buy_onlineorder`.`IFRETURN` = 1) then `mec_buy_onlinecontent`.`RETAILAMT` else ((`mec_buy_onlinecontent`.`UNITPRICE` * `mec_buy_onlinecontent`.`NUM`) - ifnull(`mec_buy_onlinecontent`.`HANDAMT`,0)) end) AS `totaloriprice`,ifnull(`mec_buy_onlinecontent`.`HANDAMT`,0) AS `handdiscount` from (((`mec_buy_onlinecontent` join `mec_buy_onlineorder` on((`mec_buy_onlineorder`.`ONLINEORDERCODE` = `mec_buy_onlinecontent`.`ONLINEORDERCODE`))) join `mec_itm_skc` on((`mec_itm_skc`.`SKCCODE` = `mec_buy_onlinecontent`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_item`.`ITEMCODE` = `mec_itm_skc`.`ITEMCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_pos_orderinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_orderinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_pos_orderinfo` AS select ifnull(`mec_buy_offlineorder`.`STORECODE`,'') AS `storecode`,ifnull(`mec_buy_offlineorder`.`OFFLINEORDERCODE`,'') AS `ordercode`,ifnull(`mec_buy_offlineorder`.`SALESMANCODE`,'') AS `salemancode`,ifnull(`mec_hsy_salesman`.`SALESMANNAME`,'') AS `salemanname`,ifnull(`mec_buy_offlineorder`.`VIPCARDNO`,'') AS `vipcode`,`mec_buy_offlineorder`.`IFRETURN` AS `ifreturn`,0 AS `ifonline` from (`mec_buy_offlineorder` left join `mec_hsy_salesman` on((`mec_buy_offlineorder`.`SALESMANCODE` = `mec_hsy_salesman`.`SALESMANCODE`))) where ((`mec_buy_offlineorder`.`ORDERSTATE` = 0) or (`mec_buy_offlineorder`.`ORDERSTATE` = 100)) union all select ifnull(`mec_buy_onlineorder`.`STORECODE`,'') AS `storecode`,ifnull(`mec_buy_onlineorder`.`ONLINEORDERCODE`,'') AS `ordercode`,'' AS `salemancode`,'' AS `salemanname`,ifnull(`mec_buy_onlineorder`.`VIPCARDNO`,'') AS `vipcode`,`mec_buy_onlineorder`.`IFRETURN` AS `ifreturn`,1 AS `ifonline` from `mec_buy_onlineorder` where ((`mec_buy_onlineorder`.`ORDERSTATE` = 1) or (`mec_buy_onlineorder`.`ORDERSTATE` = 100)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_pos_payprepareinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_pos_payprepareinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_pos_payprepareinfo` AS select ifnull(`mec_buy_offlinecontent`.`OFFLINEORDERCODE`,'') AS `ordercode`,ifnull(`mec_buy_offlinecontent`.`ITEMCODE`,'') AS `itemcode`,ifnull(`mec_buy_offlinecontent`.`NUM`,0) AS `amount`,ifnull(`mec_buy_offlinecontent`.`UNITPRICE`,0) AS `unitprice`,((case when isnull(`mec_buy_offlinecontent`.`VIPDISCOUNTAMT`) then 0 else `mec_buy_offlinecontent`.`VIPDISCOUNTAMT` end) + (case when isnull(`mec_buy_offlinecontent`.`VIPFLOORAMT`) then 0 else `mec_buy_offlinecontent`.`VIPFLOORAMT` end)) AS `vipdiscount`,0 AS `handdiscount`,(case when isnull(`mec_buy_offlinecontent`.`DISCOUNTOUTAMT`) then 0 else `mec_buy_offlinecontent`.`DISCOUNTOUTAMT` end) AS `promotiondiscount`,(case when isnull(`mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT`) then 0 else `mec_buy_offlinecontent`.`MERCHANTDISCOUTAMT` end) AS `merchantdiscount`,(case when isnull(`mec_buy_offlinecontent`.`REALVIPCARDTYPE`) then '00' else `mec_buy_offlinecontent`.`REALVIPCARDTYPE` end) AS `vipcardtype`,cast((case when isnull(`mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE`) then 100 else `mec_buy_offlinecontent`.`REALVIPDISCOUNTRATE` end) as char charset utf8) AS `vipdiscountstr`,(case when isnull(`mec_buy_offlinecontent`.`RETAILAMT`) then 0 else `mec_buy_offlinecontent`.`RETAILAMT` end) AS `retailamt` from `mec_buy_offlinecontent` union all select ifnull(`mec_buy_onlinecontent`.`ONLINEORDERCODE`,'') AS `ordercode`,ifnull(`mec_itm_skc`.`ITEMCODE`,'') AS `itemcode`,ifnull(`mec_buy_onlinecontent`.`NUM`,0) AS `amount`,ifnull(`mec_buy_onlinecontent`.`UNITPRICE`,0) AS `unitprice`,((case when isnull(`mec_buy_onlinecontent`.`VIPDISCOUNTAMT`) then 0 else `mec_buy_onlinecontent`.`VIPDISCOUNTAMT` end) + (case when isnull(`mec_buy_onlinecontent`.`VIPFLOORAMT`) then 0 else `mec_buy_onlinecontent`.`VIPFLOORAMT` end)) AS `vipdiscount`,0 AS `handdiscount`,(case when isnull(`mec_buy_onlinecontent`.`DISCOUNTOUTAMT`) then 0 else `mec_buy_onlinecontent`.`DISCOUNTOUTAMT` end) AS `promotiondiscount`,(case when isnull(`mec_buy_onlinecontent`.`MERCHANTDISCOUTAMT`) then 0 else `mec_buy_onlinecontent`.`MERCHANTDISCOUTAMT` end) AS `merchantdiscount`,(case when isnull(`mec_buy_onlinecontent`.`REALVIPCARDTYPE`) then '00' else `mec_buy_onlinecontent`.`REALVIPCARDTYPE` end) AS `vipcardtype`,cast((case when isnull(`mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE`) then 100 else `mec_buy_onlinecontent`.`REALVIPDISCOUNTRATE` end) as char charset utf8) AS `vipdiscountstr`,(case when isnull(`mec_buy_onlinecontent`.`RETAILAMT`) then 0 else `mec_buy_onlinecontent`.`RETAILAMT` end) AS `retailamt` from (`mec_buy_onlinecontent` join `mec_itm_skc` on((`mec_buy_onlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_prm_order_content_params`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_prm_order_content_params`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_prm_order_content_params` AS select `mec_vi_prm_order_content_params_raw`.`ordercode` AS `ordercode`,`mec_vi_prm_order_content_params_raw`.`contentcode` AS `contentcode`,`mec_vi_prm_order_content_params_raw`.`itemcode` AS `itemcode`,`mec_vi_prm_order_content_params_raw`.`countercode` AS `countercode`,`mec_vi_prm_order_content_params_raw`.`deptcode` AS `deptcode`,`mec_vi_prm_order_content_params_raw`.`num` AS `num`,`mec_vi_prm_order_content_params_raw`.`originprice` AS `originprice`,`mec_vi_prm_order_content_params_raw`.`promotionmark` AS `promotionmark`,`mec_vi_prm_order_content_params_raw`.`finalmanual` AS `finalmanual`,`mec_vi_prm_order_content_params_raw`.`flag` AS `flag`,`mec_vi_prm_order_content_params_raw`.`finalprice` AS `finalprice`,`mec_vi_prm_order_content_params_raw`.`pos` AS `pos` from `mec_vi_prm_order_content_params_raw` order by `mec_vi_prm_order_content_params_raw`.`contentcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_prm_order_content_params_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_prm_order_content_params_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_prm_order_content_params_raw` AS select `mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ordercode`,`mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `contentcode`,`mec_buy_offlinecontent`.`ITEMCODE` AS `itemcode`,`mec_buy_offlineorder`.`COUNTERCODE` AS `countercode`,`mec_buy_offlineorder`.`STORECODE` AS `deptcode`,`mec_buy_offlinecontent`.`NUM` AS `num`,`mec_buy_offlinecontent`.`UNITPRICE` AS `originprice`,`mec_buy_offlinecontent`.`PROMOTIONMARK` AS `promotionmark`,`mec_buy_offlinecontent`.`HANDAMT` AS `finalmanual`,(case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 0) then 1 else 2 end) AS `flag`,(case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 0) then NULL when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) then `mec_buy_offlinecontent`.`RETAILAMT` else `mec_buy_offlinecontent`.`RETAILAMT2` end) AS `finalprice`,`mec_buy_offlineorder`.`POSDEALNUM` AS `pos` from (`mec_buy_offlinecontent` join `mec_buy_offlineorder` on((`mec_buy_offlineorder`.`OFFLINEORDERCODE` = `mec_buy_offlinecontent`.`OFFLINEORDERCODE`))) union all select `mec_buy_onlineorder`.`ONLINEORDERCODE` AS `ordercode`,`mec_buy_onlinecontent`.`ONLINECONTENTCODE` AS `contentcode`,`mec_itm_skc`.`ITEMCODE` AS `itemcode`,`mec_buy_onlinecontent`.`ONLINECOUNTERCODE` AS `countercode`,`mec_buy_onlineorder`.`STORECODE` AS `deptcode`,`mec_buy_onlinecontent`.`NUM` AS `num`,`mec_buy_onlinecontent`.`UNITPRICE` AS `originprice`,`mec_buy_onlinecontent`.`PROMOTIONMARK` AS `promotionmark`,NULL AS `finalmanual`,(case when (`mec_buy_onlineorder`.`PAYMENTSTATE` = 0) then 1 else 2 end) AS `flag`,(case when (`mec_buy_onlineorder`.`PAYMENTSTATE` = 0) then NULL else `mec_buy_onlinecontent`.`RETAILAMT` end) AS `finalprice`,`mec_buy_onlineorder`.`POSDEALNUM` AS `pos` from ((`mec_buy_onlinecontent` join `mec_buy_onlineorder` on((`mec_buy_onlineorder`.`ONLINEORDERCODE` = `mec_buy_onlinecontent`.`ONLINEORDERCODE`))) join `mec_itm_skc` on((`mec_itm_skc`.`SKCCODE` = `mec_buy_onlinecontent`.`SKCCODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_region_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_region_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_region_sku_total` AS select `mec_itm_itemregion`.`REGIONID` AS `REGIONID`,`mec_itm_region`.`REGIONNAME` AS `REGIONNAME`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES` from (((((((`mec_itm_itemregion` join `mec_itm_item` on((`mec_itm_itemregion`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_itm_region` on((`mec_itm_region`.`REGIONID` = `mec_itm_itemregion`.`REGIONID`))) left join `hct_brand` on((`hct_brand`.`BRANDCODE` = `mec_itm_item`.`BRANDCODE`))) left join `hsy_itemtype` on((`hsy_itemtype`.`ITEMTYPECODE` = `mec_itm_item`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_region`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_ret_offlinecontent_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_offlinecontent_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_ret_offlinecontent_total` AS select `mec_buy_offlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_offlinecontent`.`ITEMCODE` AS `ITEMCODE`,`mec_buy_offlinecontent`.`NUM` AS `NUM`,`mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `OFFLINECONTENTCODE`,`mec_buy_offlinecontent`.`OFFLINEORDERCODE` AS `OFFLINEORDERCODE`,`mec_buy_offlinecontent`.`ORIGINCONTENTCODE` AS `ORIGINCONTENTCODE`,`mec_buy_offlinecontent`.`ORIGINORDERCODE` AS `ORIGINORDERCODE`,`mec_buy_offlinecontent`.`PROMOTIONMARK` AS `PROMOTIONMARK`,`mec_buy_offlinecontent`.`RETAILAMT` AS `RETAILAMT`,`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_buy_offlinecontent`.`UNITPRICE` AS `UNITPRICE`,`mec_buy_offlineorder`.`ORDERSTATE` AS `ORDERSTATE`,`mec_buy_offlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_offlineorder`.`STORECODE` AS `STORECODE`,`mec_buy_offlineorder`.`RETUSERCODE` AS `RETUSERCODE`,`mec_buy_offlineorder`.`RETBACKCOUPON` AS `RETBACKCOUPON`,`mec_buy_offlineorder`.`RETORIPOSTRANSCODE` AS `RETORIPOSTRANSCODE`,`mec_buy_offlineorder`.`RECEIVABLEAMT` AS `RECEIVABLEAMT`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_skc`.`MERCHANTSKCCODE` AS `MERCHANTSKCCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`hct_brand`.`BRANDNAME` AS `BRANDNAME` from ((((`mec_buy_offlinecontent` left join `mec_buy_offlineorder` on((`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) left join `mec_itm_item` on((`mec_buy_offlinecontent`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_itm_skc` on((`mec_buy_offlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) where (`mec_buy_offlinecontent`.`IFRETURN` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_ret_offlineorder_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_offlineorder_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_ret_offlineorder_total` AS select `mec_vi_ret_offlineorder_total_raw`.`COUNTERCODE` AS `COUNTERCODE`,`mec_vi_ret_offlineorder_total_raw`.`OFFLINEORDERCODE` AS `OFFLINEORDERCODE`,`mec_vi_ret_offlineorder_total_raw`.`ORDERSTATE` AS `ORDERSTATE`,`mec_vi_ret_offlineorder_total_raw`.`PLACETIME` AS `PLACETIME`,`mec_vi_ret_offlineorder_total_raw`.`STORECODE` AS `STORECODE`,`mec_vi_ret_offlineorder_total_raw`.`RETUSERCODE` AS `RETUSERCODE`,`mec_vi_ret_offlineorder_total_raw`.`RETBACKCOUPON` AS `RETBACKCOUPON`,`mec_vi_ret_offlineorder_total_raw`.`RETORIPOSTRANSCODE` AS `RETORIPOSTRANSCODE`,`mec_vi_ret_offlineorder_total_raw`.`RECEIVABLEAMT` AS `RECEIVABLEAMT`,(case when (count(`mec_vi_ret_offlineorder_total_raw`.`COUNTERCODE`) = 1) then 0 else 1 end) AS `ISMULTICOUNTERS` from `mec_vi_ret_offlineorder_total_raw` group by `mec_vi_ret_offlineorder_total_raw`.`OFFLINEORDERCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_ret_offlineorder_total_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_offlineorder_total_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_ret_offlineorder_total_raw` AS select `mec_buy_offlinecontent`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `OFFLINEORDERCODE`,`mec_buy_offlineorder`.`ORDERSTATE` AS `ORDERSTATE`,`mec_buy_offlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_offlineorder`.`STORECODE` AS `STORECODE`,`mec_buy_offlineorder`.`RETUSERCODE` AS `RETUSERCODE`,`mec_buy_offlineorder`.`RETBACKCOUPON` AS `RETBACKCOUPON`,`mec_buy_offlineorder`.`RETORIPOSTRANSCODE` AS `RETORIPOSTRANSCODE`,`mec_buy_offlineorder`.`RECEIVABLEAMT` AS `RECEIVABLEAMT` from (`mec_buy_offlinecontent` join `mec_buy_offlineorder` on((`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) where (`mec_buy_offlinecontent`.`IFRETURN` = 1) group by `mec_buy_offlinecontent`.`OFFLINEORDERCODE`,`mec_buy_offlinecontent`.`COUNTERCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_ret_returnable_contentinfo`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_returnable_contentinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_ret_returnable_contentinfo` AS select `mec_buy_offlineorder`.`OFFLINEORDERCODE` AS `ORDERCODE`,(case when (`mec_buy_offlineorder`.`PAYMENTSTATE` = 1) then `mec_buy_offlineorder`.`VIPCARDNO` else `mec_buy_offlineorder`.`VIPCARDNO2` end) AS `VIPCARDNO`,`mec_buy_offlineorder`.`USERCODE` AS `USERCODE`,`mec_buy_offlineorder`.`POSDEALNUM` AS `POSDEALNUM`,`mec_buy_offlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_offlineorder`.`COUNTERCODE` AS `COUNTERCODE`,`mec_buy_offlineorder`.`STORECODE` AS `STORECODE`,`mec_buy_offlineorder`.`PLACETIME` AS `PLACETIME`,`mec_buy_offlineorder`.`PAYTIME` AS `PAYTIME`,`mec_buy_offlinecontent`.`OFFLINECONTENTCODE` AS `CONTENTCODE`,`mec_buy_offlinecontent`.`ITEMCODE` AS `ITEMCODE`,`mec_buy_offlinecontent`.`SKCCODE` AS `SKCCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`, `mec_itm_item`.`BRANDCODE`,`hct_brand`.`BRANDNAME`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_buy_offlinecontent`.`NUM` AS `NUM`,`mec_buy_offlinecontent`.`UNITPRICE` AS `UNITPRICE`,(`mec_buy_offlinecontent`.`NUM` * `mec_buy_offlinecontent`.`UNITPRICE`) AS `ORIGINAMT`,`mec_buy_offlinecontent`.`RETAILAMT` AS `RETAILAMT`,`mec_buy_offlinecontent`.`CASHPAYSHARE` AS `CASHPAYSHARE`,`mec_buy_offlinecontent`.`CREDITPAYSHARE` AS `CREDITPAYSHARE`,`mec_buy_offlinecontent`.`CASHCOUPONPAYSHARE` AS `CASHCOUPONPAYSHARE`,`mec_buy_offlinecontent`.`GOODSCOUPONPAYSHARE` AS `GOODSCOUPONPAYSHARE`,`mec_buy_offlinecontent`.`ECARDPAYSHARE` AS `ECARDPAYSHARE`,`mec_buy_offlinecontent`.`OTHERPAYSHARE` AS `OTHERPAYSHARE`,`mec_buy_offlinecontent`.`PREMIUMPAYSHARE` AS `PREMIUMPAYSHARE` from (((`mec_buy_offlinecontent` join `mec_buy_offlineorder` on((`mec_buy_offlinecontent`.`OFFLINEORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) left join `mec_itm_item` on((`mec_buy_offlinecontent`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_itm_skc` on((`mec_buy_offlinecontent`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) left join `hct_brand` on `mec_itm_item`.`BRANDCODE`=`hct_brand`.`BRANDCODE` where ((`mec_buy_offlineorder`.`ORDERSTATE` in (4,5,6,8)) and (`mec_buy_offlineorder`.`IFRETURN` = 0) and (`mec_buy_offlineorder`.`POSDEALNUM` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_ret_returnable_paylist`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_returnable_paylist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_ret_returnable_paylist` AS select `mec_vi_ret_returnable_paylist_raw`.`GROUPCODE` AS `GROUPCODE`,`mec_vi_ret_returnable_paylist_raw`.`ORDERCODE` AS `ORDERCODE`,`mec_vi_ret_returnable_paylist_raw`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_vi_ret_returnable_paylist_raw`.`IFRETURN` AS `IFRETURN`,`mec_vi_ret_returnable_paylist_raw`.`PAYMODECODE` AS `PAYMODECODE`,`mec_vi_ret_returnable_paylist_raw`.`PAYMODENAME` AS `PAYMODENAME`,`mec_vi_ret_returnable_paylist_raw`.`AMT` AS `AMT`,`mec_vi_ret_returnable_paylist_raw`.`CARDCODE` AS `CARDCODE`,`mec_vi_ret_returnable_paylist_raw`.`PORTNO` AS `PORTNO`,`mec_vi_ret_returnable_paylist_raw`.`BANKCARDCODE` AS `BANKCARDCODE`,`mec_vi_ret_returnable_paylist_raw`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_vi_ret_returnable_paylist_raw`.`STORECODE` AS `STORECODE` from `mec_vi_ret_returnable_paylist_raw` order by `mec_vi_ret_returnable_paylist_raw`.`POSTRANSCODE`,`mec_vi_ret_returnable_paylist_raw`.`ORDERCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_ret_returnable_paylist_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_ret_returnable_paylist_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_ret_returnable_paylist_raw` AS select `mec_audit_pay`.`GROUPCODE` AS `GROUPCODE`,`mec_audit_pay`.`ORDERCODE` AS `ORDERCODE`,`mec_audit_pay`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_audit_pay`.`IFRETURN` AS `IFRETURN`,`hsy_paymode`.`PAYMODECODE` AS `PAYMODECODE`,`hsy_paymode`.`PAYMODENAME` AS `PAYMODENAME`,`mec_audit_pay`.`AMT` AS `AMT`,`mec_audit_pay`.`CARDCODE` AS `CARDCODE`,`mec_audit_pay`.`PORTNO` AS `PORTNO`,`mec_audit_pay`.`BANKCARDCODE` AS `BANKCARDCODE`,`mec_buy_offlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_offlineorder`.`STORECODE` AS `STORECODE` from ((`mec_audit_pay` join `hsy_paymode` on((`mec_audit_pay`.`PAYCODE` = `hsy_paymode`.`PAYMODECODE`))) join `mec_buy_offlineorder` on((`mec_audit_pay`.`ORDERCODE` = `mec_buy_offlineorder`.`OFFLINEORDERCODE`))) where (`mec_buy_offlineorder`.`IFRETURN` = 0) union all select `mec_audit_pay`.`GROUPCODE` AS `GROUPCODE`,`mec_audit_pay`.`ORDERCODE` AS `ORDERCODE`,`mec_audit_pay`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_audit_pay`.`IFRETURN` AS `IFRETURN`,`hsy_paymode`.`PAYMODECODE` AS `PAYMODECODE`,`hsy_paymode`.`PAYMODENAME` AS `PAYMODENAME`,`mec_audit_pay`.`AMT` AS `AMT`,`mec_audit_pay`.`CARDCODE` AS `CARDCODE`,`mec_audit_pay`.`PORTNO` AS `PORTNO`,`mec_audit_pay`.`BANKCARDCODE` AS `BANKCARDCODE`,`mec_buy_offlinegroup`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_offlinegroup`.`STORECODE` AS `STORECODE` from ((`mec_audit_pay` join `hsy_paymode` on((`mec_audit_pay`.`PAYCODE` = `hsy_paymode`.`PAYMODECODE`))) join `mec_buy_offlinegroup` on((`mec_audit_pay`.`GROUPCODE` = `mec_buy_offlinegroup`.`OFFLINEGROUPCODE`))) where (`mec_buy_offlinegroup`.`IFRETURN` = 0) union all select `mec_audit_pay`.`GROUPCODE` AS `GROUPCODE`,`mec_audit_pay`.`ORDERCODE` AS `ORDERCODE`,`mec_audit_pay`.`ISONLINEORDER` AS `ISONLINEORDER`,`mec_audit_pay`.`IFRETURN` AS `IFRETURN`,`hsy_paymode`.`PAYMODECODE` AS `PAYMODECODE`,`hsy_paymode`.`PAYMODENAME` AS `PAYMODENAME`,`mec_audit_pay`.`AMT` AS `AMT`,`mec_audit_pay`.`CARDCODE` AS `CARDCODE`,`mec_audit_pay`.`PORTNO` AS `PORTNO`,`mec_audit_pay`.`BANKCARDCODE` AS `BANKCARDCODE`,`mec_buy_onlineorder`.`POSTRANSCODE` AS `POSTRANSCODE`,`mec_buy_onlineorder`.`STORECODE` AS `STORECODE` from ((`mec_audit_pay` join `hsy_paymode` on((`mec_audit_pay`.`PAYCODE` = `hsy_paymode`.`PAYMODECODE`))) join `mec_buy_onlineorder` on((`mec_audit_pay`.`ORDERCODE` = `mec_buy_onlineorder`.`ONLINEORDERCODE`))) where (`mec_buy_onlineorder`.`IFRETURN` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;


--
-- Final view structure for view `mec_vi_revisable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_revisable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_revisable_sku` AS select `t`.`ID` AS `ID`,`t`.`ITEMCODE` AS `ITEMCODE`,`t`.`BARCODE` AS `BARCODE`,`t`.`ITEMNAME` AS `ITEMNAME`,`t`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`t`.`BRANDCODE` AS `BRANDCODE`,`t`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`t`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`t`.`MERCHANTCODE` AS `MERCHANTCODE`,`t`.`BUSINESSMODE` AS `BUSINESSMODE`,`t`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`t`.`PRICE` AS `PRICE`,`t`.`TEMPPRICE` AS `TEMPPRICE`,`t`.`TAXRATE` AS `TAXRATE`,`t`.`EXCISERATE` AS `EXCISERATE`,`t`.`RETURNGOODS` AS `RETURNGOODS`,`t`.`SALESTATE` AS `SALESTATE`,`t`.`NETWEIGHT` AS `NETWEIGHT`,`t`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`t`.`SPECIFICATION` AS `SPECIFICATION`,`t`.`PRODUCTCODE` AS `PRODUCTCODE`,`t`.`GRADE` AS `GRADE`,`t`.`COLOR` AS `COLOR`,`t`.`CASING` AS `CASING`,`t`.`DIMENSION` AS `DIMENSION`,`t`.`VOLUME` AS `VOLUME`,`t`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`t`.`UNIT` AS `UNIT`,`t`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`t`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`t`.`SAFESTOCK` AS `SAFESTOCK`,`t`.`MAXSTOCK` AS `MAXSTOCK`,`t`.`MINSTOCK` AS `MINSTOCK`,`t`.`MAXORDER` AS `MAXORDER`,`t`.`MINORDER` AS `MINORDER`,`t`.`PROPERTY` AS `PROPERTY`,`t`.`CHECKSTATE` AS `CHECKSTATE`,`t`.`ERRORINFO` AS `ERRORINFO`,`t`.`INPUTPERSON` AS `INPUTPERSON`,`t`.`AGENTCODE` AS `AGENTCODE`,`t`.`TERM` AS `TERM`,`t`.`createdAt` AS `createdAt`,`t`.`updatedAt` AS `updatedAt`,`t`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`t`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`t`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`t`.`TMPSTATE` AS `TMPSTATE`,`t`.`LASTOPERATEPERSON` AS `LASTOPERATEPERSON` from `mec_vi_revisable_sku_raw` `t` group by `t`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_revisable_sku_raw`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_revisable_sku_raw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_revisable_sku_raw` AS select `mec_itm_item_tmp1`.`ID` AS `ID`,`mec_itm_item_tmp1`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item_tmp1`.`BARCODE` AS `BARCODE`,`mec_itm_item_tmp1`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item_tmp1`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item_tmp1`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item_tmp1`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item_tmp1`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item_tmp1`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item_tmp1`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item_tmp1`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item_tmp1`.`PRICE` AS `PRICE`,`mec_itm_item_tmp1`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item_tmp1`.`TAXRATE` AS `TAXRATE`,`mec_itm_item_tmp1`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item_tmp1`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item_tmp1`.`SALESTATE` AS `SALESTATE`,`mec_itm_item_tmp1`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item_tmp1`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item_tmp1`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item_tmp1`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item_tmp1`.`GRADE` AS `GRADE`,`mec_itm_item_tmp1`.`COLOR` AS `COLOR`,`mec_itm_item_tmp1`.`CASING` AS `CASING`,`mec_itm_item_tmp1`.`DIMENSION` AS `DIMENSION`,`mec_itm_item_tmp1`.`VOLUME` AS `VOLUME`,`mec_itm_item_tmp1`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item_tmp1`.`UNIT` AS `UNIT`,`mec_itm_item_tmp1`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item_tmp1`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item_tmp1`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item_tmp1`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item_tmp1`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item_tmp1`.`MAXORDER` AS `MAXORDER`,`mec_itm_item_tmp1`.`MINORDER` AS `MINORDER`,`mec_itm_item_tmp1`.`PROPERTY` AS `PROPERTY`,`mec_itm_item_tmp1`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item_tmp1`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item_tmp1`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item_tmp1`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item_tmp1`.`TERM` AS `TERM`,`mec_itm_item_tmp1`.`createdAt` AS `createdAt`,`mec_itm_item_tmp1`.`updatedAt` AS `updatedAt`,`mec_itm_item_tmp1`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item_tmp1`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item_tmp1`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item_tmp1`.`TMPSTATE` AS `TMPSTATE`,`mec_itm_item_tmp1`.`LASTOPERATEPERSON` AS `LASTOPERATEPERSON` from `mec_itm_item_tmp1` where (`mec_itm_item_tmp1`.`TMPSTATE` = 0) union all select `mec_itm_item_tmp1`.`ID` AS `ID`,`mec_itm_item_tmp1`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item_tmp1`.`BARCODE` AS `BARCODE`,`mec_itm_item_tmp1`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item_tmp1`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item_tmp1`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item_tmp1`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item_tmp1`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item_tmp1`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item_tmp1`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item_tmp1`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item_tmp1`.`PRICE` AS `PRICE`,`mec_itm_item_tmp1`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item_tmp1`.`TAXRATE` AS `TAXRATE`,`mec_itm_item_tmp1`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item_tmp1`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item_tmp1`.`SALESTATE` AS `SALESTATE`,`mec_itm_item_tmp1`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item_tmp1`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item_tmp1`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item_tmp1`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item_tmp1`.`GRADE` AS `GRADE`,`mec_itm_item_tmp1`.`COLOR` AS `COLOR`,`mec_itm_item_tmp1`.`CASING` AS `CASING`,`mec_itm_item_tmp1`.`DIMENSION` AS `DIMENSION`,`mec_itm_item_tmp1`.`VOLUME` AS `VOLUME`,`mec_itm_item_tmp1`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item_tmp1`.`UNIT` AS `UNIT`,`mec_itm_item_tmp1`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item_tmp1`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item_tmp1`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item_tmp1`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item_tmp1`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item_tmp1`.`MAXORDER` AS `MAXORDER`,`mec_itm_item_tmp1`.`MINORDER` AS `MINORDER`,`mec_itm_item_tmp1`.`PROPERTY` AS `PROPERTY`,`mec_itm_item_tmp1`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item_tmp1`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item_tmp1`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item_tmp1`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item_tmp1`.`TERM` AS `TERM`,`mec_itm_item_tmp1`.`createdAt` AS `createdAt`,`mec_itm_item_tmp1`.`updatedAt` AS `updatedAt`,`mec_itm_item_tmp1`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item_tmp1`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item_tmp1`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item_tmp1`.`TMPSTATE` AS `TMPSTATE`,`mec_itm_item_tmp1`.`LASTOPERATEPERSON` AS `LASTOPERATEPERSON` from `mec_itm_item_tmp1` where (`mec_itm_item_tmp1`.`TMPSTATE` = 2) union all select NULL AS `ID`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,NULL AS `TMPSTATE`,NULL AS `LASTOPERATEPERSON` from `mec_itm_item` where (`mec_itm_item`.`CHECKSTATE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_revisable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_revisable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_revisable_sku_total` AS select `mec_vi_revisable_sku`.`ID` AS `ID`,`mec_vi_revisable_sku`.`ITEMCODE` AS `ITEMCODE`,`mec_vi_revisable_sku`.`BARCODE` AS `BARCODE`,`mec_vi_revisable_sku`.`ITEMNAME` AS `ITEMNAME`,`mec_vi_revisable_sku`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_vi_revisable_sku`.`BRANDCODE` AS `BRANDCODE`,`mec_vi_revisable_sku`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_vi_revisable_sku`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_vi_revisable_sku`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_vi_revisable_sku`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_vi_revisable_sku`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_vi_revisable_sku`.`PRICE` AS `PRICE`,`mec_vi_revisable_sku`.`TEMPPRICE` AS `TEMPPRICE`,`mec_vi_revisable_sku`.`TAXRATE` AS `TAXRATE`,`mec_vi_revisable_sku`.`EXCISERATE` AS `EXCISERATE`,`mec_vi_revisable_sku`.`RETURNGOODS` AS `RETURNGOODS`,`mec_vi_revisable_sku`.`SALESTATE` AS `SALESTATE`,`mec_vi_revisable_sku`.`NETWEIGHT` AS `NETWEIGHT`,`mec_vi_revisable_sku`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_vi_revisable_sku`.`SPECIFICATION` AS `SPECIFICATION`,`mec_vi_revisable_sku`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_vi_revisable_sku`.`GRADE` AS `GRADE`,`mec_vi_revisable_sku`.`COLOR` AS `COLOR`,`mec_vi_revisable_sku`.`CASING` AS `CASING`,`mec_vi_revisable_sku`.`DIMENSION` AS `DIMENSION`,`mec_vi_revisable_sku`.`VOLUME` AS `VOLUME`,`mec_vi_revisable_sku`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_vi_revisable_sku`.`UNIT` AS `UNIT`,`mec_vi_revisable_sku`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_vi_revisable_sku`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_vi_revisable_sku`.`SAFESTOCK` AS `SAFESTOCK`,`mec_vi_revisable_sku`.`MAXSTOCK` AS `MAXSTOCK`,`mec_vi_revisable_sku`.`MINSTOCK` AS `MINSTOCK`,`mec_vi_revisable_sku`.`MAXORDER` AS `MAXORDER`,`mec_vi_revisable_sku`.`MINORDER` AS `MINORDER`,`mec_vi_revisable_sku`.`PROPERTY` AS `PROPERTY`,`mec_vi_revisable_sku`.`CHECKSTATE` AS `CHECKSTATE`,`mec_vi_revisable_sku`.`ERRORINFO` AS `ERRORINFO`,`mec_vi_revisable_sku`.`INPUTPERSON` AS `INPUTPERSON`,`mec_vi_revisable_sku`.`AGENTCODE` AS `AGENTCODE`,`mec_vi_revisable_sku`.`TERM` AS `TERM`,`mec_vi_revisable_sku`.`createdAt` AS `createdAt`,`mec_vi_revisable_sku`.`updatedAt` AS `updatedAt`,`mec_vi_revisable_sku`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_vi_revisable_sku`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_vi_revisable_sku`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_vi_revisable_sku`.`TMPSTATE` AS `TMPSTATE`,`mec_vi_revisable_sku`.`LASTOPERATEPERSON` AS `LASTOPERATEPERSON`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_vi_revisable_sku` left join `hct_brand` on((`mec_vi_revisable_sku`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_vi_revisable_sku`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_vi_revisable_sku`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_vi_revisable_sku`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_vi_revisable_sku`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_shoppingcart_skc`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_shoppingcart_skc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_shoppingcart_skc` AS select `mec_buy_shoppingcart`.`ID` AS `ID`,`mec_buy_shoppingcart`.`USERCODE` AS `USERCODE`,`mec_buy_shoppingcart`.`SKCCODE` AS `SKCCODE`,`mec_buy_shoppingcart`.`NUM` AS `NUM`,`mec_buy_shoppingcart`.`updatedAt` AS `TIME`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME` from ((`mec_buy_shoppingcart` join `mec_itm_skc` on((`mec_buy_shoppingcart`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_shoppingcart_skc_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_shoppingcart_skc_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_shoppingcart_skc_total` AS select `mec_buy_shoppingcart`.`ID` AS `ID`,`mec_buy_shoppingcart`.`USERCODE` AS `USERCODE`,`mec_buy_shoppingcart`.`SKCCODE` AS `SKCCODE`,`mec_buy_shoppingcart`.`NUM` AS `NUM`,`mec_buy_shoppingcart`.`updatedAt` AS `TIME`,`mec_itm_skc`.`COLOR` AS `COLOR`,`mec_itm_skc`.`SIZE` AS `SIZE`,`mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`mec_vi_first_imgpreview`.`IMGURL` AS `IMGURL`,`mec_vi_sku_categorynames`.`CATEGORYNAMES` AS `CATEGORYNAMES`,`mec_vi_sku_regionnames`.`REGIONNAMES` AS `REGIONNAMES`,`mec_vi_online_skc_stock`.`AMOUNT` AS `AMOUNT` from ((((((((`mec_buy_shoppingcart` join `mec_itm_skc` on((`mec_buy_shoppingcart`.`SKCCODE` = `mec_itm_skc`.`SKCCODE`))) join `mec_itm_item` on((`mec_itm_skc`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `hct_brand` on((`hct_brand`.`BRANDCODE` = `mec_itm_item`.`BRANDCODE`))) left join `hsy_itemtype` on((`hsy_itemtype`.`ITEMTYPECODE` = `mec_itm_item`.`ITEMTYPECODE`))) left join `mec_vi_first_imgpreview` on((`mec_vi_first_imgpreview`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_categorynames` on((`mec_vi_sku_categorynames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_sku_regionnames` on((`mec_vi_sku_regionnames`.`ITEMCODE` = `mec_itm_item`.`ITEMCODE`))) left join `mec_vi_online_skc_stock` on((`mec_vi_online_skc_stock`.`SKCCODE` = `mec_buy_shoppingcart`.`SKCCODE`))) where ((`mec_itm_skc`.`RECORDSTATE` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_checkable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_checkable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_checkable_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE` from `mec_itm_item` where ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_checkable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_checkable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_checkable_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` between 2 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_renewable_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_renewable_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_renewable_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE` from `mec_itm_item` where ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` between 1 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_renewable_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_renewable_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_renewable_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` between 1 and 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_stock`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_stock` AS select `mec_itm_stock`.`SKCCODE` AS `SKCCODE`,sum(`mec_itm_stock`.`AMOUNT`) AS `AMOUNT` from `mec_itm_stock` where (`mec_itm_stock`.`RECORDSTATE` = 1) group by `mec_itm_stock`.`SKCCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_uninitial_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_uninitial_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_uninitial_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE` from `mec_itm_item` where ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_skc_uninitial_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_skc_uninitial_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_skc_uninitial_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where ((`mec_itm_item`.`ISCONSIDERSTOCK` = 1) and (`mec_itm_item`.`CHECKSTATE` = 1) and (`mec_itm_item`.`SKCCHECKSTATE` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE` from `mec_itm_item` where (`mec_itm_item`.`CHECKSTATE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku_categorynames`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_categorynames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku_categorynames` AS select `mec_itm_itemcategory`.`ITEMCODE` AS `ITEMCODE`,group_concat(`mec_itm_category`.`CATEGORYNAME` order by `mec_itm_category`.`CATEGORYID` ASC separator '-') AS `CATEGORYNAMES`,max(`mec_itm_itemcategory`.`createdAt`) AS `createdAt`,max(`mec_itm_itemcategory`.`updatedAt`) AS `updatedAt` from (`mec_itm_itemcategory` join `mec_itm_category`) where (`mec_itm_itemcategory`.`CATEGORYID` = `mec_itm_category`.`CATEGORYID`) group by `mec_itm_itemcategory`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku_hasstock_counternum`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_hasstock_counternum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku_hasstock_counternum` AS select `mec_vi_offline_hasstock_selling_counter_sku`.`ITEMCODE` AS `ITEMCODE`,count(`mec_vi_offline_hasstock_selling_counter_sku`.`COUNTERCODE`) AS `COUNTERNUM` from `mec_vi_offline_hasstock_selling_counter_sku` group by `mec_vi_offline_hasstock_selling_counter_sku`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku_online_counternum`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_online_counternum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku_online_counternum` AS select `mec_itm_storeitem`.`ITEMCODE` AS `ITEMCODE`,count(`mec_itm_storeitem`.`COUNTERCODE`) AS `COUNTERNUM` from `mec_itm_storeitem` where ((`mec_itm_storeitem`.`CHECKSTATE` = 1) and (`mec_itm_storeitem`.`ONLINESTATE` = 1)) group by `mec_itm_storeitem`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku_regionnames`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_regionnames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku_regionnames` AS select `mec_itm_itemregion`.`ITEMCODE` AS `ITEMCODE`,group_concat(`mec_itm_region`.`REGIONNAME` order by `mec_itm_region`.`REGIONID` ASC separator '-') AS `REGIONNAMES`,max(`mec_itm_itemregion`.`createdAt`) AS `createdAt`,max(`mec_itm_itemregion`.`updatedAt`) AS `updatedAt` from (`mec_itm_itemregion` join `mec_itm_region`) where (`mec_itm_itemregion`.`REGIONID` = `mec_itm_region`.`REGIONID`) group by `mec_itm_itemregion`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku_total`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku_total` AS select `mec_itm_item`.`ITEMCODE` AS `ITEMCODE`,`mec_itm_item`.`BARCODE` AS `BARCODE`,`mec_itm_item`.`ITEMNAME` AS `ITEMNAME`,`mec_itm_item`.`ITEMSHORTNAME` AS `ITEMSHORTNAME`,`mec_itm_item`.`BRANDCODE` AS `BRANDCODE`,`mec_itm_item`.`RETAILTYPECODE` AS `RETAILTYPECODE`,`mec_itm_item`.`ITEMTYPECODE` AS `ITEMTYPECODE`,`mec_itm_item`.`MERCHANTCODE` AS `MERCHANTCODE`,`mec_itm_item`.`BUSINESSMODE` AS `BUSINESSMODE`,`mec_itm_item`.`PRODUCINGAREA` AS `PRODUCINGAREA`,`mec_itm_item`.`PRICE` AS `PRICE`,`mec_itm_item`.`TEMPPRICE` AS `TEMPPRICE`,`mec_itm_item`.`TAXRATE` AS `TAXRATE`,`mec_itm_item`.`EXCISERATE` AS `EXCISERATE`,`mec_itm_item`.`RETURNGOODS` AS `RETURNGOODS`,`mec_itm_item`.`SALESTATE` AS `SALESTATE`,`mec_itm_item`.`NETWEIGHT` AS `NETWEIGHT`,`mec_itm_item`.`GROSSWEIGHT` AS `GROSSWEIGHT`,`mec_itm_item`.`SPECIFICATION` AS `SPECIFICATION`,`mec_itm_item`.`PRODUCTCODE` AS `PRODUCTCODE`,`mec_itm_item`.`GRADE` AS `GRADE`,`mec_itm_item`.`COLOR` AS `COLOR`,`mec_itm_item`.`CASING` AS `CASING`,`mec_itm_item`.`DIMENSION` AS `DIMENSION`,`mec_itm_item`.`VOLUME` AS `VOLUME`,`mec_itm_item`.`ITEMCODETYPE` AS `ITEMCODETYPE`,`mec_itm_item`.`UNIT` AS `UNIT`,`mec_itm_item`.`LASTPURCHASEPRICE` AS `LASTPURCHASEPRICE`,`mec_itm_item`.`PURCHASETAXRATE` AS `PURCHASETAXRATE`,`mec_itm_item`.`SAFESTOCK` AS `SAFESTOCK`,`mec_itm_item`.`MAXSTOCK` AS `MAXSTOCK`,`mec_itm_item`.`MINSTOCK` AS `MINSTOCK`,`mec_itm_item`.`MAXORDER` AS `MAXORDER`,`mec_itm_item`.`MINORDER` AS `MINORDER`,`mec_itm_item`.`PROPERTY` AS `PROPERTY`,`mec_itm_item`.`CHECKSTATE` AS `CHECKSTATE`,`mec_itm_item`.`ERRORINFO` AS `ERRORINFO`,`mec_itm_item`.`INPUTPERSON` AS `INPUTPERSON`,`mec_itm_item`.`AGENTCODE` AS `AGENTCODE`,`mec_itm_item`.`TERM` AS `TERM`,`mec_itm_item`.`createdAt` AS `createdAt`,`mec_itm_item`.`updatedAt` AS `updatedAt`,`mec_itm_item`.`ISCONSIDERSTOCK` AS `ISCONSIDERSTOCK`,`mec_itm_item`.`ISALLOWONLINE` AS `ISALLOWONLINE`,`mec_itm_item`.`ISALLOWNEGATIVE` AS `ISALLOWNEGATIVE`,`mec_itm_item`.`SKCCHECKSTATE` AS `SKCCHECKSTATE`,`mec_itm_item`.`ONLINECHECKSTATE` AS `ONLINECHECKSTATE`,`mec_itm_item`.`SELLINGSTATE` AS `SELLINGSTATE`,`mec_itm_item`.`TITLE` AS `TITLE`,`mec_itm_item`.`SCORE` AS `SCORE`,`mec_itm_item`.`SCOREPOPULARITY` AS `SCOREPOPULARITY`,`mec_itm_item`.`PURCHASE` AS `PURCHASE`,`mec_itm_item`.`PURCHASEPOPULARITY` AS `PURCHASEPOPULARITY`,`mec_itm_item`.`PRAISERATE` AS `PRAISERATE`,`mec_itm_item`.`ONLINETIME` AS `ONLINETIME`,`hct_brand`.`BRANDNAME` AS `BRANDNAME`,`hct_merchant`.`MERCHANTNAME` AS `MERCHANTNAME`,`hsy_agent`.`AGENTNAME` AS `AGENTNAME`,`hsy_itemtype`.`ITEMTYPENAME` AS `ITEMTYPENAME`,`hsy_retailtype`.`RETAILTYPENAME` AS `RETAILTYPENAME` from (((((`mec_itm_item` left join `hct_brand` on((`mec_itm_item`.`BRANDCODE` = `hct_brand`.`BRANDCODE`))) left join `hct_merchant` on((`mec_itm_item`.`MERCHANTCODE` = `hct_merchant`.`MERCHANTCODE`))) left join `hsy_agent` on((`mec_itm_item`.`AGENTCODE` = `hsy_agent`.`AGENTCODE`))) left join `hsy_itemtype` on((`mec_itm_item`.`ITEMTYPECODE` = `hsy_itemtype`.`ITEMTYPECODE`))) left join `hsy_retailtype` on((`mec_itm_item`.`RETAILTYPECODE` = `hsy_retailtype`.`RETAILTYPECODE`))) where (`mec_itm_item`.`CHECKSTATE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mec_vi_sku_total_counternum`
--

/*!50001 DROP VIEW IF EXISTS `mec_vi_sku_total_counternum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mec_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mec_vi_sku_total_counternum` AS select `mec_itm_storeitem`.`ITEMCODE` AS `ITEMCODE`,count(`mec_itm_storeitem`.`COUNTERCODE`) AS `COUNTERNUM` from `mec_itm_storeitem` where (`mec_itm_storeitem`.`CHECKSTATE` = 1) group by `mec_itm_storeitem`.`ITEMCODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;




-- generate system meta data

LOCK TABLES `mec`.`mec_adm_admin` WRITE;
/*!40000 ALTER TABLE `mec`.`mec_adm_admin` DISABLE KEYS */;
INSERT INTO `mec`.`mec_adm_admin` VALUES('superadmin',9,NULL,NULL,NULL,NULL,NULL,NULL,'c80dc34eb38f0d5052ade43ae2ba51d563c8ae297762960613110fc6af1602aa','cd69df65ac0bb4532a444af99ca2cc36',1,NULL,'2015-07-01 00:00:00','2015-07-01 00:00:00');
/*!40000 ALTER TABLE `mec`.`mec_adm_admin` ENABLE KEYS */;

LOCK TABLES `mec`.`mec_sys_businesssetting` WRITE;
/*!40000 ALTER TABLE `mec`.`mec_sys_businesssetting` DISABLE KEYS */;
INSERT INTO `mec`.`mec_sys_businesssetting`(`KEY`,`VALUE`,`createdAt`,`updatedAt`)VALUES('paymentExpireTime',1,'2015-07-01 00:00:00','2015-07-01 00:00:00');
/*!40000 ALTER TABLE `mec`.`mec_sys_businesssetting` ENABLE KEYS */;

UNLOCK TABLES;
 
-- end db schema