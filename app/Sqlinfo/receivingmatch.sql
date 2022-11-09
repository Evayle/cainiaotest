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

 Date: 09/11/2022 17:41:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `user_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户状态',
  `user_rights` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户权限PC\r\n',
  `user_rights_pda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户权限PDA',
  `user_phone` bigint(13) NOT NULL COMMENT '用户电话号码',
  `user_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户token',
  `token_time` timestamp NULL DEFAULT NULL COMMENT '用户token的有效时间',
  `socket_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '用户的Scoketid',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '用户添加时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '用户修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '软删除字段',
  `user_group` int(11) NOT NULL DEFAULT 0 COMMENT '用户分组',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`user_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (4, 'Eva', '$2y$10$mg9OkWLjnNTB.HWKB5wWXenMLwNRnZzaV5knlq1NwxvJBO.A1VTLi', '1', '\"[1231,1231]\"', '', 13543853501, '3b6eee82cce72e429bc317ca8d311f63', NULL, '1', '2022-11-07 09:44:16', '2022-11-08 01:57:34', NULL, 1);
INSERT INTO `admin_user` VALUES (8, '海宁', '$2y$10$RvOw29C/3DE1sEdB95.Ki.Sb986aYHqdOnJvRPYctyPH.k5uzQZG2', '1', '', '', 15626906056, 'b931bd631e2175a204c1466cbbbbad3c', '2022-11-11 16:35:35', '1', '2022-11-07 09:47:11', '2022-11-09 09:23:48', NULL, 2);

SET FOREIGN_KEY_CHECKS = 1;
