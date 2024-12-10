BEGIN
    FOR t IN (SELECT table_name FROM user_tables ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
    END LOOP;


EXECUTE IMMEDIATE '
    CREATE TABLE COUNTRY (
        Country CHAR(3) PRIMARY KEY,
        Region VARCHAR2(4) 
        ) 
    ';


EXECUTE IMMEDIATE '
    CREATE TABLE PLAYERACCOUNT (
        PlayerID INTEGER PRIMARY KEY,
        email VARCHAR2(100) UNIQUE,
        userName VARCHAR2(100) UNIQUE,
        nickName VARCHAR2(100),
        Country CHAR(3),
        FOREIGN KEY (Country) REFERENCES Country(Country)
    )
    ';


EXECUTE IMMEDIATE '
CREATE TABLE Kart (
  kartID INT PRIMARY KEY,
  kartName VARCHAR2(100) UNIQUE,
  handling NUMBER(10, 2),
  speed NUMBER(10, 2), 
  weights NUMBER(10, 2),
  acceleration NUMBER(10, 2)
 )

';  

EXECUTE IMMEDIATE '
 CREATE TABLE PowerUp (
  powerUpName VARCHAR2(100)PRIMARY KEY,
  effect VARCHAR2(100),
  type VARCHAR2(100)
 )

';

EXECUTE IMMEDIATE '
 CREATE TABLE WeightClassInformation(
    weightClass VARCHAR2(100) PRIMARY KEY,
    baseSpeed INTEGER
   )
';

EXECUTE IMMEDIATE '
  CREATE TABLE CharacterInformation (
    characterName VARCHAR2(100) PRIMARY KEY,
    weightClass VARCHAR2(100), 
    FOREIGN KEY (weightClass) REFERENCES WeightClassInformation (weightClass) 
 )
';

EXECUTE IMMEDIATE '
 CREATE TABLE EngineClass (
  classID VARCHAR2(100) PRIMARY KEY,
  description VARCHAR2(100)
)
';

EXECUTE IMMEDIATE '
 CREATE TABLE CompetitionFormat (
  competitionFormat VARCHAR2(100)PRIMARY KEY,
  advancementCriteria VARCHAR2(100)
 )
';

EXECUTE IMMEDIATE '
   CREATE TABLE CompetitionInformation (
  competitionID INTEGER PRIMARY KEY,
  winnerID INTEGER,
  competitionFormat VARCHAR2(100),
  FOREIGN KEY (competitionFormat) REFERENCES CompetitionFormat(competitionFormat)
   ON DELETE CASCADE,
  FOREIGN KEY (winnerID) REFERENCES PlayerAccount(PlayerID)
  ON DELETE CASCADE
 )
';

EXECUTE IMMEDIATE '
  CREATE TABLE TimedCompetition (
    competitionId INTEGER PRIMARY KEY,
    timeLimit INTEGER,
    bestLapTime INTEGER,
    FOREIGN KEY (competitionId) REFERENCES CompetitionInformation(competitionID)
 	ON DELETE CASCADE
)
';

EXECUTE IMMEDIATE '
 CREATE TABLE GrandPrixCompetition (
    competitionId INTEGER PRIMARY KEY,
    cupName VARCHAR2(100),
    FOREIGN KEY (competitionId) REFERENCES CompetitionInformation(competitionID)
  	ON DELETE CASCADE
)
';

EXECUTE IMMEDIATE '
CREATE TABLE RaceCompetition(
  raceName VARCHAR2(100),
  competitionID INTEGER,
  numberOfPlayers INTEGER,
  PRIMARY KEY (raceName, competitionID), 
  FOREIGN KEY (competitionID) REFERENCES CompetitionInformation (competitionID) ON DELETE CASCADE
)
';

EXECUTE IMMEDIATE '
CREATE TABLE Track(
  trackName VARCHAR2(100),
  terrainType VARCHAR2(100),
  trackShortcuts INTEGER,
  laps INTEGER,
  PRIMARY KEY (trackName)
)
';


EXECUTE IMMEDIATE '
CREATE TABLE RaceTrack(
  raceName VARCHAR2(100),
  trackName VARCHAR2(100),
  PRIMARY KEY (raceName, trackName),
  FOREIGN KEY (trackName) REFERENCES Track (trackName) ON DELETE CASCADE
)
';

EXECUTE IMMEDIATE '
CREATE TABLE Hazard(
  hazardName VARCHAR2(100),
  hazardType VARCHAR2(100),
  effect VARCHAR2(100),
  PRIMARY KEY (hazardName)
)
';

EXECUTE IMMEDIATE '
CREATE TABLE TrackHazard(
  trackName VARCHAR2(100),
  hazardName VARCHAR2(100),
  freq INTEGER,
  PRIMARY KEY (trackName, hazardName),
  FOREIGN KEY (trackName) REFERENCES Track (trackName) ON DELETE CASCADE,
  FOREIGN KEY (hazardName) REFERENCES Hazard (hazardName) ON DELETE CASCADE
)
';

EXECUTE IMMEDIATE '
 CREATE TABLE PlayerRace (
   playerID INTEGER,
   raceName VARCHAR2(100),
   competitionID INTEGER,
   rank INTEGER,
   characterName VARCHAR2(100),
   kartID INTEGER,
   PRIMARY KEY (playerID, raceName, competitionID),
   FOREIGN KEY (playerID) REFERENCES PLAYERACCOUNT(playerID) ON DELETE CASCADE,
   FOREIGN KEY (competitionID) REFERENCES CompetitionInformation(competitionID) ON DELETE CASCADE,
    FOREIGN KEY (characterName) REFERENCES CharacterInformation(characterName) ON DELETE CASCADE,
    FOREIGN KEY (kartID) REFERENCES KART (kartID) ON DELETE CASCADE,
    UNIQUE (raceName, competitionID, characterName)
)'
;


END; 