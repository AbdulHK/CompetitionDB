--always drop your tables at begining- if cascade constraints purge included in the drop statment
--it means that even the relationships will be droped so the tables
--does not have to be in reverse order
drop table team cascade constraints purge;
drop table referees cascade constraints purge;
drop table player cascade constraints purge;
drop table match cascade constraints purge;
drop table manager cascade constraints purge;
drop table competition cascade constraints purge;
drop table club cascade constraints purge;


--create table is used to create the tables(entities) and the columns(attributes) with it
CREATE TABLE Club
(
	clubID               VARCHAR2(30) NOT NULL ,
	address              VARCHAR2(30) NULL ,
	address2             VARCHAR2(30) NULL ,
	CONSTRAINT  club_id_pk PRIMARY KEY (clubID)
-- make ClubID primary key and name this constraint club_id_pk
);


CREATE TABLE Competition
(
	sponsor              VARCHAR2(30) NULL ,
	prize                NUMBER(30) NULL ,
	orgname              VARCHAR2(30) NULL ,
	orgnum               NUMBER(30) NULL ,
	agegroup             VARCHAR2(30) NULL ,
	compID               VARCHAR2(30) NOT NULL ,
	CONSTRAINT  comp_id_pk PRIMARY KEY (compID)

);


CREATE TABLE Manager
(
	managername          VARCHAR2(30) NULL ,
	managerid            VARCHAR2(30) NOT NULL ,
	address              VARCHAR2(30) NULL ,
	phone                NUMBER(30) NULL ,
	 CONSTRAINT  mngr_id_pk PRIMARY KEY (managerid)
);

CREATE TABLE Team
(
	teamname             VARCHAR2(30) NOT NULL ,
	agegroup             VARCHAR2(6) NULL ,
	managerid            VARCHAR2(30) NULL ,
	compID               VARCHAR2(30) NULL ,
	clubID               VARCHAR2(30) NULL ,
	CONSTRAINT team_name_pk PRIMARY KEY (teamname),
   -- these constraints statmeing that: these following columns
   --(managerid) references managerID on manager table
   --the same apply to each constraint and the table it references
  CONSTRAINT manager_team_fk FOREIGN KEY (managerid)
    REFERENCES Manager (managerid) ON DELETE SET NULL,
  CONSTRAINT comp_team_fk FOREIGN KEY (compID)
    REFERENCES Competition (compID) ON DELETE SET NULL,
  CONSTRAINT club_team_fk FOREIGN KEY (clubID)
    REFERENCES Club (clubID) ON DELETE SET NULL
);


CREATE TABLE Player
(
	playername           VARCHAR2(30) NULL ,
	playerage            NUMBER(30) NULL ,
	DOB                  DATE NULL ,
	address              VARCHAR2(30) NULL ,
	teamname             VARCHAR2(30) NULL ,
	CONSTRAINT player_team_fk FOREIGN KEY(teamname)
  REFERENCES team (teamname) ON DELETE SET NULL
);


CREATE TABLE Referees
(
	refereesqual         VARCHAR2(30) NULL ,
	refereename          VARCHAR2(30) NULL ,
	address              VARCHAR2(30) NULL ,
	refereepone          NUMBER(30) NULL ,
	refereeID            VARCHAR2(30) NOT NULL ,
	constraint ref_id_pk PRIMARY KEY (refereeID)
);

CREATE TABLE Match
(
	matchID              VARCHAR2(30) NOT NULL ,
	hometeamname         VARCHAR2(30) NULL ,
	awayteamname         VARCHAR2(30) NULL ,
	refereeID            VARCHAR2(30) NULL ,
	venue                VARCHAR2(30) NULL ,
	CONSTRAINT  match_id_pk PRIMARY KEY (matchID),
  
  CONSTRAINT team_match_fk FOREIGN KEY (hometeamname)
  REFERENCES Team (teamname) ON DELETE SET NULL,

  CONSTRAINT team1_match_fk FOREIGN KEY (awayteamname)
  REFERENCES Team (teamname) ON DELETE SET NULL,

  CONSTRAINT ref_match_fk FOREIGN KEY (refereeID)
  REFERENCES Referees (refereeID) ON DELETE SET NULL
	
);

			--adding data to the clubs table the values has to be in the same columns
      --order in which they were created in, so we start with (clubID,address1,address2)
		insert into club values
		('1','parnell street','ivy exchange');
		insert into club values
		('2','leopardstown','Central Park');
		insert into club values
		('3','Moore street','Ilac center');
		insert into club values
		('4','Kevin Street','DIT');
		insert into club values
		('5','Aungier Street','DIT');
		insert into club values
		('6','Mountjoy square','DIT');
		insert into club values
		('7','Stillorgan','The Cubes');
		insert into club values
		('8','Sandyford Rd','Wayckham point');
		insert into club values
		('9','Rathmines','Swan center');
		insert into club values
		('10','grafton St','Wesbury hotel');


			--inserting values to compeition
			insert into competition values
			('John Smith','1000','Apple Inc','0873569531','20-22','10001');
			insert into competition values
			('Abdul','9999','Samsung','0873569631','20-24','10002');
			insert into competition values
			('Owen Grogan','999','HTC','0873569441','18-20','10003');
			insert into competition values
			('Majed Alshammari','4000','DELL','0893569531','15-17','10004');
			insert into competition values
			('Alex Kiernan','9000','Vodafone','0876569531','20-22','10005');
			insert into competition values
			('Greg','2000','O2','0873569531','23-25','10006');
			insert into competition values
			('Feras Hakeem','10000','Three','0879569531','20-24','10007');
			insert into competition values
			('Ghassan','11000','Hokair Inc','0873669531','20-22','10008');
			insert into competition values
			('Abdullah','1000','Apple Inc','0873569531','20-22','10009');
			insert into competition values
			('Abdullah Omran','1000','Apple Inc','0873569531','20-22','10010');

			 --inserting values into manager
			 insert into manager values
			 ('Abdulellah','1','Parnell St','0873569532');
			 insert into manager values
			 ('Alex','2','Kevin St','0873569532');
			insert into manager values
			 ('Owen','3','Camden St','0873569532');
			insert into manager values
			 ('Aziz','4','Parnell St','0873569789');
			insert into manager values
			 ('Aadam','5','Stillorgan road','0898769532');
			insert into manager values
			 ('Emmet','6','Stillorgan road','0872369532');
			insert into manager values
			 ('Greg','7','Blackrock','0873569232');
			 insert into manager values
			 ('Aziz','8','Parnell St','0873569892');
			insert into manager values
			 ('Majed','9','Parnell St','0878769532');
			insert into manager values
			 ('Rayan','10','Parnell St','0873659532');

		  
	
			 --inserting values for team table. because each team has a manager and there
       --is a non-identifying relationship between team and manager the manager ID column value
       --has to match any of the manager ID values in the managers table
		  insert into team values
		  ('the hawks','15-25','1','10001','1');
		  insert into team values
		  ('the dolphins','15-25','2','10002','2');
		  insert into team values
		  ('the sea sharks','15-25','3','10002','3');
		  insert into team values
		  ('Dubliners','15-25','4','10003','2');
		  insert into team values
		  ('Barclona','15-25','3','10004','4');
		  insert into team values
		  ('Real Madrid','15-25','4','10005','6');
		  insert into team values
		  ('Arsenal','15-25','5','10005','7');
		  insert into team values
		  ('Juventos','15-25','6','10008','8');
		  insert into team values
		  ('BoysInBlue','15-25','7','10010','1');
		  insert into team values
		  ('ACE Milan','15-25','8','10001','4');
		  insert into team values
		  ('liverpool','15-25','9','10001','5');
      

		  --inserting values into player, becuase of the relationship between a player and team
      -- the column(teamname) value has to match any of the team names in team name
			insert into PLAYER values
		  ('Alex Kiernan','21','01-MAR-1994','Blackrock','Liverpool');
			insert into player values
		  ('Aziz hokair','25','01-JAN-1989','Stillorgan','ACE Milan');
			insert into player values
		  ('Greg Giztkeia','24','10-JUN-1991','Waxford','BoysInBlue');
			insert into player values
		  ('Owen Grogran','23','01-DEC-1991','Rathmines','Juventos'); 
			insert into player values
		  ('Feras Hakeem','15','01-NOV-1999','Sandyford','Arsenal'); 
			insert into player values
		  ('Ghassan Hakeem','17','01-OCT-1996','Dundrum','Barclona'); 
			insert into player values
		  ('Majed Alshammari','20','05-APR-1994','Islandbridge','Dubliners'); 
			insert into player values
		  ('Abdulellah Hakim','21','10-JUL-1993','Parnell St','the sea sharks'); 
			insert into player values
		  ('Owen Kane','19','04-FEB-1995','Bray','the hawks'); 
			insert into player values
		  ('Stephen Fox','18','09-FEB-1997','Bray','the dolphins'); 
			insert into player values
		  ('James Pendgent','15','15-MAR-1999','Arklow','Real Madrid'); 
			insert into player values
		  ('Podge hassien','18','25-DEC-1996','Wicklow','Barclona');
		  
    
      
		--referees has to be entered before MATCH because of the relationship between them
		  insert  into referees values
		  ('Y','Ali','Parnell St','0873569342','01');
		  insert into referees values
		  ('Y','Abdul','Moore St','0853876532','03');
		  insert into referees values
		  ('Y','David','Stillorgan rd','0654321678','04');
		  insert  into referees values
		  ('Y','Lauren','Parnell St','1234567890','05');
		  insert into referees values
		  ('Y','Podge','Kevin  St','0456781243','06');
		  insert  into referees values
		  ('Y','Alex','Aungier St','0891239876','07');
		  insert into referees values
		  ('Y','Greg','Moore St','085445563','08');
		  insert  into referees values
		  ('Y','James','Parnell St','0891245864','09');
		  insert into referees values
		  ('Y','Owen','Moore St','087536885','10');
		  insert  into referees values
		  ('N','Jane','Parnell St','08739342','11');
		  insert into referees values
		  ('N','Jamal','Moore St','087538532','12');
		  
--MATCH has to be the last table because of the relationship with various other
--tables(hometeam,awayteam,referee ID) which comes from the tables team and referee
    insert into match values
		('2001','the sea sharks','the dolphins','10','3Arena');
		insert into match values
		('2002','Barclona','Arsenal','03','Aviva stadium');
		insert into match values
		('2003','the hawks','Arsenal','07','3Arena');
		insert into match values
		('2004','Arsenal','Real Madrid','03','Aviva stadium');
		insert into match values
		('2005','ACE Milan','Juventos','07','Aviva stadium');
		insert into match values
		('2006','liverpool','the dolphins','09','3Arena');
		insert into match values
		('2007','Barclona','the dolphins','06','3Arena');
		insert into match values
		('2008','Dubliners','the dolphins','08','Aviva stadium');
		insert into match values
		('2009','the sea sharks','BoysInBlue','10','Aviva stadium');
		insert into match values
		('2010','the sea sharks','liverpool','01','Aviva stadium');
	commit;
  
  
  
  --single row function (UPPER)
  select UPPER(playername) from player;
  --aggregate function;
  select count(playername) from player;
    --INNER join two tables
     select *
    from team
    inner join club
  ON team.clubid=club.clubid;
  
  --INNER join three tables
  select * from team
  inner join club
  on team.clubid=club.clubid
  inner join competition
  on team.compid=competition.compid;
  
  --right outer join
  select * from team
  right outer join manager
  on team.managerID=manager.managerID;
  
  
  --left outer join
  select * from club
  left outer join team
  on club.clubID=team.clubID;
  
  
    --updated selected data
	--we select Aziz alhokair and repalce it with aziz hokair
	--we have to tell Orcale what table we want to update and then
	-- we say the column name.
  UPDATE player
  SET playername='Aziz hokair'
  WHERE playername='Aziz alhokair';
  
  
  
    --add column to club table
	--alter table statment is used to edit\update table
	--columns, in the example below we added a column
	--called adedcolumn to the table club. and the data type
	--for this is VARCHAR2(30)
  alter table club
  add adedcolumn VARCHAR2(30);

--add a constraint giving it uniqueness
--to add a constraint we need specfy the table name,
--then we say what we want to do, in this explame we
-- did add a new constraint, we named it NOT_NULL 
-- and we made this constraint(column-adedcolumn) have unique values
  ALTER TABLE club
  ADD CONSTRAINT not_null unique (adedcolumn);
--modify a data type in column
--alter table used to MODFY adedcolum which changes the datatype
--for a column. in this example we changed it from VARCHAR2 to NUMBER
  alter table club
  modify  adedcolumn NUMBER(30);
 --we have to drop the constraint before we delete the column
 --alter table is used to DROP the constraint which is called
 --NOT_NULL in the table club
  ALTER TABLE club
  drop CONSTRAINT not_null;

 --drop added column
 -- now that there is no constraints in the column
 --we can use drop column and drop the newly added column.
    alter table club
  drop column adedcolumn;
