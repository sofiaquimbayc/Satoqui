--COMENZAMOS CREANDO LAS TABLAS NECESARIAS

CREATE TABLE UserC 
( User_id SERIAL PRIMARY KEY,
Age integer,
Gender VARCHAR(10),
Experience BOOLEAN,
Semester integer)
;

CREATE TABLE Player
(Player_id SERIAL PRIMARY KEY,
User_id integer REFERENCES UserC(User_id), 
Alias Varchar(50)NOT NULL UNIQUE)
;


CREATE TABLE Ux_instrument
(Instrument_id SERIAL PRIMARY KEY, 
Name VARCHAR(50))
;

CREATE TABLE Ux_item 
(Item_id SERIAL PRIMARY KEY,
Instrument_id integer REFERENCES Ux_instrument(Instrument_id),
 Question TEXT, 
ScaleType VARCHAR(10))
;

CREATE TABLE Ux_responseItem
(Response_id INTEGER REFERENCES Ux_response (Response_id),
Item_id INTEGER REFERENCES Ux_item(Item_id),
Response_value VARCHAR(50));

CREATE TABLE Episode
(Episode_id SERIAL PRIMARY KEY,
Name VARCHAR(50))
;

CREATE TABLE TelemetryEvent
(Game_id INTEGER REFERENCES Game (Game_id),
Player_id INTEGER REFERENCES Player(Player_id),
TimeS TIMESTAMP,
tic integer,
Posx integer, 
Posy integer, 
Posz integer,
Angle float, 
MomX integer,
MomY integer)
;

CREATE TABLE Sector
 (Map_id integer REFERENCES Map(Map_id),
  Col integer,
  Row integer,
  Geom VARCHAR(30),
  Count integer,
  PRIMARY KEY (Map_id, Col, Row))
;


CREATE TABLE Game
(Game_id SERIAL PRIMARY KEY,
Player_id INTEGER REFERENCES Player(Player_id),
 startTime TIMESTAMP, 
endTime TIMESTAMP, 
Episode_id INTEGER REFERENCES Episode (Episode_id))
;

CREATE TABLE Map
(Map_id INTEGER,
 Map_code VARCHAR(20) PRIMARY KEY)
;

-- LUEGO INSERTAMOS LOS DATOS EN LAS TABLAS 

INSERT INTO UserC 
(User_id,Age,Gender,Experience,Semester )VALUES (1,18,'FEMALE',FALSE,3),(2,19,'FEMALE',FALSE,3),
(3,23,'FEMALE',TRUE,3);

INSERT INTO Userc(User_id,Age,Gender,Experience,Semester)VALUES(4,20,'MALE',TRUE,5),
(5,21,'MALE',FALSE,6);

INSERT INTO Userc(User_id,Age,Gender,Experience,Semester)VALUES(6,19,'M
ALE',FALSE,3);


INSERT INTO Player (Player_id,User_id,Alias) VALUES 
(1,1,'Estefix'),
(2,2,'JuliGalaxyDestructor'),
(3,3,'Sofix');
INSERT INTO Player(Player_id,User_id,Alias)VALUES
(4,4,'simon'),
(5,5,'jeronimo');
INSERT INTO Player(Player_id,User_id,Alias)VALUES
(6,6,'Juan Pablo');



INSERT INTO Ux_instrument(Instrument_id,Name) VALUES
(1,'PENS'),(2,'GUESS'),(3,'BANGS');


INSERT INTO Ux_response(Response_id,User_id,Instrument_id,DateR)VALUES(1,1,2,'2025-11-04'),(2,2,2,'2025-11-05'),(3,3,2,'2025-11-06');

INSERT INTO Ux_response(response_id,User_id,Instrument_id,DateR) VALUES(4,4,2,'2025-11-05'),(5,5,2,'2025-11-07');

INSERT INTO Ux_item(Item_id, Instrument_id, Question, ScaleType)
VALUES
(1, 2, 'I FIND THE CONTROLS OF THE GAME TO BE STRAIGHT FORWARD', 'LIKERT'),
(2, 2, 'I FIND THE GAME´S INTERFACE TO BE EASY TO NAVIGATE', 'LIKERT'),
(3, 2, 'I AM CAPTIVATED BY THE GAME´S STORY FROM THE BEGINNING', 'LIKERT'),
(4, 2, 'I ENJOY THE FANTASY OR THE STORY PROVIDED BY THE GAME', 'LIKERT'),
(5, 2, 'I FEEL DETACHED FROM THE OUTSIDE WORLD WHILE PLAYING THE GAME', 'LIKERT'),
(6, 2, 'I DO NOT CARE TO CHECK EVENTS THAT ARE HAPPENING IN THE REAL WORLD DURING THE GAME', 'LIKERT'),
(7, 2, 'I THINK THE GAME IS FUN', 'LIKERT'),
(8, 2, 'I FEEL BORED WHILE PLAYING THE GAME', 'LIKERT'),
(9, 2, 'I FEEL THE GAME ALLOWS ME TO BE IMAGINATIVE', 'LIKERT'),
(10, 2, 'I FEEL CREATIVE WHILE PLAYING THE GAME', 'LIKERT'),
(11, 2, 'I ENJOY THE SOUND EFFECTS IN THE GAME', 'LIKERT'),
(12, 2, 'I FEEL THE GAME´S AUDIO ENHANCES MY GAMING EXPERIENCE', 'LIKERT'),
(13, 2, 'I AM VERY FOCUSED ON MY OWN PERFORMANCE WHILE PLAYING THE GAME', 'LIKERT'),
(14, 2, 'I WANT TO DO AS WELL AS POSSIBLE DURING THE GAME', 'LIKERT'),
(15, 2, 'I´VE FOUND THE GAME SUPPORTS SOCIAL INTERACTION BETWEEN PLAYERS', 'LIKERT'),
(16, 2, 'I LIKE TO PLAY THIS GAME WITH OTHER PLAYERS', 'LIKERT'),
(17, 2, 'I ENJOY THE GAME''S GRAPHICS', 'LIKERT'),
(18, 2, 'I THINK THE GAME IS VISUALLY APPEALING', 'LIKERT');

INSERT INTO Ux_responseItem(Response_id, Item_id, Response_value)VALUES
(1,1,'Neither Agree nor Disagree')
,(1,2,'Somewhat Agree')
,(1,3,'Disagree')
,(1,4,'Somewhat Disagree')
,(1,5,'Disagree')
,(1,6,'Strongly Disagree')
,(1,7,'Somewhat Agree')
,(1,8,'Disagree')
,(1,9,'Disagree')
,(1,10,'Neither Agree nor Disagree')
,(1,11,'Strongly Disagree')
,(1,12,'Strongly Disagree')
,(1,13,'Agree')
,(1,14,'Agree')
,(1,15,'Strongly Disagree')
,(1,16,'Disagree')
,(1,17,'Somewhat Disagree')
,(1,18,'Disagree')
,(2,1,'Neither Agree not Disagree'),
(2,2,'Agree'),
(2,3,'Disagree'),
(2,4,'Neither Agree not Disagree'),
(2,5,'Agree'),
(2,6,'Neither Agree not Disagree'),
(2,7,'Strongly agree'),
(2,8,'Strongly Disagree'),
(2,9,'Neither Agree not Disagree'),
(2,10,'Agree'),
(2,11,'Somewhat Agree'),
(2,12,'Neither Agree not Disagree'),
(2,13,'Strongly Agree'),
(2,14,'Agree'),
(2,15,'Neither Agree not Disagree'),
(2,16,'Neither Agree not Disagree'),
(2,17,'Somewhat Agree'),
(2,18,'Somewhat Agree'),
(3,1,'Disagree'),
(3,2,'Agree'),
(3,3,'Disagree'),
(3,4,'Disagree'),
(3,5,'Neither Agree not Disagree'),
(3,6,'Agree'),
(3,7,'Agree'),
(3,18,'Disagree');

INSERT INTO Ux_responseItem(Response_id, Item_id, Response_value)VALUES
(4,1,'Disagree'),
(4,2,'Agree'),
(4,3,'Somewhat Disagree'),
(4,4,'Disagree'),
(4,5,'Agree'),
(4,6,'Somewhat Disagree'),
(4,7,'Agree'),
(4,8,'Strongly Disagree'),
(4,9,'Somewhat Disagree'),
(4,10,'Strongly Disagree'),
(4,11,'Disagree'),
(4,12,'Strongly Disagree'),
(4,13,'Agree'),
(4,14,'Somewhat Disagree'),
(4,15,'Strongly Agree'),
(4,16,'Strongly Disagree'),
(4,17,'Agree'),
(4,18,'Disagree'),
(5,1,'Somewhat Disagree'),
(5,2,'Somewhat Agree'),
(5,3,'Disagree'),
(5,4,'Somewhat Disagree'),
(5,5,'Disagree'),
(5,6,'Somewhat Disagree'),
(5,7,'Agree'),
(5,8,'Disagree'),
(5,9,'Somewhat Disagree'),
(5,10,'Neither Agree nor Disagree'),
(5,11,'Strongly Disagree'),
(5,12,'Disagree'),
(5,13,'Agree'),
(5,14,'Strongly Agree'),
(5,15,'Disagree'),
(5,16,'Disagree'),
(5,17,'Somewhat Disagree'),
(5,18,'Neither Agree nor Disagree');


INSERT INTO Episode (episode_id,name) VALUES
(1,'Knee-Deep In The Dead'),
(2,'The Shores Of Hell'),
(3,'Inferno'),
(4,'Thy Flesh Consumed');

INSERT INTO Game(game_id, player_id,starttime,endtime,episode_id) 
VALUES (1,1,'2025-11-05 10:11:22','2025-11-05 10:20:00',1);
INSERT INTO Game(game_id, player_id, starttime,endtime,episode_id)
VALUES (2,2,'2025-11-05 10:03:32','2025-11-05 10:07:08',1);
INSERT INTO Game(game_id,player_id,starttime,endtime,episode_id)
VALUES(3,3,'2025-11-05 08:41:09','2025-11-05 09:16:06',1),(4,4,'2025-11-05 09:53:07','2025-11-05 10:01:37',3),(5,5,'2025-11-05 09:49:42','2025-11-05 09:50:21',2);
INSERT INTO Game(game_id,player_id,starttime,endtime,map_code)
VALUES(6,6,'2025-11-05 21:47:00','2025-11-05 22:17:44','EPISODE:4 MAP:1');

INSERT INTO Game(game_id,player_id,starttime,endtime,map_code)
VALUES(6,6,'2025-11-25 09:17:16','2025-11-25 09:32:37','EPISODE:2 MAP:3');

INSERT INTO Game(game_id,player_id,starttime,endtime,map_code)
VALUES(8,3,'2025-11-27 10:37:32','2025-11-27 10:41:07','EPISODE:1 MAP:2');

INSERT INTO Game(game_id,player_id,starttime,endtime,map_code)
VALUES(9,1,'2025-11-27 10:45:13','2025-11-27 10:50:27','EPISODE:4 MAP:1');

INSERT INTO Game(game_id,player_id,starttime,endtime,map_code)
VALUES(10,2,'2025-11-27 10:53:36','2025-11-27 10:56:12','EPISODE:3 MAP:5');

INSERT INTO Game(game_id,player_id,starttime,endtime,map_code)
VALUES(11,5,'2025-11-27 11:02:59','2025-11-27 11:04:58','EPISODE:2 MAP:2');


INSERT INTO Map (map_id,map_code,episode_id)
VALUES SODE:1 MAP:1',1),
(1,'EPISODE:1 MAP:1',1),
(1,'EPISODE:2 MAP:1',2),
(1,'EPISODE:3 MAP:1',3),
(1,'EPISODE:4 MAP:1',4),
(2,'EPISODE:1 MAP:2',1),
(2,'EPISODE:1 MAP:2',1),
(2,'EPISODE:2 MAP:2',2),
(2,'EPISODE:3 MAP:2',3),
(2,'EPISODE:4 MAP:2',4),
(3,'EPISODE:1 MAP:3',1),
(3,'EPISODE:1 MAP:3',1),
(3,'EPISODE:2 MAP:3',2),
(3,'EPISODE:3 MAP:3',3),
(3,'EPISODE:4 MAP:3',4),
(4,'EPISODE:1 MAP:4',1),
(4,'EPISODE:1 MAP:4',1),
(4,'EPISODE:2 MAP:4',2),
(4,'EPISODE:3 MAP:4',3),
(4,'EPISODE:4 MAP:4',4),
(5,'EPISODE:1 MAP:5',1),
(5,'EPISODE:1 MAP:5',1),
(5,'EPISODE:2 MAP:5',2),
(5,'EPISODE:3 MAP:5',3),
(5,'EPISODE:4 MAP:5',4),
(6,'EPISODE:1 MAP:6',1),
(6,'EPISODE:1 MAP:6',1),
(6,'EPISODE:2 MAP:6',2),
(6,'EPISODE:3 MAP:6',3),
(6,'EPISODE:4 MAP:6',4),
(7,'EPISODE:1 MAP:7',1),
(7,'EPISODE:1 MAP:7',1),
(7,'EPISODE:2 MAP:7',2),
(7,'EPISODE:3 MAP:7',3),
(7,'EPISODE:4 MAP:7',4),
(8,'EPISODE:1 MAP:8',1),
(8,'EPISODE:1 MAP:8',1),
(8,'EPISODE:2 MAP:8',2),
(8,'EPISODE:3 MAP:8',3),
(8,'EPISODE:4 MAP:8',4),
(9,'EPISODE:1 MAP:9',1),
(9,'EPISODE:1 MAP:9',1),
(9,'EPISODE:2 MAP:9',2),
(9,'EPISODE:3 MAP:9',3),
(9,'EPISODE:4 MAP:9',4);



 ALTER TABLE Game DROP COLUMN episode_id;
ALTER TABLE Game ADD COLUMN map_code VARCHAR(20);

UPDATE Game SET map_code = 'EPISODE:1 MAP:2' WHERE game_id = 1;

CHOCOLATE=# UPDATE Game SET map_code = 'EPISODE:1 MAP:5' WHERE game_id = 2;

CHOCOLATE=# UPDATE Game SET map_code = 'EPISODE:1 MAP:5' WHERE game_id = 3;

CHOCOLATE=# UPDATE Game SET map_code = 'EPISODE:3 MAP:5' WHERE game_id = 4;

CHOCOLATE=# UPDATE Game SET map_code = 'EPISODE:2 MAP:7' WHERE game_id = 5;

ALTER TABLE Game ADD FOREIGN KEY (map_code) REFERENCES Map(map_code);

\copy TelemetryEvent FROM '/vagrant/juan.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/sofia.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/juliana.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/estefa.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/simon.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/jeronimo.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/estefa2.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/juanpablo.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/sofia2.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/juli2.csv' WITH CSV HEADER;
\copy TelemetryEvent FROM '/vagrant/jero2.csv' WITH CSV HEADER;

