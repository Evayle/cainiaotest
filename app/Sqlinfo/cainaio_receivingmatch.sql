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

 Date: 09/11/2022 17:41:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cainaio_receivingmatch
-- ----------------------------
DROP TABLE IF EXISTS `cainaio_receivingmatch`;
CREATE TABLE `cainaio_receivingmatch`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cainiao_match` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜鳥序號',
  `cainiao_match_chi` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '門店名稱(繁中)',
  `cainiao_transfer` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '轉店菜鳥序號',
  `cainiao_transfer_chi` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '門店名稱(簡中)',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '創建時間',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '刪除時間',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cainaio_receivingmatch
-- ----------------------------
INSERT INTO `cainaio_receivingmatch` VALUES (1, 'AYG043', '獲多利櫃', 'AYD001', '皇朝獲多利分店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (2, 'AYG004', '亨達櫃', 'AYD021', '海濱花園店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (3, 'AYG005', '通發櫃', 'AYD089', '蘆苑店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (4, 'AYG008', '新益櫃', 'AYD043', '佑漢民安店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (5, 'AYG011', '世邦櫃', 'AYD009', '鏡湖店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (6, 'AYG013', '筷子基櫃', 'AYD041', '高士德羅神父店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (7, 'AYG015', '濠庭櫃(第7座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (8, 'AYG016', '濠庭櫃(第11座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (9, 'AYG017', '濠庭櫃(第8座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (10, 'AYG018', '濠庭櫃(第12座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (11, 'AYG019', '濠珀櫃(第1座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (12, 'AYG020', '濠珀櫃(第2座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (13, 'AYG021', '濠珀櫃(第3座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (14, 'AYG023', '文豐櫃', 'AYD043', '佑漢民安店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (15, 'AYG026', '科大櫃', 'AYD018', '氹仔花城店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (16, 'AYG028', '高士德櫃(停車場負1)', 'AYD089', '蘆苑店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (17, 'AYG033', '聯薪櫃', 'AYD041', '高士德羅神父店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (18, 'AYG035', '寶翠櫃', 'AYD041', '高士德羅神父店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (19, 'AYG036', '廣福安櫃', 'AYD044', '黑沙環廣福祥店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (20, 'AYG039', '東南亞櫃', 'AYD001', '皇朝獲多利分店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (21, 'AYG042', '名門世家櫃', 'AYD018', '氹仔花城店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (22, 'AYG044', '半島櫃', 'AYD041', '高士德羅神父店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (23, 'AYG046', '擎天滙櫃(第1座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (24, 'AYG047', '擎天滙櫃(第12座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (25, 'AYG048', '擎天滙櫃(第3座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (26, 'AYG050', '石排灣櫃', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (27, 'AYG052', '盧九櫃', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (28, 'AYG062', '文第士櫃', 'AYD041', '高士德羅神父店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (29, 'AYG055', '茵豪薈櫃', 'AYD041', '高士德羅神父店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (30, 'AYG061', '晉海櫃', 'AYD021', '海濱花園店', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (31, 'AYG056', '濠尚櫃(一至二座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (32, 'AYG057', '濠尚櫃(三至四座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (33, 'AYG058', '濠尚櫃(五至六座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (34, 'AYG059', '濠尚櫃(七至八座)', 'AYD066', '氹仔金利達(樂淘)', NULL, NULL, NULL);
INSERT INTO `cainaio_receivingmatch` VALUES (35, NULL, NULL, NULL, NULL, '2022-11-09 08:48:03', NULL, '2022-11-09 08:48:03');
INSERT INTO `cainaio_receivingmatch` VALUES (36, NULL, NULL, NULL, NULL, '2022-11-09 08:57:37', NULL, '2022-11-09 08:57:37');
INSERT INTO `cainaio_receivingmatch` VALUES (37, NULL, NULL, NULL, NULL, '2022-11-09 08:58:02', NULL, '2022-11-09 08:58:02');

SET FOREIGN_KEY_CHECKS = 1;
