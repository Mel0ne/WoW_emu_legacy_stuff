DROP TABLE IF EXISTS `ultravendor_disables`;
CREATE TABLE `ultravendor_disables` (
  `itemid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `config_misc` (`Key`, `Value`) VALUES ('Ultra_Vendor_Max_Item_Level', '-1');
INSERT INTO `config_misc` (`Key`, `Value`) VALUES ('Ultra_Vendor_Max_Item_Req_Level', '-1');