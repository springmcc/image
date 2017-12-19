﻿
/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.19 : Database - shishuocms
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shishuocms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shishuocms`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `password` varchar(32) DEFAULT NULL COMMENT '密码 MD5加密',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员';

/*Data for the table `admin` */

insert  into `admin`(`adminId`,`name`,`password`,`createTime`) values (1,'xiaoping','e10adc3949ba59abbe56e057f20f883e','2017-12-19 11:00:00'),(2,'admintest','e10adc3949ba59abbe56e057f20f883e','2017-12-19 11:04:05'),(3,'admin','e10adc3949ba59abbe56e057f20f883e','2017-12-19 11:04:28');

/*Table structure for table `admin_folder` */

DROP TABLE IF EXISTS `admin_folder`;

CREATE TABLE `admin_folder` (
  `adminId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin_folder` */

insert  into `admin_folder`(`adminId`,`folderId`,`createTime`) values (1,1,'2014-10-29 20:48:42'),(1,3,'2014-10-29 20:48:43'),(1,4,'2014-10-29 20:48:44'),(1,5,'2014-10-29 20:48:45'),(1,2,'2014-10-29 20:48:46'),(4,1,'2017-12-19 11:04:39'),(4,4,'2017-12-19 11:04:42'),(4,5,'2017-12-19 11:04:43'),(4,2,'2017-12-19 11:04:45'),(4,3,'2017-12-19 11:04:48');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `articleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `folderId` bigint(20) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `adminId` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `picture` varchar(60) DEFAULT NULL,
  `title` varchar(200) DEFAULT '' COMMENT '文件名称',
  `summary` varchar(2000) DEFAULT NULL,
  `content` mediumtext COMMENT '文件内容',
  `viewCount` int(11) DEFAULT '0' COMMENT '浏览数',
  `commentCount` int(11) DEFAULT '0' COMMENT '评论数',
  `status` varchar(20) DEFAULT 'init' COMMENT '状态：0 隐藏 1 显示',
  `check` enum('yes','no','init') DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`articleId`),
  KEY `idx_folder` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文件';

/*Data for the table `article` */

insert  into `article`(`articleId`,`folderId`,`path`,`adminId`,`picture`,`title`,`summary`,`content`,`viewCount`,`commentCount`,`status`,`check`,`createTime`,`updateTime`) values (1,5,'1#5',1,'upload/2017/12/19/97a036cbc0cc4df98bf6e1e544260415.jpg','Hello World','Hello World!!','<pre style=\"background-color:#272822;color:#f8f8f2;font-family:&#39;Consolas&#39;;font-size:10.8pt;\">##&nbsp;CMS###&nbsp;*&nbsp;*&nbsp;###&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;###&nbsp;*&nbsp;UEditor*&nbsp;*&nbsp;*&nbsp;###&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;###&nbsp;*&nbsp;*&nbsp;##&nbsp;*&nbsp;jQuery\r\n*&nbsp;Bootstrap\r\n*&nbsp;Java\r\n*&nbsp;Maven\r\n*&nbsp;Spring\r\n*&nbsp;Spring&nbsp;MVC\r\n*&nbsp;MyBatis\r\n*&nbsp;MySQL\r\n*&nbsp;FreeMarker\r\n*&nbsp;Lucene\r\n\r\n##&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;-&nbsp;##&nbsp;Licensed&nbsp;under&nbsp;the&nbsp;Apache&nbsp;License,&nbsp;Version&nbsp;2.0&nbsp;(the&nbsp;&quot;License&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;you&nbsp;may&nbsp;not&nbsp;use&nbsp;this&nbsp;file&nbsp;except&nbsp;in&nbsp;compliance&nbsp;with&nbsp;the&nbsp;License.\r\n&nbsp;&nbsp;&nbsp;&nbsp;You&nbsp;may&nbsp;obtain&nbsp;a&nbsp;copy&nbsp;of&nbsp;the&nbsp;License&nbsp;at\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;Unless&nbsp;required&nbsp;by&nbsp;applicable&nbsp;law&nbsp;or&nbsp;agreed&nbsp;to&nbsp;in&nbsp;writing,&nbsp;software\r\n&nbsp;&nbsp;&nbsp;&nbsp;distributed&nbsp;under&nbsp;the&nbsp;License&nbsp;is&nbsp;distributed&nbsp;on&nbsp;an&nbsp;&quot;AS&nbsp;IS&quot;&nbsp;BASIS,\r\n&nbsp;&nbsp;&nbsp;&nbsp;WITHOUT&nbsp;WARRANTIES&nbsp;OR&nbsp;CONDITIONS&nbsp;OF&nbsp;ANY&nbsp;KIND,&nbsp;either&nbsp;express&nbsp;or&nbsp;implied.\r\n&nbsp;&nbsp;&nbsp;&nbsp;See&nbsp;the&nbsp;License&nbsp;for&nbsp;the&nbsp;specific&nbsp;language&nbsp;governing&nbsp;permissions&nbsp;and\r\n&nbsp;&nbsp;&nbsp;&nbsp;limitations&nbsp;under&nbsp;the&nbsp;License.\r\n\r\n\r\n\r\n\r\nGIT</pre><p><br/></p>',0,0,'display','yes','2017-12-19 00:00:00','2014-10-29 20:49:54'),(2,1,'1',1,'upload/2017/12/19/210a7c2387fb4fcaaf3abc6d2a533fb8.jpg','向平大爷致敬！','测试','<p>测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss测试cesssssssssssssss</p>',0,0,'display','yes','2017-12-19 00:00:00','2017-12-19 10:52:17');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `fatherId` bigint(20) DEFAULT NULL COMMENT '父评论ID',
  `kindId` bigint(20) DEFAULT NULL,
  `kind` varchar(45) DEFAULT NULL COMMENT '文件ID',
  `name` varchar(45) DEFAULT NULL COMMENT '评论者',
  `email` varchar(45) DEFAULT NULL COMMENT '评论者邮件地址',
  `url` varchar(200) DEFAULT NULL COMMENT '评论者网址',
  `phone` bigint(20) DEFAULT NULL,
  `content` text COMMENT '内容',
  `ip` varchar(45) DEFAULT NULL COMMENT 'Ip',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`commentId`),
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='评论';

/*Data for the table `comment` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `key` varchar(45) NOT NULL COMMENT 'Key',
  `value` varchar(45) DEFAULT NULL COMMENT '值',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站配置';

/*Data for the table `config` */

insert  into `config`(`key`,`value`,`description`,`createTime`) values ('shishuo_headline_image_height','420','首页头图的高（px）','2012-08-08 00:00:00'),('shishuo_headline_image_width','858','首页头图的宽（px）','2012-08-08 00:00:00'),('shishuo_seo_headline','师说CMS是用Java开发的内容管理系统','网站口号','2012-08-08 00:00:00'),('shishuo_seo_title','师说CMS','网站名称','2012-08-08 00:00:00'),('shishuo_static','false','是否启用全站静态化','2012-08-08 00:00:00'),('shishuo_template','blog','模板','2012-08-08 00:00:00');

/*Table structure for table `folder` */

DROP TABLE IF EXISTS `folder`;

CREATE TABLE `folder` (
  `folderId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `fatherId` bigint(20) NOT NULL DEFAULT '0' COMMENT '父亲Id，用于构建目录树',
  `ename` varchar(45) NOT NULL COMMENT '英文名',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '中文名',
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '路径',
  `content` text,
  `level` tinyint(4) DEFAULT '1' COMMENT '层级',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `count` int(11) DEFAULT '0' COMMENT '文件数',
  `status` varchar(20) DEFAULT 'hidden' COMMENT '状态：0 隐藏 1 现实',
  `check` enum('yes','no') DEFAULT 'no',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `idx_ename` (`ename`) USING BTREE,
  KEY `idx_status` (`fatherId`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='目录';

/*Data for the table `folder` */

insert  into `folder`(`folderId`,`fatherId`,`ename`,`name`,`path`,`content`,`level`,`sort`,`width`,`height`,`count`,`status`,`check`,`createTime`,`updateTime`) values (1,0,'blog','博客','1','',1,1,0,0,0,'display','no','2014-10-29 18:37:39',NULL),(2,0,'about','关于博主','2','<p>朕就是这样一汉子。<br/></p><div id=\"xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd\"></div>',1,1,0,0,0,'display','no','2014-10-29 18:38:02',NULL),(3,1,'life','生活','1#3','',2,1,0,0,0,'display','no','2014-10-29 20:16:53',NULL),(4,1,'work','工作','1#4','',2,1,0,0,0,'display','no','2014-10-29 20:17:06',NULL),(5,1,'travel','旅游','1#5','',2,1,0,0,0,'display','no','2014-10-29 20:17:39',NULL);

/*Table structure for table `guestbook` */

DROP TABLE IF EXISTS `guestbook`;

CREATE TABLE `guestbook` (
  `guestbookId` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `reply` varchar(2000) DEFAULT NULL,
  `status` enum('display','hidden','init') DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `replyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`guestbookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `guestbook` */

/*Table structure for table `headline` */

DROP TABLE IF EXISTS `headline`;

CREATE TABLE `headline` (
  `headlineId` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`headlineId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `headline` */

insert  into `headline`(`headlineId`,`name`,`picture`,`url`,`sort`,`createTime`) values (1,'ww','upload/2017/12/19/29016c2114ca43a08b8686bf18eec11b.jpg','wwwww',0,'2017-12-19 10:51:00');

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `mediaId` bigint(20) NOT NULL AUTO_INCREMENT,
  `kindId` bigint(20) DEFAULT '0',
  `name` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `kind` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`mediaId`),
  KEY `idx_kind` (`kind`,`kindId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 ROW_FORMAT=COMPACT;

/*Data for the table `media` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `openId` bigint(20) DEFAULT NULL COMMENT '公共用户ID，只有是师说，QQ，微博等其它网站登录时才有。',
  `type` varchar(20) DEFAULT NULL COMMENT '帐号类型：0 本站 1 师说 2 QQ 3 微博',
  `name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户';

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

