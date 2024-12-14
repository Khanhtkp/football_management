-- Giao dịch 1: Cập nhật, thêm và xóa trong bảng teams và players
START TRANSACTION;
-- Cập nhật thông tin đội bóng (teams)
UPDATE teams
SET teamShortName = 'MUL'
WHERE teamNumber = 11;
-- Thêm một cầu thủ mới (players)
INSERT INTO players (playerNumber, playerName, countryNumber, teamNumber, birthday) 
VALUES (201233, 'Nguyen Cong Phuong', null, null, '1995-01-21');
-- Xóa một cầu thủ (players)
DELETE FROM players
WHERE playerNumber = 5;
-- Hủy bỏ thay đổi
ROLLBACK;


-- Giao dịch 2: Cập nhật, thêm và xóa trong bảng teamattributes và playerattributes
START TRANSACTION;
-- Cập nhật thông tin thuộc tính của đội bóng (teamattributes)
UPDATE teamAttributes
SET overall = overall + 5
WHERE teamNumber = 243;
-- Thêm thuộc tính mới cho một cầu thủ (playerattributes)
INSERT INTO players (playerNumber, playerName, countryNumber, teamNumber, birthday) 
VALUES (201233, 'Nguyen Cong Phuong', null, null, '1995-01-21');
INSERT INTO playerAttributes (playerNumber, overallRating, potential, preferredFoot, crossing, finishing, acceleration, interceptions, visions, gkHandling)
VALUES (201233, 81, 88, 'Right', 79, 80, 87, 37, 77, 7);
-- Xóa thuộc tính của một đội bóng (teamattributes)
DELETE FROM teamattributes
WHERE teamNumber = 1;
-- Hủy bỏ thay đổi
ROLLBACK;


-- Giao dịch 3: Xóa và thêm trong bảng leagues và countries
START TRANSACTION;
-- Xóa một giải đấu (leagues)
DELETE FROM leagues
WHERE leagueNumber = 1005;
-- Thêm một quốc gia mới (countries)
INSERT INTO countries (countryNumber, countryName)
VALUES (1234, 'Viet Nam');
-- Thêm một giải đấu mới (leagues)
INSERT INTO leagues (leagueNumber, leagueName, countryNumber)
VALUES (12, 'V.League 1', 1234);
-- Hủy bỏ thay đổi
ROLLBACK;
 
