CREATE TABLE `admin_user` (
	`id` INT ( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_name` VARCHAR ( 50 ) NOT NULL COMMENT '用户名称',
	`user_password` VARCHAR ( 255 ) NOT NULL COMMENT '用户密码',
	`user_status` enum ( '1', '0' ) NOT NULL DEFAULT '0' COMMENT '用户状态',
	`user_rights` VARCHAR ( 255 ) NOT NULL DEFAULT '' COMMENT '用户权限PC\r\n',
	`user_rights_pda` VARCHAR ( 255 ) NOT NULL DEFAULT '' COMMENT '用户权限PDA',
	`user_phone` BIGINT ( 13 ) NOT NULL COMMENT '用户电话号码',
	`user_token` VARCHAR ( 255 ) NOT NULL COMMENT '用户token',
	`socket_id` VARCHAR ( 200 ) NOT NULL COMMENT '用户的Scoketid',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT '用户添加时间',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT '用户修改时间',
	`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT '软删除字段',
	`user_group` INT ( 11 ) NOT NULL DEFAULT '0' COMMENT '用户分组',
	PRIMARY KEY ( `id` ),
UNIQUE KEY `phone` ( `user_phone` ) USING BTREE
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `admin_user_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL COMMENT '组名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
