CREATE TABLE IF NOT EXISTS `aowow_version` (
  `version` varchar(11) NOT NULL,
  `sql_version` varchar(255) NOT NULL,
  `revision` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `aowow_version` (`version`, `sql_version`, `revision`) VALUES
('12.4.0', '1', '107');
