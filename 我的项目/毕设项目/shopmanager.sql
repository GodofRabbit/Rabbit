/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : shopmanager

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-27 13:15:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `provinces` varchar(255) NOT NULL,
  `citys` varchar(255) NOT NULL,
  `countys` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postalcode` int(11) NOT NULL,
  `conname` varchar(255) NOT NULL,
  `conphone` varchar(255) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES ('13', '44', '家', '山西', '运城市', '永济市', '城西街道12路', '44500', '张三', '15735104465');
INSERT INTO `t_address` VALUES ('14', '44', '家', '江苏', '盐城市', '建湖县', '城东街道12路', '224700', '李四', '12345432789');
INSERT INTO `t_address` VALUES ('15', '50', '家 ', '吉林', '白山市', '江源县', '城北街道67号', '134700', '赵四', '1212124544');

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `ad` (`user_id`),
  KEY `av` (`goods_id`),
  CONSTRAINT `ad` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `av` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('1', '42', '1', '1');
INSERT INTO `t_cart` VALUES ('34', '50', '6', '1');
INSERT INTO `t_cart` VALUES ('35', '50', '6', '2');
INSERT INTO `t_cart` VALUES ('36', '50', '1', '1');
INSERT INTO `t_cart` VALUES ('38', '44', '1', '3');
INSERT INTO `t_cart` VALUES ('39', '44', '1', '1');
INSERT INTO `t_cart` VALUES ('40', '44', '2', '1');
INSERT INTO `t_cart` VALUES ('41', '44', '3', '1');
INSERT INTO `t_cart` VALUES ('48', '55', '1', '45');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(30) NOT NULL,
  `goodsprice` double(10,2) NOT NULL,
  `goods_imageurl` varchar(20) NOT NULL,
  `goodstime` varchar(255) NOT NULL,
  `state` int(2) NOT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '菠菜280g', '19.00', 'ht-1.jpg', '2017-10-24 15:10:58', '1', '45');
INSERT INTO `t_goods` VALUES ('2', '  大红脆甜水蜜桃 5斤', '29.00', 'pr-1.jpg', '2017-10-24 15:12:03', '1', '56');
INSERT INTO `t_goods` VALUES ('3', ' 菲律宾进口菠萝凤梨 2个', '38.00', 'ht-3.jpg', '2017-10-24 15:12:06', '1', '78');
INSERT INTO `t_goods` VALUES ('4', '梨福建特级红心蜜柚 4个', '69.00', 'ht-4.jpg', '2017-10-24 00:00:00', '1', '87');
INSERT INTO `t_goods` VALUES ('5', '广西青皮芒果青芒玉芒 5斤', '39.00', 'ht-5.jpg', '2017-10-10 00:00:00', '1', '65');
INSERT INTO `t_goods` VALUES ('6', '加力果嗄啦果苹果12个装', '33.50', 'ht-6.jpg', '2017-10-25 11:20:13', '1', '79');
INSERT INTO `t_goods` VALUES ('7', '  国产绿奇异果 16颗', '49.00', 'ht-7.jpg', '2017-10-11 11:20:24', '1', '34');
INSERT INTO `t_goods` VALUES ('8', ' 佳沛新西兰阳光金奇异果8颗', '27.50', 'ht-8.jpg', '2017-10-06 11:21:18', '1', '79');
INSERT INTO `t_goods` VALUES ('9', '精选百香果西番莲8颗', '29.00', 'ht-9.jpg', '2017-10-17 11:21:50', '1', '57');
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
INSERT INTO `t_goods` VALUES ('26', '浙江涌泉蜜桔无核桔子500g', '5.00', 'ht-28.jpg', '2018-02-24 22:34:21', '1', '78');
INSERT INTO `t_goods` VALUES ('27', '进口香蕉超甜蕉500g', '5.00', 'ht-2.jpg', '2018-02-24 22:34:21', '1', '95');
INSERT INTO `t_goods` VALUES ('28', '智利进口新鲜蓝莓 4盒	', '60.00', 'rc-3.jpg', '2018-02-27 23:34:12', '2', '87');

-- ----------------------------
-- Table structure for t_goods_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_sort`;
CREATE TABLE `t_goods_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_id` (`sort_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `t_goods_sort_ibfk_1` FOREIGN KEY (`sort_id`) REFERENCES `t_sort` (`sort_id`),
  CONSTRAINT `t_goods_sort_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_sort
-- ----------------------------
INSERT INTO `t_goods_sort` VALUES ('1', '3', '1');
INSERT INTO `t_goods_sort` VALUES ('2', '1', '2');
INSERT INTO `t_goods_sort` VALUES ('3', '2', '3');
INSERT INTO `t_goods_sort` VALUES ('4', '1', '4');
INSERT INTO `t_goods_sort` VALUES ('5', '1', '5');
INSERT INTO `t_goods_sort` VALUES ('6', '2', '6');
INSERT INTO `t_goods_sort` VALUES ('7', '1', '7');
INSERT INTO `t_goods_sort` VALUES ('8', '2', '8');
INSERT INTO `t_goods_sort` VALUES ('9', '2', '9');
INSERT INTO `t_goods_sort` VALUES ('10', '3', '10');
INSERT INTO `t_goods_sort` VALUES ('11', '2', '11');
INSERT INTO `t_goods_sort` VALUES ('12', '2', '12');
INSERT INTO `t_goods_sort` VALUES ('13', '3', '13');
INSERT INTO `t_goods_sort` VALUES ('14', '2', '14');
INSERT INTO `t_goods_sort` VALUES ('15', '2', '15');
INSERT INTO `t_goods_sort` VALUES ('16', '2', '16');
INSERT INTO `t_goods_sort` VALUES ('17', '1', '17');
INSERT INTO `t_goods_sort` VALUES ('18', '2', '18');
INSERT INTO `t_goods_sort` VALUES ('19', '2', '19');
INSERT INTO `t_goods_sort` VALUES ('20', '3', '20');
INSERT INTO `t_goods_sort` VALUES ('21', '3', '21');
INSERT INTO `t_goods_sort` VALUES ('22', '1', '22');
INSERT INTO `t_goods_sort` VALUES ('23', '1', '23');
INSERT INTO `t_goods_sort` VALUES ('24', '3', '24');
INSERT INTO `t_goods_sort` VALUES ('25', '2', '25');
INSERT INTO `t_goods_sort` VALUES ('26', '1', '26');
INSERT INTO `t_goods_sort` VALUES ('27', '1', '27');
INSERT INTO `t_goods_sort` VALUES ('28', '2', '28');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderseq` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `order_time` varchar(255) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `order_state` int(11) NOT NULL,
  `order_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `t_address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('25', '6657712279500172', '44', '14', '2018-03-11 23:48:08', '双休日、假日送货周六至周日', '3', '记得水果要新鲜的哦！');
INSERT INTO `t_order` VALUES ('26', '276059038262869', '44', '13', '2018-03-14 00:48:23', '工作日送货周一至周五', '1', '');
INSERT INTO `t_order` VALUES ('27', '51467525448154e16', '50', '15', '2018-03-14 00:50:59', '不限送货时间周一至周日', '4', '');
INSERT INTO `t_order` VALUES ('28', '7156615040410.883', '44', '13', '2018-03-14 16:33:46', '不限送货时间周一至周日', '1', '');
INSERT INTO `t_order` VALUES ('29', '827257680545.8009', '44', '13', '2018-03-14 16:49:56', '不限送货时间周一至周日', '1', '');
INSERT INTO `t_order` VALUES ('30', '6311643874562.945', '44', '13', '2018-03-17 11:19:45', '不限送货时间周一至周日', '1', '');
INSERT INTO `t_order` VALUES ('31', '9960633162372.404', '44', '13', '2018-03-23 17:06:38', '不限送货时间周一至周日', '1', '');
INSERT INTO `t_order` VALUES ('32', '2472138099812.0996', '44', '13', '2018-03-27 17:24:17', '不限送货时间周一至周日', '1', '');
INSERT INTO `t_order` VALUES ('33', '4133572274943.415', '44', '13', '2018-04-12 14:18:12', '不限送货时间周一至周日', '1', '');

-- ----------------------------
-- Table structure for t_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods`;
CREATE TABLE `t_order_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `t_order_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`),
  CONSTRAINT `t_order_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_goods
-- ----------------------------
INSERT INTO `t_order_goods` VALUES ('1', '25', '6', '3');
INSERT INTO `t_order_goods` VALUES ('2', '25', '11', '1');
INSERT INTO `t_order_goods` VALUES ('3', '26', '5', '1');
INSERT INTO `t_order_goods` VALUES ('4', '26', '6', '3');
INSERT INTO `t_order_goods` VALUES ('5', '26', '11', '1');
INSERT INTO `t_order_goods` VALUES ('6', '27', '6', '3');
INSERT INTO `t_order_goods` VALUES ('7', '28', '5', '1');
INSERT INTO `t_order_goods` VALUES ('8', '28', '6', '3');
INSERT INTO `t_order_goods` VALUES ('9', '28', '11', '1');
INSERT INTO `t_order_goods` VALUES ('10', '29', '5', '1');
INSERT INTO `t_order_goods` VALUES ('11', '29', '6', '3');
INSERT INTO `t_order_goods` VALUES ('12', '29', '11', '1');
INSERT INTO `t_order_goods` VALUES ('14', '30', '2', '1');
INSERT INTO `t_order_goods` VALUES ('15', '30', '28', '2');
INSERT INTO `t_order_goods` VALUES ('16', '31', '1', '5');
INSERT INTO `t_order_goods` VALUES ('17', '31', '15', '1');
INSERT INTO `t_order_goods` VALUES ('18', '32', '1', '4');
INSERT INTO `t_order_goods` VALUES ('19', '33', '5', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'normal');
INSERT INTO `t_role` VALUES ('2', 'admin');
INSERT INTO `t_role` VALUES ('3', 'root');

-- ----------------------------
-- Table structure for t_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort` (
  `sort_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(255) NOT NULL,
  PRIMARY KEY (`sort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sort
-- ----------------------------
INSERT INTO `t_sort` VALUES ('1', '国产水果');
INSERT INTO `t_sort` VALUES ('2', '进口水果');
INSERT INTO `t_sort` VALUES ('3', '新鲜时蔬');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `jointime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('42', 'root', '2a7273d39a392343d1a39d2f407fb82d', '超级管理员', '15735104461', '2018-02-23 11:15:06');
INSERT INTO `t_user` VALUES ('43', 'admin', '96aa34b6c9346f3ad21d4a30fcc2939e', '普通管理员', '15735104462', '2018-02-23 11:16:17');
INSERT INTO `t_user` VALUES ('44', '张三', 'd4e0d2d5ec47607940248729ca752c63', '张三', '15735104463', '2018-02-23 11:16:55');
INSERT INTO `t_user` VALUES ('46', 'lisi', 'c489eb2fac4bd4b1dd47718d2d4eacb2', '李四', '15735104464', '2018-03-13 22:05:29');
INSERT INTO `t_user` VALUES ('47', 'wangwu', 'f75550ecf200295af5c1167a2c9b252b', '王五', '15735104465', '2018-03-13 22:06:00');
INSERT INTO `t_user` VALUES ('48', 'maliu', 'b33a7cf64665b15f54f980628865e42b', '马六', '15735104466', '2018-03-13 22:06:27');
INSERT INTO `t_user` VALUES ('49', 'qianqi', '10c98635661761a5fd98e6b1d244de68', '钱七', '15735104467', '2018-03-13 22:06:58');
INSERT INTO `t_user` VALUES ('50', 'zhaosi', 'c59b762a22c1e5c5f3dd07b7f9f3adaf', '赵四', '15735104468', '2018-03-13 23:48:19');
INSERT INTO `t_user` VALUES ('51', '1', '9686c284966d4f11b5742b421a06c33e', '1', '15735191111', '2018-03-23 17:17:44');
INSERT INTO `t_user` VALUES ('55', 'qwer', '7964433e52cc70100afb23e8d05119cd', '吕彦楠', '15735104469', '2018-04-19 17:23:21');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`user_id`),
  KEY `r_id` (`role_id`),
  CONSTRAINT `r_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`role_id`),
  CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('5', '42', '3');
INSERT INTO `t_user_role` VALUES ('6', '43', '2');
INSERT INTO `t_user_role` VALUES ('7', '44', '1');
INSERT INTO `t_user_role` VALUES ('9', '46', '2');
INSERT INTO `t_user_role` VALUES ('10', '47', '2');
INSERT INTO `t_user_role` VALUES ('11', '48', '2');
INSERT INTO `t_user_role` VALUES ('12', '49', '2');
INSERT INTO `t_user_role` VALUES ('13', '50', '1');
INSERT INTO `t_user_role` VALUES ('14', '51', '1');
INSERT INTO `t_user_role` VALUES ('18', '55', '1');
