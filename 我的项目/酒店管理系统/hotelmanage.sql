/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : hotelmanage

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-27 13:24:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作员ID',
  `admin_name` varchar(255) NOT NULL COMMENT '操作员姓名',
  `admin_password` varchar(255) NOT NULL,
  `admin_reallyName` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'renlu', '4QrcOUm6Wau+VuBX8g+IPg==', '任录');
INSERT INTO `admin` VALUES ('2', 'jiguofeng', '4QrcOUm6Wau+VuBX8g+IPg==', '吉国锋');
INSERT INTO `admin` VALUES ('3', 'zhangxin', '4QrcOUm6Wau+VuBX8g+IPg==', '张鑫');
INSERT INTO `admin` VALUES ('4', 'qiaoyajun', '4QrcOUm6Wau+VuBX8g+IPg==', ' 乔亚军');

-- ----------------------------
-- Table structure for a_r
-- ----------------------------
DROP TABLE IF EXISTS `a_r`;
CREATE TABLE `a_r` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aid` (`admin_id`),
  KEY `FK_rid` (`role_id`),
  CONSTRAINT `FK_aid` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `FK_rid` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_r
-- ----------------------------
INSERT INTO `a_r` VALUES ('1', '1', '3');
INSERT INTO `a_r` VALUES ('2', '2', '2');
INSERT INTO `a_r` VALUES ('3', '3', '1');
INSERT INTO `a_r` VALUES ('4', '4', '1');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) DEFAULT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1505199213994.jpg', '1');
INSERT INTO `image` VALUES ('2', 'admin1.jpg', '2');
INSERT INTO `image` VALUES ('3', '54607cf962c91.jpg', '3');
INSERT INTO `image` VALUES ('4', 'admin1.jpg', '4');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '常用菜单');
INSERT INTO `menu` VALUES ('2', '信息查询');
INSERT INTO `menu` VALUES ('3', '客户管理');
INSERT INTO `menu` VALUES ('4', '入住管理');
INSERT INTO `menu` VALUES ('5', '后台设置');
INSERT INTO `menu` VALUES ('6', '营业额统计');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '职员');
INSERT INTO `role` VALUES ('2', '主管');
INSERT INTO `role` VALUES ('3', '总经理');

-- ----------------------------
-- Table structure for roominfo
-- ----------------------------
DROP TABLE IF EXISTS `roominfo`;
CREATE TABLE `roominfo` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间编号',
  `room_number` varchar(20) NOT NULL COMMENT '房间号 ',
  `room_type_id` int(11) DEFAULT NULL COMMENT '房间类型ID',
  `room_state_id` int(11) DEFAULT NULL COMMENT '房间状态编号',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roominfo
-- ----------------------------
INSERT INTO `roominfo` VALUES ('1', 'A001', '1', '3');
INSERT INTO `roominfo` VALUES ('2', 'A002', '1', '3');
INSERT INTO `roominfo` VALUES ('3', 'A003', '1', '3');
INSERT INTO `roominfo` VALUES ('4', 'A004', '1', '3');
INSERT INTO `roominfo` VALUES ('5', 'A005', '1', '3');
INSERT INTO `roominfo` VALUES ('6', 'A006', '1', '3');
INSERT INTO `roominfo` VALUES ('7', 'B001', '2', '3');
INSERT INTO `roominfo` VALUES ('8', 'B002', '2', '3');
INSERT INTO `roominfo` VALUES ('9', 'B003', '2', '3');
INSERT INTO `roominfo` VALUES ('10', 'B004', '2', '3');
INSERT INTO `roominfo` VALUES ('11', 'B005', '2', '3');
INSERT INTO `roominfo` VALUES ('12', 'B006', '2', '3');
INSERT INTO `roominfo` VALUES ('13', 'C001', '3', '3');
INSERT INTO `roominfo` VALUES ('14', 'C002', '3', '3');
INSERT INTO `roominfo` VALUES ('15', 'C003', '3', '3');
INSERT INTO `roominfo` VALUES ('16', 'C004', '3', '3');
INSERT INTO `roominfo` VALUES ('17', 'C005', '3', '3');
INSERT INTO `roominfo` VALUES ('18', 'C006', '3', '3');
INSERT INTO `roominfo` VALUES ('19', 'D001', '4', '2');
INSERT INTO `roominfo` VALUES ('20', 'D002', '4', '3');
INSERT INTO `roominfo` VALUES ('21', 'D003', '4', '3');
INSERT INTO `roominfo` VALUES ('22', 'D004', '4', '3');
INSERT INTO `roominfo` VALUES ('23', 'D005', '4', '3');
INSERT INTO `roominfo` VALUES ('24', 'D006', '4', '3');
INSERT INTO `roominfo` VALUES ('25', 'E001', '5', '3');
INSERT INTO `roominfo` VALUES ('26', 'E002', '5', '3');
INSERT INTO `roominfo` VALUES ('27', 'E003', '5', '3');
INSERT INTO `roominfo` VALUES ('28', 'E004', '5', '3');
INSERT INTO `roominfo` VALUES ('29', 'E005', '5', '3');
INSERT INTO `roominfo` VALUES ('30', 'E006', '5', '3');
INSERT INTO `roominfo` VALUES ('31', 'F001', '6', '3');
INSERT INTO `roominfo` VALUES ('32', 'F002', '6', '3');
INSERT INTO `roominfo` VALUES ('33', 'F003', '6', '3');
INSERT INTO `roominfo` VALUES ('34', 'F004', '6', '3');
INSERT INTO `roominfo` VALUES ('35', 'F005', '6', '3');
INSERT INTO `roominfo` VALUES ('36', 'F006', '6', '3');

-- ----------------------------
-- Table structure for roomstate
-- ----------------------------
DROP TABLE IF EXISTS `roomstate`;
CREATE TABLE `roomstate` (
  `room_state_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间状态编号',
  `room_state_name` varchar(20) NOT NULL,
  PRIMARY KEY (`room_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomstate
-- ----------------------------
INSERT INTO `roomstate` VALUES ('1', '已预定');
INSERT INTO `roomstate` VALUES ('2', '已入住');
INSERT INTO `roomstate` VALUES ('3', '未入住');
INSERT INTO `roomstate` VALUES ('4', '维修中');
INSERT INTO `roomstate` VALUES ('5', '清扫中');
INSERT INTO `roomstate` VALUES ('6', '未开通');

-- ----------------------------
-- Table structure for roomtype
-- ----------------------------
DROP TABLE IF EXISTS `roomtype`;
CREATE TABLE `roomtype` (
  `room_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type_name` varchar(50) NOT NULL,
  `room_type_price` int(11) NOT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomtype
-- ----------------------------
INSERT INTO `roomtype` VALUES ('1', '普通单人间(220/天)', '220');
INSERT INTO `roomtype` VALUES ('2', '豪华单人间(280/天)', '280');
INSERT INTO `roomtype` VALUES ('3', '普通双人间(380/天)', '380');
INSERT INTO `roomtype` VALUES ('4', '豪华双人间(480/天)', '480');
INSERT INTO `roomtype` VALUES ('5', '贵宾套房(580/天)', '580');
INSERT INTO `roomtype` VALUES ('6', '总统套房(1280/天)', '1280');

-- ----------------------------
-- Table structure for r_m
-- ----------------------------
DROP TABLE IF EXISTS `r_m`;
CREATE TABLE `r_m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_roID` (`role_id`),
  KEY `FK_meid` (`menu_id`),
  CONSTRAINT `FK_meid` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `FK_roID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_m
-- ----------------------------
INSERT INTO `r_m` VALUES ('1', '1', '1');
INSERT INTO `r_m` VALUES ('2', '1', '2');
INSERT INTO `r_m` VALUES ('3', '1', '4');
INSERT INTO `r_m` VALUES ('4', '1', '5');
INSERT INTO `r_m` VALUES ('5', '2', '1');
INSERT INTO `r_m` VALUES ('6', '2', '2');
INSERT INTO `r_m` VALUES ('7', '2', '3');
INSERT INTO `r_m` VALUES ('8', '2', '4');
INSERT INTO `r_m` VALUES ('9', '2', '5');
INSERT INTO `r_m` VALUES ('10', '3', '1');
INSERT INTO `r_m` VALUES ('11', '3', '2');
INSERT INTO `r_m` VALUES ('12', '3', '3');
INSERT INTO `r_m` VALUES ('13', '3', '4');
INSERT INTO `r_m` VALUES ('14', '3', '5');
INSERT INTO `r_m` VALUES ('15', '3', '6');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顾客ID',
  `user_name` varchar(255) NOT NULL,
  `user_sex` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `personID` varchar(255) NOT NULL COMMENT '身份证号码',
  `user_type_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '任录', '男', '15735104464', '142702199601194918', '4');
INSERT INTO `userinfo` VALUES ('2', '吉国锋', '男', '15735104465', '142702199602194918', '3');
INSERT INTO `userinfo` VALUES ('3', '张鑫', '男', '15735104466', '142702199603194918', '2');
INSERT INTO `userinfo` VALUES ('4', '乔亚军', '男', '15735104467', '142702199604194918', '1');
INSERT INTO `userinfo` VALUES ('5', '丽丽', '女', '15735104468', '142702199605194918', '1');
INSERT INTO `userinfo` VALUES ('6', '小美', '女', '15735104469', '142702199606194918', '4');
INSERT INTO `userinfo` VALUES ('7', '老王', '男', '15735104470', '142702199607194918', '1');

-- ----------------------------
-- Table structure for userrecord
-- ----------------------------
DROP TABLE IF EXISTS `userrecord`;
CREATE TABLE `userrecord` (
  `record_id` int(255) NOT NULL AUTO_INCREMENT,
  `room_id` varchar(255) NOT NULL,
  `inTime` datetime NOT NULL,
  `dayNum` int(11) NOT NULL,
  `outTime` datetime NOT NULL,
  `charge` double NOT NULL DEFAULT '0',
  `consume` double NOT NULL,
  `remark` varchar(255) NOT NULL,
  `user_id` varchar(11) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrecord
-- ----------------------------
INSERT INTO `userrecord` VALUES ('1', '19', '2017-12-01 18:19:51', '2', '2017-12-03 18:19:52', '500', '2560', '暂无', '1');
INSERT INTO `userrecord` VALUES ('2', '13', '2017-12-01 18:24:57', '1', '2017-12-02 18:24:59', '300', '380', '暂无', '1');
INSERT INTO `userrecord` VALUES ('3', '7', '2017-12-02 16:09:36', '2', '2017-12-04 16:09:37', '200', '560', '暂无', '2');
INSERT INTO `userrecord` VALUES ('4', '1', '2017-12-02 17:29:34', '3', '2017-12-05 17:29:49', '100', '660', '暂无', '2');
INSERT INTO `userrecord` VALUES ('5', '19', '2017-12-02 18:19:51', '2', '2017-12-04 18:19:52', '500', '2560', '暂无', '3');
INSERT INTO `userrecord` VALUES ('6', '7', '2017-12-03 16:09:36', '2', '2017-12-05 16:09:37', '200', '560', '暂无', '3');
INSERT INTO `userrecord` VALUES ('7', '19', '2017-12-02 18:24:57', '2', '2017-12-04 18:24:59', '500', '2560', '暂无', '4');
INSERT INTO `userrecord` VALUES ('8', '7', '2017-12-03 18:24:57', '2', '2017-12-05 18:24:59', '200', '560', '暂无', '4');
INSERT INTO `userrecord` VALUES ('9', '1', '2017-12-02 17:29:34', '2', '2017-12-05 17:29:49', '50', '440', '暂无', '5');
INSERT INTO `userrecord` VALUES ('10', '19', '2017-11-29 19:56:39', '1', '2017-11-30 19:56:53', '200', '1280', '暂无', '5');
INSERT INTO `userrecord` VALUES ('11', '7', '2017-12-03 12:06:44', '3', '2017-12-06 12:06:44', '200', '840', '暂无\n    ', '6');
INSERT INTO `userrecord` VALUES ('12', '9', '2017-12-03 12:31:43', '1', '2017-12-04 12:31:43', '100', '280', '暂无', '6');
INSERT INTO `userrecord` VALUES ('13', '1', '2017-12-03 12:35:28', '4', '2017-12-07 12:35:28', '300', '880', '暂无', '7');
INSERT INTO `userrecord` VALUES ('14', '7', '2017-12-03 13:06:56', '1', '2017-12-04 13:06:56', '100', '280', '暂无', '7');
INSERT INTO `userrecord` VALUES ('15', '8', '2017-12-03 13:08:58', '2', '2017-12-05 13:09:04', '140', '560', '暂无', '2');
INSERT INTO `userrecord` VALUES ('21', '24', '2017-12-03 14:41:19', '1', '2017-12-05 11:20:32', '1000', '1280', '暂无', '1');
INSERT INTO `userrecord` VALUES ('29', '6', '2017-12-05 14:49:59', '2', '2017-12-07 14:49:55', '100', '440', '暂无', '1');
INSERT INTO `userrecord` VALUES ('30', '1', '2017-12-05 15:30:41', '1', '2017-12-05 15:31:47', '400', '220', '暂无', '1');
INSERT INTO `userrecord` VALUES ('31', '4', '2017-12-06 00:16:39', '1', '2017-12-06 00:17:32', '100', '220', '暂无', '1');
INSERT INTO `userrecord` VALUES ('32', '16', '2017-12-06 01:29:16', '1', '2017-12-06 01:29:45', '200', '380', '暂无', '1');
INSERT INTO `userrecord` VALUES ('33', '1', '2017-12-06 08:40:23', '1', '2017-12-07 15:58:06', '100', '220', '暂无', '1');
INSERT INTO `userrecord` VALUES ('34', '7', '2017-12-06 10:57:03', '1', '2017-12-06 10:58:10', '50', '280', '暂无', '1');
INSERT INTO `userrecord` VALUES ('35', '2', '2017-12-06 17:39:58', '1', '2017-12-06 17:40:19', '100', '220', '暂无', '1');
INSERT INTO `userrecord` VALUES ('36', '2', '2017-12-07 15:54:39', '1', '2018-04-17 17:42:19', '100', '220', '暂无', '1');
INSERT INTO `userrecord` VALUES ('37', '1', '2018-03-07 11:21:38', '0', '2018-03-07 11:22:48', '100', '0', '暂无', '1');

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `user_type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO `usertype` VALUES ('1', '普通会员');
INSERT INTO `usertype` VALUES ('2', '高级会员');
INSERT INTO `usertype` VALUES ('3', '黄金会员');
INSERT INTO `usertype` VALUES ('4', '钻石会员');
