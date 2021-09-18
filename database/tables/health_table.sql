USE `health_db`;
DROP procedure IF EXISTS `createHealthTable`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `health_table`;
SET FOREIGN_KEY_CHECKS = 1;

DELIMITER $$

USE `health_db`$$
CREATE PROCEDURE `createHealthTable` ()
BEGIN

CREATE TABLE `health_table` (
  `log_id` INT NOT NULL auto_increment,
  `name` VARCHAR(255) NOT NULL,
  `time` DATETIME,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

END$$

DELIMITER ;