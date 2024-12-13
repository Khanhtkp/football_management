DELIMITER $$

CREATE PROCEDURE calculate_team_worth(IN team_id INT, OUT total_worth FLOAT)
BEGIN
    DECLARE worth_sum FLOAT DEFAULT 0;

    SELECT SUM(overallRating + potential + acceleration + finishing + interceptions + visions + gkHandling)
    INTO worth_sum
    FROM playerattributes
    WHERE playerNumber IN (SELECT playerNumber FROM players WHERE teamNumber = team_id);

    SET total_worth = worth_sum;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE calculate_total_player_age(IN team_id INT, OUT age_sum FLOAT)
BEGIN

    SELECT SUM(TIMESTAMPDIFF(YEAR, birthday, CURDATE())) INTO age_sum
    FROM players
    WHERE teamNumber = team_id;
END$$

DELIMITER ;
