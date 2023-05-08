/*
SQLyog Ultimate v9.30 
MySQL - 5.1.48-community : Database - world
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `aowow_screenshots` */

DROP TABLE IF EXISTS `aowow_screenshots`;

CREATE TABLE `aowow_screenshots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Screenshot ID',
  `type` int(10) unsigned NOT NULL COMMENT 'Type of Page',
  `typeid` int(10) unsigned NOT NULL COMMENT 'ID Of Page',
  `username` mediumtext NOT NULL COMMENT 'Username',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Screenshot timestamp',
  `body` text COMMENT 'Comment text',
  `moderated` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Not implemented',
  `width` mediumint(4) NOT NULL,
  `height` mediumint(4) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='AoWoW Scrrenshots Table';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;