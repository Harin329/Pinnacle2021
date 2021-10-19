# STORED PROCEDURES FOR USER
USE `spotlight_db`;

DROP procedure IF EXISTS `postUser`;
DROP procedure IF EXISTS `setAnthem`;
DROP procedure IF EXISTS `getAllUser`;
DROP procedure IF EXISTS `getAllUserId`;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `postUser` (IN `_userid` VARCHAR(255), IN `_username` VARCHAR(255), IN `_danceability` DECIMAL(10, 5), IN `_energy` DECIMAL(10, 5), IN `_key` DECIMAL(10, 5), IN `_loudness` DECIMAL(10, 5), IN `_mode` DECIMAL(10, 5), IN `_speechiness` DECIMAL(10, 5), IN `_acousticness` DECIMAL(10, 5), IN `_instrumentalness` DECIMAL(10, 5), IN `_liveness` DECIMAL(10, 5), IN `_valence` DECIMAL(10, 5), IN `_tempo` DECIMAL(10, 5))
BEGIN

REPLACE INTO `user_table` (`user_id`, `name`, `last_login`, `danceability`, `energy`, `key`, `loudness`, `mode`, `speechiness`, `acousticness`, `instrumentalness`, `liveness`, `valence`, `tempo`)
VALUES (`_userid`, `_username`, now(), `_danceability`, `_energy`, `_key`, `_loudness`, `_mode`, `_speechiness`, `_acousticness`, `_instrumentalness`, `_liveness`, `_valence`, `_tempo`);

END$$

DELIMITER ;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `setAnthem` (IN `_userid` VARCHAR(255), `_anthem` VARCHAR(255))
BEGIN

UPDATE `user_table`
SET `anthem` = '_anthem'
WHERE `user_id` = `_userid`;

END$$

DELIMITER ;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `getAllUser` ()
BEGIN

SELECT * FROM `user_table`;

END$$

DELIMITER ;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `getAllUserId` ()
BEGIN

SELECT `user_id` FROM `user_table`;

END$$

DELIMITER ;
