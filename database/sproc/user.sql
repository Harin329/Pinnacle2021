# STORED PROCEDURES FOR USER
USE `spotlight_db`;

DROP procedure IF EXISTS `postUser`;

DELIMITER $ $ USE `spotlight_db` $ $ CREATE PROCEDURE `postUser`(
    IN `userID` VARCHAR(255),
    IN `userName` VARCHAR(255),
    IN `_danceability` DOUBLE PRECISION(10, 5),
    IN `_energy` DOUBLE PRECISION(10, 5),
    IN `_key` DOUBLE PRECISION(10, 5),
    IN `_loudness` DOUBLE PRECISION(10, 5),
    IN `_mode` DOUBLE PRECISION(10, 5),
    IN `_speechiness` DOUBLE PRECISION(10, 5),
    IN `_acousticness` DOUBLE PRECISION(10, 5),
    IN `_instrumentalness` DOUBLE PRECISION(10, 5),
    IN `_liveness` DOUBLE PRECISION(10, 5),
    IN `_valence` DOUBLE PRECISION(10, 5),
    IN `_tempo` DOUBLE PRECISION(10, 5),
) BEGIN
INSERT INTO
    `user_table` (
        `user_id`,
        `name`,
        `last_login`,
        `danceability`,
        `energy`,
        `key`,
        `loudness`,
        `mode`,
        `speechiness`,
        `acousticness`,
        `instrumentalness`,
        `liveness`,
        `valence`,
        `tempo`
    )
VALUES
    (
        `userID`,
        `userName`,
        now(),
        `_danceability`,
        `_energy`,
        `_key`,
        `_loudness`,
        `_mode`,
        `_speechess`,
        `_acousticness`,
        `_instrumentalness`,
        `_liveness`,
        `_valence`,
        `_tempo`,
    );

END $ $ DELIMITER;