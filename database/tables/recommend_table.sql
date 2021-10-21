USE `spotlight_db`;
DROP procedure IF EXISTS `createRecommendTable`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `recommend_table`;
SET FOREIGN_KEY_CHECKS = 1;

DELIMITER $$

USE `spotlight_db`$$
CREATE PROCEDURE `createRecommendTable` ()
BEGIN

CREATE TABLE `recommend_table` (
  `user_id` VARCHAR(255) NOT NULL,
  `reco_type` VARCHAR(255) NOT NULL,
  `match_id` VARCHAR(255) NOT NULL,
  `match_score` DECIMAL(20, 15),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

END$$

DELIMITER ;