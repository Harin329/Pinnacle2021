# STORED PROCEDURES FOR Playlist

USE `spotlight_db`;
DROP procedure IF EXISTS `postPlaylist`;

DELIMITER $$
USE `spotlight_db`$$
CREATE PROCEDURE `postPlaylist` (IN `_playlistid` VARCHAR(255), IN `_playlistname` VARCHAR(255), IN `_danceability` DECIMAL(10, 5), IN `_energy` DECIMAL(10, 5), IN `_key` DECIMAL(10, 5), IN `_loudness` DECIMAL(10, 5), IN `_mode` DECIMAL(10, 5), IN `_speechiness` DECIMAL(10, 5), IN `_acousticness` DECIMAL(10, 5), IN `_instrumentalness` DECIMAL(10, 5), IN `_liveness` DECIMAL(10, 5), IN `_valence` DECIMAL(10, 5), IN `_tempo` DECIMAL(10, 5))
BEGIN

REPLACE INTO `playlist_table` (`playlist_id`, `name`, `time`, `danceability`, `energy`, `key`, `loudness`, `mode`, `speechiness`, `acousticness`, `instrumentalness`, `liveness`, `valence`, `tempo`)
VALUES (`_playlistid`, `_playlistname`, now(), `_danceability`, `_energy`, `_key`, `_loudness`, `_mode`, `_speechiness`, `_acousticness`, `_instrumentalness`, `_liveness`, `_valence`, `_tempo`);

END$$

DELIMITER ;
