CREATE TABLE IF NOT EXISTS `account_reputation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `reputation` varchar(5) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `date` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;