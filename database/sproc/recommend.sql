# STORED PROCEDURES FOR USER
USE `spotlight_db`;

DROP procedure IF EXISTS `postRecommendation`;
DROP procedure IF EXISTS `getMatches`;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `postRecommendation` (IN `_userid` VARCHAR(255), IN `_matchid` VARCHAR(255), IN `_match` DECIMAL(20, 15))
BEGIN

REPLACE INTO `recommend_table` (`user_id`, `match_id`, `match_score`)
VALUES (`_user_id`, `_matchid`, `_match`);

END$$

DELIMITER ;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `getMatches` (IN `_userid` VARCHAR(255))
BEGIN

SELECT * FROM `recommend_table`
WHERE `user_id`=`_userid`
ORDER BY `match_score` DESC
LIMIT 5;

END$$

DELIMITER ;
