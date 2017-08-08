/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : root

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-08 12:53:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fn_1_block
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_block`;
CREATE TABLE `fn_1_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '资料块名称',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资料块表';

-- ----------------------------
-- Records of fn_1_block
-- ----------------------------
INSERT INTO `fn_1_block` VALUES ('1', '首页文本公告', 'FineCMS公益版v5.0正式上线了，全新内容管理设计，灵活，高负载|#009688\nFineCMS公益版永久免费开源，不计较版权，开源QQ群：8615168|red');
INSERT INTO `fn_1_block` VALUES ('3', '友情链接', 'http://www.finecms.net|公益版论坛\n	http://www.dayrui.com|天睿程序设计');
INSERT INTO `fn_1_block` VALUES ('4', '图片上传', '{i-4}:');

-- ----------------------------
-- Table structure for fn_1_category
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_category`;
CREATE TABLE `fn_1_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `domain` varchar(50) NOT NULL COMMENT '绑定域名',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of fn_1_category
-- ----------------------------
INSERT INTO `fn_1_category` VALUES ('1', '1', '0', 'news', '0', '植物', '', 'y', 'yejie', '', '0', '1', '0', '', '1', '', '', '{\"edit\":\"0\",\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"show_title\":\"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}\",\"list_title\":\"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\\u4e1a\\u754c\\u65b0\\u95fb\",\"list_description\":\"\\u4e1a\\u754c\\u65b0\\u95fb\\u63cf\\u8ff0\"},\"template\":{\"pagesize\":\"20\",\"show\":\"index.html\",\"category\":\"index.html\",\"list\":\"index.html\",\"search\":\"index.html\",\"page\":\"index.html\"},\"admin\":[],\"member\":[],\"html\":0,\"getchild\":0}', '0');

-- ----------------------------
-- Table structure for fn_1_form
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form`;
CREATE TABLE `fn_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='表单模型表';

-- ----------------------------
-- Records of fn_1_form
-- ----------------------------
INSERT INTO `fn_1_form` VALUES ('1', '留言', 'liuyan', '{\"post\":\"1\",\"code\":\"1\",\"send\":\"\",\"template\":\"\",\"rt_url\":\"\"}');

-- ----------------------------
-- Table structure for fn_1_form_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form_liuyan`;
CREATE TABLE `fn_1_form_liuyan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `neirong` mediumtext,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留言表单表';

-- ----------------------------
-- Records of fn_1_form_liuyan
-- ----------------------------

-- ----------------------------
-- Table structure for fn_1_form_liuyan_data_0
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form_liuyan_data_0`;
CREATE TABLE `fn_1_form_liuyan_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表单附表';

-- ----------------------------
-- Records of fn_1_form_liuyan_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for fn_1_index
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_index`;
CREATE TABLE `fn_1_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of fn_1_index
-- ----------------------------
INSERT INTO `fn_1_index` VALUES ('1', '1', 'news', '7', '9', '1491960567');
INSERT INTO `fn_1_index` VALUES ('2', '1', 'news', '7', '9', '1491960680');
INSERT INTO `fn_1_index` VALUES ('3', '1', 'news', '7', '9', '1491960733');
INSERT INTO `fn_1_index` VALUES ('4', '1', 'news', '7', '9', '1491960798');
INSERT INTO `fn_1_index` VALUES ('5', '1', 'news', '7', '9', '1491961512');
INSERT INTO `fn_1_index` VALUES ('6', '1', 'news', '7', '9', '1491961527');
INSERT INTO `fn_1_index` VALUES ('7', '1', 'news', '7', '9', '1491961540');
INSERT INTO `fn_1_index` VALUES ('8', '1', 'news', '7', '9', '1491961552');
INSERT INTO `fn_1_index` VALUES ('9', '1', 'news', '7', '9', '1491961566');
INSERT INTO `fn_1_index` VALUES ('10', '1', 'news', '7', '9', '1491961772');
INSERT INTO `fn_1_index` VALUES ('11', '1', 'news', '8', '9', '1491961788');
INSERT INTO `fn_1_index` VALUES ('12', '1', 'news', '8', '9', '1491961810');
INSERT INTO `fn_1_index` VALUES ('13', '1', 'news', '8', '9', '1491961819');
INSERT INTO `fn_1_index` VALUES ('14', '1', 'news', '8', '9', '1491961830');
INSERT INTO `fn_1_index` VALUES ('15', '1', 'news', '8', '9', '1491961842');
INSERT INTO `fn_1_index` VALUES ('16', '1', 'news', '8', '9', '1491961853');
INSERT INTO `fn_1_index` VALUES ('17', '1', 'news', '8', '9', '1491961865');
INSERT INTO `fn_1_index` VALUES ('18', '1', 'news', '8', '9', '1491961874');
INSERT INTO `fn_1_index` VALUES ('19', '1', 'news', '8', '9', '1491961886');
INSERT INTO `fn_1_index` VALUES ('20', '1', 'news', '8', '9', '1491961901');
INSERT INTO `fn_1_index` VALUES ('21', '1', 'news', '9', '9', '1491961919');
INSERT INTO `fn_1_index` VALUES ('22', '1', 'news', '9', '9', '1491961968');
INSERT INTO `fn_1_index` VALUES ('23', '1', 'news', '9', '9', '1491961979');
INSERT INTO `fn_1_index` VALUES ('24', '1', 'news', '9', '9', '1491961989');
INSERT INTO `fn_1_index` VALUES ('25', '1', 'news', '9', '9', '1491962001');
INSERT INTO `fn_1_index` VALUES ('26', '1', 'news', '9', '9', '1491962013');
INSERT INTO `fn_1_index` VALUES ('27', '1', 'news', '9', '9', '1491962025');
INSERT INTO `fn_1_index` VALUES ('28', '1', 'news', '9', '9', '1491962036');
INSERT INTO `fn_1_index` VALUES ('29', '1', 'news', '9', '9', '1491962048');
INSERT INTO `fn_1_index` VALUES ('30', '1', 'news', '9', '9', '1491962065');
INSERT INTO `fn_1_index` VALUES ('31', '1', 'news', '2', '9', '1491962157');
INSERT INTO `fn_1_index` VALUES ('32', '1', 'news', '2', '9', '1491962218');
INSERT INTO `fn_1_index` VALUES ('33', '1', 'news', '2', '9', '1491962231');
INSERT INTO `fn_1_index` VALUES ('34', '1', 'news', '2', '9', '1491962243');
INSERT INTO `fn_1_index` VALUES ('35', '1', 'news', '2', '9', '1491962255');
INSERT INTO `fn_1_index` VALUES ('36', '1', 'news', '2', '9', '1491962288');
INSERT INTO `fn_1_index` VALUES ('37', '1', 'news', '2', '9', '1491962297');
INSERT INTO `fn_1_index` VALUES ('38', '1', 'news', '2', '9', '1491962307');
INSERT INTO `fn_1_index` VALUES ('39', '1', 'news', '2', '9', '1491962318');
INSERT INTO `fn_1_index` VALUES ('40', '1', 'news', '2', '9', '1491962330');
INSERT INTO `fn_1_index` VALUES ('41', '1', 'news', '10', '9', '1491962345');
INSERT INTO `fn_1_index` VALUES ('42', '1', 'news', '10', '9', '1491962366');
INSERT INTO `fn_1_index` VALUES ('43', '1', 'news', '10', '9', '1491962376');
INSERT INTO `fn_1_index` VALUES ('44', '1', 'news', '10', '9', '1491962387');
INSERT INTO `fn_1_index` VALUES ('45', '1', 'news', '10', '9', '1491962400');
INSERT INTO `fn_1_index` VALUES ('46', '1', 'news', '10', '9', '1491962414');
INSERT INTO `fn_1_index` VALUES ('47', '1', 'news', '10', '9', '1491962433');
INSERT INTO `fn_1_index` VALUES ('48', '1', 'news', '10', '9', '1491962449');
INSERT INTO `fn_1_index` VALUES ('49', '1', 'news', '10', '9', '1491962464');
INSERT INTO `fn_1_index` VALUES ('50', '1', 'news', '10', '9', '1491962491');
INSERT INTO `fn_1_index` VALUES ('51', '1', 'news', '11', '9', '1491962512');
INSERT INTO `fn_1_index` VALUES ('52', '1', 'news', '11', '9', '1491962537');
INSERT INTO `fn_1_index` VALUES ('53', '1', 'news', '11', '9', '1491962548');
INSERT INTO `fn_1_index` VALUES ('54', '1', 'news', '11', '9', '1491962560');
INSERT INTO `fn_1_index` VALUES ('55', '1', 'news', '11', '9', '1491962573');
INSERT INTO `fn_1_index` VALUES ('56', '1', 'news', '11', '9', '1491962585');
INSERT INTO `fn_1_index` VALUES ('57', '1', 'news', '11', '9', '1491962601');
INSERT INTO `fn_1_index` VALUES ('58', '1', 'news', '11', '9', '1491962613');
INSERT INTO `fn_1_index` VALUES ('59', '1', 'news', '11', '9', '1491962627');
INSERT INTO `fn_1_index` VALUES ('60', '1', 'news', '11', '9', '1491962640');
INSERT INTO `fn_1_index` VALUES ('61', '1', 'news', '12', '9', '1491962660');
INSERT INTO `fn_1_index` VALUES ('62', '1', 'news', '12', '9', '1491962681');
INSERT INTO `fn_1_index` VALUES ('63', '1', 'news', '12', '9', '1491962694');
INSERT INTO `fn_1_index` VALUES ('64', '1', 'news', '12', '9', '1491962703');
INSERT INTO `fn_1_index` VALUES ('65', '1', 'news', '12', '9', '1491962715');
INSERT INTO `fn_1_index` VALUES ('66', '1', 'news', '12', '9', '1491962731');
INSERT INTO `fn_1_index` VALUES ('67', '1', 'news', '12', '9', '1491962742');
INSERT INTO `fn_1_index` VALUES ('68', '1', 'news', '12', '9', '1491962758');
INSERT INTO `fn_1_index` VALUES ('69', '1', 'news', '12', '9', '1491962768');
INSERT INTO `fn_1_index` VALUES ('70', '1', 'news', '12', '9', '1491962780');
INSERT INTO `fn_1_index` VALUES ('71', '1', 'news', '13', '9', '1491962798');
INSERT INTO `fn_1_index` VALUES ('72', '1', 'news', '13', '9', '1491962819');
INSERT INTO `fn_1_index` VALUES ('73', '1', 'news', '13', '9', '1491962830');
INSERT INTO `fn_1_index` VALUES ('74', '1', 'news', '13', '9', '1491962843');
INSERT INTO `fn_1_index` VALUES ('75', '1', 'news', '13', '9', '1491962852');
INSERT INTO `fn_1_index` VALUES ('76', '1', 'news', '13', '9', '1491962861');
INSERT INTO `fn_1_index` VALUES ('77', '1', 'news', '13', '9', '1491962871');
INSERT INTO `fn_1_index` VALUES ('78', '1', 'news', '13', '9', '1491962881');
INSERT INTO `fn_1_index` VALUES ('79', '1', 'news', '13', '9', '1491962890');
INSERT INTO `fn_1_index` VALUES ('80', '1', 'news', '13', '9', '1491962902');
INSERT INTO `fn_1_index` VALUES ('81', '1', 'news', '14', '9', '1491962962');
INSERT INTO `fn_1_index` VALUES ('82', '1', 'news', '14', '9', '1491962977');
INSERT INTO `fn_1_index` VALUES ('83', '1', 'news', '14', '9', '1491962988');
INSERT INTO `fn_1_index` VALUES ('84', '1', 'news', '14', '9', '1491962997');
INSERT INTO `fn_1_index` VALUES ('85', '1', 'news', '14', '9', '1491963009');
INSERT INTO `fn_1_index` VALUES ('86', '1', 'news', '14', '9', '1491963018');
INSERT INTO `fn_1_index` VALUES ('87', '1', 'news', '14', '9', '1491963028');
INSERT INTO `fn_1_index` VALUES ('88', '1', 'news', '14', '9', '1491963040');
INSERT INTO `fn_1_index` VALUES ('89', '1', 'news', '14', '9', '1491963052');
INSERT INTO `fn_1_index` VALUES ('90', '1', 'news', '14', '9', '1491963164');
INSERT INTO `fn_1_index` VALUES ('91', '1', 'news', '15', '9', '1491963194');
INSERT INTO `fn_1_index` VALUES ('92', '1', 'news', '15', '9', '1491963214');
INSERT INTO `fn_1_index` VALUES ('93', '1', 'news', '15', '9', '1491963225');
INSERT INTO `fn_1_index` VALUES ('94', '1', 'news', '15', '9', '1491963235');
INSERT INTO `fn_1_index` VALUES ('95', '1', 'news', '15', '9', '1491963245');
INSERT INTO `fn_1_index` VALUES ('96', '1', 'news', '15', '9', '1491963255');
INSERT INTO `fn_1_index` VALUES ('97', '1', 'news', '15', '9', '1491963269');
INSERT INTO `fn_1_index` VALUES ('98', '1', 'news', '15', '9', '1491963280');
INSERT INTO `fn_1_index` VALUES ('99', '1', 'news', '15', '9', '1491963293');
INSERT INTO `fn_1_index` VALUES ('100', '1', 'news', '15', '9', '1491963305');
INSERT INTO `fn_1_index` VALUES ('101', '1', 'news', '16', '9', '1491963316');
INSERT INTO `fn_1_index` VALUES ('102', '1', 'news', '16', '9', '1491963382');
INSERT INTO `fn_1_index` VALUES ('103', '1', 'news', '16', '9', '1491963396');
INSERT INTO `fn_1_index` VALUES ('104', '1', 'news', '16', '9', '1491963405');
INSERT INTO `fn_1_index` VALUES ('105', '1', 'news', '16', '9', '1491963414');
INSERT INTO `fn_1_index` VALUES ('106', '1', 'news', '16', '9', '1491963427');
INSERT INTO `fn_1_index` VALUES ('107', '1', 'news', '16', '9', '1491963440');
INSERT INTO `fn_1_index` VALUES ('108', '1', 'news', '16', '9', '1491963453');
INSERT INTO `fn_1_index` VALUES ('109', '1', 'news', '16', '9', '1491963567');
INSERT INTO `fn_1_index` VALUES ('110', '1', 'news', '16', '9', '1491963584');
INSERT INTO `fn_1_index` VALUES ('111', '1', 'news', '17', '9', '1491963594');
INSERT INTO `fn_1_index` VALUES ('112', '1', 'news', '17', '9', '1491963620');
INSERT INTO `fn_1_index` VALUES ('113', '1', 'news', '17', '9', '1491963630');
INSERT INTO `fn_1_index` VALUES ('114', '1', 'news', '17', '9', '1491963640');
INSERT INTO `fn_1_index` VALUES ('115', '1', 'news', '17', '9', '1491963649');
INSERT INTO `fn_1_index` VALUES ('116', '1', 'news', '17', '9', '1491963661');
INSERT INTO `fn_1_index` VALUES ('117', '1', 'news', '17', '9', '1491963671');
INSERT INTO `fn_1_index` VALUES ('118', '1', 'news', '17', '9', '1491963682');
INSERT INTO `fn_1_index` VALUES ('119', '1', 'news', '17', '9', '1491963692');
INSERT INTO `fn_1_index` VALUES ('120', '1', 'news', '17', '9', '1491963722');
INSERT INTO `fn_1_index` VALUES ('121', '1', 'news', '2', '9', '1491964073');
INSERT INTO `fn_1_index` VALUES ('122', '1', 'news', '2', '9', '1491964135');
INSERT INTO `fn_1_index` VALUES ('123', '1', 'news', '2', '9', '1491964148');
INSERT INTO `fn_1_index` VALUES ('124', '1', 'news', '2', '9', '1491964156');
INSERT INTO `fn_1_index` VALUES ('125', '1', 'news', '2', '9', '1491964165');
INSERT INTO `fn_1_index` VALUES ('126', '1', 'news', '2', '9', '1491964180');
INSERT INTO `fn_1_index` VALUES ('127', '1', 'news', '1', '9', '1502075282');
INSERT INTO `fn_1_index` VALUES ('128', '1', 'news', '1', '9', '1502076339');
INSERT INTO `fn_1_index` VALUES ('129', '1', 'news', '1', '9', '1502093483');
INSERT INTO `fn_1_index` VALUES ('130', '1', 'news', '1', '9', '1502093535');
INSERT INTO `fn_1_index` VALUES ('131', '1', 'news', '1', '9', '1502093570');
INSERT INTO `fn_1_index` VALUES ('132', '1', 'news', '1', '9', '1502093588');
INSERT INTO `fn_1_index` VALUES ('133', '1', 'news', '1', '9', '1502093607');
INSERT INTO `fn_1_index` VALUES ('134', '1', 'news', '1', '9', '1502093624');
INSERT INTO `fn_1_index` VALUES ('135', '1', 'news', '1', '9', '1502093643');
INSERT INTO `fn_1_index` VALUES ('136', '1', 'news', '1', '9', '1502093666');
INSERT INTO `fn_1_index` VALUES ('137', '1', 'news', '1', '9', '1502093688');

-- ----------------------------
-- Table structure for fn_1_news
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_news`;
CREATE TABLE `fn_1_news` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL,
  `favorites` int(11) NOT NULL,
  `shx` varchar(255) DEFAULT NULL,
  `sdlx` varchar(255) DEFAULT NULL,
  `wslxx` varchar(255) DEFAULT NULL,
  `gstxx` varchar(255) DEFAULT NULL,
  `jx` varchar(255) DEFAULT NULL,
  `ssfww` varchar(255) DEFAULT NULL,
  `qhlx` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `updatetime` (`updatetime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型主表';

-- ----------------------------
-- Records of fn_1_news
-- ----------------------------
INSERT INTO `fn_1_news` VALUES ('127', '1', '干屈菜', '1', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=127', '0', '127.0.0.1', '1502075282', '1502092308', '0', '0', '0', 'value1', 'value6', 'value7', 'value10', 'value13', 'value14', 'value18');
INSERT INTO `fn_1_news` VALUES ('128', '1', '黄菖蒲', '2', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=128', '0', '127.0.0.1', '1502076339', '1502092298', '0', '0', '0', 'value1', 'value5', 'value8', 'value10', 'value12', 'value14', 'value18');
INSERT INTO `fn_1_news` VALUES ('129', '1', '黄花蔺', '3', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=129', '0', '127.0.0.1', '1502093483', '1502093483', '0', '0', '0', 'value3', 'value6', 'value8', 'value10', 'value12', 'value15', 'value19');
INSERT INTO `fn_1_news` VALUES ('130', '1', '梭鱼草', '4', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=130', '0', '127.0.0.1', '1502093535', '1502093535', '0', '0', '0', 'value4', 'value6', 'value7', 'value10', 'value13', 'value14', 'value18');
INSERT INTO `fn_1_news` VALUES ('131', '1', '美人蕉', '5', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=131', '0', '127.0.0.1', '1502093570', '1502093570', '0', '0', '0', 'value1', 'value6', 'value7', 'value9', 'value12', 'value15', 'value18');
INSERT INTO `fn_1_news` VALUES ('132', '1', '香蒲', '6', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=132', '0', '127.0.0.1', '1502093588', '1502093588', '0', '0', '0', 'value2', 'value6', 'value8', 'value9', 'value12', 'value15', 'value19');
INSERT INTO `fn_1_news` VALUES ('133', '1', '雨久花', '7', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=133', '0', '127.0.0.1', '1502093607', '1502093607', '0', '0', '0', 'value3', 'value6', 'value8', 'value11', 'value13', 'value16', 'value19');
INSERT INTO `fn_1_news` VALUES ('134', '1', '星光草', '8', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=134', '0', '127.0.0.1', '1502093624', '1502093624', '0', '0', '0', 'value2', 'value5', 'value7', 'value10', 'value12', 'value15', 'value17');
INSERT INTO `fn_1_news` VALUES ('135', '1', '干屈菜', '9', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=135', '0', '127.0.0.1', '1502093643', '1502093643', '0', '0', '0', 'value1', 'value6', 'value7', 'value10', 'value13', 'value14', 'value18');
INSERT INTO `fn_1_news` VALUES ('136', '1', '测试草', '10', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=136', '0', '127.0.0.1', '1502093666', '1502093666', '0', '0', '0', 'value1', 'value6', 'value8', 'value10', 'value13', 'value15', 'value17');
INSERT INTO `fn_1_news` VALUES ('137', '1', '测试花', '11', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=137', '0', '127.0.0.1', '1502093688', '1502093688', '0', '0', '0', 'value1', 'value6', 'value8', 'value9', 'value13', 'value15', 'value18');

-- ----------------------------
-- Table structure for fn_1_news_data_0
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_news_data_0`;
CREATE TABLE `fn_1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `shenghuoxing` varchar(255) DEFAULT NULL,
  `shidileixing` varchar(255) DEFAULT NULL,
  `wslx` varchar(255) DEFAULT NULL,
  `gstx` varchar(255) DEFAULT NULL,
  `jixiang` varchar(255) DEFAULT NULL,
  `ssfw` varchar(255) DEFAULT NULL,
  `qihouleixing` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型附表';

-- ----------------------------
-- Records of fn_1_news_data_0
-- ----------------------------
INSERT INTO `fn_1_news_data_0` VALUES ('127', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('128', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('129', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('130', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('131', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('132', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('133', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('134', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('135', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('136', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('137', '1', '1', '', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for fn_1_tag
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_tag`;
CREATE TABLE `fn_1_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '父级id',
  `name` varchar(200) NOT NULL COMMENT '关键词名称',
  `code` varchar(200) NOT NULL COMMENT '关键词代码（拼音）',
  `pcode` varchar(255) DEFAULT NULL,
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  `url` varchar(255) DEFAULT NULL COMMENT '关键词url',
  `childids` varchar(255) NOT NULL COMMENT '子类集合',
  `content` text NOT NULL COMMENT '关键词描述',
  `total` int(10) NOT NULL COMMENT '点击数量',
  `displayorder` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='关键词库表';

-- ----------------------------
-- Records of fn_1_tag
-- ----------------------------
INSERT INTO `fn_1_tag` VALUES ('1', '0', '标签测试', 'test', null, '18', '', '', '1', '0', '0');
INSERT INTO `fn_1_tag` VALUES ('2', '0', '中国', 'zhongguo', '', '0', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for fn_1_weixin
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin`;
CREATE TABLE `fn_1_weixin` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信属性参数表';

-- ----------------------------
-- Records of fn_1_weixin
-- ----------------------------

-- ----------------------------
-- Table structure for fn_1_weixin_follow
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_follow`;
CREATE TABLE `fn_1_weixin_follow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信粉丝同步表';

-- ----------------------------
-- Records of fn_1_weixin_follow
-- ----------------------------

-- ----------------------------
-- Table structure for fn_1_weixin_menu
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_menu`;
CREATE TABLE `fn_1_weixin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `displayorder` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
-- Records of fn_1_weixin_menu
-- ----------------------------

-- ----------------------------
-- Table structure for fn_1_weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_user`;
CREATE TABLE `fn_1_weixin_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '会员id',
  `username` varchar(100) NOT NULL,
  `groupid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL COMMENT '唯一id',
  `nickname` text NOT NULL COMMENT '微信昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '性别',
  `city` varchar(30) DEFAULT NULL COMMENT '城市',
  `country` varchar(30) DEFAULT NULL COMMENT '国家',
  `province` varchar(30) DEFAULT NULL COMMENT '省',
  `language` varchar(30) DEFAULT NULL COMMENT '语言',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `subscribe_time` int(10) unsigned NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `subscribe_time` (`subscribe_time`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信粉丝表';

-- ----------------------------
-- Records of fn_1_weixin_user
-- ----------------------------

-- ----------------------------
-- Table structure for fn_admin
-- ----------------------------
DROP TABLE IF EXISTS `fn_admin`;
CREATE TABLE `fn_admin` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` text COMMENT '定制权限',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of fn_admin
-- ----------------------------
INSERT INTO `fn_admin` VALUES ('1', '网站创始人', '', 'blue');

-- ----------------------------
-- Table structure for fn_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment`;
CREATE TABLE `fn_attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of fn_attachment
-- ----------------------------
INSERT INTO `fn_attachment` VALUES ('1', '1', 'admin', '1', '', '1', '0', '138875', 'jpg', '2f0b9e7386a6a677f1f4b71211527ce9');
INSERT INTO `fn_attachment` VALUES ('2', '1', 'admin', '1', '', '1', '0', '618240', 'jpg', '511873f8639cf1209fa0acc87c4faf2a');
INSERT INTO `fn_attachment` VALUES ('3', '1', 'admin', '1', '', '1', '0', '114883', 'jpg', 'bf314a4f15b1b97e03e4cc86bb478fd2');
INSERT INTO `fn_attachment` VALUES ('4', '1', 'admin', '1', '', '1', '0', '294154', 'jpg', '0beec4bdae96c072d939e73467c0037e');
INSERT INTO `fn_attachment` VALUES ('5', '1', 'admin', '1', '', '1', '0', '170271', 'jpg', 'beacb9da7cf1660561a745460b28f756');
INSERT INTO `fn_attachment` VALUES ('6', '1', 'admin', '1', '', '1', '0', '137646', 'jpg', '57c604405bee23ba05466cbb6cac7445');
INSERT INTO `fn_attachment` VALUES ('7', '1', 'admin', '1', '', '1', '0', '1368105', 'jpg', '4a50808bf38781498c86b21376ff1ed8');
INSERT INTO `fn_attachment` VALUES ('8', '1', 'admin', '1', '', '1', '0', '131666', 'jpg', 'fb721afdbea04392fa3188747bb06b21');
INSERT INTO `fn_attachment` VALUES ('9', '1', 'admin', '1', '', '1', '0', '138875', 'jpg', '2f0b9e7386a6a677f1f4b71211527ce9');
INSERT INTO `fn_attachment` VALUES ('10', '1', 'admin', '1', '', '1', '0', '1368105', 'jpg', '4a50808bf38781498c86b21376ff1ed8');
INSERT INTO `fn_attachment` VALUES ('11', '1', 'admin', '1', '', '1', '0', '137646', 'jpg', '57c604405bee23ba05466cbb6cac7445');

-- ----------------------------
-- Table structure for fn_attachment_0
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_0`;
CREATE TABLE `fn_attachment_0` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表0';

-- ----------------------------
-- Records of fn_attachment_0
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_1
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_1`;
CREATE TABLE `fn_attachment_1` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表1';

-- ----------------------------
-- Records of fn_attachment_1
-- ----------------------------
INSERT INTO `fn_attachment_1` VALUES ('1', '1', 'admin', '', '1', 'jpg', '138875', '201708/a4061921a4.jpg', '0', '', '1502076294');
INSERT INTO `fn_attachment_1` VALUES ('2', '1', 'admin', '', '2', 'jpg', '618240', '201708/b50a7dd636.jpg', '0', '', '1502076376');
INSERT INTO `fn_attachment_1` VALUES ('3', '1', 'admin', '', '3', 'jpg', '114883', '201708/dd1c800216.jpg', '0', '', '1502093524');
INSERT INTO `fn_attachment_1` VALUES ('4', '1', 'admin', '', '8', 'jpg', '294154', '201708/2060b8441d.jpg', '0', '', '1502093558');
INSERT INTO `fn_attachment_1` VALUES ('5', '1', 'admin', '', '4', 'jpg', '170271', '201708/6c022f3b3e.jpg', '0', '', '1502093580');
INSERT INTO `fn_attachment_1` VALUES ('6', '1', 'admin', '', '6', 'jpg', '137646', '201708/8c12027570.jpg', '0', '', '1502093603');
INSERT INTO `fn_attachment_1` VALUES ('7', '1', 'admin', '', '5', 'jpg', '1368105', '201708/36c896481d.jpg', '0', '', '1502093622');
INSERT INTO `fn_attachment_1` VALUES ('8', '1', 'admin', '', '7', 'jpg', '131666', '201708/ba4eb73bf4.jpg', '0', '', '1502093641');
INSERT INTO `fn_attachment_1` VALUES ('9', '1', 'admin', '', '1', 'jpg', '138875', '201708/5fa6872ac8.jpg', '0', '', '1502093665');
INSERT INTO `fn_attachment_1` VALUES ('10', '1', 'admin', '', '5', 'jpg', '1368105', '201708/79c128c47e.jpg', '0', '', '1502093687');
INSERT INTO `fn_attachment_1` VALUES ('11', '1', 'admin', '', '6', 'jpg', '137646', '201708/10ea3ca6b4.jpg', '0', '', '1502093701');

-- ----------------------------
-- Table structure for fn_attachment_2
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_2`;
CREATE TABLE `fn_attachment_2` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表2';

-- ----------------------------
-- Records of fn_attachment_2
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_3
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_3`;
CREATE TABLE `fn_attachment_3` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表3';

-- ----------------------------
-- Records of fn_attachment_3
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_4
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_4`;
CREATE TABLE `fn_attachment_4` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表4';

-- ----------------------------
-- Records of fn_attachment_4
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_5
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_5`;
CREATE TABLE `fn_attachment_5` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表5';

-- ----------------------------
-- Records of fn_attachment_5
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_6
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_6`;
CREATE TABLE `fn_attachment_6` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表6';

-- ----------------------------
-- Records of fn_attachment_6
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_7
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_7`;
CREATE TABLE `fn_attachment_7` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表7';

-- ----------------------------
-- Records of fn_attachment_7
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_8
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_8`;
CREATE TABLE `fn_attachment_8` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表8';

-- ----------------------------
-- Records of fn_attachment_8
-- ----------------------------

-- ----------------------------
-- Table structure for fn_attachment_9
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_9`;
CREATE TABLE `fn_attachment_9` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表9';

-- ----------------------------
-- Records of fn_attachment_9
-- ----------------------------

-- ----------------------------
-- Table structure for fn_field
-- ----------------------------
DROP TABLE IF EXISTS `fn_field`;
CREATE TABLE `fn_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='字段表';

-- ----------------------------
-- Records of fn_field
-- ----------------------------
INSERT INTO `fn_field` VALUES ('8', '主题', 'title', 'Text', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', '1');
INSERT INTO `fn_field` VALUES ('9', '缩略图', 'thumb', 'File', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', '10');
INSERT INTO `fn_field` VALUES ('10', '关键字', 'keywords', 'Text', '4', 'module', '1', '1', '1', '1', '1', '1', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', '0');
INSERT INTO `fn_field` VALUES ('11', '描述', 'description', 'Textarea', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', '11');
INSERT INTO `fn_field` VALUES ('12', '内容', 'content', 'Ueditor', '4', 'module', '1', '0', '1', '1', '0', '0', '{\"option\":{\"width\":\"90%\",\"height\":\"400\",\"autofloat\":\"0\",\"autoheight\":\"0\",\"autodown\":\"0\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '12');
INSERT INTO `fn_field` VALUES ('25', '内容', 'neirong', 'Ueditor', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"width\":\"100%\",\"height\":\"200\",\"autofloat\":\"0\",\"autoheight\":\"0\",\"autodown\":\"0\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"value\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '0');
INSERT INTO `fn_field` VALUES ('23', '主题', 'title', 'Text', '1', 'form-1', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1}}', '0');
INSERT INTO `fn_field` VALUES ('54', '季象', 'jx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u5e38\\u7eff|value12\\r\\n\\u843d\\u53f6|value13\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('53', '观赏特性', 'gstxx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u89c2\\u82b1|value9\\r\\n\\u89c2\\u53f6|value10\\r\\n\\u89c2\\u679c|value11\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('56', '气候类型', 'qhlx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u70ed\\u5e26|value17\\r\\n\\u4e9a\\u70ed\\u5e26|value18\\r\\n\\u6e29\\u5e26|value19\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('55', '水深范围', 'ssfww', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"0-20|value14\\r\\n30-50|value15\\r\\n60-100|value16\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('50', '生活型', 'shx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u633a\\u6c34\\u578b|value1\\r\\n\\u6d6e\\u6c34\\u578b|value2\\r\\n\\u6f02\\u6d6e\\u578b|value3\\r\\n\\u6c89\\u6c34\\u578b|value4\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('51', '湿地类型', 'sdlx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u8868\\u9762\\u6d41\\u578b|value5\\r\\n\\u6f5c\\u6d41\\u578b|value6\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('52', '污水类型', 'wslxx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u751f\\u6d3b\\u6c61\\u6c34|value7\\r\\n\\u5de5\\u4e1a\\u6c61\\u6c34|value8\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');

-- ----------------------------
-- Table structure for fn_linkage
-- ----------------------------
DROP TABLE IF EXISTS `fn_linkage`;
CREATE TABLE `fn_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='联动菜单表';

-- ----------------------------
-- Records of fn_linkage
-- ----------------------------
INSERT INTO `fn_linkage` VALUES ('1', '中国地区', '0', 'address');

-- ----------------------------
-- Table structure for fn_linkage_data_1
-- ----------------------------
DROP TABLE IF EXISTS `fn_linkage_data_1`;
CREATE TABLE `fn_linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表';

-- ----------------------------
-- Records of fn_linkage_data_1
-- ----------------------------
INSERT INTO `fn_linkage_data_1` VALUES ('1', '1', '0', '0', '北京', 'beijing', '0', '0', '1', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('2', '1', '0', '0', '天津', 'tianjin', '0', '0', '2', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('3', '1', '0', '0', '上海', 'shanghai', '0', '0', '3', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('4', '1', '0', '0', '重庆', 'chongqing', '0', '0', '4', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('5', '1', '0', '0', '黑龙江', 'heilongjiang', '0', '0', '5', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('6', '1', '0', '0', '吉林', 'jilin', '0', '0', '6', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('7', '1', '0', '0', '辽宁', 'liaoning', '0', '0', '7', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('8', '1', '0', '0', '河北', 'hebei', '0', '0', '8', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('9', '1', '0', '0', '河南', 'henan', '0', '0', '9', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('10', '1', '0', '0', '山东', 'shandong', '0', '0', '10', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('11', '1', '0', '0', '江苏', 'jiangsu', '0', '0', '11', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('12', '1', '0', '0', '山西', 'shanxi', '0', '0', '12', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('13', '1', '0', '0', '陕西', 'shanxi1', '0', '0', '13', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('14', '1', '0', '0', '甘肃', 'gansu', '0', '0', '14', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('15', '1', '0', '0', '四川', 'sichuan', '0', '0', '15', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('16', '1', '0', '0', '青海', 'qinghai', '0', '0', '16', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('17', '1', '0', '0', '湖南', 'hunan', '0', '0', '17', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('18', '1', '0', '0', '湖北', 'hubei', '0', '0', '18', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('19', '1', '0', '0', '江西', 'jiangxi', '0', '0', '19', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('20', '1', '0', '0', '安徽', 'anhui', '0', '0', '20', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('21', '1', '0', '0', '浙江', 'zhejiang', '0', '0', '21', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('22', '1', '0', '0', '福建', 'fujian', '0', '0', '22', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('23', '1', '0', '0', '广东', 'guangdong', '0', '0', '23', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('24', '1', '0', '0', '广西', 'guangxi', '0', '0', '24', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('25', '1', '0', '0', '贵州', 'guizhou', '0', '0', '25', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('26', '1', '0', '0', '云南', 'yunnan', '0', '0', '26', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('27', '1', '0', '0', '海南', 'hainan', '0', '0', '27', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('28', '1', '0', '0', '内蒙古', 'neimenggu', '0', '0', '28', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('29', '1', '0', '0', '新疆', 'xinjiang', '0', '0', '29', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('30', '1', '0', '0', '宁夏', 'ningxia', '0', '0', '30', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('31', '1', '0', '0', '西藏', 'xicang', '0', '0', '31', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('32', '1', '0', '0', '香港', 'xianggang', '0', '0', '32', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('33', '1', '0', '0', '澳门', 'aomen', '0', '0', '33', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('34', '1', '0', '0', '台湾', 'taiwan', '0', '0', '34', '0');

-- ----------------------------
-- Table structure for fn_mail_smtp
-- ----------------------------
DROP TABLE IF EXISTS `fn_mail_smtp`;
CREATE TABLE `fn_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账户表';

-- ----------------------------
-- Records of fn_mail_smtp
-- ----------------------------

-- ----------------------------
-- Table structure for fn_member
-- ----------------------------
DROP TABLE IF EXISTS `fn_member`;
CREATE TABLE `fn_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(40) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `adminid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `levelid` smallint(5) unsigned NOT NULL COMMENT '会员级别',
  `overdue` int(10) unsigned NOT NULL COMMENT '到期时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  `ismobile` tinyint(1) unsigned DEFAULT NULL COMMENT '手机认证标识',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `adminid` (`adminid`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of fn_member
-- ----------------------------
INSERT INTO `fn_member` VALUES ('1', '', 'admin', 'ac7cd59472be180b81c7551b92925f03', 'b3967a0e93', '1212', '12', '', '9999.00', '0.00', '0.00', '10000', '10000', '1', '3', '4', '0', '', '0', '0', '0');

-- ----------------------------
-- Table structure for fn_member_data
-- ----------------------------
DROP TABLE IF EXISTS `fn_member_data`;
CREATE TABLE `fn_member_data` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of fn_member_data
-- ----------------------------
INSERT INTO `fn_member_data` VALUES ('1', '1', '0');

-- ----------------------------
-- Table structure for fn_member_oauth
-- ----------------------------
DROP TABLE IF EXISTS `fn_member_oauth`;
CREATE TABLE `fn_member_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `expire_at` int(10) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员OAuth2授权表';

-- ----------------------------
-- Records of fn_member_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for fn_module
-- ----------------------------
DROP TABLE IF EXISTS `fn_module`;
CREATE TABLE `fn_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是扩展模块',
  `sitemap` tinyint(1) unsigned DEFAULT NULL COMMENT '是否生成地图',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of fn_module
-- ----------------------------
INSERT INTO `fn_module` VALUES ('4', '{\"name\":\"\\u6587\\u7ae0\",\"urlrule\":\"4\",\"search_title\":\"[\\u7b2c{page}\\u9875{join}][{keyword}{join}][{param}{join}]{modulename}{join}{SITE_NAME}\",\"search_keywords\":\"\",\"search_description\":\"\",\"use\":1}', 'news', '0', '0', '0', '', '0', '0');

-- ----------------------------
-- Table structure for fn_site
-- ----------------------------
DROP TABLE IF EXISTS `fn_site`;
CREATE TABLE `fn_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of fn_site
-- ----------------------------
INSERT INTO `fn_site` VALUES ('1', 'FineCMS', '127.0.1.4', '{\"SITE_CLOSE\":\"0\",\"SITE_CLOSE_MSG\":\"\\u7f51\\u7ad9\\u5347\\u7ea7\\u4e2d....\",\"SITE_NAME\":\"FineCMS\",\"SITE_TIME_FORMAT\":\"Y-m-d H:i\",\"SITE_LANGUAGE\":\"zh-cn\",\"SITE_THEME\":\"default\",\"SITE_TEMPLATE\":\"default\",\"SITE_TIMEZONE\":\"8\",\"SITE_DOMAINS\":\"\",\"SITE_REWRITE\":\"6\",\"SITE_MOBILE_OPEN\":\"1\",\"SITE_MOBILE\":\"\",\"SITE_SEOJOIN\":\"_\",\"SITE_TITLE\":\"FineCMS\\u516c\\u76ca\\u8f6f\\u4ef6\",\"SITE_KEYWORDS\":\"\\u514d\\u8d39cms,\\u5f00\\u6e90cms\",\"SITE_DESCRIPTION\":\"\\u516c\\u76ca\\u8f6f\\u4ef6\\u4ea7\\u54c1\\u4ecb\\u7ecd\",\"SITE_IMAGE_RATIO\":\"1\",\"SITE_IMAGE_WATERMARK\":\"0\",\"SITE_IMAGE_VRTALIGN\":\"top\",\"SITE_IMAGE_HORALIGN\":\"left\",\"SITE_IMAGE_VRTOFFSET\":\"\",\"SITE_IMAGE_HOROFFSET\":\"\",\"SITE_IMAGE_TYPE\":\"0\",\"SITE_IMAGE_OVERLAY\":\"default.png\",\"SITE_IMAGE_OPACITY\":\"\",\"SITE_IMAGE_FONT\":\"default.ttf\",\"SITE_IMAGE_COLOR\":\"\",\"SITE_IMAGE_SIZE\":\"\",\"SITE_IMAGE_TEXT\":\"\",\"SITE_DOMAIN\":\"www.gyb.com\",\"SITE_IMAGE_CONTENT\":0}');

-- ----------------------------
-- Table structure for fn_urlrule
-- ----------------------------
DROP TABLE IF EXISTS `fn_urlrule`;
CREATE TABLE `fn_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='URL规则表';

-- ----------------------------
-- Records of fn_urlrule
-- ----------------------------
INSERT INTO `fn_urlrule` VALUES ('1', '3', '栏目规则测试', '{\"share_list\":\"{dirname}-list.html\",\"share_list_page\":\"{dirname}-list-{page}.html\",\"share_show\":\"{dirname}-show-{id}.html\",\"share_show_page\":\"{dirname}-show-{id}-{page}.html\",\"share_search\":\"\",\"share_search_page\":\"\",\"tags\":\"\"}');
INSERT INTO `fn_urlrule` VALUES ('2', '4', '站点URL测试', '{\"share_list\":\"\",\"share_list_page\":\"\",\"share_show\":\"\",\"share_show_page\":\"\",\"share_search\":\"search.html\",\"share_search_page\":\"search\\/{param}.html\",\"tags\":\"tag\\/{tag}.html\"}');
