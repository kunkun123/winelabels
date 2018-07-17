-- ************************************************************
-- Sequel Pro SQL dump
-- Version 4541
--
-- http://www.sequelpro.com/
-- https://github.com/sequelpro/sequelpro
--
-- Host: 127.0.0.1 (MySQL 5.7.18)
-- Database: gecko_framework
-- Generation Time: 2017-09-04 08:28:21 +0000
-- ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump of table system_account_resources
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_account_resources`;

CREATE TABLE `system_account_resources` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) NOT NULL,
  `resource_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ;



-- Dump of table system_account_roles
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_account_roles`;

CREATE TABLE `system_account_roles` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_account_roles` WRITE;
/*!40000 ALTER TABLE `system_account_roles` DISABLE KEYS */;

INSERT INTO `system_account_roles` (`id`, `account_id`, `role_id`)
VALUES
	(0,'0','0'),
	(1,'c32600e0da054919b5c7ac3ae82977e9','0');

/*!40000 ALTER TABLE `system_account_roles` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_accounts
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_accounts`;

CREATE TABLE `system_accounts` (
  `id` varchar(32) NOT NULL,
  `real_name` varchar(32) NOT NULL DEFAULT '',
  `principal` varchar(50) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `credential` varchar(50) DEFAULT '',
  `locked` int(11) DEFAULT NULL,
  `salt` varchar(50) DEFAULT '',
  `mobile_phone` varchar(50) DEFAULT NULL,
  `tel_phone` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `principal` (`principal`)
) ;

LOCK TABLES `system_accounts` WRITE;
/*!40000 ALTER TABLE `system_accounts` DISABLE KEYS */;

INSERT INTO `system_accounts` (`id`, `real_name`, `principal`, `gender`, `credential`, `locked`, `salt`, `mobile_phone`, `tel_phone`, `qq`, `email`, `create_time`)
VALUES
	('0','超管-SuperAdmin','admin','1','123456',0,'','0000000','0000000','000000','admin@fakemail.none','2017-09-04 16:26:01'),
	('016b776e4af44bc085ce204eb6baa646','宁富纯','ningfuchun','1','123456',0,'','1234567890123','88888888','123456','ningfuchun@mail.com','2017-05-19 22:11:41'),
	('06dd62e1b97c49548787fa42b0b0df29','何祺祺','hezuozuo','2','123456',0,'','1234567890123','88888888','123456','hezuozuo@mail.com','2017-05-19 22:11:41'),
	('19a6bf8097674551862827135de2801b','陆蕴莹','luyunying','2','123456',0,'','1234567890123','88888888','123456','luyunying@mail.com','2017-05-19 22:11:41'),
	('211cf634ca034b2482044945bbaa7254','赖绮情','laizuoqing','2','123456',0,'','1234567890123','88888888','123456','laizuoqing@mail.com','2017-05-19 22:11:41'),
	('4d6dc8031e7349c489b2eb14c7918c92','佘斌','zuobin','1','123456',0,'','1234567890123','88888888','123456','zuobin@mail.com','2017-05-19 22:11:41'),
	('8170e61abec34151baa3fd30cb551f7d','王鹏','wangpeng','1','123456',0,'','12345678','88888888','123456','wangpeng@mail.com','2017-05-19 22:11:41'),
	('b4123e00d6f14adb89de71af73783e50','毕结维','bijiewei','1','123456',0,'','1234567890123','88888888','123456','bijiewei@mail.com','2017-05-19 22:11:41'),
	('b5b426929b464bd49d2bb9dee5bc4730','张茂海','zhangmaohai','1','123456',0,'','1234567890123','88888888','123456','zhangmaohai@mail.com','2017-05-19 22:11:41'),
	('bc4010c1261c41de9aef9992090be014','罗晓东','luoxiaodong','1','123456',0,'','1234567890123','88888888','123456','luoxiaodong@mail.com','2017-05-19 22:11:41'),
	('c32600e0da054919b5c7ac3ae82977e9','朱旭岗111','zhuxugang','1','123456',0,'','1888888880123','188888888','123456','zhuxugang@mail.com','2017-05-18 16:04:01'),
	('c5ace3ee595449b3a5583218bc918dc7','sdasdf','sdfasdf','1','asdfsdf',1,'adfadsf','1212222','sdfasdf','122','xga@ggg.com','2017-09-01 17:04:09'),
	('f37107f0368f4e74b9e6c44ed62ec855','陈瑞丽','chenruili','2','123456',0,'','1234567890123','88888888','123456','chenruili@mail.com','2017-05-19 22:11:41'),
	('fbcdee0cc4b340b88a77b36987bbd468','黄春燕','huangchunyan','2','123456',0,'','1234567890123','88888888','123456','huangchunyan@mail.com','2017-05-19 22:11:41');

/*!40000 ALTER TABLE `system_accounts` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_authorities
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_authorities`;

CREATE TABLE `system_authorities` (
  `id` varchar(32) NOT NULL,
  `authority_type` varchar(10) NOT NULL,
  `authority_code` varchar(50) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  `resource` varchar(50) NOT NULL,
  `sort_index` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_authorities` WRITE;
/*!40000 ALTER TABLE `system_authorities` DISABLE KEYS */;

INSERT INTO `system_authorities` (`id`, `authority_type`, `authority_code`, `authority_name`, `resource`, `sort_index`)
VALUES
	('100100','1','GECKO_SYSTEM_AUTHORITY_QUERY','权限管理查询','100100',3),
	('100101','1','GECKO_SYSTEM_AUTHORITY_VIEW','权限管理查看','100100',2),
	('100102','1','GECKO_SYSTEM_AUTHORITY_NEW','权限管理新建','100100',3),
	('100103','1','GECKO_SYSTEM_AUTHORITY_EDIT','权限管理编辑','100100',4),
	('100104','1','GECKO_SYSTEM_AUTHORITY_DELETE','权限管理删除','100100',5),
	('100105','1','GECKO_SYSTEM_AUTHORITY_EXPORT','权限管理导出','100100',6),
	('100300','1','GECKO_SYSTEM_ACCOUNT_QUERY','账号管理查询','100300',1),
	('100301','1','GECKO_SYSTEM_ACCOUNT_VIEW','账号管理查看','100300',2),
	('100302','1','GECKO_SYSTEM_ACCOUNT_NEW','账号管理新建','100300',3),
	('100303','1','GECKO_SYSTEM_ACCOUNT_EDIT','账号管理编辑','100300',4),
	('100304','1','GECKO_SYSTEM_ACCOUNT_DELETE','账号管理删除','100300',5),
	('100305','1','GECKO_SYSTEM_ACCOUNT_EXPORT','账号管理导出','100300',6),
	('100500','1','GECKO_SYSTEM_RESOURCES_QUERY','资源管理查询','100500',1),
	('100501','1','GECKO_SYSTEM_RESOURCES_VIEW','资源管理查看','100500',2),
	('100502','1','GECKO_SYSTEM_RESOURCES_NEW','资源管理新建','100500',3),
	('100503','1','GECKO_SYSTEM_RESOURCES_EDIT','资源管理编辑','100500',4),
	('100504','1','GECKO_SYSTEM_RESOURCES_DELETE','资源管理删除','100500',5),
	('100505','1','GECKO_SYSTEM_RESOURCES_EXPORT','资源管理导出','100500',6),
	('100700','1','GECKO_SYSTEM_ACCOUNTRESOURCE_QUERY','用户资源查询','100700',1),
	('100701','1','GECKO_SYSTEM_ACCOUNTRESOURCE_VIEW','用户资源查看','100700',2),
	('100702','1','GECKO_SYSTEM_ACCOUNTRESOURCE_NEW','用户资源新建','100700',3),
	('100703','1','GECKO_SYSTEM_ACCOUNTRESOURCE_EDIT','用户资源编辑','100700',4),
	('100704','1','GECKO_SYSTEM_ACCOUNTRESOURCE_DELETE','用户资源删除','100700',5),
	('100705','1','GECKO_SYSTEM_ACCOUNTRESOURCE_EXPORT','用户资源导出','100700',6),
	('100900','1','GECKO_SYSTEM_ACCOUNTROLE_QUERY','用户角色查询','100900',1),
	('100901','1','GECKO_SYSTEM_ACCOUNTROLE_VIEW','用户角色查看','100900',2),
	('100902','1','GECKO_SYSTEM_ACCOUNTROLE_NEW','用户角色新建','100900',3),
	('100903','1','GECKO_SYSTEM_ACCOUNTROLE_EDIT','用户角色编辑','100900',4),
	('100904','1','GECKO_SYSTEM_ACCOUNTROLE_DELETE','用户角色删除','100900',5),
	('100905','1','GECKO_SYSTEM_ACCOUNTROLE_EXPORT','用户角色导出','100900',6),
	('101100','1','GECKO_SYSTEM_DICTIONARY_QUERY','字典管理查询','101100',1),
	('101101','1','GECKO_SYSTEM_DICTIONARY_VIEW','字典管理查看','101100',2),
	('101102','1','GECKO_SYSTEM_DICTIONARY_NEW','字典管理新建','101100',3),
	('101103','1','GECKO_SYSTEM_DICTIONARY_EDIT','字典管理编辑','101100',4),
	('101104','1','GECKO_SYSTEM_DICTIONARY_DELETE','字典管理删除','101100',5),
	('101105','1','GECKO_SYSTEM_DICTIONARY_EXPORT','字典管理导出','101100',6),
	('101300','1','GECKO_SYSTEM_DICTIONARYTYPE_QUERY','字典类型管理查询','101300',1),
	('101301','1','GECKO_SYSTEM_DICTIONARYTYPE_VIEW','字典类型管理查看','101300',2),
	('101302','1','GECKO_SYSTEM_DICTIONARYTYPE_NEW','字典类型管理新建','101300',3),
	('101303','1','GECKO_SYSTEM_DICTIONARYTYPE_EDIT','字典类型管理编辑','101300',4),
	('101304','1','GECKO_SYSTEM_DICTIONARYTYPE_DELETE','字典类型管理删除','101300',5),
	('101305','1','GECKO_SYSTEM_DICTIONARYTYPE_EXPORT','字典类型管理导出','101300',6),
	('101500','1','GECKO_SYSTEM_LOG_QUERY','日志管理查询','101500',1),
	('101501','1','GECKO_SYSTEM_LOG_VIEW','日志管理查看','101500',2),
	('101502','1','GECKO_SYSTEM_LOG_NEW','日志管理新建','101500',3),
	('101503','1','GECKO_SYSTEM_LOG_EDIT','日志管理编辑','101500',4),
	('101504','1','GECKO_SYSTEM_LOG_DELETE','日志管理删除','101500',5),
	('101505','1','GECKO_SYSTEM_LOG_EXPORT','日志管理导出','101500',6),
	('101700','1','GECKO_SYSTEM_ORGNIZATION_QUERY','机构管理查询','101700',1),
	('101701','1','GECKO_SYSTEM_ORGNIZATION_VIEW','机构管理查看','101700',2),
	('101702','1','GECKO_SYSTEM_ORGNIZATION_NEW','机构管理新建','101700',3),
	('101703','1','GECKO_SYSTEM_ORGNIZATION_EDIT','机构管理编辑','101700',4),
	('101704','1','GECKO_SYSTEM_ORGNIZATION_DELETE','机构管理删除','101700',5),
	('101705','1','GECKO_SYSTEM_ORGNIZATION_EXPORT','机构管理导出','101700',6),
	('102100','1','GECKO_SYSTEM_ROLE_QUERY','角色管理查询','102100',1),
	('102101','1','GECKO_SYSTEM_ROLE_VIEW','角色管理查看','102100',2),
	('102102','1','GECKO_SYSTEM_ROLE_NEW','角色管理新建','102100',3),
	('102103','1','GECKO_SYSTEM_ROLE_EDIT','角色管理编辑','102100',4),
	('102104','1','GECKO_SYSTEM_ROLE_DELETE','角色管理删除','102100',5),
	('102105','1','GECKO_SYSTEM_ROLE_EXPORT','角色管理导出','102100',6),
	('102700','1','GECKO_SYSTEM_ORGACCOUNT_QUERY','账户与机构查询','102700',1),
	('102701','1','GECKO_SYSTEM_ORGACCOUNT_VIEW','账户与机构查看','102700',2),
	('102702','1','GECKO_SYSTEM_ORGACCOUNT_NEW','账户与机构新建','102700',3),
	('102703','1','GECKO_SYSTEM_ORGACCOUNT_EDIT','账户与机构编辑','102700',4),
	('102704','1','GECKO_SYSTEM_ORGACCOUNT_DELETE','账户与机构删除','102700',5),
	('102705','1','GECKO_SYSTEM_ORGACCOUNT_EXPORT','账户与机构导出','102700',6),
	('102900','1','GECKO_SYSTEM_ROLEAUTHORITY_QUERY','角色与权限查询','102900',1),
	('102901','1','GECKO_SYSTEM_ROLEAUTHORITY_VIEW','角色与权限查看','102900',2),
	('102902','1','GECKO_SYSTEM_ROLEAUTHORITY_NEW','角色与权限新建','102900',3),
	('102903','1','GECKO_SYSTEM_ROLEAUTHORITY_EDIT','角色与权限编辑','102900',4),
	('102904','1','GECKO_SYSTEM_ROLEAUTHORITY_DELETE','角色与权限删除','102900',5),
	('102905','1','GECKO_SYSTEM_ROLEAUTHORITY_EXPORT','角色与权限导出','102900',6),
	('103100','1','GECKO_SYSTEM_DUTY_QUERY','职务查询','103100',1),
	('103101','1','GECKO_SYSTEM_DUTY_VIEW','职务查看','103100',2),
	('103102','1','GECKO_SYSTEM_DUTY_NEW','职务新建','103100',3),
	('103103','1','GECKO_SYSTEM_DUTY_EDIT','职务编辑','103100',4),
	('103104','1','GECKO_SYSTEM_DUTY_DELETE','职务删除','103100',5),
	('103105','1','GECKO_SYSTEM_DUTY_EXPORT','职务导出','103100',6),
	('103300','1','GECKO_SYSTEM_POSITION_QUERY','岗位查询','103300',1),
	('103301','1','GECKO_SYSTEM_POSITION_VIEW','岗位查看','103300',2),
	('103302','1','GECKO_SYSTEM_POSITION_NEW','岗位新建','103300',3),
	('103303','1','GECKO_SYSTEM_POSITION_EDIT','岗位编辑','103300',4),
	('103304','1','GECKO_SYSTEM_POSITION_DELETE','岗位删除','103300',5),
	('103305','1','GECKO_SYSTEM_POSITION_EXPORT','岗位导出','103300',6),
	('103500','1','GECKO_SYSTEM_ACCOUNTDUTY_QUERY','账户职务查询','103500',1),
	('103501','1','GECKO_SYSTEM_ACCOUNTDUTY_VIEW','账户职务查看','103500',2),
	('103502','1','GECKO_SYSTEM_ACCOUNTDUTY_NEW','账户职务新建','103500',3),
	('103503','1','GECKO_SYSTEM_ACCOUNTDUTY_EDIT','账户职务编辑','103500',4),
	('103504','1','GECKO_SYSTEM_ACCOUNTDUTY_DELETE','账户职务删除','103500',5),
	('103505','1','GECKO_SYSTEM_ACCOUNTDUTY_EXPORT','账户职务导出','103500',6),
	('103700','1','GECKO_SYSTEM_ACCOUNTPOSITION_QUERY','账户岗位查询','103700',1),
	('103701','1','GECKO_SYSTEM_ACCOUNTPOSITION_VIEW','账户岗位查看','103700',2),
	('103702','1','GECKO_SYSTEM_ACCOUNTPOSITION_NEW','账户岗位新建','103700',3),
	('103703','1','GECKO_SYSTEM_ACCOUNTPOSITION_EDIT','账户岗位编辑','103700',4),
	('103704','1','GECKO_SYSTEM_ACCOUNTPOSITION_DELETE','账户岗位删除','103700',5),
	('103705','1','GECKO_SYSTEM_ACCOUNTPOSITION_EXPORT','账户岗位导出','103700',6),
	('b6be10db2a104104b1b5f000676ede5d','2','GECKO_SYSTEM_TEST_ONLY','测试111','1001033',13),
	('b7d8cb23f0504f43a9325c7f34b8cef3','2','GECKO_SYSTEM_','dfasdfas','100111',1);

/*!40000 ALTER TABLE `system_authorities` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_dictionaries
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_dictionaries`;

CREATE TABLE `system_dictionaries` (
  `id` varchar(32) NOT NULL,
  `dic_code` varchar(50) NOT NULL,
  `dic_name` varchar(50) NOT NULL,
  `discription` varchar(50) DEFAULT NULL,
  `sort_index` double DEFAULT NULL,
  `dictionary_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ;



-- Dump of table system_dictionary_types
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_dictionary_types`;

CREATE TABLE `system_dictionary_types` (
  `id` varchar(200) NOT NULL,
  `dic_type_code` varchar(50) NOT NULL,
  `dic_type_name` varchar(50) NOT NULL,
  `dic_type_class` varchar(200) NOT NULL,
  `discription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dic_type_code` (`dic_type_code`)
) ;

LOCK TABLES `system_dictionary_types` WRITE;
/*!40000 ALTER TABLE `system_dictionary_types` DISABLE KEYS */;

INSERT INTO `system_dictionary_types` (`id`, `dic_type_code`, `dic_type_name`, `dic_type_class`, `discription`)
VALUES
	('org.gecko.framework.system.entity.enums.Gender','GENDER','性别','org.gecko.framework.system.entity.enums.Gender','性别');

/*!40000 ALTER TABLE `system_dictionary_types` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_duties
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_duties`;

CREATE TABLE `system_duties` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ;



-- Dump of table system_duty_account
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_duty_account`;

CREATE TABLE `system_duty_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `duty_id` varchar(64) NOT NULL DEFAULT '',
  `account_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ;



-- Dump of table system_logs
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_logs`;

CREATE TABLE `system_logs` (
  `id` varchar(32) NOT NULL,
  `content` blob NOT NULL,
  `current_user_name` varchar(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `log_level` varchar(50) NOT NULL,
  `record_time` datetime NOT NULL,
  `request_url` varchar(50) NOT NULL,
  `request_params` varchar(2000) DEFAULT NULL,
  `return_value` varchar(5000) DEFAULT NULL,
  `call_method` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_logs` WRITE;
/*!40000 ALTER TABLE `system_logs` DISABLE KEYS */;

INSERT INTO `system_logs` (`id`, `content`, `current_user_name`, `ip`, `log_level`, `record_time`, `request_url`, `request_params`, `return_value`, `call_method`)
VALUES
	('02efa2a96a4d4b03b89d5cedb3be843e','','zhuxugang','127.0.0.1','1','2017-05-15 19:52:05','http://localhost:8080/order/cart/list',NULL,NULL,NULL),
	('5080a7fd54e44e22a430ea48f3c38e2f',X'636F6E746E6574','zhuxugang','127.0.0.1','1','2017-05-24 17:18:37','http://localhost:8080/order/cart/list',NULL,NULL,NULL),
	('53065b0f57754338b059eb5a729216c7',X'636F6E746E6574','zhuxugang','127.0.0.1','1','2017-05-27 16:01:39','http://localhost:8080/order/cart/list',NULL,NULL,NULL),
	('91b46007ba2f4a7380952b8e02c0bcbe','','zhuxugang','127.0.0.1','1','2017-05-15 19:49:49','http://localhost:8080/order/cart/list',NULL,NULL,NULL),
	('93d33d39349a42deb570c6d759da78c0',X'636F6E746E6574','zhuxugang','127.0.0.1','1','2017-05-27 16:04:31','http://localhost:8080/order/cart/list',NULL,NULL,NULL),
	('dc8ebd3283dc4141927942fedd70543e','','zhuxugang','127.0.0.1','1','2017-05-15 19:55:52','http://localhost:8080/order/cart/list','{\"first\":1,\"hasNext\":false,\"hasPrev\":false,\"nextPage\":1,\"orders\":[],\"pageNumber\":1,\"pageSize\":10,\"prevPage\":1,\"result\":[],\"totalCount\":-1,\"totalPages\":-1}, {}, ','{\"data\":{\"first\":1,\"hasNext\":true,\"hasPrev\":false,\"nextPage\":2,\"orders\":[],\"pageNumber\":1,\"pageSize\":10,\"prevPage\":1,\"result\":[{\"amount\":654992.3925348459,\"blobfile\":\"2YrLqQI4XFCM+KLLAYEzKakWC0UD0dv+h4I8zlPdjfu32dRVUtjer8mToEqWq78J0RGzunrhTNJuGowIV0Fxf18K3OfC+U3S75RNxntmlsG31BVu95tL5ZP03qCn+NddsLGsKw==\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"17518b7d9db24eed9f58c69905923f56\",\"name\":\"谯璛责\"},{\"amount\":1111111,\"blobfile\":\"b2Vyd29lcnF3ZW8z\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"270468ae6d2144388ffd0f856bcd0b40\",\"name\":\"U斉盙蜣缜\"},{\"amount\":524932.1093849303,\"blobfile\":\"c2Rmc2FkZnNhZGY=\",\"gender\":\"MAN\",\"gender2\":\"WOMAN\",\"id\":\"34bfd2eaeec84a33a877291ab5084dd7\",\"name\":\"娄捺戹獫\"},{\"amount\":324050.355957837,\"blobfile\":\"c2Rmc2FkZnNhZGY=\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"572e776b2b9048c8b98565e5d8d680d1\",\"name\":\"搬毴\"},{\"amount\":475540.86581892485,\"blobfile\":\"qInAG+iDtaVIxMkwScbJDk95ZCvK33SeOXKMjuFtEf/s4IcgVpRol8lnxd+3NfEQXR6K467ITilxVKwzTfxnQpJe2N3NTTdhPoKx2Ve8rTVf9ViGyXuQysEjcyqd9Z6alN6TLg==\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"5b169bd67b80428fb5a46df2b898dc19\",\"name\":\"愺璧蜒癴淒\"},{\"amount\":61799.76297454492,\"blobfile\":\"eqmz+YjRgTmteby7PT2gKBdDY9pqKMDQRy1YUdbLMUZjxjaqihqiLE4KaSfOjRY5is5Ytp2jB8Od4ZdbvEprvQ7+Gh7XD9AAJwRRRlLRQTQikzfxsJt5rHFh9SLAJtcMOG2nEg==\",\"gender\":\"MAN\",\"gender2\":\"MAN\",\"id\":\"7b902c67de5c4df7b08e9847c136de8c\",\"name\":\"dddd\"},{\"amount\":1111111,\"blobfile\":\"b2Vyd29lcnF3ZW8z\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"9c40926bc0b7469c9f60794e05b29f8b\",\"name\":\"U猉輍矏\"},{\"amount\":290768.9599115695,\"blobfile\":\"c2Rmc2FkZnNhZGY=\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"a2108bbee29d4acda0830ea1316d2cdd\",\"name\":\"蹪\"},{\"amount\":354400.9820674351,\"blobfile\":\"c2Rmc2FkZnNhZGY=\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"d108a8ce6c1c488ebd252df9741052ac\",\"name\":\"佤闲寛荑僁殕\"},{\"amount\":889434.8489940865,\"blobfile\":\"c2Rmc2FkZnNhZGY=\",\"gender\":\"WOMAN\",\"gender2\":\"WOMAN\",\"id\":\"d6b2f0d7f6b64777838a077e574268c1\",\"name\":\"貍曌躨槔旻\"}],\"totalCount\":12,\"totalPages\":2},\"code\":0}','org.gecko.framework.order.controller.CartController.list'),
	('e869cd248df846adb5b74cac8a57338b',X'636F6E746E6574','zhuxugang','127.0.0.1','1','2017-06-09 14:42:29','http://localhost:8080/order/cart/list',NULL,NULL,NULL);

/*!40000 ALTER TABLE `system_logs` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_org_account
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_org_account`;

CREATE TABLE `system_org_account` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orgnization_id` varchar(50) NOT NULL,
  `account_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_org_account` WRITE;
/*!40000 ALTER TABLE `system_org_account` DISABLE KEYS */;

INSERT INTO `system_org_account` (`id`, `orgnization_id`, `account_id`)
VALUES
	(1,'1b9b64d30d334ef89653863ea47fdae3','0'),
	(2,'1b9b64d30d334ef89653863ea47fdae3','b4123e00d6f14adb89de71af73783e50'),
	(3,'1b9b64d30d334ef89653863ea47fdae3','f37107f0368f4e74b9e6c44ed62ec855'),
	(4,'1b9b64d30d334ef89653863ea47fdae3','06dd62e1b97c49548787fa42b0b0df29'),
	(5,'1b9b64d30d334ef89653863ea47fdae3','fbcdee0cc4b340b88a77b36987bbd468'),
	(6,'1b9b64d30d334ef89653863ea47fdae3','211cf634ca034b2482044945bbaa7254'),
	(7,'1b9b64d30d334ef89653863ea47fdae3','bc4010c1261c41de9aef9992090be014'),
	(8,'1b9b64d30d334ef89653863ea47fdae3','19a6bf8097674551862827135de2801b'),
	(9,'1b9b64d30d334ef89653863ea47fdae3','016b776e4af44bc085ce204eb6baa646'),
	(10,'1b9b64d30d334ef89653863ea47fdae3','9b18de0432194d69bea50ab1e198e7dc'),
	(11,'1b9b64d30d334ef89653863ea47fdae3','8170e61abec34151baa3fd30cb551f7d'),
	(12,'1b9b64d30d334ef89653863ea47fdae3','b5b426929b464bd49d2bb9dee5bc4730'),
	(13,'1b9b64d30d334ef89653863ea47fdae3','c32600e0da054919b5c7ac3ae82977e9'),
	(14,'1b9b64d30d334ef89653863ea47fdae3','4d6dc8031e7349c489b2eb14c7918c92');

/*!40000 ALTER TABLE `system_org_account` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_organizations
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_organizations`;

CREATE TABLE `system_organizations` (
  `id` varchar(32) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `org_code` varchar(50) DEFAULT NULL,
  `org_category` varchar(50) NOT NULL,
  `parent_org` varchar(50) DEFAULT NULL,
  `org_seq` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_organizations` WRITE;
/*!40000 ALTER TABLE `system_organizations` DISABLE KEYS */;

INSERT INTO `system_organizations` (`id`, `org_name`, `org_code`, `org_category`, `parent_org`, `org_seq`)
VALUES
	('015f51e870224bc2833ed9f8c76c4e9f','法规科','1','0','e782a562c79f492abe9e1c889203ac4c','e782a562c79f492abe9e1c889203ac4c.015f51e870224bc2833ed9f8c76c4e9f'),
	('0e1f952884c44036a4c62112e60d281c','注册科1111','21111','0','e782a562c79f492abe9e1c889203ac4c','e782a562c79f492abe9e1c889203ac4c.'),
	('1456782f74634f3abe71800778cc5849','鹤润工商所','3','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.1456782f74634f3abe71800778cc5849'),
	('1b9b64d30d334ef89653863ea47fdae3','荔湾分局','4','0','e782a562c79f492abe9e1c889203ac4c','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3'),
	('2232d4bb0aa245edbc767f5627d9e9b3','食品科','5','0','e782a562c79f492abe9e1c889203ac4c','e782a562c79f492abe9e1c889203ac4c.2232d4bb0aa245edbc767f5627d9e9b3'),
	('3498055c56544e44ba3c8763f4a8e04a','12122','2112312','0','015f51e870224bc2833ed9f8c76c4e9f','e782a562c79f492abe9e1c889203ac4c.015f51e870224bc2833ed9f8c76c4e9f.3498055c56544e44ba3c8763f4a8e04a'),
	('466ebd9b653b4f2994627b0c6bfa235f','冲口工商所','6','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.466ebd9b653b4f2994627b0c6bfa235f'),
	('4d1ba6ab7de3442386036709872001a4','东沙工商所','7','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.4d1ba6ab7de3442386036709872001a4'),
	('4ebde6c29321477fbb8772f90a2c7ef7','西湾工商所','7','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.4ebde6c29321477fbb8772f90a2c7ef7'),
	('504ac3e0751d4c00827250321a377518','黄少工商所','8','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.504ac3e0751d4c00827250321a377518'),
	('5686338bb8b145f29cf9c73d8af629e0','十甫工商所','9','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.5686338bb8b145f29cf9c73d8af629e0'),
	('5a05549e17d24f70a14dfba48220b19b','dsfasdfd','sfdsfds','0','2232d4bb0aa245edbc767f5627d9e9b3','e782a562c79f492abe9e1c889203ac4c.2232d4bb0aa245edbc767f5627d9e9b3.5a05549e17d24f70a14dfba48220b19b'),
	('605277aa282f4c9aab4899960fa7988d','长寿工商所','0','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.605277aa282f4c9aab4899960fa7988d'),
	('890272e06c71430bbdbe188e911f5168','龙湾工商所','3','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.890272e06c71430bbdbe188e911f5168'),
	('8cb574b8b1b24b9791f877e2b40b5f23','南岸工商所','5','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.8cb574b8b1b24b9791f877e2b40b5f23'),
	('908b7f5d3eb04f15a8136f88becc39af','东工商所','6','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.908b7f5d3eb04f15a8136f88becc39af'),
	('972f1c0e257c45c3bbeb86941be85f11','清平工商所','7','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.972f1c0e257c45c3bbeb86941be85f11'),
	('9e1332542f9646a189f26e9406b9b716','西华工商所','8','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.9e1332542f9646a189f26e9406b9b716'),
	('aedf6a0e49fc46bca2896dd2e854eec7','花地工商所','9','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.aedf6a0e49fc46bca2896dd2e854eec7'),
	('c6e35877bff44b0fa41708eccd9fe67d','消委会','3','0','e782a562c79f492abe9e1c889203ac4c','e782a562c79f492abe9e1c889203ac4c.c6e35877bff44b0fa41708eccd9fe67d'),
	('d9ccfc2e97f4470db1efb7946cdd9eeb','如意工商所','4','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.d9ccfc2e97f4470db1efb7946cdd9eeb'),
	('e782a562c79f492abe9e1c889203ac4c','广州市工商行政管理局','5','0',NULL,'e782a562c79f492abe9e1c889203ac4c'),
	('eb2d1b6f7c9e4aec85cf186893c2a564','茶湿工商所','6','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.eb2d1b6f7c9e4aec85cf186893c2a564'),
	('ec26730fce0f40dd96085626be3714a1','石围塘工商所','2','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.ec26730fce0f40dd96085626be3714a1'),
	('f3eb4718a0954d628f469743148f4187','周门工商所','3','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.f3eb4718a0954d628f469743148f4187'),
	('f6a403daaa25442b892a09486c394d4d','桥中工商所','4','0','1b9b64d30d334ef89653863ea47fdae3','e782a562c79f492abe9e1c889203ac4c.1b9b64d30d334ef89653863ea47fdae3.f6a403daaa25442b892a09486c394d4d'),
	('fba28d5458584179a86f377315ae5681','其他',NULL,'',NULL,'fba28d5458584179a86f377315ae5681'),
	('fba28d5458584179a86f377315ae568a','屠管大队','','0','e782a562c79f492abe9e1c889203ac4c','e782a562c79f492abe9e1c889203ac4c.fba28d5458584179a86f377315ae568a');

/*!40000 ALTER TABLE `system_organizations` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_position_account
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_position_account`;

CREATE TABLE `system_position_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` varchar(64) NOT NULL DEFAULT '',
  `position_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ;



-- Dump of table system_positions
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_positions`;

CREATE TABLE `system_positions` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ;



-- Dump of table system_resources
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_resources`;

CREATE TABLE `system_resources` (
  `id` varchar(32) NOT NULL,
  `source_name` varchar(50) NOT NULL,
  `resource_type` varchar(50) NOT NULL,
  `is_platform` int(11) NOT NULL DEFAULT '2',
  `parent_id` varchar(50) DEFAULT NULL,
  `resource_seq` varchar(500) DEFAULT NULL,
  `uri` varchar(50) DEFAULT '',
  `icon_cls` varchar(50) DEFAULT NULL,
  `sort_index` double DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_resources` WRITE;
/*!40000 ALTER TABLE `system_resources` DISABLE KEYS */;

INSERT INTO `system_resources` (`id`, `source_name`, `resource_type`, `is_platform`, `parent_id`, `resource_seq`, `uri`, `icon_cls`, `sort_index`, `available`, `description`)
VALUES
	('1','新菜单','2',1,NULL,NULL,NULL,'glyphicon glyphicon-link',0,1,NULL),
	('100000','系统管理','1',2,NULL,NULL,'',NULL,NULL,NULL,NULL),
	('100100','权限管理','1',1,'100000',NULL,'/mgr/views/system/authority/authority.html',NULL,NULL,1,NULL),
	('100300','账号分配','1',1,'100000',NULL,'/mgr/views/system/account/account.html','',NULL,1,NULL),
	('100301','账号管理','1',1,'100000',NULL,'/views/system/account/account.html','',NULL,1,NULL),
	('100500','菜单管理','1',1,'100000',NULL,'/mgr/views/system/resource/resource.html',NULL,NULL,1,'菜单管理，初始化默认数据'),
	('100900','角色管理','2',1,'100000',NULL,'/mgr/views/system/role/role.html','',NULL,1,NULL),
	('101700','机构管理','2',1,'100000',NULL,'/mgr/views/system/organization/org.html','',NULL,1,NULL),
	('103700','岗位相关','1',1,'100000',NULL,'/mgr/views/system/position/position.html','',NULL,NULL,NULL),
	('105a9bdb0ddf481689339d3523b22f7f','日志查询','1',0,'a5fac9c073044a23854065d9f802a6ea',NULL,'/mgr/mgr/platform/logquery','',0,1,NULL),
	('2111332220794094a7e7c4a22b3c0fd6','我的工作台','1',0,'-1',NULL,'/mgr/index.jsp','',0,1,NULL),
	('a5fac9c073044a23854065d9f802a6ea','平台管理','1',0,'100000',NULL,'/mgr/platform/','',0,1,NULL),
	('e568c909b50142c0a253ba2ad91fd345','系统监控','1',0,'a5fac9c073044a23854065d9f802a6ea',NULL,'/mgr/platform/monitor','',0,1,NULL),
	('e6426284e24a462b8c9788d5e8abf847','系统原型标准','1',0,'-1',NULL,'/mge','',0,1,NULL),
	('edbb446d98ac45a0b9e921da7e5e639c','权限字典','2',0,'100000',NULL,'/mgr/views/system/authority/authority.html','\"\"',0,1,NULL);

/*!40000 ALTER TABLE `system_resources` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_role_authority
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_role_authority`;

CREATE TABLE `system_role_authority` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) NOT NULL,
  `authority_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_role_authority` WRITE;
/*!40000 ALTER TABLE `system_role_authority` DISABLE KEYS */;

INSERT INTO `system_role_authority` (`id`, `role_id`, `authority_id`)
VALUES
	(118,'0','100100'),
	(119,'0','100101'),
	(120,'0','100102'),
	(121,'0','100103'),
	(122,'0','100104'),
	(123,'0','100105'),
	(124,'0','100300'),
	(125,'0','100301'),
	(126,'0','100302'),
	(127,'0','100303'),
	(128,'0','100304'),
	(129,'0','100305'),
	(130,'0','100500'),
	(131,'0','100501'),
	(132,'0','100502'),
	(133,'0','100503'),
	(134,'0','100504'),
	(135,'0','100505'),
	(136,'0','100700'),
	(137,'0','100701'),
	(138,'0','100702'),
	(139,'0','100703'),
	(140,'0','100704'),
	(141,'0','100705'),
	(142,'0','100900'),
	(143,'0','100901'),
	(144,'0','100902'),
	(145,'0','100903'),
	(146,'0','100904'),
	(147,'0','100905'),
	(148,'0','101700'),
	(149,'0','101701'),
	(150,'0','101702'),
	(151,'0','101703'),
	(152,'0','101704'),
	(153,'0','101705'),
	(154,'0','102100'),
	(155,'0','102101'),
	(156,'0','102102'),
	(157,'0','102103'),
	(158,'0','102104'),
	(159,'0','102105'),
	(160,'1','100100'),
	(161,'1','100101'),
	(162,'1','100102'),
	(163,'1','100103'),
	(164,'1','100104'),
	(165,'1','100105'),
	(166,'1','100300'),
	(167,'1','100301'),
	(168,'1','100302'),
	(169,'1','100303'),
	(170,'1','100304'),
	(171,'1','100305'),
	(172,'1','100900'),
	(173,'1','100901'),
	(174,'1','100902'),
	(175,'1','100903'),
	(176,'1','100904'),
	(177,'1','100905');

/*!40000 ALTER TABLE `system_role_authority` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump of table system_roles
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `system_roles`;

CREATE TABLE `system_roles` (
  `id` varchar(32) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `role_type` tinyint(2) DEFAULT NULL,
  `available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ;

LOCK TABLES `system_roles` WRITE;
/*!40000 ALTER TABLE `system_roles` DISABLE KEYS */;

INSERT INTO `system_roles` (`id`, `role_name`, `description`, `role_type`, `available`)
VALUES
	('0','超级管理员','系统管理员，设置角色，菜单',0,0),
	('1','管理员','系统所有功能权限，最高权限',1,1),
	('5','全城通办市局裁定11','',20,1),
	('6','名称自主申报审核','无',20,1);

/*!40000 ALTER TABLE `system_roles` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
