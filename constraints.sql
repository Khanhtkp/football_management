ALTER TABLE leagues
ADD CONSTRAINT country_fk FOREIGN KEY (countryNumber) REFERENCES countries(countryNumber) ON DELETE CASCADE;
ALTER TABLE teams
ADD CONSTRAINT league_fk FOREIGN KEY (leagueNumber) REFERENCES leagues(leagueNumber) ON DELETE CASCADE;
ALTER TABLE teamAttributes
ADD CONSTRAINT team_fk FOREIGN KEY (teamNumber) REFERENCES teams(teamNumber) ON DELETE CASCADE;
ALTER TABLE players
ADD CONSTRAINT fk_country FOREIGN KEY (countryNumber) REFERENCES countries(countryNumber) ON DELETE CASCADE,
ADD CONSTRAINT fk_team FOREIGN KEY (teamNumber) REFERENCES teams(teamNumber) ON DELETE CASCADE;
ALTER TABLE playerAttributes
ADD CONSTRAINT player_fk FOREIGN KEY (playerNumber) REFERENCES players(playerNumber) ON DELETE CASCADE;
