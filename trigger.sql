DELIMITER $$

CREATE TRIGGER after_player_insert
AFTER INSERT ON players
FOR EACH ROW
BEGIN
    INSERT INTO playerattributes (playerNumber, overallRating, potential, preferredFoot, crossing, finishing, acceleration, interceptions, visions, gkHandling)
    VALUES (NEW.playerNumber, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_playerattributes_update
AFTER UPDATE ON playerattributes
FOR EACH ROW
BEGIN
    DECLARE team_id INT;
    DECLARE avg_rating FLOAT;

    SELECT teamNumber INTO team_id
    FROM players
    WHERE playerNumber = NEW.playerNumber;

    SELECT AVG(overallRating) INTO avg_rating
    FROM playerattributes
    WHERE playerNumber IN (SELECT playerNumber FROM players WHERE teamNumber = team_id);

    UPDATE teamattributes
    SET averageAge = avg_rating
    WHERE teamNumber = team_id;
END$$
DELIMITER ;
