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

 Date: 26/11/2022 18:03:37
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
  `user_rights` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户权限PC\r\n',
  `user_rights_pda` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户权限PDA',
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
INSERT INTO `admin_user` VALUES (4, 'Eva', '$2y$10$mg9OkWLjnNTB.HWKB5wWXenMLwNRnZzaV5knlq1NwxvJBO.A1VTLi', '1', '[\"123123\"]', '[\"12312312SBKJ\"]', 13543853501, '3b6eee82cce72e429bc317ca8d311f63', NULL, '1', '2022-11-07 09:44:16', '2022-11-11 18:18:40', NULL, 1);
INSERT INTO `admin_user` VALUES (8, '海宁', '$2y$10$RvOw29C/3DE1sEdB95.Ki.Sb986aYHqdOnJvRPYctyPH.k5uzQZG2', '1', '[\"123123\"]', '[\"12312312SBKJ\"]', 15626906056, '89f521e63ef6439f11fb824ce885b861', '2022-11-11 16:35:35', '1', '2022-11-07 09:47:11', '2022-11-26 14:27:29', NULL, 2);

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

-- ----------------------------
-- Table structure for cainiao_area
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_area`;
CREATE TABLE `cainiao_area`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `area_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库区名称',
  `area_task_num` int(10) NULL DEFAULT NULL COMMENT '任务数量',
  `area_task_people` int(10) NULL DEFAULT NULL COMMENT '每次领取任务的人数',
  `admin_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '后台操作人员名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cainiao_area
-- ----------------------------
INSERT INTO `cainiao_area` VALUES (1, '2库区1', 20, 4, '海宁修改于2022-11-11 14:33:37', '2022-11-11 06:25:27', '2022-11-11 14:33:37');

-- ----------------------------
-- Table structure for cainiao_area_task
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_area_task`;
CREATE TABLE `cainiao_area_task`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `area_id` int(11) NOT NULL COMMENT '绑定的库区ID',
  `order_people` int(10) NOT NULL COMMENT '该库区一次性可以领多少人',
  `order_num` int(5) NOT NULL COMMENT '该库区一次领取的不可以超过多少数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cainiao_area_task
-- ----------------------------
INSERT INTO `cainiao_area_task` VALUES (1, '库区一认领部分', 1, 10, 50);

-- ----------------------------
-- Table structure for cainiao_bount_task_list
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_bount_task_list`;
CREATE TABLE `cainiao_bount_task_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mailNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `logisticsOrderCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '一段单号',
  `two_logisticsOrderCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '二段单号',
  `area_id` int(11) NOT NULL COMMENT '库区ID',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库区名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货架号',
  `bound_time` timestamp NULL DEFAULT NULL COMMENT '处理通知时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order`(`mailNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cainiao_bount_task_list
-- ----------------------------
INSERT INTO `cainiao_bount_task_list` VALUES (1, '545806510768', 'LP00545806510768', 'LP00544427410761', 1, 'AYD001', '213123', '2022-11-26 16:08:31', '2022-11-26 17:51:50', '2022-11-26 17:51:50');
INSERT INTO `cainiao_bount_task_list` VALUES (2, '546094278624', 'LP00546094278624', 'LP00544427410761', 1, 'AYD001', '213123', NULL, '2022-11-26 17:51:50', '2022-11-26 17:51:50');
INSERT INTO `cainiao_bount_task_list` VALUES (3, '546094278675', 'LP00546094278675', 'LP00544427410761', 1, 'AYD001', '213123', NULL, '2022-11-26 17:51:50', '2022-11-26 17:51:50');
INSERT INTO `cainiao_bount_task_list` VALUES (21, '546094278731', 'LP00546094278731', 'LP00544427410761', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (22, '546138921620', 'LP00546138921620', 'LP00544427410761', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (23, '546146350613', 'LP00546146350613', 'LP00544427410761', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (24, '546146350814', 'LP00546146350814', 'LP00544427410761', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (25, '546146351072', 'LP00546146351150', 'LP00544427410762', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (26, '546146351070', 'LP00546146351139', 'LP00544427410762', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (27, '546146351071', 'LP00546146351149', 'LP00544427410762', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (28, '546146351254', 'LP00546146351254', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (29, '546146351386', 'LP00546146351386', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (30, '546146350818', 'LP00546146350818', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (31, '546146351264', 'LP00546146351264', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (32, '544879146188', 'LP00544879146188', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (33, '546146351303', 'LP00546146351303', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');
INSERT INTO `cainiao_bount_task_list` VALUES (34, '30357937081526455191', 'LP005462114710451', '3121321355545', 1, 'AYD001', '213123', NULL, '2022-11-26 17:52:54', '2022-11-26 17:52:54');

-- ----------------------------
-- Table structure for cainiao_config
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_config`;
CREATE TABLE `cainiao_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cainiao_config
-- ----------------------------
INSERT INTO `cainiao_config` VALUES (1, '6QZc68cU1n05u2j09x9DB14747d9i8W3');

-- ----------------------------
-- Table structure for cainiao_error_log
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_error_log`;
CREATE TABLE `cainiao_error_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(10) NOT NULL COMMENT '类型:1预报,2修改订单,3取消订单4.退款,5.修改订单数据库没有数据6.取消订单时,没有原数据7.取消数据异常8退款没预报9取消异常',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预报内容',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cainiao_error_log
-- ----------------------------
INSERT INTO `cainiao_error_log` VALUES (1, 5, '{\"eventHeader\":{\"eventTime\":\"2022-06-30 17:27:08\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_UPDATE_CONSIGN\"},\"eventBody\":{\"logisticsDetail\":{\"mailNo\":\"YT6595450573600\",\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"carrierCode\":\"YTO\",\"logisticsOrderCode\":\"LP00519211937198\"}}}', '2022-11-16');
INSERT INTO `cainiao_error_log` VALUES (2, 6, '{\"eventHeader\":{\"eventTime\":\"2022-08-09 15:33:55\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_CANCEL_CONSIGN\"},\"eventBody\":{\"logisticsDetail\":{\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"logisticsOrderCode\":\"LP00525746116553\"}}}', '2022-11-16');
INSERT INTO `cainiao_error_log` VALUES (3, 8, '{\"eventHeader\":{\"eventTime\":\"2022-08-04 20:26:00\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_RETURN_REFUND_NOTICE\"},\"eventBody\":{\"logisticsDetail\":{\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"occurTime\":\"2022-08-04 20:26:00\",\"logisticsOrderCode\":\"LP00523073111587\",\"timeZone\":\"UTC+8\",\"items\":[],\"status\":\"REFUND_SUCCESS\"}}}', '2022-11-16');

-- ----------------------------
-- Table structure for cainiao_forecast
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_forecast`;
CREATE TABLE `cainiao_forecast`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mailNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单号',
  `logisticsOrderCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一段单号',
  `two_logisticsOrderCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二段单号',
  `trackingNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SBKJ订单号',
  `parcel_weight` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合单总重量',
  `conso_order_query` smallint(1) NULL DEFAULT 0 COMMENT '判断是多件还是单件:1单件,2多件',
  `deliveryType` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自提方式:1是HOME_DELIVERY2是PICKUP_DELIVERY',
  `consoType` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集运类型:1',
  `isSplitConsign` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否产拆单:Y:N',
  `isLastPackage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是最后一件包裹:Y N',
  `packageQuantity` int(3) NULL DEFAULT NULL COMMENT '包裹数量',
  `tradeOrderId` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易订单ID',
  `dereRecogCode` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '无主件识别码',
  `user_phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号码',
  `carrierCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货运订单来仓库属性',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单状态:1正常,2取消发货.3申请退款',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '当前节点时间',
  `updated_at` timestamp NULL DEFAULT NULL,
  `cainiao_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `long` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `height` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `in_time` timestamp NULL DEFAULT NULL COMMENT '入库时间',
  `over_time` timestamp NULL DEFAULT NULL,
  `outbound_time` timestamp NULL DEFAULT NULL COMMENT '处理通知时间',
  `store_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '柜点名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cainiao_forecast
-- ----------------------------
INSERT INTO `cainiao_forecast` VALUES (64, '544878835398', 'LP00544878835398', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3034418148098645519', 'R5JY443U2XCE1', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '0', '2022-11-16 17:45:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (65, '544888642108', 'LP00544888642108', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3036104462270645519', 'R5LAVQYV81JSJ', '86-15158121000', 'YTO', '澳门', '饰品/流行首饰/时尚饰品新_发饰', '0', '2022-11-16 18:00:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (66, '544879146179', 'LP00544879146179', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3036493045160645519', 'R5L1DC9M4KYHD', '86-15158121000', 'YTO', '澳门', '饰品/流行首饰/时尚饰品新_发饰', '0', '2022-11-17 16:41:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (67, '544879146178', 'LP00545108197720', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3036493045160645519', 'R5L1DC9M4KYHD', '86-15158121000', 'ZTO', '澳门', '饰品/流行首饰/时尚饰品新_发饰', '0', '2022-11-17 16:50:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (68, '544888642167', 'LP00544888642167', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3036491281156645519', 'R5L1AZ6RYWW4C', '86-15158121000', 'YTO', '澳门', '饰品/流行首饰/时尚饰品新_发饰', '0', '2022-11-17 17:52:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (69, '544888642168', 'LP00544888642168', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3036493045167645519', 'R5L1DC91EWTK2', '86-15158121000', 'YTO', '澳门', '饰品/流行首饰/时尚饰品新_发饰', '0', '2022-11-21 10:10:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (70, '545724935152', 'LP00545724935152', NULL, NULL, NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3044131345226645519', 'R54WUHQDE2WH8', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '0', '2022-11-21 10:18:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (71, '545806510768', 'LP00545806510768', 'LP00544427410761', 'LP00545724935152', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3044795113620645519', 'R545DV9AKF6KD', '853-22221111', 'DISTRIBUTOR_13476787', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-21 16:12:51', '2022-11-26 18:02:11', '10', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 18:02:11', NULL);
INSERT INTO `cainiao_forecast` VALUES (72, '546094278624', 'LP00546094278624', 'LP00544427410761', 'LP00545724935152', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3048393133021645519', 'R59AHSW3CGYXA', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 11:47:21', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (73, '546094278675', 'LP00546094278675', 'LP00544427410761', 'LP00545724935152', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3048626774073645519', 'R59ZAUUU9Q6XL', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 11:48:08', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (74, '546094278731', 'LP00546094278731', 'LP00544427410761', 'LP00545724935152', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3046418064626645519', 'R564MZD5AQTN4', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 11:48:46', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (75, '546138921620', 'LP00546138921620', 'LP00544427410761', 'LP00545724935152', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3046328532887645519', 'R561DXRJG64SC', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 15:14:49', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (76, '546146350613', 'LP00546146350613', 'LP00544427410761', 'LP00545724935152', NULL, 1, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3049156046205645519', 'R6QYA2V1U996N', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 17:05:58', '2022-11-26 17:55:24', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (77, '546146350814', 'LP00546146350814', 'LP00544427410761', 'LP00545724935152', NULL, 1, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3049155434218645519', 'R6QYAWHT56D8V', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 17:06:30', '2022-11-26 17:55:24', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (78, '546146351072', 'LP00546146351150', 'LP00544427410762', 'LP00545724935153', NULL, 0, 'HOME_DELIVERY', '002', 'Y', 'Y', 3, '3049145426309645519', 'R6QT5DVMS4A7E', '1-01046923153', 'YTO', 'coco', '饰品/流行首饰/时尚饰品新_发饰', '17', '2022-11-23 17:25:22', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (79, '546146351070', 'LP00546146351139', 'LP00544427410762', 'LP00545724935153', NULL, 0, 'HOME_DELIVERY', '002', 'Y', 'Y', 3, '3049145426309645519', 'R6QT5DVMS4A7E', '1-01046923153', 'YTO', 'coco', '饰品/流行首饰/时尚饰品新_发饰', '17', '2022-11-23 17:25:58', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (80, '546146351071', 'LP00546146351149', 'LP00544427410762', 'LP00545724935153', NULL, 0, 'HOME_DELIVERY', '002', 'Y', 'Y', 3, '3049145426309645519', 'R6QT5DVMS4A7E', '1-01046923153', 'YTO', 'coco', '饰品/流行首饰/时尚饰品新_发饰', '17', '2022-11-23 17:25:58', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (81, '546146351254', 'LP00546146351254', '3121321355545', 'LP005457249351521', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3049156046275645519', 'R6QYA2V3N3MMY', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 17:33:01', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (82, '546146351386', 'LP00546146351386', '3121321355545', 'LP0054572493515212', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3048823045287645519', 'R592NFW9RFLTK', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 17:46:01', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (83, '546146350818', 'LP00546146350818', '3121321355545', 'LP00545724935157', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3049488219204645519', 'R6QX4ARCCMLJ1', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 21:56:31', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (84, '546146351264', 'LP00546146351264', '3121321355545', 'LP00545724935157', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3049157450252645519', 'R6QYDHN13ZQWF', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 21:57:27', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (85, '544879146188', 'LP00544879146188', '3121321355545', 'LP00545724935157', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3037446903156645519', 'R5Z6G944HU2V5', '86-15158121000', 'YTO', '澳门', '饰品/流行首饰/时尚饰品新_发饰', '17', '2022-11-23 21:58:42', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (86, '546146351303', 'LP00546146351303', '3121321355545', 'LP00545724935157', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'Y', 1, '3049140818272645519', 'R6QTN7TXYYEJG', '853-22221111', 'YTO', '澳门', '女装/女士精品_连衣裙', '17', '2022-11-23 22:21:06', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_forecast` VALUES (87, '30357937081526455191', 'LP005462114710451', '3121321355545', 'LP00545724935157', NULL, 0, 'HOME_DELIVERY', '002', 'N', 'N', 1, '3035793708152645519', 'R5K55NUC8Y8XN', '86-15158121000', NULL, '澳门', '饰品/流行首饰/时尚饰品新_发饰', '17', '2022-11-24 14:39:54', '2022-11-26 17:55:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AYDTTT');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cainiao_forecast_count
-- ----------------------------
INSERT INTO `cainiao_forecast_count` VALUES (12, 3, '2022-11-15', '2022-11-16 10:17:40', '2022-11-16 10:17:43');
INSERT INTO `cainiao_forecast_count` VALUES (13, 10, '2022-11-16', '2022-11-16 10:18:00', '2022-11-16 16:54:13');
INSERT INTO `cainiao_forecast_count` VALUES (14, 1, '2022-11-24', '2022-11-24 14:34:55', '2022-11-24 14:34:55');

-- ----------------------------
-- Table structure for cainiao_forecast_shopinfo
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_forecast_shopinfo`;
CREATE TABLE `cainiao_forecast_shopinfo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `d_id` int(11) NOT NULL COMMENT '关联的订单ID',
  `itemId` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `skuId` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKUID',
  `itemName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `categoryId` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品类目ID',
  `categoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `totalActualPayment` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品实付金额',
  `itemUnitPrice` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品单价',
  `itemQuantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品购买数量',
  `itemPicUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `itemSkuProperty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品SKU属性',
  `tradeOrderValue` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品实际付款金额',
  `gstCurrency` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `exchangeRate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇率',
  `isLevyTax` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否已征税',
  `isPresent` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否馈赠\r\n',
  `totalShippingFee` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运费',
  `totalTaxFee` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '税费总额',
  `actualSenderName` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付人真实姓名',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '添加数据时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '数据修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cainiao_forecast_shopinfo
-- ----------------------------
INSERT INTO `cainiao_forecast_shopinfo` VALUES (54, 64, '607136539151', '', '女装，TBC，测试商品，请不要拍，拍下不发货', '16_50010850', '女装/女士精品_连衣裙', '1', '1', '1', 'https://img.alicdn.com/imgextra/i3/429504656/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg', '', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-16 17:45:02', '2022-11-16 17:45:02');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (55, 65, '667718304014', '4810140060309', '(测试商品请不要拍)克隆商品=42985775812', '50013864_50013878', '饰品/流行首饰/时尚饰品新_发饰', '1', '1', '1', 'https://img.alicdn.com/imgextra/i1/263669477/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg', '颜色分类:明黄色', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-16 18:00:54', '2022-11-16 18:00:54');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (56, 66, '667718304014', '4810140060309', '(测试商品请不要拍)克隆商品=42985775812', '50013864_50013878', '饰品/流行首饰/时尚饰品新_发饰', '1', '1', '1', 'https://img.alicdn.com/imgextra/i1/263669477/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg', '颜色分类:明黄色', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-17 16:41:53', '2022-11-17 16:41:53');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (57, 67, '667718304014', '4810140060309', '(测试商品请不要拍)克隆商品=42985775812', '50013864_50013878', '饰品/流行首饰/时尚饰品新_发饰', '1', '1', '1', 'https://img.alicdn.com/imgextra/i1/263669477/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg', '颜色分类:明黄色', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-17 16:50:48', '2022-11-17 16:50:48');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (58, 68, '667718304014', '4810140060309', '(测试商品请不要拍)克隆商品=42985775812', '50013864_50013878', '饰品/流行首饰/时尚饰品新_发饰', '1', '1', '1', 'https://img.alicdn.com/imgextra/i1/263669477/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg', '颜色分类:明黄色', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-17 17:52:01', '2022-11-17 17:52:02');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (59, 69, '667718304014', '4810140060309', '(测试商品请不要拍)克隆商品=42985775812', '50013864_50013878', '饰品/流行首饰/时尚饰品新_发饰', '1', '1', '1', 'https://img.alicdn.com/imgextra/i1/263669477/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg', '颜色分类:明黄色', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-21 10:10:45', '2022-11-21 10:10:45');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (60, 70, '607136539151', '', '女装，TBC，测试商品，请不要拍，拍下不发货', '16_50010850', '女装/女士精品_连衣裙', '1', '1', '1', 'https://img.alicdn.com/imgextra/i3/429504656/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg', '', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-21 10:18:46', '2022-11-21 10:18:46');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (61, 71, '607136539151', '', '女装，TBC，测试商品，请不要拍，拍下不发货', '16_50010850', '女装/女士精品_连衣裙', '1', '1', '1', 'https://img.alicdn.com/imgextra/i3/429504656/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg', '', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-21 16:12:51', '2022-11-21 16:12:51');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (62, 72, '607136539151', '', '女装，TBC，测试商品，请不要拍，拍下不发货', '16_50010850', '女装/女士精品_连衣裙', '1', '1', '1', 'https://img.alicdn.com/imgextra/i3/429504656/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg', '', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-23 11:47:21', '2022-11-23 11:47:21');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (63, 73, '607136539151', '', '女装，TBC，测试商品，请不要拍，拍下不发货', '16_50010850', '女装/女士精品_连衣裙', '1', '1', '1', 'https://img.alicdn.com/imgextra/i3/429504656/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg', '', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-23 11:48:08', '2022-11-23 11:48:08');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (64, 74, '607136539151', '', '女装，TBC，测试商品，请不要拍，拍下不发货', '16_50010850', '女装/女士精品_连衣裙', '1', '1', '1', 'https://img.alicdn.com/imgextra/i3/429504656/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg', '', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-23 11:48:46', '2022-11-23 11:48:46');
INSERT INTO `cainiao_forecast_shopinfo` VALUES (65, 75, '667718304014', '4810140060309', '(测试商品请不要拍)克隆商品=42985775812', '50013864_50013878', '饰品/流行首饰/时尚饰品新_发饰', '1', '1', '1', 'https://img.alicdn.com/imgextra/i1/263669477/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg', '颜色分类:明黄色', '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '2022-11-24 14:34:55', '2022-11-24 14:34:55');

-- ----------------------------
-- Table structure for cainiao_forecast_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_forecast_userinfo`;
CREATE TABLE `cainiao_forecast_userinfo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `d_id` int(11) NOT NULL,
  `buyer_wangwangId` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '旺旺ID',
  `buyer_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家名称',
  `buyer_mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家电话',
  `buyer_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家邮箱',
  `buyer_country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `buyer_province` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省/洲',
  `buyer_city` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `buyer_district` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `buyer_town` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乡',
  `buyer_streetAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `sender_wangwangId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家旺旺ID',
  `sender_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家姓名',
  `sender_shopName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家商铺名称',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家电话',
  `country` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省会',
  `sender_city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家城市',
  `sender_district` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `sender_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乡镇/街道',
  `sender_streetAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cainiao_forecast_userinfo
-- ----------------------------
INSERT INTO `cainiao_forecast_userinfo` VALUES (41, 64, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇 腾新路65号 上海捷利跨境转运仓@9Y2WCZF3#R5JY443U2XCE1#', '2022-11-16 17:45:02', '2022-11-16 17:45:02');
INSERT INTO `cainiao_forecast_userinfo` VALUES (42, 65, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', '小壮', '商家测试账号（小壮）', '14111111111', '中国', '浙江省', '杭州市', '余杭区', NULL, '浙江省^^^杭州市^^^余杭区^^^   五常街道乐佳国际2号楼', '2022-11-16 18:00:54', '2022-11-16 18:00:54');
INSERT INTO `cainiao_forecast_userinfo` VALUES (43, 66, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', '小壮', '商家测试账号（小壮）', '14111111111', '中国', '浙江省', '杭州市', '余杭区', NULL, '浙江省^^^杭州市^^^余杭区^^^   五常街道乐佳国际2号楼', '2022-11-17 16:41:53', '2022-11-17 16:41:53');
INSERT INTO `cainiao_forecast_userinfo` VALUES (44, 67, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', '小壮', '商家测试账号（小壮）', '14111111111', '中国', '浙江省', '杭州市', '余杭区', NULL, '浙江省^^^杭州市^^^余杭区^^^   五常街道乐佳国际2号楼', '2022-11-17 16:50:48', '2022-11-17 16:50:48');
INSERT INTO `cainiao_forecast_userinfo` VALUES (45, 68, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', '澳门', '商家测试账号（小壮）', '0086-15363780710', '中国', '广东省', '珠海市', '香洲区', NULL, '广东省^^^珠海市^^^香洲区^^^ 拱北街道   港二路56号1栋三楼LT倉【直邮仓】@X2M0E5G3#R5L1AZ6RYWW4C#', '2022-11-17 17:52:01', '2022-11-17 17:52:02');
INSERT INTO `cainiao_forecast_userinfo` VALUES (46, 69, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', '澳门', '商家测试账号（小壮）', '0086-15363780710', '中国', '广东省', '珠海市', '香洲区', NULL, '广东省^^^珠海市^^^香洲区^^^ 拱北街道   港二路56号1栋三楼LT倉【直邮仓】@X2M0E5G3#R5L1DC91EWTK2#', '2022-11-21 10:10:45', '2022-11-21 10:10:45');
INSERT INTO `cainiao_forecast_userinfo` VALUES (47, 70, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R54WUHQDE2WH8#', '2022-11-21 10:18:46', '2022-11-21 10:18:46');
INSERT INTO `cainiao_forecast_userinfo` VALUES (48, 71, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R545DV9AKF6KD#', '2022-11-21 16:12:51', '2022-11-21 16:12:51');
INSERT INTO `cainiao_forecast_userinfo` VALUES (49, 72, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R59AHSW3CGYXA#', '2022-11-23 11:47:21', '2022-11-23 11:47:21');
INSERT INTO `cainiao_forecast_userinfo` VALUES (50, 73, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R59ZAUUU9Q6XL#', '2022-11-23 11:48:08', '2022-11-23 11:48:08');
INSERT INTO `cainiao_forecast_userinfo` VALUES (51, 74, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R564MZD5AQTN4#', '2022-11-23 11:48:46', '2022-11-23 11:48:46');
INSERT INTO `cainiao_forecast_userinfo` VALUES (52, 75, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R561DXRJG64SC#', '2022-11-23 15:14:49', '2022-11-23 15:14:49');
INSERT INTO `cainiao_forecast_userinfo` VALUES (53, 76, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R6QYA2V1U996N#', '2022-11-23 17:05:58', '2022-11-23 17:05:58');
INSERT INTO `cainiao_forecast_userinfo` VALUES (54, 77, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R6QYAWHT56D8V#', '2022-11-23 17:06:30', '2022-11-23 17:06:30');
INSERT INTO `cainiao_forecast_userinfo` VALUES (55, 78, '小壮测试账号01', 'coco', '1-01046923153', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, '地方VG地方VB大部分都搞不定发吧v', '商家测试账号（小壮）', '小壮', '商家测试账号（小壮）', '14111111111', '中国', '浙江省', '杭州市', '余杭区', NULL, '浙江省^^^杭州市^^^余杭区^^^   五常街道乐佳国际2号楼', '2022-11-23 17:25:22', '2022-11-23 17:25:22');
INSERT INTO `cainiao_forecast_userinfo` VALUES (56, 79, '小壮测试账号01', 'coco', '1-01046923153', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, '地方VG地方VB大部分都搞不定发吧v', '商家测试账号（小壮）', '小壮', '商家测试账号（小壮）', '14111111111', '中国', '浙江省', '杭州市', '余杭区', NULL, '浙江省^^^杭州市^^^余杭区^^^   五常街道乐佳国际2号楼', '2022-11-23 17:25:58', '2022-11-23 17:25:58');
INSERT INTO `cainiao_forecast_userinfo` VALUES (57, 80, '小壮测试账号01', 'coco', '1-01046923153', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, '地方VG地方VB大部分都搞不定发吧v', '商家测试账号（小壮）', '小壮', '商家测试账号（小壮）', '14111111111', '中国', '浙江省', '杭州市', '余杭区', NULL, '浙江省^^^杭州市^^^余杭区^^^   五常街道乐佳国际2号楼', '2022-11-23 17:25:58', '2022-11-23 17:25:58');
INSERT INTO `cainiao_forecast_userinfo` VALUES (58, 81, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R6QYA2V3N3MMY#', '2022-11-23 17:33:01', '2022-11-23 17:33:01');
INSERT INTO `cainiao_forecast_userinfo` VALUES (59, 82, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R592NFW9RFLTK#', '2022-11-23 17:46:01', '2022-11-23 17:46:01');
INSERT INTO `cainiao_forecast_userinfo` VALUES (60, 83, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R6QX4ARCCMLJ1#', '2022-11-23 21:56:31', '2022-11-23 21:56:31');
INSERT INTO `cainiao_forecast_userinfo` VALUES (61, 84, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R6QYDHN13ZQWF#', '2022-11-23 21:57:27', '2022-11-23 21:57:27');
INSERT INTO `cainiao_forecast_userinfo` VALUES (62, 85, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', '澳门', '商家测试账号（小壮）', '0086-15363780710', '中国', '广东省', '珠海市', '香洲区', NULL, '广东省^^^珠海市^^^香洲区^^^ 拱北街道   港二路56号1栋三楼LT倉【直邮仓】@X2M0E5G3#R5Z6G944HU2V5#', '2022-11-23 21:58:42', '2022-11-23 21:58:42');
INSERT INTO `cainiao_forecast_userinfo` VALUES (63, 86, '小壮测试账号01', '澳门', '853-22221111', NULL, '中国', '澳门特别行政区', '澳门半岛', '花王堂区', NULL, '的滴滴答答滴滴答答滴滴答答的', 'c测试账号67', 'JESS', 'c测试账号67', '59810618', '中国', '上海', '上海市', '青浦区', NULL, '上海^^^上海市^^^青浦区^^^ 白鹤镇   腾新路65号  上海捷利跨境转运仓@9Y2WCZF3#R6QTN7TXYYEJG#', '2022-11-23 22:21:06', '2022-11-23 22:21:06');
INSERT INTO `cainiao_forecast_userinfo` VALUES (64, 87, '小壮测试账号01', '澳门', '86-15158121000', NULL, '中国', '澳门特别行政区', '澳门半岛', '花地玛堂区', NULL, 'MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, 澳门', '商家测试账号（小壮）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 14:39:54', '2022-11-24 14:39:54');

-- ----------------------------
-- Table structure for cainiao_order_log
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_order_log`;
CREATE TABLE `cainiao_order_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本次操作的内容',
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `cainiao_api` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作对应的API',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cainiao_order_log
-- ----------------------------
INSERT INTO `cainiao_order_log` VALUES (1, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-20 14:26:31', '2022-11-20 14:26:31');
INSERT INTO `cainiao_order_log` VALUES (2, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-20 14:26:46', '2022-11-20 14:26:46');
INSERT INTO `cainiao_order_log` VALUES (3, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', '544888642108', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-20 14:34:10', '2022-11-20 14:34:10');
INSERT INTO `cainiao_order_log` VALUES (4, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', '544888642108', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-20 14:34:20', '2022-11-20 14:34:20');
INSERT INTO `cainiao_order_log` VALUES (5, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-22 14:53:24', '2022-11-22 14:53:24');
INSERT INTO `cainiao_order_log` VALUES (6, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-22 15:13:54', '2022-11-22 15:13:54');
INSERT INTO `cainiao_order_log` VALUES (7, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-22 15:20:22', '2022-11-22 15:20:22');
INSERT INTO `cainiao_order_log` VALUES (8, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-22 15:20:25', '2022-11-22 15:20:25');
INSERT INTO `cainiao_order_log` VALUES (9, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-22 15:20:26', '2022-11-22 15:20:26');
INSERT INTO `cainiao_order_log` VALUES (10, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-22 15:32:56', '2022-11-22 15:32:56');
INSERT INTO `cainiao_order_log` VALUES (11, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 12:03:16', '2022-11-23 12:03:16');
INSERT INTO `cainiao_order_log` VALUES (12, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 12:03:20', '2022-11-23 12:03:20');
INSERT INTO `cainiao_order_log` VALUES (13, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 12:03:24', '2022-11-23 12:03:24');
INSERT INTO `cainiao_order_log` VALUES (14, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', NULL, NULL);
INSERT INTO `cainiao_order_log` VALUES (15, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', NULL, NULL);
INSERT INTO `cainiao_order_log` VALUES (16, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:50:52', NULL);
INSERT INTO `cainiao_order_log` VALUES (17, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:50:52', NULL);
INSERT INTO `cainiao_order_log` VALUES (18, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:50:53', NULL);
INSERT INTO `cainiao_order_log` VALUES (19, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:50:53', NULL);
INSERT INTO `cainiao_order_log` VALUES (20, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:54:56', NULL);
INSERT INTO `cainiao_order_log` VALUES (21, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:54:56', NULL);
INSERT INTO `cainiao_order_log` VALUES (22, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:54:58', NULL);
INSERT INTO `cainiao_order_log` VALUES (23, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', NULL, '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:54:58', NULL);
INSERT INTO `cainiao_order_log` VALUES (24, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', '546094278624', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:58:00', NULL);
INSERT INTO `cainiao_order_log` VALUES (25, '菜鸟上游仓库快件已签收,操作人员的账号是:海宁', '546094278624', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-23 16:58:00', NULL);
INSERT INTO `cainiao_order_log` VALUES (26, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', '546146350613', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-25 14:16:35', NULL);
INSERT INTO `cainiao_order_log` VALUES (27, '菜鸟上游仓库快件签收成功:,操作人员的账号是:海宁', '546146350613', '海宁', 'CONSO_WAREHOUSE_SIGN', '2022-11-25 14:16:35', NULL);
INSERT INTO `cainiao_order_log` VALUES (28, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', '546146350613', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-25 14:24:24', NULL);
INSERT INTO `cainiao_order_log` VALUES (29, '菜鸟上游仓库快件签收异常,异常原因是:您的包裹破损严重无法收件转运，目前已经拒签返回给卖家，您可联系卖家发起【仅退款】，告知卖家商品会被集运仓自动退回。退款处理中如有问题，建议联系淘宝小蜜寻求帮助哦,操作人员的账号是:海宁', '546146350613', '海宁', 'CONSO_WAREHOUSE_SIGN', '2022-11-25 14:24:24', NULL);
INSERT INTO `cainiao_order_log` VALUES (30, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', '546146350613', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-25 14:24:41', NULL);
INSERT INTO `cainiao_order_log` VALUES (31, '菜鸟上游仓库快件签收成功:,操作人员的账号是:海宁', '546146350613', '海宁', 'CONSO_WAREHOUSE_SIGN', '2022-11-25 14:24:41', NULL);
INSERT INTO `cainiao_order_log` VALUES (32, '菜鸟上游仓库快件已到达,操作人员的账号是:海宁', '546146350814', '海宁', 'CONSO_WAREHOUSE_ARRIVE', '2022-11-25 15:52:57', NULL);
INSERT INTO `cainiao_order_log` VALUES (33, '菜鸟上游仓库快件签收成功:,操作人员的账号是:海宁', '546146350814', '海宁', 'CONSO_WAREHOUSE_SIGN', '2022-11-25 15:52:57', NULL);
INSERT INTO `cainiao_order_log` VALUES (34, '该快件菜鸟下发预报,等待出库,预报的时间是:2022-11-26 16:00:17', 'LP00545806510768', '菜鸟API发送', NULL, '2022-11-26 16:00:17', '2022-11-26 16:00:17');
INSERT INTO `cainiao_order_log` VALUES (35, '该快件菜鸟下发预报,等待出库,预报的时间是:2022-11-26 16:08:31', 'LP00545806510768', '菜鸟API发送', NULL, '2022-11-26 16:08:31', '2022-11-26 16:08:31');
INSERT INTO `cainiao_order_log` VALUES (36, '该快件菜鸟下发预报,等待出库,预报的时间是:2022-11-26 18:02:11', 'LP00545806510768', '菜鸟API发送', 'CONSO_WAREHOUSE_OUTBOUND_NOTICE', '2022-11-26 18:02:11', '2022-11-26 18:02:11');

-- ----------------------------
-- Table structure for cainiao_outbount_error_log
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_outbount_error_log`;
CREATE TABLE `cainiao_outbount_error_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报文',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cainiao_outbount_error_log
-- ----------------------------
INSERT INTO `cainiao_outbount_error_log` VALUES (1, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-22 15:32:47\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_OUTBOUND_NOTICE\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"carrierCode\\\":\\\"DISTRIBUTOR_13476787\\\",\\\"logisticsOrderCode\\\":\\\"LP00544427410761\\\",\\\"receiverDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"outboundLogisticsOrderCodes\\\":\\\"LP00545806510768\\\",\\\"segmentCode\\\":\\\"SENDTORECVER\\\",\\\"majorlogisticsOrderCode\\\":\\\"LP00544427410761\\\"},\\\"paymentDetail\\\":{\\\"payOrderId\\\":\\\"1336910004\\\",\\\"payTimeZone\\\":\\\"UTC+8\\\",\\\"shippingFee\\\":\\\"0\\\",\\\"payWeight\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"currencyUnit\\\":\\\"CENT\\\",\\\"weightUnit\\\":\\\"GRAM\\\"},\\\"extendData\\\":{\\\"promotionMoney\\\":\\\"0\\\"}}}}\",\"data_digest\":\"bD95BWxoKWvU7vi6dAufVg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"inner\",\"msg_type\":\"CONSO_WAREHOUSE_OUTBOUND_NOTICE\",\"msg_id\":\"1669107635977\"}', NULL);

-- ----------------------------
-- Table structure for cainiao_print_info
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_print_info`;
CREATE TABLE `cainiao_print_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '打印订单号(SBKJ)',
  `print_Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '打印内容',
  `is_print` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否打印',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cainiao_print_info
-- ----------------------------

-- ----------------------------
-- Table structure for cainiao_receivinglist
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_receivinglist`;
CREATE TABLE `cainiao_receivinglist`  (
  `receiving_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cainiao_match` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '對應菜鳥碼',
  `receiving_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '網點名稱(繁中)',
  `receiving_name_simple` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '網點名稱(簡中)',
  `receiving_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '網點地址',
  `type` int(11) NULL DEFAULT NULL COMMENT '自提點類型',
  `area_id` int(11) NULL DEFAULT 0 COMMENT '库区ID',
  `latitude` float NULL DEFAULT NULL COMMENT '經度',
  `longitude` float NULL DEFAULT NULL COMMENT '緯度',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '新增日期',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '刪除日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  `sort` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`receiving_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cainiao_receivinglist
-- ----------------------------
INSERT INTO `cainiao_receivinglist` VALUES (1, 'AYD004', '新華門店', '新华门店', '澳門佑漢新村八街新華學校後門創利電訊', 2, 1, 113.549, 22.2126, NULL, NULL, '2022-11-16 10:06:49', '1');
INSERT INTO `cainiao_receivinglist` VALUES (2, 'AYD001', '皇朝獲多利分店', '皇朝获多利分店', '皇朝宋玉生广场获多利中心U铺集运帮代收店【澳运驿站】(君柏地产左侧直入5米)', 2, 1, 113.326, 22.1122, NULL, NULL, '2022-11-16 10:06:54', '2');
INSERT INTO `cainiao_receivinglist` VALUES (3, 'AYD009', '鏡湖店', '镜湖店', '连胜街91号仁昌大厦地下A铺集运帮代收店【澳运驿站】', 2, 1, 113.542, 22.1999, NULL, NULL, '2022-11-13 12:48:03', '1');
INSERT INTO `cainiao_receivinglist` VALUES (4, 'AYG004', '亨達櫃', '亨达柜', '马揸度博士大马路511号亨达大厦地铺B座(easy wash洗车屋内)', 1, 1, 113.332, 22.1218, NULL, NULL, NULL, '5');
INSERT INTO `cainiao_receivinglist` VALUES (5, 'AYG005', '通發櫃', '通发柜', '荷兰园二马路25-27B号通发大厦地下T座(文化广场书店后边)', 1, 1, 113.325, 22.115, NULL, NULL, '2022-11-16 10:06:58', '1');
INSERT INTO `cainiao_receivinglist` VALUES (8, 'AYG008', '新益櫃', '新益柜', '马交石斜坡9号新益花园大堂內', 1, 1, 113.33, 22.1221, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (11, 'AYG011', '世邦櫃', '世邦柜', '啤利喇街4号广利大厦地下世邦家私城(啤利喇街方向门口)', 1, 1, 113.324, 22.1158, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (13, 'AYG013', '筷子基櫃', '筷子基柜', '提督马路143号南益工业大厦地下B(郑忠记CCK凍內店右側)', 1, 1, 113.324, 22.1224, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (15, 'AYG015', '濠庭櫃(第7座)', '濠庭柜(第7座)', '哥英布拉街濠庭都会1楼平台花园(第7座旁)【住户专用】', 1, 1, 113.332, 22.0936, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (16, 'AYG016', '濠庭櫃(第11座)', '濠庭柜(第11座)', '哥英布拉街濠庭都会1楼平台花园(第11座旁)【住户专用】', 1, 1, 113.332, 22.0933, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (17, 'AYG017', '濠庭櫃(第8座)', '濠庭柜(第8座)', '南京街濠庭都会1楼平台花园(第8座旁)【住户专用】', 1, 1, 113.332, 22.0938, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (18, 'AYG018', '濠庭櫃(第12座)', '濠庭柜(第12座)', '南京街濠庭都会1楼平台花园(第12座旁) 【住户专用】', 1, 1, 113.332, 22.0935, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (19, 'AYG019', '濠珀櫃(第1座)', '濠珀柜(第1座)', '基马拉斯大马路濠珀大厦第一座电梯大堂【住户专用】', 1, 1, 113.332, 22.0927, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (20, 'AYG020', '濠珀櫃(第2座)', '濠珀柜(第2座)', '基马拉斯大马路濠珀大厦第二座电梯大堂【住户专用】', 1, 1, 113.332, 22.0928, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (21, 'AYG021', '濠珀櫃(第3座)', '濠珀柜(第3座)', '基马拉斯大马路濠珀大厦第三座电梯大堂【住户专用】', 1, 1, 113.332, 22.0929, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (23, 'AYG023', '文豐櫃', '文丰柜', '黑沙环第一街51-55号文丰楼地下I座及H座文丰创意墟大堂', 1, 1, 113.33, 22.1235, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (26, 'AYG026', '科大櫃', '科大柜', '伟龙马路科技大学C座教学大楼地下正门旁', 1, 1, 113.335, 22.0905, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (28, 'AYG028', '高士德櫃(停車場負1)', '高士德柜(停车场负1)', '高士德世纪豪庭停车场负一层(电梯旁)', 1, 1, 113.325, 22.1205, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (33, 'AYG033', '聯薪櫃', '联薪柜', '飞喇士街81-101号联薪广场地下来来超市联薪分店内', 1, 1, 113.324, 22.1227, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (35, 'AYG035', '寶翠櫃', '宝翠柜', '沙梨头南街及飞喇士街宝翠花园利星阁地下扶康会门口旁', 1, 1, 113.323, 22.1224, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (36, 'AYG036', '廣福安櫃', '广福安柜', '黑沙环劳动节街广福安花园地下AO铺', 1, 1, 113.332, 22.124, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (39, 'AYG039', '東南亞櫃', '东南亚柜', '新口岸外港填海区罗马街东南亚花园B座电梯大堂左侧【住户专用】', 1, 1, 113.331, 22.112, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (40, 'AYG042', '名門世家櫃', '名门世家柜', '柯维纳马路410号374星河湾名门世家6楼平台第8座入口旁【住户专用】', 1, 1, 113.546, 22.1576, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (41, 'AYG043', '獲多利櫃', '获多利柜', '宋玉生广场获多利中心停车场入口侧(电梯大堂內直入6米)', 1, 1, 113.55, 22.1895, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (42, 'AYD005', '白鴿巢財旺店', '白鸽巢财旺店', '白鸽巢沙栏仔斜路18号地花王堂大厦一座地下C铺财旺商行【澳运驿站】', 2, 1, 113.539, 22.1989, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (50, 'AYD015', '俾利喇店', '俾利喇店', '罗利老马路9-13号集运帮代收店【澳运驿站】(一哥炸鸡行旁)', 2, 1, 113.546, 22.2014, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (53, 'AYD018', '氹仔花城店', '凼仔花城店', '奥林匹克大马路251号超级花城利宝阁一座地下C座【澳运国际自提中心】', 2, 1, 113.556, 22.1554, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (55, 'AYG044', '半島櫃', '半岛柜', '筷子基北湾半岛大厦4楼会所内【住户专用】', 1, 1, 113.538, 22.2058, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (57, 'AYG046', '擎天滙櫃(第1座)', '擎天汇柜(第1座)', '石排湾马路擎天汇第1座门口【住户专用】', 1, 1, 113.56, 22.1306, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (58, 'AYG047', '擎天滙櫃(第12座)', '擎天汇柜(第12座)', '石排湾马路擎天汇第12座门口【住户专用】', 1, 1, 113.561, 22.1307, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (59, 'AYD021', '海濱花園店', '海滨花园店', '黑沙環東北大馬路209號海濱花園第四座地下友鄰小市大多（澳運國際加盟店）', 2, 1, 113.555, 22.207, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (60, 'AYD020', '新橋墨山巷店', '新桥墨山巷店', '新桥墨山巷10号保康大厦地下C铺成记三友物流【澳运驿站】(連勝馬路來來超市附近)', 2, 1, 113.544, 22.2013, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (63, 'AYG050', '石排灣櫃', '石排湾柜', '路環蝴蝶谷大馬路石排灣綜合社區大樓1樓新苗超市熟食中心內', 1, 1, 113.562, 22.1288, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (65, 'AYD023', '南灣壹號店', '南湾一号店', '商业大马路南湾壹号地下K铺(南湾半岛直入转右)【澳运国际自提中心】', 2, 1, 113.541, 22.1894, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (67, 'AYG048', '擎天滙櫃(第3座)', '擎天汇柜(第3座)', '石排湾马路擎天汇第3座门口【住户专用】', 1, 1, 113.564, 22.1274, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (70, 'AYD026', '氹仔海洋店', '凼仔海洋店', '氹仔海洋花园大马路海洋广场325室【澳运驿站】', 2, 1, 113.549, 22.158, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (71, 'AYD027', '國際中心店', '国际中心店', '澳门海港街63号国际中心1座GF楼L铺集运帮代收【澳运驿站】', 2, 1, 113.56, 22.1935, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (83, 'AYD039', '下環馬博士巷店', '下环马博士巷店', '澳门马博士巷6号金利大厦第四座地下E座I BOX博弈速递【澳运驿站】', 2, 1, 113.534, 22.1921, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (85, 'AYD041', '高士德羅神父店', '高士德罗神父店', '高士德罗神父街12-12A号永禧大厦地下B座集运帮【澳运驿站】', 2, 1, 113.539, 22.189, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (87, 'AYD043', '佑漢民安店', '佑汉民安店', '看台街354号民安新村第二座地下V铺 集运帮【澳运驿站】', 2, 1, 113.552, 22.2121, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (88, 'AYD044', '黑沙環廣福祥店', '黑沙环广福祥店', '黑沙环广福祥第7座地下BY铺 集运帮【澳运驿站】', 2, 1, 113.555, 22.2106, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (91, 'AYD047', '美副將栢蕙店', '美副将栢蕙店', '澳门荷兰园马路栢蕙花园地下BB铺（栢蕙广场大众超市旁第一入口内）集运帮代收【澳运驿站】', 2, 1, 113.551, 22.2026, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (92, 'AYD048', '唯德店', '唯德店', '澳门马场东大马路229号唯德花园(第一座,第二座,第三座)地下AX、AV、AW座联丰食品超级市场内【澳运驿站】', 2, 1, 113.554, 22.2115, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (93, 'AYD049', '台山威苑店', '台山威苑店', '澳门台山菜园涌北街180号威苑花园(B座)地下联丰超市内【澳运驿站】', 2, 1, 113.545, 22.214, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (94, 'AYD050', '白鴿巢新勝店', '白鸽巢新胜店', '澳门新胜街10D容兴大厦地下集运帮代收店【澳运驿站】', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (95, 'AYD051', '龍園店(全佳超市)', '龙园店(全佳超市)', '澳门俾利喇街177-193号龙园商场地下S至Z座及地下AA座（全佳超级市场）【澳运驿站】', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (97, 'AYD053', '三盞燈店(新建華超市)', '三盏灯店(新建华超市)', '澳门飞能便度围5A号金利来新村第三座地下A1号店新建华超级市场内【澳运驿站】', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (100, 'AYG052', '盧九櫃', '卢九柜', '澳门巴士度街5号（卢廉若公园巴士站对面）集运帮代收店旁【澳运驿站】', 1, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (101, 'AYD056', '筷子基運順新邨店(聯豐超市)', '筷子基运顺新村店(联丰超市)', '澳门兰花前地26号运顺新邨地下I座联丰超市内【澳运驿站】', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (102, 'AYD057', '氹仔南貴花園店', '凼仔南贵花园店', '澳门凼仔永诚街70-110号南贵花园地下C座联丰超市内【澳运驿站】', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (103, 'AYD058', '澳門大學店(聯豐超市)', '澳门大学店(联丰超市)', '澳門大學橫琴校區薈萃芳2層2004室聯豐超市內【澳運驛站】', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (104, 'AYD060', '皇朝南岸店(聯豐超市)', '皇朝南岸店(联丰超市)', '澳门皇朝布鲁塞尔街229号南岸花园地下J座联丰食品超级市场南岸店内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (105, 'AYD061', '沙嘉都喇賈罷麗街店(聯豐超市)', '沙嘉都喇贾罢丽街店(联丰超市)', '澳门沙嘉都喇贾罢丽街23-A号信託大厦地下B座联丰食品超级市场内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (106, 'AYG062', '文第士櫃', '文第士柜', '澳門文第士街13-13A鋪門口', 1, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (107, 'AYD065', '石排灣良品栢苑店', '石排湾良品柏苑店', '澳门路环和谐大马路擎天汇第十一座F1地铺(良品铺子生活馆内)', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (108, 'AYD076', '氹仔雄昌店', '凼仔雄昌店', '氹仔南京街580号雄昌花园IR/C地下I座联丰食品超级市场雄昌店内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (110, 'AYG055', '茵豪薈櫃', '茵豪荟柜', '澳门青洲化验所街4号茵豪荟2楼会所平台【住户专用】', 1, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (111, 'AYD063', '黑沙環寰宇天下店', '黑沙环环宇天下店', '澳门黑沙环中街158号至648号寰宇天下地下P座乐淘代收店內', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (112, 'AYD064', '黑沙環保利達店', '黑沙环保利达店', '澳门黑沙环中街129号保利达花园第6座地下BJ铺', 2, 1, 113.562, 22.2071, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (114, 'AYD079', '沙梨頭典雅灣店(利民超市)', '沙梨头典雅湾店(利民超市)', '澳门沙梨头典雅湾地下A铺利民超级市场内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (115, 'AYD080', '皇朝大豐店', '皇朝大丰店', '澳门栢林街82号大丰银行广场地下I铺华澳华创商业管理有限公司内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (116, 'AYD066', '氹仔金利達(樂淘)', '凼仔金利达(乐淘)', '氹仔佛山街142号金利达地下P座乐淘代收店內', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (117, 'AYD069', '筷子基運順店(樂淘)', '筷子基运顺店(乐淘)', '澳门运顺新邨地下CXR/C及CYR/C铺乐淘代收店内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (118, 'AYD067', '氹仔美景店(樂淘)', '凼仔美景店(乐淘)', '氹仔美景花园7座地下BF铺乐淘代收店內', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (119, 'AYD068', '青洲美居店(樂淘)', '青洲美居店(乐淘)', '澳门青洲大马路美居广场地下T铺乐淘代收店内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (120, 'AYD081', '筷子基宏基店(樂淘)', '筷子基宏基店(乐淘)', '澳门和乐坊二街6号宏兴大厦地下T座乐淘代收店内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (121, 'AYD084', '新馬路福隆店(全佳超市)', '新马路福隆店(全佳超市)', '澳门福隆下街一号_全佳超市内', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (122, 'AYG061', '晉海櫃', '晋海柜', '澳门圆台街15-39号及渔翁街294-334号 晋海(第一座侧门地面层)', 1, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (123, 'AYD085', '黑沙環百利新邨店', '黑沙环百利新村店', '澳门黑沙环马埸大马路283号百利新邨第三座地下O铺', 2, 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (124, 'AYG062', '文第士櫃', '文第士柜', '澳門文第士街13-13A鋪位門口', 1, 1, 113.55, 22.2009, NULL, NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (125, 'AYD086', '下環帶水圍店', '下环带水围店', '澳门下环带水围桂和里5号威建大厦地下C座集运帮淘宝代收店内', 2, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (126, 'AYG056', '濠尚櫃(一至二座)', '濠尚柜(一至二座)', '氹仔廣東大馬路681號濠尚第1座&第2座共用電梯走廊【住戶專用】', 1, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (127, 'AYG057', '濠尚櫃(三至四座)', '濠尚柜(三至四座)', '氹仔廣東大馬路681號濠尚第3座&第4座共用電梯走廊【住戶專用】', 1, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (128, 'AYG058', '濠尚櫃(五至六座)', '濠尚柜(五至六座)', '氹仔廣東大馬路681號濠尚第5座&第6座共用電梯走廊【住戶專用】', 1, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (129, 'AYG059', '濠尚櫃(七至八座)', '濠尚柜(七至八座)', '氹仔廣東大馬路681號濠尚第7座&第8座共用電梯走廊【住戶專用】', 1, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (130, 'AYD083', '台山新城市店(樂淘)', '台山新城市店(乐淘)', '巴波沙大马路新城市花园第十座地下C座乐淘代收店内', 2, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (131, 'AYD074', '渡船街(樂淘)', '渡船街(乐淘)', '澳门渡船街渡船台16号丰裕大厦地下A铺乐淘代收店内', 2, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (132, 'AYD075', '沙梨頭昌明店(樂淘)', '沙梨头昌明店(乐淘)', '万安巷28号昌明花园(第二期)明星阁地下F座乐淘代收店内', 2, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (133, 'AYD072', '高士德世紀店(樂淘)', '高士德世纪店(乐淘)', '飞能便度街61号世纪豪庭1楼H铺乐淘代收店内', 2, 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (134, 'AYD057', '氹仔南貴花園店', '凼仔南贵花园店', '澳门永诚街70-110号南贵花园地下C座_联丰超市内', 2, 1, 0, 0, '2022-07-06 18:31:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (135, 'AYD076', '氹仔雄昌店', '凼仔雄昌店', '凼仔南京街580号雄昌花园IR/C地下I座_联丰超市场内', 2, 1, 0, 0, '2022-07-06 18:31:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (136, 'AYG057', '濠尚櫃(三至四座)', '濠尚柜(三至四座)', '凼仔广东大马路681号濠尚第3座&第4座共享电梯走廊【住户专用】', 1, 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (137, 'AYG056', '濠尚櫃(一至二座)', '濠尚柜(一至二座)', '凼仔广东大马路681号濠尚第1座&第2座共享电梯走廊【住户专用】', 1, 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (138, 'AYG058', '濠尚櫃(五至六座)', '濠尚柜(五至六座)', '凼仔广东大马路681号濠尚第5座&第6座共享电梯走廊【住户专用】', 1, 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (139, 'AYG059', '濠尚櫃(七至八座)', '濠尚柜(七至八座)', '凼仔广东大马路681号濠尚第7座&第8座共享电梯走廊【住户专用】', 1, 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (140, 'AYG042', '名門世家櫃', '名门世家柜', '凼仔柯维纳马路410号374星河湾名门世家6楼平台第8座入口【住户专用】', 1, 1, 0, 0, '2022-08-11 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (141, 'AYD087', '氹仔海怡店(樂淘)', '凼仔海怡店(乐淘)', '凼仔杭州街84-90号海怡花园地下Q座(新濠锋员工出入口对面）', 2, 1, 0, 0, '2022-08-11 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (142, 'AYD088', '白馬行銀座廣場店', '白马行银座广场店', '澳门伯多禄局长街银座广场二楼AI铺SUN FLOWER KIDS', 2, 1, 0, 0, '2022-09-19 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (143, 'AYD082', '筷子基海擎天店(樂淘)', '筷子基海擎天店(乐淘)', '澳门海擎天地下B铺乐淘代收店内', 2, 1, 0, 0, '2022-09-19 17:51:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (144, 'AYD089', '蘆苑店', '芦苑店', '澳门罗利老马路1-P号芦苑地下G座（卢廉若公园正门口对面）', 2, 1, 0, 0, '2022-09-28 12:06:01', NULL, NULL, '1');
INSERT INTO `cainiao_receivinglist` VALUES (145, 'AYDTTT', '1', '0', '1', 1, 1, 1, 1, '2022-11-09 09:05:34', NULL, '2022-11-09 09:32:02', '1');
INSERT INTO `cainiao_receivinglist` VALUES (146, '1', '1', '0', '1', 1, 1, 1, 1, '2022-11-09 09:16:08', NULL, '2022-11-09 09:16:08', '1');
INSERT INTO `cainiao_receivinglist` VALUES (147, '1', '1', '0', '1', 1, 1, 1, 1, '2022-11-09 09:16:58', NULL, '2022-11-09 09:16:58', '1');
INSERT INTO `cainiao_receivinglist` VALUES (148, '1', '1', '0', '1', 2, 1, 1, 1, '2022-11-09 09:17:57', NULL, '2022-11-09 09:38:02', '1');
INSERT INTO `cainiao_receivinglist` VALUES (150, '1', '1', '0', '1', 2, 1, 1, 1, '2022-11-09 09:19:15', NULL, '2022-11-09 09:19:15', '1');
INSERT INTO `cainiao_receivinglist` VALUES (151, '1', '1', '0', '1', 2, 1, 1, 1, '2022-11-09 09:21:58', NULL, '2022-11-09 09:21:58', '1');
INSERT INTO `cainiao_receivinglist` VALUES (152, '1', '1', '0', '1', 23, 1, 1, 1, '2022-11-09 09:23:45', NULL, '2022-11-09 09:23:45', '1');
INSERT INTO `cainiao_receivinglist` VALUES (153, '1', '1', '0', '1', 23, 1, 1, 1, '2022-11-09 09:23:55', NULL, '2022-11-09 09:23:55', '1');

-- ----------------------------
-- Table structure for cainiao_shelf_info
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_shelf_info`;
CREATE TABLE `cainiao_shelf_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '快递单号',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货架号',
  `status` smallint(1) NOT NULL DEFAULT 0 COMMENT '状态:默认是0',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库区名称',
  `area_id` int(11) NOT NULL COMMENT '库区ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order`(`order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cainiao_shelf_info
-- ----------------------------
INSERT INTO `cainiao_shelf_info` VALUES (2, '544878835398', NULL, 0, '库区一', 1, '2022-11-24 16:30:18', '2022-11-24 16:30:18');
INSERT INTO `cainiao_shelf_info` VALUES (3, '545806510768', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (4, '546094278624', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (5, '546094278675', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (6, '546094278731', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (7, '546138921620', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (8, '546146350613', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (9, '546146350814', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (10, '546146351072', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (11, '546146351070', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (12, '546146351071', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (13, '546146351254', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (14, '546146351386', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (15, '546146350818', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (16, '546146351264', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (17, '544879146188', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (18, '546146351303', '213123', 1, 'AYD001', 1, NULL, NULL);
INSERT INTO `cainiao_shelf_info` VALUES (19, '30357937081526455191', '213123', 1, 'AYD001', 1, NULL, NULL);

-- ----------------------------
-- Table structure for cainiao_yubao
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_yubao`;
CREATE TABLE `cainiao_yubao`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接收数据',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cainiao_yubao
-- ----------------------------
INSERT INTO `cainiao_yubao` VALUES (1, '{\"data\":\"1\",\"date\":[\"123\"]}', '2022-11-10 17:01:57', '2022-11-10 17:01:57');
INSERT INTO `cainiao_yubao` VALUES (2, '{\"data\":\"1\",\"date\":[\"123\",\"23123\"]}', '2022-11-10 17:02:53', '2022-11-10 17:02:53');
INSERT INTO `cainiao_yubao` VALUES (3, '{\"data\":\"1\",\"date\":[\"123\",\"23123\"]}', '2022-11-10 17:03:32', '2022-11-10 17:03:32');
INSERT INTO `cainiao_yubao` VALUES (4, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:10:38', '2022-11-16 11:10:38');
INSERT INTO `cainiao_yubao` VALUES (5, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:11:08', '2022-11-16 11:11:08');
INSERT INTO `cainiao_yubao` VALUES (6, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:11:14', '2022-11-16 11:11:14');
INSERT INTO `cainiao_yubao` VALUES (7, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:11:22', '2022-11-16 11:11:22');
INSERT INTO `cainiao_yubao` VALUES (8, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:11:31', '2022-11-16 11:11:31');
INSERT INTO `cainiao_yubao` VALUES (9, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:11:34', '2022-11-16 11:11:34');
INSERT INTO `cainiao_yubao` VALUES (10, '{\"data\":{\"0\":\"213123\",\"2\":\"213123\"}}', '2022-11-16 11:11:40', '2022-11-16 11:11:40');
INSERT INTO `cainiao_yubao` VALUES (11, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547   \\u817e\\u65b0\\u8def65\\u53f7  \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547   \\u817e\\u65b0\\u8def65\\u53f7  \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 14:18:10', '2022-11-16 14:18:10');
INSERT INTO `cainiao_yubao` VALUES (12, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:36:22\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878697466\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878697466\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"210000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u82b1\\u6728\\u8857\\u9053\\u6a31\\u6728\\u82b1\\u9053\\u8d85\\u7ea7\\u5e05\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u6d66\\u4e1c\\u65b0\\u533a^^^   \\u82b1\\u6728\\u8857\\u9053\\u6a31\\u6728\\u82b1\\u9053\\u8d85\\u7ea7\\u5e05\\\",\\\"district\\\":\\\"\\u6d66\\u4e1c\\u65b0\\u533a\\\",\\\"name\\\":\\\"\\u82b1\\u82b1\\\",\\\"mobile\\\":\\\"130293921923\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3035376327367645519\\\",\\\"dereRecogCode\\\":\\\"R5KGESMF8GY6E\\\"}}}}\",\"data_digest\":\"lwMAbhwtvvpP17H18V2ICA==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806007202211161430\"}', '2022-11-16 14:36:25', '2022-11-16 14:36:25');
INSERT INTO `cainiao_yubao` VALUES (13, '[]', '2022-11-22 16:40:53', NULL);
INSERT INTO `cainiao_yubao` VALUES (14, '{\"12\":\"123\",\"123\":\"3\"}', '2022-11-22 16:41:06', NULL);
INSERT INTO `cainiao_yubao` VALUES (15, '{\"12\":\"123\",\"123\":\"3\"}', '2022-11-22 16:41:47', NULL);
INSERT INTO `cainiao_yubao` VALUES (16, '{\"logisticsEvent\":{\"eventHeader\":{\"eventTime\":\"2022-06-29 23:21:52\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_UPDATE_CONSIGN\"},\"eventBody\":{\"logisticsDetail\":{\"mailNo\":\"75893521738349\",\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"carrierCode\":\"ZTO\",\"logisticsOrderCode\":\"LP00518840256127\"}}}}', '2022-11-22 16:45:43', NULL);
INSERT INTO `cainiao_yubao` VALUES (17, '{\"logisticsEvent\":{\"eventHeader\":{\"eventTime\":\"2022-06-29 23:21:52\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_UPDATE_CONSIGN\"},\"eventBody\":{\"logisticsDetail\":{\"mailNo\":\"75893521738349\",\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"carrierCode\":\"ZTO\",\"logisticsOrderCode\":\"LP00518840256127\"}}}}', '2022-11-22 16:52:05', NULL);
INSERT INTO `cainiao_yubao` VALUES (18, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-22 15:32:47\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_OUTBOUND_NOTICE\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"carrierCode\\\":\\\"DISTRIBUTOR_13476787\\\",\\\"logisticsOrderCode\\\":\\\"LP00544427410761\\\",\\\"receiverDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"outboundLogisticsOrderCodes\\\":\\\"LP00545806510768\\\",\\\"segmentCode\\\":\\\"SENDTORECVER\\\",\\\"majorlogisticsOrderCode\\\":\\\"LP00544427410761\\\"},\\\"paymentDetail\\\":{\\\"payOrderId\\\":\\\"1336910004\\\",\\\"payTimeZone\\\":\\\"UTC+8\\\",\\\"shippingFee\\\":\\\"0\\\",\\\"payWeight\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"currencyUnit\\\":\\\"CENT\\\",\\\"weightUnit\\\":\\\"GRAM\\\"},\\\"extendData\\\":{\\\"promotionMoney\\\":\\\"0\\\"}}}}\",\"data_digest\":\"bD95BWxoKWvU7vi6dAufVg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"inner\",\"msg_type\":\"CONSO_WAREHOUSE_OUTBOUND_NOTICE\",\"msg_id\":\"1669107635977\"}', '2022-11-22 17:03:24', NULL);

-- ----------------------------
-- Table structure for cainiao_yubaoinfo
-- ----------------------------
DROP TABLE IF EXISTS `cainiao_yubaoinfo`;
CREATE TABLE `cainiao_yubaoinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cainiao_yubaoinfo
-- ----------------------------
INSERT INTO `cainiao_yubaoinfo` VALUES (1, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:31:05');
INSERT INTO `cainiao_yubaoinfo` VALUES (2, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:31:23');
INSERT INTO `cainiao_yubaoinfo` VALUES (3, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:33:52');
INSERT INTO `cainiao_yubaoinfo` VALUES (4, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:34:10');
INSERT INTO `cainiao_yubaoinfo` VALUES (5, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:41:07');
INSERT INTO `cainiao_yubaoinfo` VALUES (6, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:41:08');
INSERT INTO `cainiao_yubaoinfo` VALUES (7, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:41:09');
INSERT INTO `cainiao_yubaoinfo` VALUES (8, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:41:22');
INSERT INTO `cainiao_yubaoinfo` VALUES (9, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:41:53');
INSERT INTO `cainiao_yubaoinfo` VALUES (10, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:41:54');
INSERT INTO `cainiao_yubaoinfo` VALUES (11, '{\"logistics_interface\":\"{\\\"logisticsEvent\\\":{\\\"eventHeader\\\":{\\\"eventTime\\\":\\\"2022-11-16 14:18:07\\\",\\\"eventTimeZone\\\":\\\"UTC+8\\\",\\\"eventType\\\":\\\"CONSO_WAREHOUSE_CONSIGN\\\"},\\\"eventBody\\\":{\\\"logisticsDetail\\\":{\\\"isLastPackage\\\":\\\"Y\\\",\\\"orderSource\\\":\\\"1\\\",\\\"bizType\\\":\\\"CONSO4PL\\\",\\\"consoWarehouseCode\\\":\\\"TRAN_STORE_30792933\\\",\\\"buyerDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"1233\\\",\\\"province\\\":\\\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\\\",\\\"userRecogCode\\\":\\\"X2M0E5G3\\\",\\\"phone\\\":\\\"\\\",\\\"city\\\":\\\"\\u6fb3\\u95e8\\u534a\\u5c9b\\\",\\\"streetAddress\\\":\\\"\\u7684\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u6ef4\\u6ef4\\u7b54\\u7b54\\u7684\\\",\\\"district\\\":\\\"\\u82b1\\u738b\\u5802\\u533a\\\",\\\"name\\\":\\\"\\u6fb3\\u95e8\\\",\\\"mobile\\\":\\\"853-22221111\\\",\\\"membership\\\":{\\\"paidType\\\":\\\"N\\\",\\\"userLevel\\\":\\\"regularMember\\\"},\\\"wangwangId\\\":\\\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\\\"},\\\"deliveryType\\\":\\\"HOME_DELIVERY\\\",\\\"logisticsOrderCode\\\":\\\"LP00544878835398\\\",\\\"check\\\":\\\"false\\\",\\\"categoryFeature\\\":\\\"normal\\\",\\\"consoType\\\":\\\"002\\\",\\\"mailNo\\\":\\\"544878835398\\\",\\\"isSplitConsign\\\":\\\"N\\\",\\\"carrierCode\\\":\\\"YTO\\\",\\\"packageQuantity\\\":\\\"1\\\",\\\"senderDetail\\\":{\\\"country\\\":\\\"\\u4e2d\\u56fd\\\",\\\"zipCode\\\":\\\"000000\\\",\\\"province\\\":\\\"\\u4e0a\\u6d77\\\",\\\"town\\\":\\\"\\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"city\\\":\\\"\\u4e0a\\u6d77\\u5e02\\\",\\\"streetAddress\\\":\\\"\\u4e0a\\u6d77^^^\\u4e0a\\u6d77\\u5e02^^^\\u9752\\u6d66\\u533a^^^ \\u767d\\u9e64\\u9547 \\u817e\\u65b0\\u8def65\\u53f7 \\u4e0a\\u6d77\\u6377\\u5229\\u8de8\\u5883\\u8f6c\\u8fd0\\u4ed3@9Y2WCZF3#R5JY443U2XCE1#\\\",\\\"district\\\":\\\"\\u9752\\u6d66\\u533a\\\",\\\"name\\\":\\\"JESS\\\",\\\"mobile\\\":\\\"59810618\\\",\\\"shopName\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\",\\\"wangwangId\\\":\\\"c\\u6d4b\\u8bd5\\u8d26\\u53f767\\\"},\\\"items\\\":[{\\\"itemId\\\":\\\"607136539151\\\",\\\"itemUnitPrice\\\":\\\"1\\\",\\\"itemPicUrl\\\":\\\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/429504656\\/O1CN01mTmkIn1kGUZsU3xhB_!!429504656.jpg\\\",\\\"itemName\\\":\\\"\\u5973\\u88c5\\uff0cTBC\\uff0c\\u6d4b\\u8bd5\\u5546\\u54c1\\uff0c\\u8bf7\\u4e0d\\u8981\\u62cd\\uff0c\\u62cd\\u4e0b\\u4e0d\\u53d1\\u8d27\\\",\\\"itemQuantity\\\":\\\"1\\\",\\\"itemSkuProperty\\\":\\\"\\\",\\\"currency\\\":\\\"CNY\\\",\\\"categoryName\\\":\\\"\\u5973\\u88c5\\/\\u5973\\u58eb\\u7cbe\\u54c1_\\u8fde\\u8863\\u88d9\\\",\\\"totalActualPayment\\\":\\\"1\\\",\\\"skuId\\\":\\\"\\\",\\\"categoryId\\\":\\\"16_50010850\\\",\\\"currencyUnit\\\":\\\"CENT\\\"}]},\\\"paymentDetail\\\":{\\\"tradeOrderValue\\\":\\\"1\\\",\\\"currency\\\":\\\"CNY\\\",\\\"totalShippingFee\\\":\\\"0\\\",\\\"currencyUnit\\\":\\\"CENT\\\"},\\\"tradeDetail\\\":{\\\"tradeOrderId\\\":\\\"3034418148098645519\\\",\\\"dereRecogCode\\\":\\\"R5JY443U2XCE1\\\"}}}}\",\"data_digest\":\"BN6PfVDI\\/txh1Kby4+Jncg==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1332806004202211161410\"}', '2022-11-16 16:54:13');
INSERT INTO `cainiao_yubaoinfo` VALUES (12, '{\"logistics_interface\":{\"logisticsEvent\":{\"eventHeader\":{\"eventTime\":\"2022-11-24 10:29:32\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_CONSIGN\"},\"eventBody\":{\"logisticsDetail\":{\"isLastPackage\":\"N\",\"orderSource\":\"1\",\"bizType\":\"CONSO4PL\",\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"buyerDetail\":{\"country\":\"\\u4e2d\\u56fd\",\"zipCode\":\"000000\",\"province\":\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\",\"userRecogCode\":\"X2M0E5G3\",\"phone\":null,\"city\":\"\\u6fb3\\u95e8\\u534a\\u5c9b\",\"streetAddress\":\"MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, \\u6fb3\\u95e8\",\"district\":\"\\u82b1\\u5730\\u739b\\u5802\\u533a\",\"name\":\"\\u6fb3\\u95e8\",\"mobile\":\"86-15158121000\",\"membership\":{\"paidType\":\"N\",\"userLevel\":\"regularMember\"},\"wangwangId\":\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\"},\"deliveryType\":\"HOME_DELIVERY\",\"logisticsOrderCode\":\"LP00546211471045\",\"check\":\"false\",\"categoryFeature\":\"normal\",\"consoType\":\"002\",\"mailNo\":\"3035793708152645519\",\"isSplitConsign\":\"N\",\"senderDetail\":{\"wangwangId\":\"\\u5546\\u5bb6\\u6d4b\\u8bd5\\u8d26\\u53f7\\uff08\\u5c0f\\u58ee\\uff09\"},\"items\":[{\"itemId\":\"667718304014\",\"itemUnitPrice\":\"1\",\"itemPicUrl\":\"https:\\/\\/img.alicdn.com\\/imgextra\\/i1\\/263669477\\/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg\",\"itemName\":\"(\\u6d4b\\u8bd5\\u5546\\u54c1\\u8bf7\\u4e0d\\u8981\\u62cd)\\u514b\\u9686\\u5546\\u54c1=42985775812\",\"itemQuantity\":\"1\",\"itemSkuProperty\":\"\\u989c\\u8272\\u5206\\u7c7b:\\u660e\\u9ec4\\u8272\",\"currency\":\"CNY\",\"categoryName\":\"\\u9970\\u54c1\\/\\u6d41\\u884c\\u9996\\u9970\\/\\u65f6\\u5c1a\\u9970\\u54c1\\u65b0_\\u53d1\\u9970\",\"totalActualPayment\":\"1\",\"skuId\":\"4810140060309\",\"categoryId\":\"50013864_50013878\",\"currencyUnit\":\"CENT\"}]},\"paymentDetail\":{\"tradeOrderValue\":\"1\",\"currency\":\"CNY\",\"totalShippingFee\":\"0\",\"currencyUnit\":\"CENT\"},\"tradeDetail\":{\"tradeOrderId\":\"3035793708152645519\",\"dereRecogCode\":\"R5K55NUC8Y8XN\"}}}},\"data_digest\":\"z1pDhgGkeiZKCGAOb1LRWA==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1338656069202211240950\"}', '2022-11-24 14:34:19');
INSERT INTO `cainiao_yubaoinfo` VALUES (13, '{\"logistics_interface\":{\"logisticsEvent\":{\"eventHeader\":{\"eventTime\":\"2022-11-24 10:29:32\",\"eventTimeZone\":\"UTC+8\",\"eventType\":\"CONSO_WAREHOUSE_CONSIGN\"},\"eventBody\":{\"logisticsDetail\":{\"isLastPackage\":\"N\",\"orderSource\":\"1\",\"bizType\":\"CONSO4PL\",\"consoWarehouseCode\":\"TRAN_STORE_30792933\",\"buyerDetail\":{\"country\":\"\\u4e2d\\u56fd\",\"zipCode\":\"000000\",\"province\":\"\\u6fb3\\u95e8\\u7279\\u522b\\u884c\\u653f\\u533a\",\"userRecogCode\":\"X2M0E5G3\",\"phone\":null,\"city\":\"\\u6fb3\\u95e8\\u534a\\u5c9b\",\"streetAddress\":\"MO Rua Primeiro 1 de Maio, R. Um do Bairro da Areia Preta, \\u6fb3\\u95e8\",\"district\":\"\\u82b1\\u5730\\u739b\\u5802\\u533a\",\"name\":\"\\u6fb3\\u95e8\",\"mobile\":\"86-15158121000\",\"membership\":{\"paidType\":\"N\",\"userLevel\":\"regularMember\"},\"wangwangId\":\"\\u5c0f\\u58ee\\u6d4b\\u8bd5\\u8d26\\u53f701\"},\"deliveryType\":\"HOME_DELIVERY\",\"logisticsOrderCode\":\"LP00546211471045\",\"check\":\"false\",\"categoryFeature\":\"normal\",\"consoType\":\"002\",\"mailNo\":\"3035793708152645519\",\"isSplitConsign\":\"N\",\"senderDetail\":{\"wangwangId\":\"\\u5546\\u5bb6\\u6d4b\\u8bd5\\u8d26\\u53f7\\uff08\\u5c0f\\u58ee\\uff09\"},\"items\":[{\"itemId\":\"667718304014\",\"itemUnitPrice\":\"1\",\"itemPicUrl\":\"https:\\/\\/img.alicdn.com\\/imgextra\\/i1\\/263669477\\/O1CN01fH0cbf2JsW8fvHFwx_!!263669477.jpg\",\"itemName\":\"(\\u6d4b\\u8bd5\\u5546\\u54c1\\u8bf7\\u4e0d\\u8981\\u62cd)\\u514b\\u9686\\u5546\\u54c1=42985775812\",\"itemQuantity\":\"1\",\"itemSkuProperty\":\"\\u989c\\u8272\\u5206\\u7c7b:\\u660e\\u9ec4\\u8272\",\"currency\":\"CNY\",\"categoryName\":\"\\u9970\\u54c1\\/\\u6d41\\u884c\\u9996\\u9970\\/\\u65f6\\u5c1a\\u9970\\u54c1\\u65b0_\\u53d1\\u9970\",\"totalActualPayment\":\"1\",\"skuId\":\"4810140060309\",\"categoryId\":\"50013864_50013878\",\"currencyUnit\":\"CENT\"}]},\"paymentDetail\":{\"tradeOrderValue\":\"1\",\"currency\":\"CNY\",\"totalShippingFee\":\"0\",\"currencyUnit\":\"CENT\"},\"tradeDetail\":{\"tradeOrderId\":\"3035793708152645519\",\"dereRecogCode\":\"R5K55NUC8Y8XN\"}}}},\"data_digest\":\"z1pDhgGkeiZKCGAOb1LRWA==\",\"partner_code\":\"TRAN_STORE_30792933\",\"from_code\":\"CNCTP\",\"msg_type\":\"CONSO_WAREHOUSE_CONSIGN\",\"msg_id\":\"1338656069202211240950\"}', '2022-11-24 14:34:55');

-- ----------------------------
-- Table structure for carniao_order_error_log
-- ----------------------------
DROP TABLE IF EXISTS `carniao_order_error_log`;
CREATE TABLE `carniao_order_error_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报文内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cainiao_api` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carniao_order_error_log
-- ----------------------------
INSERT INTO `carniao_order_error_log` VALUES (1, '544878835398', '{\"success\":\"false\",\"errorCode\":\"EXP_CTP_COMMON_ILLEGAL_ARGUMENTS\",\"errorMsg\":\"CODE: EXP_CTP_COMMON_ILLEGAL_ARGUMENTS, MESSAGE: 参数非法\"}', '2022-11-18 17:57:52', '2022-11-18 17:57:52', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (2, '544878835398', '{\"success\":\"true\"}', '2022-11-20 14:24:42', '2022-11-20 14:24:42', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (3, '544878835398', '{\"success\":\"true\"}', '2022-11-20 14:25:04', '2022-11-20 14:25:04', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (4, '545806510768', '{\"success\":false,\"errorCode\":\"S04\",\"errorMsg\":\"\\u5BF9\\u65B9\\u670D\\u52A1\\u5668ReadTimeOut:ReceiveServiceInvoker~serviceName=com.taobao.pac.client.sdk.receiveservice.ConsoWarehouseSignService,appName=CNCTP,version=1.0.0,\\u5F02\\u5E38\\u4FE1\\u606F=\\u5BF9\\u65B9\\u670D\\u52A1\\u5668ReadTimeOut traceId:213fc39416691013437965460e8a26\"}', '2022-11-22 15:15:53', '2022-11-22 15:15:53', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (5, '545806510768', '{\"success\":false,\"errorCode\":\"S04\",\"errorMsg\":\"\\u5BF9\\u65B9\\u670D\\u52A1\\u5668ReadTimeOut:ReceiveServiceInvoker~serviceName=com.taobao.pac.client.sdk.receiveservice.ConsoWarehouseSignService,appName=CNCTP,version=1.0.0,\\u5F02\\u5E38\\u4FE1\\u606F=\\u5BF9\\u65B9\\u670D\\u52A1\\u5668ReadTimeOut traceId:2132f14616691014719762841ef812\"}', '2022-11-22 15:18:01', '2022-11-22 15:18:01', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (6, '545806510768', '{\"success\":false,\"errorCode\":\"S04\",\"errorMsg\":\"\\u5BF9\\u65B9\\u670D\\u52A1\\u5668ReadTimeOut:ReceiveServiceInvoker~serviceName=com.taobao.pac.client.sdk.receiveservice.ConsoWarehouseSignService,appName=CNCTP,version=1.0.0,\\u5F02\\u5E38\\u4FE1\\u606F=\\u5BF9\\u65B9\\u670D\\u52A1\\u5668ReadTimeOut traceId:2133cbb816691014997677012eaf5f\"}', '2022-11-22 15:18:29', '2022-11-22 15:18:29', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (7, '546146350613', '{\"success\":\"false\",\"errorCode\":\"RST_CTP_BIZ_JOB_STATUS_MACHINE_CHECK_ERROR\",\"errorMsg\":\"job statusMachine check error job执行状态机校验错误\"}', '2022-11-25 14:17:39', '2022-11-25 14:17:39', 'CONSO_WAREHOUSE_ARRIVE');
INSERT INTO `carniao_order_error_log` VALUES (8, '546146350613', '{\"success\":\"false\",\"errorCode\":\"RST_CTP_BIZ_JOB_STATUS_MACHINE_CHECK_ERROR\",\"errorMsg\":\"job statusMachine check error job执行状态机校验错误\"}', '2022-11-25 14:23:16', '2022-11-25 14:23:16', 'CONSO_WAREHOUSE_ARRIVE');

SET FOREIGN_KEY_CHECKS = 1;
