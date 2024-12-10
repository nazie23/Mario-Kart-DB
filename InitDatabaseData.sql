BEGIN

INSERT INTO COUNTRY(Country, Region) VALUES ('CAD', 'NA');
INSERT INTO COUNTRY(Country, Region) VALUES ('CHN', 'AS');
INSERT INTO COUNTRY(Country, Region) VALUES ('LON', 'EU');
INSERT INTO COUNTRY(Country, Region) VALUES ('EGY', 'AF');
INSERT INTO COUNTRY (Country, Region) VALUES ('NZL', 'OC');

-- Players from Canada (CAD)
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (1, 'rachel@gmail.com', 'rach01', 'Rachel', 'CAD');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (2, 'david@gmail.com', 'david02', 'David', 'CAD');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (3, 'emily@gmail.com', 'emily03', 'Emily', 'CAD');

-- Players from China (CHN)
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (4, 'nazia@gmail.com', 'nazia02', 'Nazia', 'CHN');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (5, 'lei@gmail.com', 'lei05', 'Lei', 'CHN');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (6, 'jun@163.com', 'jun06', 'Jun', 'CHN');

-- Players from London (LON)
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (7, 'prajna@gmail.com', 'prajna03', 'Prajna', 'LON');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (8, 'james@gmail.com', 'james08', 'James', 'LON');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (9, 'laura@gmail.com', 'laura09', 'Laura', 'LON');

-- Players from Egypt (EGY)
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (10, 'victoria@gmail.com', 'vic04', 'Victoria', 'EGY');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (11, 'ahmed@gmail.com', 'ahmed09', 'Ahmed', 'EGY');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (12, 'karim@gmail.com', 'karim12', 'Karim', 'EGY');

-- Players from New Zealand (NZL)
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (13, 'olivia@gmail.com', 'olivia13', 'Olivia', 'NZL');
INSERT INTO PLAYERACCOUNT(PlayerID, email, userName, nickName, Country) 
VALUES (14, 'jack@gmail.com', 'jack14', 'Jack', 'NZL');

INSERT INTO WeightClassInformation(weightClass, baseSpeed) VALUES ('Very Heavy', 20);
INSERT INTO WeightClassInformation(weightClass, baseSpeed) VALUES ('Heavy', 15);
INSERT INTO WeightClassInformation(weightClass, baseSpeed) VALUES ('Medium Heavy', 10);
INSERT INTO WeightClassInformation(weightClass, baseSpeed) VALUES ('Light', 5);
INSERT INTO WeightClassInformation(weightClass, baseSpeed) VALUES ('Very Light', 3);

INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Mario', 'Medium Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Luigi', 'Medium Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Peach', 'Medium Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Daisy', 'Medium Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Rosalina', 'Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Baby Mario', 'Very Light');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Baby Luigi', 'Very Light');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Baby Peach', 'Very Light');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Baby Daisy', 'Very Light');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Baby Rosalina', 'Very Light');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Wario', 'Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Waluigi', 'Medium Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Bowser', 'Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Donkey Kong', 'Very Heavy');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Toad', 'Light');
INSERT INTO CharacterInformation(characterName, weightClass) VALUES ('Toadette', 'Light');

INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (1, 'Standard Kart', 0, 0, 0, 0);
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (2, 'Pipe Frame', 0.5, 0, -0.25, 0.25);
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (3, 'Mach 8', 0, 0.5, 0.25, -0.25);
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (4, 'Steel Driver', -0.5, 0, 0.5, -0.5); 
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (5, 'Cat Cruiser', 0, 0, 0, 0);
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (6, 'Biddybuggy', -0.75, 0.75, -0.5, 0.5);
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (7, 'Blue Falcon', 0.25, -0.25, -0.25, 0.75);
INSERT INTO KART(kartId, kartName, handling, speed, weights, acceleration) VALUES (8, 'Tanooki Kart', -0.25, +0.75, 1, -0.25);

INSERT INTO CompetitionFormat(competitionFormat, advancementCriteria) VALUES('elimination bracket', 'winner advances');
INSERT INTO CompetitionFormat(competitionFormat, advancementCriteria) VALUES('group stage advancement', 'top 2 advances');
INSERT INTO CompetitionFormat(competitionFormat, advancementCriteria) VALUES('standard grandprix', 'highest point scorer advances');
INSERT INTO CompetitionFormat(competitionFormat, advancementCriteria) VALUES('Round Robin','players with the best win-loss ratio advances to finals');
INSERT INTO CompetitionFormat(competitionFormat, advancementCriteria) VALUES('Teams', 'teams w/ the best score advance');
 
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(1, 1, 'elimination bracket');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(2, 1, 'group stage advancement');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(3, 2, 'standard grandprix');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(4, 3, 'Round Robin'); 
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(5, 3, 'Teams');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(6, 4, 'elimination bracket');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(7, 4, 'group stage advancement');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(8, 5, 'standard grandprix');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(9, 5, 'Round Robin'); 
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(10, 5, 'Teams');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(11, 1, 'elimination bracket');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(12, 1, 'group stage advancement');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(13, 2, 'standard grandprix');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(14, 3, 'Round Robin');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(15, 3, 'Teams');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(16, 4, 'elimination bracket');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(17, 4, 'group stage advancement');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(18, 5, 'standard grandprix');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(19, 5, 'Round Robin');
INSERT INTO CompetitionInformation(competitionID, winnerID, competitionFormat) VALUES(20, 5, 'Teams');

INSERT INTO TimedCompetition (competitionId, timeLimit, bestLapTime) VALUES (1, 300, 120); 
INSERT INTO TimedCompetition (competitionId, timeLimit, bestLapTime) VALUES (2, 300, 120);  
INSERT INTO TimedCompetition (competitionId, timeLimit, bestLapTime) VALUES (3, 300, 120);  
INSERT INTO TimedCompetition (competitionId, timeLimit, bestLapTime) VALUES (4, 300, 120);  
INSERT INTO TimedCompetition (competitionId, timeLimit, bestLapTime) VALUES (5, 300, 120); 

INSERT INTO GrandPrixCompetition (competitionId, cupName) VALUES (6, 'Mushroom Cup');
INSERT INTO GrandPrixCompetition (competitionId, cupName) VALUES (7, 'Flower Cup');
INSERT INTO GrandPrixCompetition (competitionId, cupName) VALUES (8, 'Star Cup');
INSERT INTO GrandPrixCompetition (competitionId, cupName) VALUES (9, 'Special Cup');
INSERT INTO GrandPrixCompetition (competitionId, cupName) VALUES (10, 'Lightning Cup');


INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 1', 1, 1, 'Peach', 1);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 2', 2, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 3, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 4, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 5, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 6, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 7, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 8, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 9, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (1, 'RACE 3', 10, 3, 'Peach', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 1', 11, 1, 'Peach', 1);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 12, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 13, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 14, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 15, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 16, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 17, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 18, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 19, 2, 'Peach', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (1, 'RACE 2', 20, 2, 'Peach', 2);

INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 1', 1, 2, 'Donkey Kong', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 2', 2, 3, 'Donkey Kong', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 3', 3, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 1', 4, 2, 'Donkey Kong', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 2', 5, 3, 'Donkey Kong', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 3', 6, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 1', 7, 2, 'Donkey Kong', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 2', 8, 3, 'Donkey Kong', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 3', 9, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (2, 'RACE 3', 10, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 1', 11, 1, 'Donkey Kong', 1);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 2', 12, 2, 'Donkey Kong', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 13, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 14, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 15, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 16, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 17, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 18, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 19, 1, 'Donkey Kong', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (2, 'RACE 3', 20, 1, 'Donkey Kong', 6);

INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (3, 'RACE 1', 1, 3, 'Baby Mario', 7);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (3, 'RACE 2', 2, 1, 'Baby Mario', 8);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (3, 'RACE 3', 14, 1, 'Baby Mario', 1);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (3, 'RACE 4', 15, 1, 'Baby Mario', 1);

INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 1, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 2, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 3', 3, 1, 'Daisy', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 4, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 5, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 3', 6, 1, 'Daisy', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 7, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 8, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 3', 9, 1, 'Daisy', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 3', 10, 1, 'Daisy', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 11, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 12, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 13, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 14, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 15, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 16, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 17, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 18, 3, 'Daisy', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 1', 19, 2, 'Daisy', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (4, 'RACE 2', 20, 3, 'Daisy', 5);

INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (5, 'RACE 1', 7, 2, 'Mario', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (5, 'RACE 2', 8, 3, 'Mario', 6);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (5, 'RACE 3', 9, 1, 'Mario', 7);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (5, 'RACE 1', 17, 2, 'Mario', 5);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (5, 'RACE 2', 18, 3, 'Mario', 6);

INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 1', 1, 1, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 2', 2, 2, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 3', 3, 3, 'Toad', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 1', 4, 4, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 2', 5, 5, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 3', 6, 6, 'Toad', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 1', 7, 7, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 2', 8, 8, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 3', 9, 9, 'Toad', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID) 
VALUES (7, 'RACE 3', 10, 10, 'Toad', 4);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 1', 11, 1, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 2', 12, 2, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 1', 13, 1, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 2', 14, 2, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 1', 15, 1, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 1', 16, 1, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 2', 17, 2, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 1', 18, 1, 'Toad', 2);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 2', 19, 2, 'Toad', 3);
INSERT INTO PlayerRace (playerID, raceName, competitionID, rank, characterName, kartID)
VALUES (7, 'RACE 3', 20, 3, 'Toad', 4);


INSERT INTO EngineClass(classID, description) VALUES ('50cc', 'Easy');
INSERT INTO EngineClass(classID, description) VALUES ('100cc', 'Medium'); 
INSERT INTO EngineClass(classID, description) VALUES ('150cc', 'Hard'); 
INSERT INTO EngineClass(classID, description) VALUES ('200cc', 'Expert'); 
INSERT INTO EngineClass(classID, description) VALUES ('Mirror Mode', 'tracks horizontally flipped');

INSERT INTO PowerUp(powerUpName, effect,type) VALUES('Banana Peel', 'make players slip', 'OFFENCE/DEFENSE');
INSERT INTO PowerUp(powerUpName, effect,type) VALUES('Lightning', 'all players except user lose items + spin', 'OFFENCE');
INSERT INTO PowerUp(powerUpName, effect,type) VALUES('Green Shell', 'throw at opponent', 'OFFENCE'); 
INSERT INTO PowerUp(powerUpName, effect,type) VALUES('Red Mushroom', 'accelerate user', 'SPEED');
INSERT INTO PowerUp(powerUpName, effect,type) VALUES('Starman', 'turn user invincible + increase speed by 33%', 'SPEED/DEFENSE');

INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Mario Circuit', 'Circuit', 2, 3);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Toad Harbour', 'City', 4, 3);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Twisted Mansion', 'Grass', 2, 3);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Shy Guy Falls', 'Grass', 3, 2);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Dry Dry Desert', 'Sand', 3, 4);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Donut Plains', 'Grass', 1, 3);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Royal Raceway', 'Circuit', 3, 4);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Donkey Kong Jungle', 'Jungle', 2, 3);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Rainbow Road', 'Circuit', 3, 3);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Coconut Mall', 'Misc.', 1, 2);
INSERT INTO Track(trackName, terrainType, trackShortcuts, laps) VALUES('Vancouver Velocity', 'City', 0, 4);

INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 1', 'Mario Circuit');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 1', 'Toad Harbour');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 1', 'Twisted Mansion');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 1', 'Shy Guy Falls');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 2', 'Dry Dry Desert');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 2', 'Donut Plains');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 2', 'Royal Raceway');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 2', 'Donkey Kong Jungle');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 3', 'Mario Circuit');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 3', 'Rainbow Road');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 3', 'Coconut Mall');
INSERT INTO RaceTrack(raceName, trackName) VALUES('RACE 3', 'Vancouver Velocity');

INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Pit', 'Environmental', 'an opening in the track that drops racers outside the map');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Mud', 'Environmental', 'slows down karts');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Quicksand', 'Environmental', 'slows down karts dramatically and slowly sinks them');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Bob-ombs', 'Enemy', 'walk across the track in a line, explode on contact');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Thwomp', 'Enemy', 'large stone block that slams down, crushing/stunning players');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Chain Chomp', 'Enemy', 'moving enemy that can knock a player off-course');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Goomba', 'Enemy', 'wandering enemy that slows player down on-contact');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Shy Guy Work Crews', 'Enemy', 'cause collisions if driven into');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Debris', 'Dynamic', 'falling pieces that can slow down/knock a player');
INSERT INTO Hazard(hazardName, hazardType, effect) VALUES('Thunderstorm', 'Dynamic', 'can slow the player down if hit by lightning');

INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Mario Circuit', 'Mud', 3);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Mario Circuit', 'Goomba', 10);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Toad Harbour', 'Pit', 2);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Toad Harbour', 'Mud', 5);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Toad Harbour', 'Goomba', 13);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Twisted Mansion', 'Pit', 5);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Twisted Mansion', 'Chain Chomp', 4);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Shy Guy Falls', 'Pit', 4);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Shy Guy Falls', 'Debris', 6);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Shy Guy Falls', 'Shy Guy Work Crews', 20);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Dry Dry Desert', 'Quicksand', 10);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Dry Dry Desert', 'Thwomp', 8);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Donut Plains', 'Bob-ombs', 9);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Donut Plains', 'Pit', 2);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Donut Plains', 'Thunderstorm', 2);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Royal Raceway', 'Mud', 5);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Royal Raceway', 'Bob-ombs', 10);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Donkey Kong Jungle', 'Pit', 10);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Donkey Kong Jungle', 'Chain Chomp', 7);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Donkey Kong Jungle', 'Debris', 8);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Rainbow Road', 'Pit', 3);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Rainbow Road', 'Thwomp', 10);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Coconut Mall', 'Thwomp', 6);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Coconut Mall', 'Shy Guy Work Crews', 9);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Vancouver Velocity', 'Thunderstorm', 4);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Vancouver Velocity', 'Mud', 10);
INSERT INTO TrackHazard(trackName, hazardName, freq) VALUES('Vancouver Velocity', 'Bob-ombs', 9);


END;