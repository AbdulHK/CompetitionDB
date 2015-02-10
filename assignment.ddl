
CREATE TABLE Club
(
	clubID               varchar2(20) NOT NULL ,
	address              varchar2(20) NULL ,
	address2             varchar2(20) NULL 
);

ALTER TABLE Club
	ADD CONSTRAINT  XPKClub PRIMARY KEY (clubID);

CREATE TABLE Competition
(
	sponsor              varchar2(20) NULL ,
	prize                NUMBER() NULL ,
	orgname              varchar2(20) NULL ,
	orgnum               NUMBER() NULL ,
	agegroup             varchar2() NULL ,
	compID               varchar2(20) NOT NULL 
);

ALTER TABLE Competition
	ADD CONSTRAINT  XPKCompetition PRIMARY KEY (compID);

CREATE TABLE Manager
(
	managername          VARCHAR2(20) NULL ,
	managerid            varchar2(20) NOT NULL ,
	address              varchar2(20) NULL ,
	phone                NUMBER NULL 
);

ALTER TABLE Manager
	ADD CONSTRAINT  XPKManager PRIMARY KEY (managerid);

CREATE TABLE Match
(
	matchID              varchar2(20) NOT NULL ,
	hometeamname         varchar2(20) NULL ,
	awayteamname         varchar2(20) NULL ,
	refereeID            varchar2(20) NULL ,
	venue                varchar2(20) NULL 
);

ALTER TABLE Match
	ADD CONSTRAINT  XPKMatch PRIMARY KEY (matchID);

CREATE TABLE Player
(
	playername           varchar2(20) NULL ,
	playerage            NUMBER() NULL ,
	DOB                  DATE NULL ,
	address              varchar2(20) NULL ,
	playerID             varchar2(20) NOT NULL ,
	teamname             varchar2(20) NULL 
);

ALTER TABLE Player
	ADD CONSTRAINT  XPKPlayer PRIMARY KEY (playerID);

CREATE TABLE Referees
(
	refereesqual         varchar2(20) NULL ,
	refereename          varchar2(20) NULL ,
	address              varchar2(20) NULL ,
	refereepone          NUMBER NULL ,
	refereeID            varchar2(20) NOT NULL 
);

ALTER TABLE Referees
	ADD CONSTRAINT  XPKReferees PRIMARY KEY (refereeID);

CREATE TABLE Team
(
	teamname             varchar2(20) NOT NULL ,
	agegroup             VARCHAR2(6) NULL ,
	managerid            varchar2(20) NULL ,
	playerID             varchar2(20) NULL ,
	compID               varchar2(20) NULL ,
	clubID               varchar2(20) NULL 
);

ALTER TABLE Team
	ADD CONSTRAINT  XPKTeam PRIMARY KEY (teamname);

ALTER TABLE Match
	ADD (CONSTRAINT team_match_fk FOREIGN KEY (hometeamname) REFERENCES Team (teamname) ON DELETE SET NULL);

ALTER TABLE Match
	ADD (CONSTRAINT team1_mach_fk FOREIGN KEY (awayteamname) REFERENCES Team (teamname) ON DELETE SET NULL);

ALTER TABLE Match
	ADD (CONSTRAINT ref_match_fk FOREIGN KEY (refereeID) REFERENCES Referees (refereeID) ON DELETE SET NULL);

ALTER TABLE Player
	ADD (CONSTRAINT team_player_fk FOREIGN KEY (teamname) REFERENCES Team (teamname) ON DELETE SET NULL);

ALTER TABLE Team
	ADD (CONSTRAINT manager_team_fk FOREIGN KEY (managerid) REFERENCES Manager (managerid) ON DELETE SET NULL);

ALTER TABLE Team
	ADD (CONSTRAINT player_team_fk FOREIGN KEY (playerID) REFERENCES Player (playerID) ON DELETE SET NULL);

ALTER TABLE Team
	ADD (CONSTRAINT comp_team_fk FOREIGN KEY (compID) REFERENCES Competition (compID) ON DELETE SET NULL);

ALTER TABLE Team
	ADD (CONSTRAINT club_team_fk FOREIGN KEY (clubID) REFERENCES Club (clubID) ON DELETE SET NULL);
