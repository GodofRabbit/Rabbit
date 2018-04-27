/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : shoppingmall

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-27 13:17:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `address` int(10) DEFAULT NULL,
  ` postalcode` int(6) DEFAULT NULL,
  `conname` varchar(20) DEFAULT NULL,
  `conphone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `ad` (`user_id`),
  KEY `av` (`goods_id`),
  CONSTRAINT `ad` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `av` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('1', '1', '1', '4');
INSERT INTO `t_cart` VALUES ('12', '1', '4', '3');
INSERT INTO `t_cart` VALUES ('88', '6', '7', '1');
INSERT INTO `t_cart` VALUES ('91', '6', '2', '10');
INSERT INTO `t_cart` VALUES ('95', '6', '1', '4');

-- ----------------------------
-- Table structure for t_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `Goods_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collect
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(30) DEFAULT NULL,
  `goodsprice` double(10,2) DEFAULT NULL,
  `goods_imageurl` varchar(20) DEFAULT NULL,
  `goodstime` datetime DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '菠菜280g', '19.00', 'ht-1.jpg', '2017-10-24 15:10:58', '1', '45');
INSERT INTO `t_goods` VALUES ('2', '  大红脆甜水蜜桃 5斤', '29.00', 'pr-1.jpg', '2017-10-24 15:12:03', '1', '56');
INSERT INTO `t_goods` VALUES ('3', ' 菲律宾进口菠萝凤梨 2个', '38.00', 'ht-3.jpg', '2017-10-24 15:12:06', '1', '78');
INSERT INTO `t_goods` VALUES ('4', '梨福建特级红心蜜柚 4个', '69.00', 'ht-4.jpg', '2017-10-24 15:12:08', '1', '87');
INSERT INTO `t_goods` VALUES ('5', '广西青皮芒果青芒玉芒 5斤', '39.00', 'ht-5.jpg', '2017-10-10 00:00:00', '1', '65');
INSERT INTO `t_goods` VALUES ('6', '加力果嗄啦果苹果12个装', '33.50', 'ht-6.jpg', '2017-10-25 11:20:13', '1', '78');
INSERT INTO `t_goods` VALUES ('7', '  国产绿奇异果 16颗', '49.00', 'ht-7.jpg', '2017-10-11 11:20:24', '1', '34');
INSERT INTO `t_goods` VALUES ('8', ' 佳沛新西兰阳光金奇异果8颗', '27.50', 'ht-8.jpg', '2017-10-06 11:21:18', '1', '76');
INSERT INTO `t_goods` VALUES ('9', '精选百香果西番莲8颗', '29.00', 'ht-9.jpg', '2017-10-17 11:21:50', '1', '56');
INSERT INTO `t_goods` VALUES ('10', ' 莲藕5kg', '19.00', 'ht-10.jpg', '2017-10-08 11:23:06', '1', '90');
INSERT INTO `t_goods` VALUES ('11', '进口新鲜青苹果 5斤', '20.00', 'pr-2.jpg', '2017-10-15 11:23:15', '1', '65');
INSERT INTO `t_goods` VALUES ('12', '美国进口红啤梨 6个', '39.00', 'ht-12.jpg', '2017-10-24 11:24:12', '1', '27');
INSERT INTO `t_goods` VALUES ('13', '绿芦笋200g', '20.00', 'ht-14.jpg', '2017-10-23 13:39:36', '1', '83');
INSERT INTO `t_goods` VALUES ('14', '美国进口无籽红提 1kg', '39.00', 'ht-16.jpg', '2017-10-22 13:40:38', '1', '93');
INSERT INTO `t_goods` VALUES ('15', '墨西哥进口牛油果 5个', '35.50', 'ht-17.jpg', '2017-10-21 13:41:04', '1', '32');
INSERT INTO `t_goods` VALUES ('16', '南非进口黄柠檬 6个装', '29.00', 'ht-18.jpg', '2017-10-20 13:42:13', '1', '72');
INSERT INTO `t_goods` VALUES ('17', ' 四川大凉山会理石榴8个', '37.50', 'ht-19.jpg', '2017-10-19 13:42:57', '1', '83');
INSERT INTO `t_goods` VALUES ('18', '泰国金枕头榴莲', '129.00', 'ht-20.jpg', '2017-10-18 13:43:37', '1', '82');
INSERT INTO `t_goods` VALUES ('19', '泰国进口山竹 2斤', '27.50', 'ht-21.jpg', '2017-10-25 13:44:10', '1', '97');
INSERT INTO `t_goods` VALUES ('20', '西葫500g', '14.00', 'ht-22.jpg', '2017-10-24 13:45:06', '1', '90');
INSERT INTO `t_goods` VALUES ('21', '西兰花270g', '14.50', 'ht-23.jpg', '2017-10-16 13:45:31', '1', '37');
INSERT INTO `t_goods` VALUES ('22', '新疆库尔勒香梨 5斤礼盒装', '36.00', 'ht-24.jpg', '2017-10-21 13:46:12', '1', '83');
INSERT INTO `t_goods` VALUES ('23', '新鲜水果龙眼', '10.00', 'ht-25.jpg', '2017-10-21 13:47:05', '1', '86');
INSERT INTO `t_goods` VALUES ('24', '油菜300g', '5.00', 'ht-26.jpg', '2017-10-26 13:47:36', '1', '52');
INSERT INTO `t_goods` VALUES ('25', '越南进口红心火龙果 5斤', '38.00', 'ht-27.jpg', '2017-10-24 13:48:22', '1', '48');
INSERT INTO `t_goods` VALUES ('26', '浙江涌泉蜜桔无核桔子5斤', '37.50', 'ht-28.jpg', '2017-10-19 13:48:44', '1', '62');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `managername` varchar(15) DEFAULT NULL,
  `managerpassword` varchar(15) DEFAULT NULL,
  `realname` varchar(15) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `role` int(1) DEFAULT NULL,
  `jointime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', 'renlu', '123456', '任录', '男', '2', '2017-10-17 15:26:39');
INSERT INTO `t_manager` VALUES ('2', 'zhangxin', '123456', '张鑫', '男', '2', '2017-10-18 15:26:44');
INSERT INTO `t_manager` VALUES ('3', 'qiaoyajun', '123456', '乔亚军', '男', '2', '2017-10-19 15:26:47');
INSERT INTO `t_manager` VALUES ('4', 'wangguohong', '123456', '王国宏', '男', '2', '2017-10-20 15:26:51');
INSERT INTO `t_manager` VALUES ('5', 'admin', 'admin', '伟大的兔神', '男', '1', '2017-10-21 15:26:54');
INSERT INTO `t_manager` VALUES ('17', 'root', 'root', '毛毛', '女', '1', '2017-10-23 18:26:08');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `orderseq` int(10) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('7', '145883', '63', '2017-10-30 01:09:39', '2', '1');
INSERT INTO `t_order` VALUES ('8', '8445393', '172', '2017-10-30 01:15:03', '2', '1');
INSERT INTO `t_order` VALUES ('9', '8748807', '297', '2017-10-30 01:23:24', '2', '6');
INSERT INTO `t_order` VALUES ('11', '1305842', '388', '2017-10-30 01:56:56', '2', '6');
INSERT INTO `t_order` VALUES ('12', '1212113', '388', '2017-10-30 02:19:13', '2', '6');
INSERT INTO `t_order` VALUES ('13', '4780784', '906', '2017-10-30 09:33:35', '2', '1');
INSERT INTO `t_order` VALUES ('14', '3160974', '112', '2017-10-30 09:39:20', '2', '1');
INSERT INTO `t_order` VALUES ('15', '7388132', '172', '2017-10-30 15:32:44', '2', '0');
INSERT INTO `t_order` VALUES ('16', '5662368', '361', '2017-10-30 15:33:02', '2', '0');
INSERT INTO `t_order` VALUES ('17', '7500581', '810', '2017-10-30 15:36:15', '2', '0');

-- ----------------------------
-- Table structure for t_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods`;
CREATE TABLE `t_order_goods` (
  `id` int(10) NOT NULL,
  `order_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `realname` varchar(15) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `jointime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhangxin', '123456', '张鑫', '男', '2017-09-26 19:19:05', '13456412346', '2017-10-23 19:19:23');
INSERT INTO `t_user` VALUES ('2', 'wangguohong', '123456', '王国宏', '男', '2017-10-24 13:28:16', '13465565666', '2017-10-24 13:28:30');
INSERT INTO `t_user` VALUES ('3', 'qiaoyajun', '123456', '乔亚军', '男', '2017-10-24 13:28:18', '23456576453', '2017-10-24 13:28:33');
INSERT INTO `t_user` VALUES ('4', 'maomao', '123456', '毛毛', '女', '2017-10-24 13:28:56', '12324354657', '2017-10-24 13:29:02');
INSERT INTO `t_user` VALUES ('5', 'dabai', '123456', '大白', '女', '1996-01-16 00:00:00', '13245344561', '2017-10-24 14:18:36');
INSERT INTO `t_user` VALUES ('6', 'renlu', '123456', '任录', '男', '1996-01-16 00:00:00', '15735104464', '2017-10-29 14:38:46');
