CREATE DATABASE football_models;
USE football_models;

CREATE TABLE countries (
    countryNumber INTEGER PRIMARY KEY,
    overall INTEGER,
    countryName VARCHAR(255) UNIQUE 
);
CREATE TABLE leagues (
    leagueNumber INTEGER PRIMARY KEY,
    numberPlayers INTEGER, 
    countryNumber INTEGER,
    leagueName VARCHAR(255) UNIQUE 
);
CREATE TABLE teams (
    teamNumber INTEGER PRIMARY KEY,
    leagueNumber INTEGER, 
    teamLongName VARCHAR(255) UNIQUE, 
    teamShortName VARCHAR(255) UNIQUE 
);
CREATE TABLE teamAttributes (
    teamNumber INTEGER PRIMARY KEY,
    overall INTEGER,
    attack INTEGER, 
    midfield INTEGER,
    defense INTEGER, 
    averageAge FLOAT,
    clubWorth varchar(50) 
);
CREATE TABLE players (
    playerNumber INTEGER PRIMARY KEY,
    playerName VARCHAR(255) ,
    countryNumber INTEGER ,
    teamNumber INTEGER , 
    birthday DATE 
);
CREATE TABLE playerAttributes (
    playerNumber INTEGER PRIMARY KEY, 
    overallRating INTEGER ,
    potential INTEGER ,
    preferredFoot TEXT,
    crossing INTEGER ,
    finishing INTEGER , 
    acceleration INTEGER ,
    interceptions INTEGER ,
    visions INTEGER , 
    gkHandling INTEGER 
);
