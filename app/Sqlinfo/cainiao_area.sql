/*
 Navicat Premium Data Transfer

 Source Server         : 本地Mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : cainiaotest

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 13/11/2022 17:55:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cainiao_area
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_area`;
CREATE TABLE `cainiao_area`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `area_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库区名称',
  `admin_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '后台操作人员名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cainiao_area
-- ----------------------------
INSERT INTO `cainiao_area` VALUES (2, '2库区1', '海宁修改于2022-11-11 14:33:37', '2022-11-11 06:25:27', '2022-11-11 14:33:37');

SET FOREIGN_KEY_CHECKS = 1;
