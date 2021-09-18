USE `spotlight_db`;
DROP procedure IF EXISTS `createUserTable`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `user_table`;
SET FOREIGN_KEY_CHECKS = 1;

DELIMITER $$

USE `spotlight_db`$$
CREATE PROCEDURE `createUserTable` ()
BEGIN

CREATE TABLE `user_table` (
  `user_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `last_login` DATETIME,
  `danceability` DOUBLE PRECISION(10, 5),
  `energy`: DOUBLE PRECISION(10, 5),
  `key`: DOUBLE PRECISION(10, 5),
  `loudness`: DOUBLE PRECISION(10, 5),
  `mode`: DOUBLE PRECISION(10, 5),
  `speechiness`: DOUBLE PRECISION(10, 5),
  `acousticness`: DOUBLE PRECISION(10, 5),
  `instrumentalness`: DOUBLE PRECISION(10, 5),
  `liveness`: DOUBLE PRECISION(10, 5),
  `valence`: DOUBLE PRECISION(10, 5),
  `tempo`: DOUBLE PRECISION(10, 5),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

END$$

DELIMITER ;