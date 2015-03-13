SET NAMES 'utf8';
SET SQL_MODE = '';

CREATE TABLE IF NOT EXISTS `aowow_news` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `text_loc0` varchar(255) NOT NULL default '',
  `text_loc2` varchar(255) NOT NULL default '',
  `text_loc3` varchar(255) NOT NULL default '',
  `text_loc8` varchar(255) NOT NULL default '',
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='News';

INSERT IGNORE INTO `aowow_news` (`id`,`text_loc0`, `text_loc2`, `text_loc3`, `text_loc8`,`time`) VALUES
(1,'Welcome to <b><span class=\"q5\">FreedomWoW</span></b>!','Bienvenue à <b><span class=\"q5\">FreedomWoW</span></b>!','Willkommen bei <b><span class=\"q5\">FreedomWoW</span></b>!','Добро пожаловать на <b><span class=\"q5\">FreedomWoW</span></b>!','2012-12-14 05:39:00');
INSERT INTO `aowow_news` (`id`, `text_loc0`, `text_loc2`, `text_loc3`, `text_loc8`, `time`) VALUES
(2, 'You can edit images links in main.tpl', '', '', 'Вы можете изменить ссылки картинок в main.tpl', '2012-12-18 22:33:24');