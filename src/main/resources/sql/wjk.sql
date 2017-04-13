/*
Navicat MySQL Data Transfer

Source Server         : wjk
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : wjk

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-14 01:17:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for emp_contract
-- ----------------------------
DROP TABLE IF EXISTS `emp_contract`;
CREATE TABLE `emp_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_contract
-- ----------------------------

-- ----------------------------
-- Table structure for emp_file
-- ----------------------------
DROP TABLE IF EXISTS `emp_file`;
CREATE TABLE `emp_file` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) DEFAULT NULL,
  `family_address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `edu_background` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('159', '政府8', '    wjk', 'hahassssswww');
INSERT INTO `sys_dept` VALUES ('160', '政府4', '      haha', 'sbwwwwwwwwss');
INSERT INTO `sys_dept` VALUES ('161', '傻逼部', '吃屎', '屎真香');
INSERT INTO `sys_dept` VALUES ('162', '大屌部', '打飞机', 'sb');
INSERT INTO `sys_dept` VALUES ('163', '小屌部', '拉皮条', '傻逼');
INSERT INTO `sys_dept` VALUES ('164', '援交部', '啪啪啪', '射你一脸');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `pid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '部门信息管理', '/dept', '0');
INSERT INTO `sys_menu` VALUES ('10', '个人基本信息', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '加班通知', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '出差通知', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '休假申请', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '离职申请', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '经理信息管理', '/user/emp?type=2', '0');
INSERT INTO `sys_menu` VALUES ('3', '员工基本信息管理', '/user/emp?type=3', '0');
INSERT INTO `sys_menu` VALUES ('4', '档案合同管理员管理', '/user/emp?type=1', '0');
INSERT INTO `sys_menu` VALUES ('5', '员工合同管理', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '加班管理', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '出差管理', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '休假管理', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '离职管理', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '档案合同管理员');
INSERT INTO `sys_role` VALUES ('2', '经理');
INSERT INTO `sys_role` VALUES ('3', '员工');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(50) NOT NULL,
  `menu_id` varchar(50) DEFAULT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('10', '9', '2');
INSERT INTO `sys_role_menu` VALUES ('11', '10', '3');
INSERT INTO `sys_role_menu` VALUES ('12', '11', '3');
INSERT INTO `sys_role_menu` VALUES ('13', '12', '3');
INSERT INTO `sys_role_menu` VALUES ('14', '13', '3');
INSERT INTO `sys_role_menu` VALUES ('15', '14', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '3', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '5', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '3', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '6', '2');
INSERT INTO `sys_role_menu` VALUES ('8', '7', '2');
INSERT INTO `sys_role_menu` VALUES ('9', '8', '2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `bath` date DEFAULT NULL,
  `ch_name` varchar(255) DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('5', 'wangjiankungai', '123456', '2', '160', '1', '0', null, '王建坤gai', '山东w', '大连d', '888888888');
INSERT INTO `sys_user` VALUES ('6', 'www', '123456', '2', '159', '2', '0', null, 'wang', 'ss', 'dd', '123444');
INSERT INTO `sys_user` VALUES ('8', 'admin', '123456', '1', '159', '1', '0', null, '王建坤', '山东', '大连', '32343223424');
INSERT INTO `sys_user` VALUES ('9', 'magh', 'www', '2', '160', '0', '0', null, 'maguohao', '葫芦岛', '大连', '22222222222');
INSERT INTO `sys_user` VALUES ('10', 'xjp', '123456', '3', '160', '1', '0', null, '习近平', 'china', '中南海', '6666666666');
SET FOREIGN_KEY_CHECKS=1;
