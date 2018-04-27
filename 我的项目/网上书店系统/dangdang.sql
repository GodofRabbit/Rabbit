/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50145
Source Host           : localhost:3306
Source Database       : dangdang

Target Server Type    : MYSQL
Target Server Version : 50145
File Encoding         : 65001

Date: 2015-08-07 16:21:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `product_id` int(8) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `star` tinyint(4) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `comment_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '25', '2', '5', '青春文学，非常不错。很好的一部作品哦，大力推荐！！', '1438929946964');

-- ----------------------------
-- Table structure for `d_book`
-- ----------------------------
DROP TABLE IF EXISTS `d_book`;
CREATE TABLE `d_book` (
  `id` int(12) NOT NULL,
  `author` varchar(200) NOT NULL,
  `publishing` varchar(200) NOT NULL,
  `publish_time` bigint(20) NOT NULL,
  `word_number` varchar(15) DEFAULT NULL,
  `which_edtion` varchar(15) DEFAULT NULL,
  `total_page` varchar(15) DEFAULT NULL,
  `print_time` int(20) DEFAULT NULL,
  `print_number` varchar(15) DEFAULT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  `author_summary` text NOT NULL,
  `catalogue` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_book
-- ----------------------------
INSERT INTO `d_book` VALUES ('1', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('2', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('3', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('4', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('5', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('6', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('7', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('8', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('9', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('10', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('11', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('12', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('13', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('14', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('15', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('16', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('17', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('18', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('19', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('20', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('21', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('22', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('23', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('24', '我写的', '地球出版社', '1237873000234', '1万', '1', '100', '1', null, '12345678', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('25', '琼瑶', '人民出版社', '1438927663245', '250000', '1', '500', '1', null, '28712312', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('26', 'Bruce', '清华大学出版社', '1438930338417', '500000', '1', '890', '1', null, '27888111', '作者是好人', '这真是一本好书啊');
INSERT INTO `d_book` VALUES ('27', '王峰顶', '上海文艺出版社', '1438935293667', '681100', '1', '650', '1', null, '12312333', '作者是好人', '这真是一本好书啊');

-- ----------------------------
-- Table structure for `d_category`
-- ----------------------------
DROP TABLE IF EXISTS `d_category`;
CREATE TABLE `d_category` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `turn` int(10) NOT NULL,
  `en_name` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_category
-- ----------------------------
INSERT INTO `d_category` VALUES ('1', '1', 'Book', '图书', null, '0');
INSERT INTO `d_category` VALUES ('2', '1', 'Novel', '小说', null, '1');
INSERT INTO `d_category` VALUES ('3', '2', 'Youth', '青春', null, '1');
INSERT INTO `d_category` VALUES ('4', '3', 'Humanity And Social Science', '人文社科', null, '1');
INSERT INTO `d_category` VALUES ('5', '4', 'Management', '管理', null, '1');
INSERT INTO `d_category` VALUES ('6', '5', 'Children', '少儿', null, '1');
INSERT INTO `d_category` VALUES ('7', '6', 'Foreign Language', '外语', null, '1');
INSERT INTO `d_category` VALUES ('8', '7', 'Computer', '计算机', null, '1');
INSERT INTO `d_category` VALUES ('9', '1', 'Chinese Contemporary Novel', '当代小说', null, '2');
INSERT INTO `d_category` VALUES ('10', '2', 'Chinese Modern Novel', '近现代小说', null, '2');
INSERT INTO `d_category` VALUES ('11', '3', 'Chinese Classical  Novel', '古典小说', null, '2');
INSERT INTO `d_category` VALUES ('12', '4', 'Four Classic Novels', '四大名著', null, '2');
INSERT INTO `d_category` VALUES ('13', '5', 'Translated Works', '世界名著', null, '2');
INSERT INTO `d_category` VALUES ('14', '1', 'School', '校园', null, '3');
INSERT INTO `d_category` VALUES ('15', '2', 'Love', '爱情/情感', null, '3');
INSERT INTO `d_category` VALUES ('16', '3', 'Grow Up', '叛逆/成长', null, '3');
INSERT INTO `d_category` VALUES ('17', '4', 'Fantasy', '玄幻', null, '3');
INSERT INTO `d_category` VALUES ('18', '5', 'Original', '原创', null, '3');
INSERT INTO `d_category` VALUES ('19', '1', 'Political', '政治', null, '4');
INSERT INTO `d_category` VALUES ('20', '2', 'Economic', '经济', null, '4');
INSERT INTO `d_category` VALUES ('21', '3', 'Law', '法律', null, '4');
INSERT INTO `d_category` VALUES ('22', '4', 'Philosophy', '哲学', null, '4');
INSERT INTO `d_category` VALUES ('23', '5', 'History', '历史', null, '4');
INSERT INTO `d_category` VALUES ('24', '1', 'Commen Management', '管理学', null, '5');
INSERT INTO `d_category` VALUES ('25', '2', 'Strategic Management', '战略管理', null, '5');
INSERT INTO `d_category` VALUES ('26', '3', 'Marketing', '市场营销', null, '5');
INSERT INTO `d_category` VALUES ('27', '4', 'Business History', '商业史传', null, '5');
INSERT INTO `d_category` VALUES ('28', '5', 'E-Business', '电子商务', null, '5');
INSERT INTO `d_category` VALUES ('29', '1', '0-2', '0-2岁', null, '6');
INSERT INTO `d_category` VALUES ('30', '2', '3-6', '3-6岁', null, '6');
INSERT INTO `d_category` VALUES ('31', '3', '7-10', '7-10岁', null, '6');
INSERT INTO `d_category` VALUES ('32', '4', '11-14', '11-14岁', null, '6');
INSERT INTO `d_category` VALUES ('33', '5', 'Child Literature', '儿童文学', null, '6');
INSERT INTO `d_category` VALUES ('34', '1', 'English', '英语', null, '7');
INSERT INTO `d_category` VALUES ('35', '2', 'Japanese', '日语', null, '7');
INSERT INTO `d_category` VALUES ('36', '3', 'Korean', '韩语', null, '7');
INSERT INTO `d_category` VALUES ('37', '4', 'Russian', '俄语', null, '7');
INSERT INTO `d_category` VALUES ('38', '5', 'German', '德语', null, '7');
INSERT INTO `d_category` VALUES ('39', '1', 'Computer Theory', '计算机理论', null, '8');
INSERT INTO `d_category` VALUES ('40', '2', 'Database', '数据库', null, '8');
INSERT INTO `d_category` VALUES ('41', '3', 'Programming', '程序设计', null, '8');
INSERT INTO `d_category` VALUES ('42', '4', 'Artificial Intelligence', '人工智能', null, '8');
INSERT INTO `d_category` VALUES ('43', '5', 'Computer Examination', '计算机考试', null, '8');

-- ----------------------------
-- Table structure for `d_category_product`
-- ----------------------------
DROP TABLE IF EXISTS `d_category_product`;
CREATE TABLE `d_category_product` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_category_product
-- ----------------------------
INSERT INTO `d_category_product` VALUES ('1', '1', '9');
INSERT INTO `d_category_product` VALUES ('2', '2', '9');
INSERT INTO `d_category_product` VALUES ('3', '3', '9');
INSERT INTO `d_category_product` VALUES ('4', '4', '9');
INSERT INTO `d_category_product` VALUES ('5', '5', '9');
INSERT INTO `d_category_product` VALUES ('6', '6', '9');
INSERT INTO `d_category_product` VALUES ('7', '7', '9');
INSERT INTO `d_category_product` VALUES ('8', '8', '9');
INSERT INTO `d_category_product` VALUES ('9', '9', '9');
INSERT INTO `d_category_product` VALUES ('10', '10', '9');
INSERT INTO `d_category_product` VALUES ('11', '11', '10');
INSERT INTO `d_category_product` VALUES ('12', '12', '10');
INSERT INTO `d_category_product` VALUES ('13', '13', '10');
INSERT INTO `d_category_product` VALUES ('14', '14', '10');
INSERT INTO `d_category_product` VALUES ('15', '15', '10');
INSERT INTO `d_category_product` VALUES ('16', '16', '10');
INSERT INTO `d_category_product` VALUES ('17', '17', '10');
INSERT INTO `d_category_product` VALUES ('18', '18', '10');
INSERT INTO `d_category_product` VALUES ('19', '19', '10');
INSERT INTO `d_category_product` VALUES ('20', '20', '10');
INSERT INTO `d_category_product` VALUES ('21', '21', '10');
INSERT INTO `d_category_product` VALUES ('22', '22', '10');
INSERT INTO `d_category_product` VALUES ('23', '23', '10');
INSERT INTO `d_category_product` VALUES ('24', '24', '10');
INSERT INTO `d_category_product` VALUES ('25', '1', '2');
INSERT INTO `d_category_product` VALUES ('26', '2', '2');
INSERT INTO `d_category_product` VALUES ('27', '3', '2');
INSERT INTO `d_category_product` VALUES ('28', '4', '2');
INSERT INTO `d_category_product` VALUES ('29', '5', '2');
INSERT INTO `d_category_product` VALUES ('30', '6', '2');
INSERT INTO `d_category_product` VALUES ('31', '7', '2');
INSERT INTO `d_category_product` VALUES ('32', '8', '2');
INSERT INTO `d_category_product` VALUES ('33', '9', '2');
INSERT INTO `d_category_product` VALUES ('34', '10', '2');
INSERT INTO `d_category_product` VALUES ('35', '11', '2');
INSERT INTO `d_category_product` VALUES ('36', '12', '2');
INSERT INTO `d_category_product` VALUES ('37', '13', '2');
INSERT INTO `d_category_product` VALUES ('38', '14', '2');
INSERT INTO `d_category_product` VALUES ('39', '15', '2');
INSERT INTO `d_category_product` VALUES ('40', '16', '2');
INSERT INTO `d_category_product` VALUES ('41', '17', '2');
INSERT INTO `d_category_product` VALUES ('42', '18', '2');
INSERT INTO `d_category_product` VALUES ('43', '19', '2');
INSERT INTO `d_category_product` VALUES ('44', '20', '2');
INSERT INTO `d_category_product` VALUES ('45', '21', '2');
INSERT INTO `d_category_product` VALUES ('46', '22', '2');
INSERT INTO `d_category_product` VALUES ('47', '23', '2');
INSERT INTO `d_category_product` VALUES ('48', '24', '2');
INSERT INTO `d_category_product` VALUES ('49', '1', '1');
INSERT INTO `d_category_product` VALUES ('50', '2', '1');
INSERT INTO `d_category_product` VALUES ('51', '3', '1');
INSERT INTO `d_category_product` VALUES ('52', '4', '1');
INSERT INTO `d_category_product` VALUES ('53', '5', '1');
INSERT INTO `d_category_product` VALUES ('54', '6', '1');
INSERT INTO `d_category_product` VALUES ('55', '7', '1');
INSERT INTO `d_category_product` VALUES ('56', '8', '1');
INSERT INTO `d_category_product` VALUES ('57', '9', '1');
INSERT INTO `d_category_product` VALUES ('58', '10', '1');
INSERT INTO `d_category_product` VALUES ('59', '11', '1');
INSERT INTO `d_category_product` VALUES ('60', '12', '1');
INSERT INTO `d_category_product` VALUES ('61', '13', '1');
INSERT INTO `d_category_product` VALUES ('62', '14', '1');
INSERT INTO `d_category_product` VALUES ('63', '15', '1');
INSERT INTO `d_category_product` VALUES ('64', '16', '1');
INSERT INTO `d_category_product` VALUES ('65', '17', '1');
INSERT INTO `d_category_product` VALUES ('66', '18', '1');
INSERT INTO `d_category_product` VALUES ('67', '19', '1');
INSERT INTO `d_category_product` VALUES ('68', '20', '1');
INSERT INTO `d_category_product` VALUES ('69', '21', '1');
INSERT INTO `d_category_product` VALUES ('70', '22', '1');
INSERT INTO `d_category_product` VALUES ('71', '23', '1');
INSERT INTO `d_category_product` VALUES ('72', '24', '1');
INSERT INTO `d_category_product` VALUES ('73', '25', '2');
INSERT INTO `d_category_product` VALUES ('74', '26', '8');
INSERT INTO `d_category_product` VALUES ('75', '27', '2');

-- ----------------------------
-- Table structure for `d_item`
-- ----------------------------
DROP TABLE IF EXISTS `d_item`;
CREATE TABLE `d_item` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `dang_price` double NOT NULL,
  `product_num` int(10) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_item
-- ----------------------------
INSERT INTO `d_item` VALUES ('1', '120301', '1', '上课头疼的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('2', '120301', '2', '上课头疼的故事', '180', '1', '180');
INSERT INTO `d_item` VALUES ('3', '120302', '3', '上课头疼的故事', '180', '10', '1800');
INSERT INTO `d_item` VALUES ('5', '120303', '14', '上课睡觉的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('6', '120304', '15', '上课睡觉的故事', '180', '1', '180');
INSERT INTO `d_item` VALUES ('7', '120305', '16', '上课睡觉的故事', '180', '1', '180');
INSERT INTO `d_item` VALUES ('8', '120306', '17', '上课睡觉的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('9', '120307', '18', '上课睡觉的故事', '180', '3', '540');
INSERT INTO `d_item` VALUES ('10', '120308', '19', '上课睡觉的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('11', '120309', '17', '上课睡觉的故事', '180', '1', '180');
INSERT INTO `d_item` VALUES ('12', '120310', '1', '上课头疼的故事', '180', '4', '720');
INSERT INTO `d_item` VALUES ('13', '120311', '11', '上课头疼的故事', '180', '4', '720');
INSERT INTO `d_item` VALUES ('14', '120312', '9', '上课头疼的故事', '180', '5', '900');
INSERT INTO `d_item` VALUES ('15', '120313', '8', '上课头疼的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('16', '120314', '7', '上课头疼的故事', '180', '1', '180');
INSERT INTO `d_item` VALUES ('17', '120315', '6', '上课头疼的故事', '180', '5', '900');
INSERT INTO `d_item` VALUES ('18', '120316', '5', '上课头疼的故事', '180', '3', '540');
INSERT INTO `d_item` VALUES ('19', '120317', '4', '上课头疼的故事', '180', '1', '180');
INSERT INTO `d_item` VALUES ('20', '120302', '6', '上课头疼的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('21', '120302', '6', '上课头疼的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('22', '120302', '11', '上课头疼的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('23', '120302', '14', '上课头疼的故事', '180', '2', '360');
INSERT INTO `d_item` VALUES ('24', '1', '5', '围城', '182', '1', '182');
INSERT INTO `d_item` VALUES ('25', '2', '25', '校服的裙摆', '58', '1', '58');
INSERT INTO `d_item` VALUES ('26', '2', '3', '九阴真经', '22', '1', '22');
INSERT INTO `d_item` VALUES ('27', '3', '26', 'Java核心技术', '68', '1', '68');
INSERT INTO `d_item` VALUES ('28', '3', '25', '校服的裙摆', '58', '1', '58');

-- ----------------------------
-- Table structure for `d_managergongneng`
-- ----------------------------
DROP TABLE IF EXISTS `d_managergongneng`;
CREATE TABLE `d_managergongneng` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_managergongneng
-- ----------------------------
INSERT INTO `d_managergongneng` VALUES ('2', '图书管理模块', '1');
INSERT INTO `d_managergongneng` VALUES ('3', '订单管理模块', '1');
INSERT INTO `d_managergongneng` VALUES ('4', '用户管理模块', '1');
INSERT INTO `d_managergongneng` VALUES ('5', '查询', '2');
INSERT INTO `d_managergongneng` VALUES ('7', '增加', '2');
INSERT INTO `d_managergongneng` VALUES ('8', '查询', '3');
INSERT INTO `d_managergongneng` VALUES ('13', '查询', '4');
INSERT INTO `d_managergongneng` VALUES ('14', '增加', '4');
INSERT INTO `d_managergongneng` VALUES ('15', '指定查询', '2');
INSERT INTO `d_managergongneng` VALUES ('16', '指定查询', '3');
INSERT INTO `d_managergongneng` VALUES ('17', '指定查询', '4');

-- ----------------------------
-- Table structure for `d_order`
-- ----------------------------
DROP TABLE IF EXISTS `d_order`;
CREATE TABLE `d_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `order_time` bigint(20) NOT NULL,
  `order_desc` varchar(100) DEFAULT NULL,
  `total_price` double NOT NULL,
  `receive_name` varchar(100) DEFAULT NULL,
  `full_address` varchar(200) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_order
-- ----------------------------
INSERT INTO `d_order` VALUES ('1', '2', '1', '1438924478417', null, '182', '高圆圆', '北京市东城区工人影院', '100111', '13589569999', '85851111');
INSERT INTO `d_order` VALUES ('2', '2', '1', '1438929890776', null, '80', '高圆', '北京市东城区工人影院', '100111', '13589569999', '85851111');
INSERT INTO `d_order` VALUES ('3', '4', '1', '1438935195792', null, '126', '阿猫', '上海市浦东区', '555511', '13913900001', '85897777');

-- ----------------------------
-- Table structure for `d_product`
-- ----------------------------
DROP TABLE IF EXISTS `d_product`;
CREATE TABLE `d_product` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `fixed_price` double NOT NULL,
  `dang_price` double NOT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `has_deleted` int(1) NOT NULL DEFAULT '0',
  `product_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_product
-- ----------------------------
INSERT INTO `d_product` VALUES ('1', '上课头疼的故事', '上课头疼的故事', '1237873000234', '200', '180', 'key', '0', '16.jpg');
INSERT INTO `d_product` VALUES ('2', '上课睡觉的故事', '上课头疼的故事', '1237873700234', '210', '170', 'key', '0', '17.jpg');
INSERT INTO `d_product` VALUES ('3', '九阴真经', '一本武侠颠峰之作', '1238873000234', '30', '22', 'key', '0', '18.jpg');
INSERT INTO `d_product` VALUES ('4', '骆驼祥子', '描述了一个名叫骆驼的拉车夫的坎坷人生', '1237873000234', '200', '180', 'key', '0', '19.jpg');
INSERT INTO `d_product` VALUES ('5', '围城', '战争年代富二代的经历', '1237973000234', '220', '182', 'key', '0', '20.jpg');
INSERT INTO `d_product` VALUES ('6', '天上人间', '外国经典小说', '1237873090234', '203', '130', 'key', '0', '21.jpg');
INSERT INTO `d_product` VALUES ('7', '边城', '沈丛文先生的凤凰故事', '1297873000234', '120', '110', 'key', '0', '22.jpg');
INSERT INTO `d_product` VALUES ('8', '家', '才舍的不世之作', '1237873900294', '125', '102', 'key', '0', '23.jpg');
INSERT INTO `d_product` VALUES ('9', '黑榜', '网络小说中的黑道类小说之父', '1287873000234', '136', '127', 'key', '0', '24.jpg');
INSERT INTO `d_product` VALUES ('10', '痞子蔡', '曾经迷倒过万千少女的小说', '1237883000234', '157', '99', 'key', '0', '2.jpg');
INSERT INTO `d_product` VALUES ('11', '鬼吹灯', '盗墓小说始祖', '1237873000834', '245', '199', 'key', '0', '3.jpg');
INSERT INTO `d_product` VALUES ('12', '狼毒花', '被逼走上土匪之路，却又不失男儿本色，在战争年代保家卫国', '1237873000234', '175', '160', 'key', '0', '4.jpg');
INSERT INTO `d_product` VALUES ('13', '鲁冰花', '一个茶农的孩子，上课调皮，但很有画画天赋', '1237888000234', '145', '104', 'key', '0', '5.jpg');
INSERT INTO `d_product` VALUES ('14', '天那边', '一对恋人去乡村支教的故事，感人至深', '1237877000234', '35', '23', 'key', '0', '6.jpg');
INSERT INTO `d_product` VALUES ('15', '红旗', '为理想，捍卫正义', '1237873000734', '85', '45.6', 'key', '0', '7.jpg');
INSERT INTO `d_product` VALUES ('16', '满天星', '儿童故事', '1237873077234', '56', '45.78', 'key', '0', '8.jpg');
INSERT INTO `d_product` VALUES ('17', '卖火柴的小女孩', '安徒生笔中的小女女孩', '1237873777234', '89', '65.24', 'key', '0', '9.jpg');
INSERT INTO `d_product` VALUES ('18', '英雄无泪', '只有真正的英雄才懂得眼泪是什么', '1237873600234', '56', '44.5', 'key', '0', '10.jpg');
INSERT INTO `d_product` VALUES ('19', '剑侠情缘', '据说已经被拍成了电视剧', '1237873660234', '23', '18.6', 'key', '0', '11.jpg');
INSERT INTO `d_product` VALUES ('20', '孔乙已', '一个落魄书生的故事', '1237873666234', '12.3', '9.8', 'key', '0', '12.jpg');
INSERT INTO `d_product` VALUES ('21', '阿Q正传', '快来看，儿子打老子了的阿Q精神', '1267873000234', '52.3', '45.6', 'key', '0', '13.jpg');
INSERT INTO `d_product` VALUES ('22', '三个火枪手', '西部游侠为追求正义而与坏人斗智斗勇', '1236873600234', '33.5', '30.2', 'key', '0', '14.jpg');
INSERT INTO `d_product` VALUES ('23', '洲哥自传', '虽然哥已经不在江湖，但江湖一直流传着哥的传说...', '1267876000234', '500', '250', 'key', '0', '15.jpg');
INSERT INTO `d_product` VALUES ('24', 'Java狂想曲', '主要写的是一首歌的坎坷经历，歌词大意是：我深爱的人啊，却伤害我最深...', '1340849843242', '99.9', '9.9', 'key', '0', '1.jpg');
INSERT INTO `d_product` VALUES ('25', '校服的裙摆', '上课头疼的故事', '1438927635776', '68', '58', 'key', '0', '1438927635776.jpg');
INSERT INTO `d_product` VALUES ('26', 'Java核心技术', '上课头疼的故事', '1438930297839', '88', '68', 'key', '0', '1438930297839.jpg');
INSERT INTO `d_product` VALUES ('27', '浮沉', '上课头疼的故事', '1438935248730', '69', '58', 'key', '0', '1438935248730.jpg');

-- ----------------------------
-- Table structure for `d_receive_address`
-- ----------------------------
DROP TABLE IF EXISTS `d_receive_address`;
CREATE TABLE `d_receive_address` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receive_name` varchar(20) NOT NULL,
  `full_address` varchar(200) NOT NULL,
  `postal_code` varchar(8) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_receive_address
-- ----------------------------
INSERT INTO `d_receive_address` VALUES ('1', '6', 'Java', 'sun.cn', '10000800', '12345', '67890');
INSERT INTO `d_receive_address` VALUES ('2', '6', 'JavaJavaJava', 'ibm.cn', '10000600', '12345', '67890');
INSERT INTO `d_receive_address` VALUES ('3', '2', '高圆圆', '北京市东城区工人影院', '100111', '13589569999', '85851111');
INSERT INTO `d_receive_address` VALUES ('4', '2', '高圆', '北京市东城区工人影院', '100111', '13589569999', '85851111');
INSERT INTO `d_receive_address` VALUES ('5', '4', '阿猫', '上海市浦东区', '555511', '13913900001', '85897777');

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `user_integral` int(12) NOT NULL DEFAULT '0',
  `is_email_verify` char(3) DEFAULT NULL,
  `email_verify_code` varchar(50) DEFAULT NULL,
  `last_login_time` bigint(20) DEFAULT NULL,
  `last_login_ip` varchar(15) DEFAULT NULL,
  `pic_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'qq644945328@163.com', 'lijing2', '4QrcOUm6Wau+VuBX8g+IPg==', '10', 'Y', '9603f620-06da-416d-b51a-11cb7e0d446f', '1400834748889', '192.168.135.108', '');
INSERT INTO `d_user` VALUES ('2', '1598825181@qq.com', 'hellokitty', '4QrcOUm6Wau+VuBX8g+IPg==', '0', 'Y', 'fa9b2202-7188-4eb1-a10a-f6cf3531ea9a', '1438924171105', '127.0.0.1', null);
INSERT INTO `d_user` VALUES ('3', 'hello@qq.com', 'hellou', '4QrcOUm6Wau+VuBX8g+IPg==', '0', 'Y', 'eec292ea-73bc-4488-acc6-83553d852a4d', '1438929008886', '127.0.0.1', null);
INSERT INTO `d_user` VALUES ('4', 'love@qq.com', 'loveeat', '4QrcOUm6Wau+VuBX8g+IPg==', '0', 'Y', 'e752e621-d742-40a4-8e6c-b056200c33b6', '1438935125073', '127.0.0.1', null);
