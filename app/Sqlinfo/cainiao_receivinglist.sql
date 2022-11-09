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

 Date: 09/11/2022 17:41:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `latitude` float NULL DEFAULT NULL COMMENT '經度',
  `longitude` float NULL DEFAULT NULL COMMENT '緯度',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '新增日期',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '刪除日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`receiving_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cainiao_receivinglist
-- ----------------------------
INSERT INTO `cainiao_receivinglist` VALUES (1, 'AYD004', '新華門店', '新华门店', '澳門佑漢新村八街新華學校後門創利電訊', 2, 113.549, 22.2126, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (2, 'AYD001', '皇朝獲多利分店', '皇朝获多利分店', '皇朝宋玉生广场获多利中心U铺集运帮代收店【澳运驿站】(君柏地产左侧直入5米)', 2, 113.326, 22.1122, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (3, 'AYD009', '鏡湖店', '镜湖店', '连胜街91号仁昌大厦地下A铺集运帮代收店【澳运驿站】', 2, 113.542, 22.1999, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (4, 'AYG004', '亨達櫃', '亨达柜', '马揸度博士大马路511号亨达大厦地铺B座(easy wash洗车屋内)', 1, 113.332, 22.1218, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (5, 'AYG005', '通發櫃', '通发柜', '荷兰园二马路25-27B号通发大厦地下T座(文化广场书店后边)', 1, 113.325, 22.115, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (8, 'AYG008', '新益櫃', '新益柜', '马交石斜坡9号新益花园大堂內', 1, 113.33, 22.1221, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (11, 'AYG011', '世邦櫃', '世邦柜', '啤利喇街4号广利大厦地下世邦家私城(啤利喇街方向门口)', 1, 113.324, 22.1158, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (13, 'AYG013', '筷子基櫃', '筷子基柜', '提督马路143号南益工业大厦地下B(郑忠记CCK凍內店右側)', 1, 113.324, 22.1224, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (15, 'AYG015', '濠庭櫃(第7座)', '濠庭柜(第7座)', '哥英布拉街濠庭都会1楼平台花园(第7座旁)【住户专用】', 1, 113.332, 22.0936, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (16, 'AYG016', '濠庭櫃(第11座)', '濠庭柜(第11座)', '哥英布拉街濠庭都会1楼平台花园(第11座旁)【住户专用】', 1, 113.332, 22.0933, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (17, 'AYG017', '濠庭櫃(第8座)', '濠庭柜(第8座)', '南京街濠庭都会1楼平台花园(第8座旁)【住户专用】', 1, 113.332, 22.0938, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (18, 'AYG018', '濠庭櫃(第12座)', '濠庭柜(第12座)', '南京街濠庭都会1楼平台花园(第12座旁) 【住户专用】', 1, 113.332, 22.0935, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (19, 'AYG019', '濠珀櫃(第1座)', '濠珀柜(第1座)', '基马拉斯大马路濠珀大厦第一座电梯大堂【住户专用】', 1, 113.332, 22.0927, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (20, 'AYG020', '濠珀櫃(第2座)', '濠珀柜(第2座)', '基马拉斯大马路濠珀大厦第二座电梯大堂【住户专用】', 1, 113.332, 22.0928, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (21, 'AYG021', '濠珀櫃(第3座)', '濠珀柜(第3座)', '基马拉斯大马路濠珀大厦第三座电梯大堂【住户专用】', 1, 113.332, 22.0929, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (23, 'AYG023', '文豐櫃', '文丰柜', '黑沙环第一街51-55号文丰楼地下I座及H座文丰创意墟大堂', 1, 113.33, 22.1235, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (26, 'AYG026', '科大櫃', '科大柜', '伟龙马路科技大学C座教学大楼地下正门旁', 1, 113.335, 22.0905, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (28, 'AYG028', '高士德櫃(停車場負1)', '高士德柜(停车场负1)', '高士德世纪豪庭停车场负一层(电梯旁)', 1, 113.325, 22.1205, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (33, 'AYG033', '聯薪櫃', '联薪柜', '飞喇士街81-101号联薪广场地下来来超市联薪分店内', 1, 113.324, 22.1227, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (35, 'AYG035', '寶翠櫃', '宝翠柜', '沙梨头南街及飞喇士街宝翠花园利星阁地下扶康会门口旁', 1, 113.323, 22.1224, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (36, 'AYG036', '廣福安櫃', '广福安柜', '黑沙环劳动节街广福安花园地下AO铺', 1, 113.332, 22.124, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (39, 'AYG039', '東南亞櫃', '东南亚柜', '新口岸外港填海区罗马街东南亚花园B座电梯大堂左侧【住户专用】', 1, 113.331, 22.112, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (40, 'AYG042', '名門世家櫃', '名门世家柜', '柯维纳马路410号374星河湾名门世家6楼平台第8座入口旁【住户专用】', 1, 113.546, 22.1576, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (41, 'AYG043', '獲多利櫃', '获多利柜', '宋玉生广场获多利中心停车场入口侧(电梯大堂內直入6米)', 1, 113.55, 22.1895, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (42, 'AYD005', '白鴿巢財旺店', '白鸽巢财旺店', '白鸽巢沙栏仔斜路18号地花王堂大厦一座地下C铺财旺商行【澳运驿站】', 2, 113.539, 22.1989, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (50, 'AYD015', '俾利喇店', '俾利喇店', '罗利老马路9-13号集运帮代收店【澳运驿站】(一哥炸鸡行旁)', 2, 113.546, 22.2014, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (53, 'AYD018', '氹仔花城店', '凼仔花城店', '奥林匹克大马路251号超级花城利宝阁一座地下C座【澳运国际自提中心】', 2, 113.556, 22.1554, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (55, 'AYG044', '半島櫃', '半岛柜', '筷子基北湾半岛大厦4楼会所内【住户专用】', 1, 113.538, 22.2058, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (57, 'AYG046', '擎天滙櫃(第1座)', '擎天汇柜(第1座)', '石排湾马路擎天汇第1座门口【住户专用】', 1, 113.56, 22.1306, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (58, 'AYG047', '擎天滙櫃(第12座)', '擎天汇柜(第12座)', '石排湾马路擎天汇第12座门口【住户专用】', 1, 113.561, 22.1307, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (59, 'AYD021', '海濱花園店', '海滨花园店', '黑沙環東北大馬路209號海濱花園第四座地下友鄰小市大多（澳運國際加盟店）', 2, 113.555, 22.207, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (60, 'AYD020', '新橋墨山巷店', '新桥墨山巷店', '新桥墨山巷10号保康大厦地下C铺成记三友物流【澳运驿站】(連勝馬路來來超市附近)', 2, 113.544, 22.2013, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (63, 'AYG050', '石排灣櫃', '石排湾柜', '路環蝴蝶谷大馬路石排灣綜合社區大樓1樓新苗超市熟食中心內', 1, 113.562, 22.1288, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (65, 'AYD023', '南灣壹號店', '南湾一号店', '商业大马路南湾壹号地下K铺(南湾半岛直入转右)【澳运国际自提中心】', 2, 113.541, 22.1894, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (67, 'AYG048', '擎天滙櫃(第3座)', '擎天汇柜(第3座)', '石排湾马路擎天汇第3座门口【住户专用】', 1, 113.564, 22.1274, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (70, 'AYD026', '氹仔海洋店', '凼仔海洋店', '氹仔海洋花园大马路海洋广场325室【澳运驿站】', 2, 113.549, 22.158, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (71, 'AYD027', '國際中心店', '国际中心店', '澳门海港街63号国际中心1座GF楼L铺集运帮代收【澳运驿站】', 2, 113.56, 22.1935, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (83, 'AYD039', '下環馬博士巷店', '下环马博士巷店', '澳门马博士巷6号金利大厦第四座地下E座I BOX博弈速递【澳运驿站】', 2, 113.534, 22.1921, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (85, 'AYD041', '高士德羅神父店', '高士德罗神父店', '高士德罗神父街12-12A号永禧大厦地下B座集运帮【澳运驿站】', 2, 113.539, 22.189, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (87, 'AYD043', '佑漢民安店', '佑汉民安店', '看台街354号民安新村第二座地下V铺 集运帮【澳运驿站】', 2, 113.552, 22.2121, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (88, 'AYD044', '黑沙環廣福祥店', '黑沙环广福祥店', '黑沙环广福祥第7座地下BY铺 集运帮【澳运驿站】', 2, 113.555, 22.2106, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (91, 'AYD047', '美副將栢蕙店', '美副将栢蕙店', '澳门荷兰园马路栢蕙花园地下BB铺（栢蕙广场大众超市旁第一入口内）集运帮代收【澳运驿站】', 2, 113.551, 22.2026, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (92, 'AYD048', '唯德店', '唯德店', '澳门马场东大马路229号唯德花园(第一座,第二座,第三座)地下AX、AV、AW座联丰食品超级市场内【澳运驿站】', 2, 113.554, 22.2115, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (93, 'AYD049', '台山威苑店', '台山威苑店', '澳门台山菜园涌北街180号威苑花园(B座)地下联丰超市内【澳运驿站】', 2, 113.545, 22.214, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (94, 'AYD050', '白鴿巢新勝店', '白鸽巢新胜店', '澳门新胜街10D容兴大厦地下集运帮代收店【澳运驿站】', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (95, 'AYD051', '龍園店(全佳超市)', '龙园店(全佳超市)', '澳门俾利喇街177-193号龙园商场地下S至Z座及地下AA座（全佳超级市场）【澳运驿站】', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (97, 'AYD053', '三盞燈店(新建華超市)', '三盏灯店(新建华超市)', '澳门飞能便度围5A号金利来新村第三座地下A1号店新建华超级市场内【澳运驿站】', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (100, 'AYG052', '盧九櫃', '卢九柜', '澳门巴士度街5号（卢廉若公园巴士站对面）集运帮代收店旁【澳运驿站】', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (101, 'AYD056', '筷子基運順新邨店(聯豐超市)', '筷子基运顺新村店(联丰超市)', '澳门兰花前地26号运顺新邨地下I座联丰超市内【澳运驿站】', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (102, 'AYD057', '氹仔南貴花園店', '凼仔南贵花园店', '澳门凼仔永诚街70-110号南贵花园地下C座联丰超市内【澳运驿站】', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (103, 'AYD058', '澳門大學店(聯豐超市)', '澳门大学店(联丰超市)', '澳門大學橫琴校區薈萃芳2層2004室聯豐超市內【澳運驛站】', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (104, 'AYD060', '皇朝南岸店(聯豐超市)', '皇朝南岸店(联丰超市)', '澳门皇朝布鲁塞尔街229号南岸花园地下J座联丰食品超级市场南岸店内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (105, 'AYD061', '沙嘉都喇賈罷麗街店(聯豐超市)', '沙嘉都喇贾罢丽街店(联丰超市)', '澳门沙嘉都喇贾罢丽街23-A号信託大厦地下B座联丰食品超级市场内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (106, 'AYG062', '文第士櫃', '文第士柜', '澳門文第士街13-13A鋪門口', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (107, 'AYD065', '石排灣良品栢苑店', '石排湾良品柏苑店', '澳门路环和谐大马路擎天汇第十一座F1地铺(良品铺子生活馆内)', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (108, 'AYD076', '氹仔雄昌店', '凼仔雄昌店', '氹仔南京街580号雄昌花园IR/C地下I座联丰食品超级市场雄昌店内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (110, 'AYG055', '茵豪薈櫃', '茵豪荟柜', '澳门青洲化验所街4号茵豪荟2楼会所平台【住户专用】', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (111, 'AYD063', '黑沙環寰宇天下店', '黑沙环环宇天下店', '澳门黑沙环中街158号至648号寰宇天下地下P座乐淘代收店內', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (112, 'AYD064', '黑沙環保利達店', '黑沙环保利达店', '澳门黑沙环中街129号保利达花园第6座地下BJ铺', 2, 113.562, 22.2071, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (114, 'AYD079', '沙梨頭典雅灣店(利民超市)', '沙梨头典雅湾店(利民超市)', '澳门沙梨头典雅湾地下A铺利民超级市场内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (115, 'AYD080', '皇朝大豐店', '皇朝大丰店', '澳门栢林街82号大丰银行广场地下I铺华澳华创商业管理有限公司内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (116, 'AYD066', '氹仔金利達(樂淘)', '凼仔金利达(乐淘)', '氹仔佛山街142号金利达地下P座乐淘代收店內', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (117, 'AYD069', '筷子基運順店(樂淘)', '筷子基运顺店(乐淘)', '澳门运顺新邨地下CXR/C及CYR/C铺乐淘代收店内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (118, 'AYD067', '氹仔美景店(樂淘)', '凼仔美景店(乐淘)', '氹仔美景花园7座地下BF铺乐淘代收店內', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (119, 'AYD068', '青洲美居店(樂淘)', '青洲美居店(乐淘)', '澳门青洲大马路美居广场地下T铺乐淘代收店内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (120, 'AYD081', '筷子基宏基店(樂淘)', '筷子基宏基店(乐淘)', '澳门和乐坊二街6号宏兴大厦地下T座乐淘代收店内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (121, 'AYD084', '新馬路福隆店(全佳超市)', '新马路福隆店(全佳超市)', '澳门福隆下街一号_全佳超市内', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (122, 'AYG061', '晉海櫃', '晋海柜', '澳门圆台街15-39号及渔翁街294-334号 晋海(第一座侧门地面层)', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (123, 'AYD085', '黑沙環百利新邨店', '黑沙环百利新村店', '澳门黑沙环马埸大马路283号百利新邨第三座地下O铺', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (124, 'AYG062', '文第士櫃', '文第士柜', '澳門文第士街13-13A鋪位門口', 1, 113.55, 22.2009, NULL, NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (125, 'AYD086', '下環帶水圍店', '下环带水围店', '澳门下环带水围桂和里5号威建大厦地下C座集运帮淘宝代收店内', 2, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (126, 'AYG056', '濠尚櫃(一至二座)', '濠尚柜(一至二座)', '氹仔廣東大馬路681號濠尚第1座&第2座共用電梯走廊【住戶專用】', 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (127, 'AYG057', '濠尚櫃(三至四座)', '濠尚柜(三至四座)', '氹仔廣東大馬路681號濠尚第3座&第4座共用電梯走廊【住戶專用】', 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (128, 'AYG058', '濠尚櫃(五至六座)', '濠尚柜(五至六座)', '氹仔廣東大馬路681號濠尚第5座&第6座共用電梯走廊【住戶專用】', 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (129, 'AYG059', '濠尚櫃(七至八座)', '濠尚柜(七至八座)', '氹仔廣東大馬路681號濠尚第7座&第8座共用電梯走廊【住戶專用】', 1, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (130, 'AYD083', '台山新城市店(樂淘)', '台山新城市店(乐淘)', '巴波沙大马路新城市花园第十座地下C座乐淘代收店内', 2, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (131, 'AYD074', '渡船街(樂淘)', '渡船街(乐淘)', '澳门渡船街渡船台16号丰裕大厦地下A铺乐淘代收店内', 2, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (132, 'AYD075', '沙梨頭昌明店(樂淘)', '沙梨头昌明店(乐淘)', '万安巷28号昌明花园(第二期)明星阁地下F座乐淘代收店内', 2, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (133, 'AYD072', '高士德世紀店(樂淘)', '高士德世纪店(乐淘)', '飞能便度街61号世纪豪庭1楼H铺乐淘代收店内', 2, 0, 0, '2022-06-07 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (134, 'AYD057', '氹仔南貴花園店', '凼仔南贵花园店', '澳门永诚街70-110号南贵花园地下C座_联丰超市内', 2, 0, 0, '2022-07-06 18:31:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (135, 'AYD076', '氹仔雄昌店', '凼仔雄昌店', '凼仔南京街580号雄昌花园IR/C地下I座_联丰超市场内', 2, 0, 0, '2022-07-06 18:31:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (136, 'AYG057', '濠尚櫃(三至四座)', '濠尚柜(三至四座)', '凼仔广东大马路681号濠尚第3座&第4座共享电梯走廊【住户专用】', 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (137, 'AYG056', '濠尚櫃(一至二座)', '濠尚柜(一至二座)', '凼仔广东大马路681号濠尚第1座&第2座共享电梯走廊【住户专用】', 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (138, 'AYG058', '濠尚櫃(五至六座)', '濠尚柜(五至六座)', '凼仔广东大马路681号濠尚第5座&第6座共享电梯走廊【住户专用】', 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (139, 'AYG059', '濠尚櫃(七至八座)', '濠尚柜(七至八座)', '凼仔广东大马路681号濠尚第7座&第8座共享电梯走廊【住户专用】', 1, 0, 0, '2022-08-03 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (140, 'AYG042', '名門世家櫃', '名门世家柜', '凼仔柯维纳马路410号374星河湾名门世家6楼平台第8座入口【住户专用】', 1, 0, 0, '2022-08-11 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (141, 'AYD087', '氹仔海怡店(樂淘)', '凼仔海怡店(乐淘)', '凼仔杭州街84-90号海怡花园地下Q座(新濠锋员工出入口对面）', 2, 0, 0, '2022-08-11 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (142, 'AYD088', '白馬行銀座廣場店', '白马行银座广场店', '澳门伯多禄局长街银座广场二楼AI铺SUN FLOWER KIDS', 2, 0, 0, '2022-09-19 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (143, 'AYD082', '筷子基海擎天店(樂淘)', '筷子基海擎天店(乐淘)', '澳门海擎天地下B铺乐淘代收店内', 2, 0, 0, '2022-09-19 17:51:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (144, 'AYD089', '蘆苑店', '芦苑店', '澳门罗利老马路1-P号芦苑地下G座（卢廉若公园正门口对面）', 2, 0, 0, '2022-09-28 12:06:01', NULL, NULL);
INSERT INTO `cainiao_receivinglist` VALUES (145, 'AYD777', '1', '0', '1', 1, 1, 1, '2022-11-09 09:05:34', NULL, '2022-11-09 09:32:02');
INSERT INTO `cainiao_receivinglist` VALUES (146, '1', '1', '0', '1', 1, 1, 1, '2022-11-09 09:16:08', NULL, '2022-11-09 09:16:08');
INSERT INTO `cainiao_receivinglist` VALUES (147, '1', '1', '0', '1', 1, 1, 1, '2022-11-09 09:16:58', NULL, '2022-11-09 09:16:58');
INSERT INTO `cainiao_receivinglist` VALUES (148, '1', '1', '0', '1', 2, 1, 1, '2022-11-09 09:17:57', NULL, '2022-11-09 09:38:02');
INSERT INTO `cainiao_receivinglist` VALUES (150, '1', '1', '0', '1', 2, 1, 1, '2022-11-09 09:19:15', NULL, '2022-11-09 09:19:15');
INSERT INTO `cainiao_receivinglist` VALUES (151, '1', '1', '0', '1', 2, 1, 1, '2022-11-09 09:21:58', NULL, '2022-11-09 09:21:58');
INSERT INTO `cainiao_receivinglist` VALUES (152, '1', '1', '0', '1', 23, 1, 1, '2022-11-09 09:23:45', NULL, '2022-11-09 09:23:45');
INSERT INTO `cainiao_receivinglist` VALUES (153, '1', '1', '0', '1', 23, 1, 1, '2022-11-09 09:23:55', NULL, '2022-11-09 09:23:55');

SET FOREIGN_KEY_CHECKS = 1;
