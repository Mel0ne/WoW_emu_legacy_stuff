CREATE TABLE IF NOT EXISTS `aowow_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Comment ID',
  `type` int(10) unsigned NOT NULL COMMENT 'Type of Page',
  `typeid` int(10) unsigned NOT NULL COMMENT 'ID Of Page',
  `userid` bigint(20) unsigned NOT NULL COMMENT 'User ID',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Comment timestap',
  `commentbody` text COMMENT 'Comment text',
  `replyto` bigint(20) unsigned DEFAULT NULL COMMENT 'Reply To, comment ID',
  `edit_userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Edit User ID',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last Edit Time',
  `edit_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count Of Edits',
  `ip` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='AoWoW Comments Table' AUTO_INCREMENT=250 ;

CREATE TABLE IF NOT EXISTS `aowow_comments_rates` (
  `commentid` bigint(20) unsigned NOT NULL default 0 COMMENT 'Comment ID',
  `userid` bigint(20) unsigned NOT NULL default 0 COMMENT 'User ID',
  `rate` tinyint(4) NOT NULL default 0 COMMENT 'Rating Set'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='AoWoW Comments Rates Table';
