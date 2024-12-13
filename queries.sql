use football_models;

-- 7a
-- Show player names, their team names, and the league names they belong to.
SELECT 
    players.playerName,
    teams.teamLongName AS teamName,
    leagues.leagueName
FROM 
    players
INNER JOIN 
    teams ON players.teamNumber = teams.teamNumber
INNER JOIN 
    leagues ON teams.leagueNumber = leagues.leagueNumber;
    
-- Show team names, their overall rating, attack rating, and average age.
SELECT 
    teams.teamLongName AS teamName,
    teamattributes.overall,
    teamattributes.attack,
    teamattributes.averageAge
FROM 
    teams
INNER JOIN 
    teamattributes ON teams.teamNumber = teamattributes.teamNumber;
    
-- 7b
-- Show player names, their team names, and league names even if they are not currently assigned to a team or if their team does not belong to any league.
SELECT 
    players.playerName,
    teams.teamLongName AS teamName,
    leagues.leagueName
FROM 
    players
LEFT OUTER JOIN 
    teams ON players.teamNumber = teams.teamNumber
LEFT OUTER JOIN 
    leagues ON teams.leagueNumber = leagues.leagueNumber;

-- Show team names, their overall ratings, attack ratings, and average ages, even if there are no corresponding teams in the teams table.
SELECT 
    teams.teamLongName AS teamName,
    teamattributes.overall,
    teamattributes.attack,
    teamattributes.averageAge
FROM 
    teams
RIGHT OUTER JOIN 
    teamattributes ON teams.teamNumber = teamattributes.teamNumber;

-- 7c
-- Show the names of players who belong to teams playing in a specific league (Using where).
SELECT 
    playerName
FROM 
    players
WHERE 
    teamNumber IN (
        SELECT 
            teams.teamNumber
        FROM 
            teams
        INNER JOIN 
            leagues ON teams.leagueNumber = leagues.leagueNumber
        WHERE 
            leagues.leagueName = 'Premier League'
    );

-- 7d
-- Show the average overall ratings of players for each team (Using from).
SELECT 
    t.teamName,
    AVG(pa.overallRating) AS averagePlayerRating
FROM 
    (SELECT 
         teams.teamNumber AS teamID, 
         teams.teamLongName AS teamName
     FROM 
         teams
    ) AS t
INNER JOIN 
    playerattributes AS pa ON t.teamID = pa.playerNumber
GROUP BY 
    t.teamName;

-- 7e
-- Calculates the average overallRating of players for each team and displays the team name along with the average rating.
SELECT 
    teams.teamLongName AS teamName,
    AVG(playerattributes.overallRating) AS averageRating,
    COUNT(playerattributes.playerNumber) AS totalPlayers
FROM 
    teams
INNER JOIN 
    players ON teams.teamNumber = players.teamNumber
INNER JOIN 
    playerattributes ON players.playerNumber = playerattributes.playerNumber
GROUP BY 
    teams.teamLongName
ORDER BY 
    averageRating DESC;
