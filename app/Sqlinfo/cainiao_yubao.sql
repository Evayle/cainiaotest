/*
 Navicat Premium Data Transfer

 Source Server         : 测试新加坡菜鸟部分
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : cainiao_api_test

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 16/11/2022 14:49:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

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

SET FOREIGN_KEY_CHECKS = 1;
