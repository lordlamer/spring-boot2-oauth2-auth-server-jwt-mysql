/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oauth2_database` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oauth2_database`;

/*Table structure for table `oauth_client_details` */

DROP TABLE IF EXISTS `oauth_client_details`;

CREATE TABLE `oauth_client_details` (
                                        `client_id` varchar(255) NOT NULL,
                                        `client_secret` varchar(255) NOT NULL,
                                        `resource_ids` varchar(255) DEFAULT NULL,
                                        `scope` varchar(255) DEFAULT NULL,
                                        `authorized_grant_types` varchar(255) DEFAULT NULL,
                                        `web_server_redirect_uri` varchar(255) DEFAULT NULL,
                                        `authorities` varchar(255) DEFAULT NULL,
                                        `access_token_validity` int(11) DEFAULT NULL,
                                        `refresh_token_validity` int(11) DEFAULT NULL,
                                        `additional_information` varchar(4096) DEFAULT NULL,
                                        `autoapprove` varchar(255) DEFAULT NULL,
                                        PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_client_details` */

insert  into `oauth_client_details`(`client_id`,`client_secret`,`resource_ids`,`scope`,`authorized_grant_types`,`web_server_redirect_uri`,`authorities`,`access_token_validity`,`refresh_token_validity`,`additional_information`,`autoapprove`) values
('USER_CLIENT_APP','{noop}password','USER_CLIENT_RESOURCE,USER_ADMIN_RESOURCE','role_admin,role_user','authorization_code,password,refresh_token,implicit',NULL,NULL,900,3600,'{}',NULL);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(60) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`name`) values
(1,'can_create_user'),
(4,'can_delete_user'),
(3,'can_read_user'),
(2,'can_update_user');

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
                                   `permission_id` int(11) DEFAULT NULL,
                                   `role_id` int(11) DEFAULT NULL,
                                   KEY `PERMISSION_ID` (`permission_id`),
                                   KEY `ROLE_ID` (`role_id`),
                                   CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
                                   CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values
(1,1),
(2,1),
(3,1),
(4,1),
(3,2);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` varchar(60) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values
(1,'role_admin'),
(2,'role_user');

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
                             `role_id` int(11) DEFAULT NULL,
                             `user_id` int(11) DEFAULT NULL,
                             KEY `ROLE_ID` (`role_id`),
                             KEY `USER_ID` (`user_id`),
                             CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
                             CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_user` */

insert  into `role_user`(`role_id`,`user_id`) values
(1,1),
(2,2);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `username` varchar(24) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `enabled` bit(1) NOT NULL,
                        `account_expired` bit(1) NOT NULL,
                        `credentials_expired` bit(1) NOT NULL,
                        `account_locked` bit(1) NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`enabled`,`account_expired`,`credentials_expired`,`account_locked`) values
(1,'admin','{noop}password','william@gmail.com','','\0','\0','\0'),
(2,'user','{noop}password','john@gmail.com','','\0','\0','\0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
