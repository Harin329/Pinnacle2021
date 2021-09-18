# STORED PROCEDURES FOR HEALTH

USE `health_db`;
DROP procedure IF EXISTS `postHealth`;

DELIMITER $$
USE `health_db`$$
CREATE PROCEDURE `postHealth`(IN `input_name` VARCHAR(255))
BEGIN

INSERT INTO `health_table` (`name`, `time`) VALUES (`input_name`, now());

END$$

DELIMITER ;

DELIMITER $$
USE `health_db`$$
CREATE PROCEDURE `getHealth`()
BEGIN

SELECT * FROM `health_table` ORDER BY `log_id` DESC LIMIT 1;

END$$

DELIMITER ;
