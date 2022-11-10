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

 Date: 10/11/2022 18:19:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `deliveryType` smallint(1) NULL DEFAULT NULL COMMENT '自提方式:1是HOME_DELIVERY2是PICKUP_DELIVERY',
  `consoType` smallint(1) NULL DEFAULT NULL COMMENT '集运类型:1',
  `isSplitConsign` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否产拆单:Y:N',
  `isLastPackage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是最后一件包裹:Y N',
  `packageQuantity` int(3) NULL DEFAULT NULL COMMENT '包裹数量',
  `tradeOrderId` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易订单ID',
  `dereRecogCode` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '无主件识别码',
  `user_phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号码',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_status` int(4) NULL DEFAULT NULL COMMENT '订单状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
