/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - kd-ssmj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kd-ssmj` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kd-ssmj`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm1z8hn/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm1z8hn/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm1z8hn/upload/picture3.jpg'),(4,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'mariadb_types','是否通过',1,'已安装',NULL,'2021-01-25 11:41:54'),(2,'mariadb_types','是否通过',2,'未安装',NULL,'2021-01-25 11:41:54'),(3,'mariadb_types','是否通过',3,'拆机',NULL,'2021-02-03 14:26:36');

/*Table structure for table `kuandaileixing` */

DROP TABLE IF EXISTS `kuandaileixing`;

CREATE TABLE `kuandaileixing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kdname` varchar(255) DEFAULT NULL COMMENT '宽带名称 Search',
  `notice_content` varchar(255) DEFAULT NULL COMMENT '套餐描述',
  `money` decimal(10,0) DEFAULT NULL COMMENT '宽带价格',
  `money_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '缴费时间',
  `speed` int(11) DEFAULT NULL COMMENT '宽带速度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `kuandaileixing` */

insert  into `kuandaileixing`(`id`,`kdname`,`notice_content`,`money`,`money_time`,`speed`) values (1,'宽带套餐1','宽带套餐描述','1000','2021-03-26 13:30:12',1),(3,'宽带套餐2','宽带套餐描述\r\n','2000','2021-02-03 13:58:07',2),(4,'宽带套餐3','宽带套餐描述\r\n','3000','2021-02-03 13:58:21',3);

/*Table structure for table `kuandaixinxi` */

DROP TABLE IF EXISTS `kuandaixinxi`;

CREATE TABLE `kuandaixinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `yh_types` tinyint(255) DEFAULT NULL COMMENT '所属用户 Search',
  `family` varchar(255) DEFAULT NULL COMMENT '安装地址',
  `number` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `kd_types` tinyint(255) DEFAULT NULL COMMENT '套餐信息 Search',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '安装时间',
  `mariadb_types` tinyint(255) DEFAULT NULL COMMENT '是否安装 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='宽带信息表';

/*Data for the table `kuandaixinxi` */

insert  into `kuandaixinxi`(`id`,`yh_types`,`family`,`number`,`kd_types`,`create_time`,`mariadb_types`) values (2,3,'地址1','123123123123',3,'2021-02-03 14:45:36',3),(5,1,'住址1','44444444',4,'2021-02-03 16:43:17',1);

/*Table structure for table `liuyanxinxi` */

DROP TABLE IF EXISTS `liuyanxinxi`;

CREATE TABLE `liuyanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `note` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `yhnote` varchar(11) DEFAULT NULL COMMENT '留言人',
  `note_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间 Search',
  `reply` varchar(255) DEFAULT NULL COMMENT '回复',
  `glreply` varchar(11) DEFAULT NULL COMMENT '回复人',
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanxinxi` */

insert  into `liuyanxinxi`(`id`,`note`,`yhnote`,`note_time`,`reply`,`glreply`,`reply_time`) values (4,'1231111','admin','2021-02-03 17:15:28','只有管理员可以回复','admin','2021-02-03 17:15:29');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','zm35bb7hm8q3168evf5hltqszow1v9k8','2021-01-28 18:04:51','2021-02-03 18:15:49'),(2,1,'小札','users','用户','fcfwfb0a3vfa9intt5xqj4oq0d1x0hok','2021-02-03 16:33:33','2021-02-03 17:33:33'),(3,30,'123','users',NULL,'31ztl98nm0uiodqbiajww0ig3bkqm92z','2021-02-03 16:59:57','2021-02-03 17:59:57'),(4,30,'123','users','用户','y33tglpuy0aacwtcyu9x6ewodbs15tox','2021-02-03 17:05:40','2021-02-03 18:05:57'),(5,32,'1233','users','用户','vkl4u1yicgsxytzrhxztol20vp3ha6g0','2021-02-03 17:15:57','2021-02-03 18:16:16');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-01-28 18:04:51');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (1,'2020-12-17 17:35:20','2020/12/17日常公告','日常公告','公告信息','2020-12-17 17:34:43'),(2,'2020-12-17 17:35:40','2020/12/17紧急公告','紧急公告','公告信息','2020-12-17 17:35:22'),(3,'2020-12-17 17:36:13','2020/12/17其他公告','其他公告','公告信息','2020-12-17 17:35:43');

/*Table structure for table `yonghuxinxi` */

DROP TABLE IF EXISTS `yonghuxinxi`;

CREATE TABLE `yonghuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  `number` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `family` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '住址',
  `identity` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `yonghuxinxi` */

insert  into `yonghuxinxi`(`id`,`name`,`account`,`password`,`img_photo`,`balance`,`role`,`number`,`family`,`identity`) values (1,'小札','111','111','http://localhost:8080/kd-ssmj/file/download?fileName=1612330131778.jpg','9999999.00','用户','1111111111','住址1','11111111111'),(2,'小站','222','222','http://localhost:8080/kd-ssmj/file/download?fileName=1612330113785.jpg','40000.00','用户','22222222','住址2','2222222222'),(3,'汪汪','333','333','http://localhost:8080/kd-ssmj/file/download?fileName=1612330142088.JPG','10000.00','用户','333333333','住址3','3333333333'),(29,'小夏','444','444','http://localhost:8080/kd-ssmj/file/download?fileName=1612330051317.jpg','443804.00','用户','44444444','住址1','4444444444'),(32,'1233','1233','123','http://localhost:8080/kd-ssmj/file/download?fileName=1612343631389.JPG','0.00','用户','444444443','1233','1233');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
