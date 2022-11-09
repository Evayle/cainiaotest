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

 Date: 09/11/2022 17:41:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user_group
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_group`;
CREATE TABLE `admin_user_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user_group
-- ----------------------------
INSERT INTO `admin_user_group` VALUES (2, '管理员', '2022-11-08 03:16:36', '2022-11-08 03:16:36');

SET FOREIGN_KEY_CHECKS = 1;
