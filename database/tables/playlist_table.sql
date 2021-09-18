USE `spotlight_db`;
DROP procedure IF EXISTS `createPlaylistTable`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `playlist_table`;
SET FOREIGN_KEY_CHECKS = 1;

DELIMITER $$

USE `spotlight_db`$$
CREATE PROCEDURE `createPlaylistTable` ()
BEGIN

CREATE TABLE `playlist_table` (
  `playlist_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `creator` VARCHAR(255) NOT NULL,
  `time` DATETIME,
  `followers` INT(8),
  `danceability` DECIMAL(10, 5),
  `energy` DECIMAL(10, 5),
  `key` DECIMAL(10, 5),
  `loudness` DECIMAL(10, 5),
  `mode` DECIMAL(10, 5),
  `speechiness` DECIMAL(10, 5),
  `acousticness` DECIMAL(10, 5),
  `instrumentalness` DECIMAL(10, 5),
  `liveness` DECIMAL(10, 5),
  `valence` DECIMAL(10, 5),
  `tempo` DECIMAL(10, 5),
  PRIMARY KEY (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

END$$

DELIMITER ;