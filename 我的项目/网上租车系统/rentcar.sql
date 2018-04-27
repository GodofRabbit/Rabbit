/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : rentcar

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-12-25 17:56:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `brandname` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `country` varchar(50) DEFAULT NULL COMMENT '所属国家',
  PRIMARY KEY (`id`),
  UNIQUE KEY `brandname` (`brandname`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', '奥迪', '德国');
INSERT INTO `t_brand` VALUES ('2', '宝马', '德国');
INSERT INTO `t_brand` VALUES ('3', '奔驰', '德国');
INSERT INTO `t_brand` VALUES ('4', '本田', '日本');
INSERT INTO `t_brand` VALUES ('5', '标致', '法国');
INSERT INTO `t_brand` VALUES ('6', '别克', '美国');
INSERT INTO `t_brand` VALUES ('7', '比亚迪', '中国');
INSERT INTO `t_brand` VALUES ('8', '长城', '中国');
INSERT INTO `t_brand` VALUES ('9', '大众', '德国');
INSERT INTO `t_brand` VALUES ('10', '丰田', '日本');
INSERT INTO `t_brand` VALUES ('11', '福特', '美国');
INSERT INTO `t_brand` VALUES ('12', '金杯', '中国');
INSERT INTO `t_brand` VALUES ('13', '凯迪拉克', '美国');
INSERT INTO `t_brand` VALUES ('14', '铃木', '日本');
INSERT INTO `t_brand` VALUES ('15', '马自达', '马自达');
INSERT INTO `t_brand` VALUES ('16', '奇瑞', '中国');
INSERT INTO `t_brand` VALUES ('17', '起亚', '韩国');
INSERT INTO `t_brand` VALUES ('18', '斯柯达', '德国');
INSERT INTO `t_brand` VALUES ('19', '现代', '韩国');
INSERT INTO `t_brand` VALUES ('20', '雪佛兰', '中国');
INSERT INTO `t_brand` VALUES ('21', '沃尔沃', '瑞典');
INSERT INTO `t_brand` VALUES ('22', '三菱', '日本');

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '车辆编号',
  `carname` varchar(50) NOT NULL,
  `carcolor` varchar(20) NOT NULL COMMENT '汽车颜色',
  `seating` int(10) NOT NULL COMMENT '汽车座位数',
  `fueltype` int(10) NOT NULL COMMENT '1、汽油2、柴油 3、电力',
  `displacement` varchar(10) NOT NULL COMMENT '汽车排量',
  `roz` varchar(100) NOT NULL COMMENT '汽车燃油标号',
  `fuelTank` double(255,0) NOT NULL COMMENT '油箱容量',
  `gps` varchar(255) NOT NULL COMMENT '有或无',
  `price` double NOT NULL COMMENT '汽车每天的租赁价格',
  `overprice` double NOT NULL COMMENT '汽车逾期之后每天价格',
  `state` int(10) NOT NULL COMMENT '1:可租,2:已租,3:损毁',
  `license` varchar(20) NOT NULL COMMENT '汽车车牌',
  `brand_id` int(50) DEFAULT NULL COMMENT '汽车品牌',
  `type_id` int(20) DEFAULT NULL COMMENT '汽车所属类型',
  `photo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_brand` (`brand_id`),
  KEY `fk_type` (`type_id`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `t_brand` (`id`),
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `t_cartype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1', '奥迪A6L', '白色', '5', '1', '2.0T', '92-93', '43', '有', '120', '170', '1', '晋A7777S', '1', '4', '001.webp');
INSERT INTO `t_car` VALUES ('2', '雪佛兰科鲁兹', '蓝色', '5', '1', '1.5T', '92-93', '60', '无', '99', '139', '1', '晋A6666S', '20', '2', '002.webp');
INSERT INTO `t_car` VALUES ('3', '奔驰', '黑色', '5', '1', '2.0T', '92-93', '43', '有', '120', '170', '1', '晋A5555S', '3', '4', '003.webp');

-- ----------------------------
-- Table structure for t_cartype
-- ----------------------------
DROP TABLE IF EXISTS `t_cartype`;
CREATE TABLE `t_cartype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆编号',
  `typename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typename` (`typename`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cartype
-- ----------------------------
INSERT INTO `t_cartype` VALUES ('6', '6-15商务座');
INSERT INTO `t_cartype` VALUES ('5', 'SUV');
INSERT INTO `t_cartype` VALUES ('7', '个性车');
INSERT INTO `t_cartype` VALUES ('3', '商务型');
INSERT INTO `t_cartype` VALUES ('1', '手动紧凑');
INSERT INTO `t_cartype` VALUES ('8', '电动车');
INSERT INTO `t_cartype` VALUES ('2', '经济型');
INSERT INTO `t_cartype` VALUES ('4', '豪华型');

-- ----------------------------
-- Table structure for t_clerk
-- ----------------------------
DROP TABLE IF EXISTS `t_clerk`;
CREATE TABLE `t_clerk` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '职员编号',
  `username` varchar(20) NOT NULL COMMENT '职员用户名',
  `password` varchar(20) NOT NULL COMMENT '职员密码',
  `relname` varchar(20) NOT NULL COMMENT '职员名字',
  `entrytime` date NOT NULL COMMENT '职员入职时间',
  `state` int(10) NOT NULL COMMENT '1、正在任职2、离职3、休假',
  `sex` varchar(10) NOT NULL COMMENT '职员性别',
  `phone` varchar(20) DEFAULT NULL COMMENT '职员联系电话',
  `idcard` varchar(20) DEFAULT NULL COMMENT '职员身份证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `Idcard` (`idcard`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_clerk
-- ----------------------------

-- ----------------------------
-- Table structure for t_clerk_role
-- ----------------------------
DROP TABLE IF EXISTS `t_clerk_role`;
CREATE TABLE `t_clerk_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `clerk_id` int(10) NOT NULL COMMENT '职员编号',
  `role_id` int(10) NOT NULL COMMENT '等级编号',
  PRIMARY KEY (`id`),
  KEY `fk_clerk` (`clerk_id`),
  KEY `fk_role` (`role_id`),
  CONSTRAINT `fk_clerk` FOREIGN KEY (`clerk_id`) REFERENCES `t_clerk` (`id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_clerk_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_coupon
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon`;
CREATE TABLE `t_coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double(100,2) NOT NULL,
  `time` int(10) NOT NULL,
  `state` int(255) NOT NULL COMMENT '1进行中 2已过期',
  `description` varchar(255) DEFAULT NULL,
  `coutype` int(255) NOT NULL COMMENT '1、新人券 2、满减券,3、折扣券',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coupon
-- ----------------------------
INSERT INTO `t_coupon` VALUES ('1', '新用户专享150元见面礼', '150.00', '7', '1', '新用户注册后，即送100元电子代金券，有效期：注册日起6个月。新用户专享券适用于全国所有直营门店、全部车型，节假日通用', '1', 'img/1.jpg');
INSERT INTO `t_coupon` VALUES ('2', '年租套餐问世 低至五折 ', '0.50', '5', '1', '我们支持年租了，年租可享受打五折的优惠，租车为你越过时间的界限，企业和个人均可约定年租车', '3', 'img/2.jpg');
INSERT INTO `t_coupon` VALUES ('3', '超值优惠 低至六折', '0.60', '5', '1', '超值优惠 低至6折！\r\n\r\n月租价格 再刷新低\r\n底价诱惑 就等你了！月租套餐，租期28~89天，即可享受月租特价套餐', '3', 'img/3.jpg');
INSERT INTO `t_coupon` VALUES ('4', '开通国际租车业务 满1000减100', '100.00', '3', '1', '租车开通国际租车业务，满1000减100服务', '2', 'img/4.jpg');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `min_integral` int(100) DEFAULT NULL,
  `max_integral` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '普通会员', '0', '50');
INSERT INTO `t_grade` VALUES ('2', '白银会员', '50', '150');
INSERT INTO `t_grade` VALUES ('3', '黄金会员', '150', '450');
INSERT INTO `t_grade` VALUES ('4', '白金会员', '450', '1000');
INSERT INTO `t_grade` VALUES ('5', '钻石会员', '1000', null);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `Id` int(10) NOT NULL AUTO_INCREMENT COMMENT '出租编号',
  `t_user.id` int(10) NOT NULL COMMENT '会员编号',
  `t_brand.id` int(10) NOT NULL COMMENT '所租车辆品牌编号',
  `t_cartype.id` int(10) NOT NULL COMMENT '所租车辆类型',
  `Btime` datetime NOT NULL COMMENT '所租车辆类型',
  `Etime` datetime NOT NULL COMMENT '预计还车时间',
  `Rent` double NOT NULL COMMENT '租车所付费用',
  `Rtime` datetime NOT NULL COMMENT '实际归还时间',
  `ARent` double NOT NULL COMMENT '租车实际费用',
  `damage` double DEFAULT NULL COMMENT '车辆损坏赔偿金',
  `LateFee` double DEFAULT NULL COMMENT '车辆逾期违约金',
  PRIMARY KEY (`Id`),
  KEY `fk_userid` (`t_user.id`),
  KEY `fk_bid` (`t_brand.id`),
  KEY `fk_cartid` (`t_cartype.id`),
  CONSTRAINT `fk_bid` FOREIGN KEY (`t_brand.id`) REFERENCES `t_brand` (`id`),
  CONSTRAINT `fk_cartid` FOREIGN KEY (`t_cartype.id`) REFERENCES `t_cartype` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`t_user.id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '等级编号',
  `role` varchar(20) NOT NULL COMMENT 'Admin管理员Emp店员Manager店长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `headurl` varchar(255) NOT NULL DEFAULT 'user.jpg',
  `integral` int(255) DEFAULT '0',
  `money` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('28', '任录', 'c489eb2fac4bd4b1dd47718d2d4eacb2', null, '15735104464', null, 'user.jpg', '0', '0');
INSERT INTO `t_user` VALUES ('29', '大白', '10c98635661761a5fd98e6b1d244de68', null, '15735104467', null, 'user.jpg', '0', '0');

-- ----------------------------
-- Table structure for t_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `t_user_coupon`;
CREATE TABLE `t_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(50) DEFAULT NULL COMMENT '多个券对应一个用户',
  `user_id` int(100) DEFAULT NULL COMMENT '一个券也可以对应多个用户',
  `createtime` datetime NOT NULL COMMENT '领取时间',
  `state` int(3) DEFAULT NULL COMMENT '1未使用 2 已使用 3 已过期',
  PRIMARY KEY (`id`),
  KEY `fk_coupon` (`coupon_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `t_coupon` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_coupon
-- ----------------------------
INSERT INTO `t_user_coupon` VALUES ('1', '2', '1', '2017-12-24 13:24:12', '1');
INSERT INTO `t_user_coupon` VALUES ('2', '3', '1', '2017-12-16 15:59:29', '3');
INSERT INTO `t_user_coupon` VALUES ('3', '4', '1', '2017-12-17 15:59:55', '3');
INSERT INTO `t_user_coupon` VALUES ('4', '1', '1', '2017-12-25 09:10:33', '1');
