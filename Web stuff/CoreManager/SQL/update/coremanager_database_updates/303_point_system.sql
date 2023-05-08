ALTER TABLE `point_system_prize_bags` ADD COLUMN `is_template` int(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `owner`;
ALTER TABLE `point_system_coupons` MODIFY COLUMN `credits` int(11);
ALTER TABLE `point_system_coupons` MODIFY COLUMN `money` int(11);
