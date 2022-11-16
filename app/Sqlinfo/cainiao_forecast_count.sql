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

 Date: 15/11/2022 18:09:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cainiao_forecast_count
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_forecast_count`;
CREATE TABLE `cainiao_forecast_count`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '数量',
  `date` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '当日时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
