/*
Navicat MySQL Data Transfer

Source Server         : DBTEST
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : db_ppss

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2019-05-01 23:20:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `medicine_id` varchar(20) NOT NULL COMMENT '药品id',
  `medicine_count` int(11) NOT NULL COMMENT '药品剂量',
  `medicine_name` varchar(20) NOT NULL COMMENT '药品名',
  `medicine_price` double NOT NULL COMMENT '药品价格',
  `order_id` varchar(20) NOT NULL COMMENT '订单编号',
  PRIMARY KEY (`item_id`),
  KEY `fk_medicine_id` (`medicine_id`),
  KEY `fk_order_id` (`order_id`),
  CONSTRAINT `fk_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `t_medicine` (`medicine_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_item
-- ----------------------------

-- ----------------------------
-- Table structure for `t_medicine`
-- ----------------------------
DROP TABLE IF EXISTS `t_medicine`;
CREATE TABLE `t_medicine` (
  `medicine_id` varchar(20) NOT NULL COMMENT '药品id',
  `medicine_name` varchar(20) NOT NULL COMMENT '药品通用名',
  `medicine_price` double NOT NULL COMMENT '药品价格',
  `medicine_origin_place` varchar(50) NOT NULL COMMENT '药品产地',
  `medicine_effect` varchar(100) NOT NULL COMMENT '药品效果',
  `medicine_sp` varchar(20) NOT NULL COMMENT '药品规格',
  `medicine_img` varchar(100) NOT NULL COMMENT '药品图片路径',
  `medicine_inventory` int(11) NOT NULL COMMENT '药品库存量',
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` varchar(20) NOT NULL COMMENT '购药用户Id',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `send_time` datetime DEFAULT NULL COMMENT '发件时间',
  `get_time` datetime DEFAULT NULL COMMENT '取件时间',
  `shop_name` varchar(50) NOT NULL COMMENT '售药药店名',
  `order_amount` double NOT NULL COMMENT '订单总金额',
  `user_address` varchar(50) NOT NULL COMMENT '收货地址',
  `send_address` varchar(50) NOT NULL COMMENT '发货地址',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`order_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_user_address` (`user_address`),
  CONSTRAINT `fk_user_address` FOREIGN KEY (`user_address`) REFERENCES `t_user` (`user_address`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` varchar(20) NOT NULL COMMENT '用户编号',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `real_name` varchar(20) NOT NULL COMMENT '真实姓名',
  `identity_id` varchar(20) NOT NULL COMMENT '身份证号',
  `user_address` varchar(50) NOT NULL COMMENT '收获地址',
  `tel_num` varchar(20) NOT NULL COMMENT '联系电话',
  `status` int(11) NOT NULL COMMENT '用户标识 1普通用户0管理员',
  PRIMARY KEY (`user_id`),
  KEY `user_address` (`user_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('asdasd4584asd', 'admin', 'admin', 'admin', '34045455578787888', 'admin address', '15956953945', '0');
INSERT INTO `t_user` VALUES ('dsad75745dasd', 'test', 'test', '测试', '234545454545645', '安徽合肥', '15956953945', '1');
