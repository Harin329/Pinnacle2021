# STORED PROCEDURES FOR USER
USE `spotlight_db`;

DROP procedure IF EXISTS `postRecommendation`;
DROP procedure IF EXISTS `getMatches`;
DROP procedure IF EXISTS `getPlaylists`;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `postRecommendation` (IN `_userid` VARCHAR(255), IN `_type` VARCHAR(255), IN `_matchid` VARCHAR(255), IN `_match` DECIMAL(20, 15))
BEGIN

REPLACE INTO `recommend_table` (`user_id`, `reco_type`, `match_id`, `match_score`)
VALUES (`_user_id`, `_type`, `_matchid`, `_match`);

END$$

DELIMITER ;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `getMatches` (IN `_userid` VARCHAR(255))
BEGIN

SELECT * FROM `recommend_table`
WHERE `user_id`=`_userid` AND `reco_type`="user"
ORDER BY `match_score` DESC
LIMIT 5;

END$$

DELIMITER ;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `getPlaylists` (IN `_userid` VARCHAR(255))
BEGIN

SELECT * FROM `recommend_table` AS rt
LEFT JOIN `playlist_table` as pt ON rt.match_id=pt.playlist_id
WHERE `user_id`=`_userid` AND `reco_type`="playlist"
ORDER BY `match_score` DESC
LIMIT 20;

END$$

DELIMITER ;
