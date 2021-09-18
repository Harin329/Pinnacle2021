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
  `time` DATETIME,
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
  PRIMARY KEY (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

END$$

DELIMITER ;