CREATE DATABASE chocolate;

\c chocolate

---CREACION DE TABLAS---------------

CREATE TABLE UserC 
( User_id SERIAL PRIMARY KEY,
Age integer,
Gender VARCHAR(10),
Experience BOOLEAN,
Semester integer);

CREATE TABLE Player
(Player_id SERIAL PRIMARY KEY,
User_id integer REFERENCES UserC(User_id), 
Alias Varchar(50)NOT NULL UNIQUE);

CREATE TABLE Ux_instrument
(Instrument_id SERIAL PRIMARY KEY, 
Name VARCHAR(50));


CREATE TABLE Ux_item 
(Item_id SERIAL PRIMARY KEY,
Instrument_id integer REFERENCES Ux_instrument(Instrument_id),
 Question TEXT, 
ScaleType VARCHAR(10));

CREATE TABLE Ux_response
(Response_id SERIAL PRIMARY KEY,
User_id integer REFERENCES UserC(User_id),
Instrument_id integer REFERENCES Ux_instrument(Instrument_id),
DateR DATE);

CREATE TABLE Ux_responseItem
(Response_id INTEGER REFERENCES Ux_response (Response_id),
Item_id INTEGER REFERENCES Ux_item(Item_id),
Response_value VARCHAR(50));


CREATE TABLE Episode
(Episode_id SERIAL PRIMARY KEY,
Name VARCHAR(50));


CREATE TABLE Map
(Map_id INTEGER,
 Map_code VARCHAR(20) PRIMARY KEY,
 episode_id INTEGER REFERENCES Episode(Episode_id));


CREATE TABLE Game
(Game_id SERIAL PRIMARY KEY,
Player_id INTEGER REFERENCES Player(Player_id),
 startTime TIMESTAMP, 
endTime TIMESTAMP, 
map_code VARCHAR(20) REFERENCES Map(map_code));


CREATE TABLE Sector
 (Map_id integer,
  map_code VARCHAR(20) REFERENCES Map(map_code),
  Col integer,
  Row integer,
  Geom VARCHAR(30),
  Count integer,
  PRIMARY KEY (Map_id, Col, Row));


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
MomY integer);


---------------LLENAR TABLAS ------------------


INSERT INTO UserC (User_id,Age,Gender,Experience,Semester) VALUES 
(1,18,'FEMALE',FALSE,3),
(2,19,'FEMALE',FALSE,3),
(3,23,'FEMALE',TRUE,3),
(4,20,'MALE',TRUE,5),
(5,21,'MALE',FALSE,6),
(6,19,'MALE',FALSE,3);


INSERT INTO Player (Player_id,User_id,Alias) VALUES 
(1,1,'Estefix'),
(2,2,'JuliGalaxyDestructor'),
(3,3,'Sofix'),
(4,4,'simon'),
(5,5,'jeronimo'),
(6,6,'Juan Pablo');


INSERT INTO Ux_instrument(Instrument_id,Name) VALUES
(1,'PENS'),
(2,'GUESS'),
(3,'BANGS');


INSERT INTO Ux_item(Item_id, Instrument_id, Question, ScaleType) VALUES
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



INSERT INTO Ux_response(Response_id,User_id,Instrument_id,DateR) VALUES
(1,1,2,'2025-11-04'),
(2,2,2,'2025-11-05'),
(3,3,2,'2025-11-06'),
(4,4,2,'2025-11-05'),
(5,5,2,'2025-11-07'),
(6,6,2, '2025-11-08');


INSERT INTO Ux_responseItem(Response_id, Item_id, Response_value) VALUES
(1,1,'Neither Agree nor Disagree'),
(1,2,'Somewhat Agree'),
(1,3,'Disagree'),
(1,4,'Somewhat Disagree'),
(1,5,'Disagree'),
(1,6,'Strongly Disagree'),
(1,7,'Somewhat Agree'),
(1,8,'Disagree'),
(1,9,'Disagree'),
(1,10,'Neither Agree nor Disagree'),
(1,11,'Strongly Disagree'),
(1,12,'Strongly Disagree'),
(1,13,'Agree'),
(1,14,'Agree'),
(1,15,'Strongly Disagree'),
(1,16,'Disagree'),
(1,17,'Somewhat Disagree'),
(1,18,'Disagree'),
(2,1,'Neither Agree not Disagree'),
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
(3,8,'Disagree'),
(3,9,'Strongly Disagree'),
(3,10,'Strongly Disagree'),
(3,11,'Disagree'),
(3,12,'Agree'),
(3,13,'Somewhat Agree'),
(3,14,'Somewhat Disagree'),
(3,15,'Strongly Agree'),
(3,16,'Strongly Disagree'),
(3,17,'Disagree'),
(3,18,'Disagree'),
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
(5,18,'Neither Agree nor Disagree')
(6,1,'Disagree'),
(6,2,'Somewhat Agree'),
(6,3,'Agree'),
(6,4,'Somewhat Disagree'),
(6,5,'Agree'),
(6,6,'Strongly Disagree'),
(6,7,'Somewhat Agree'),
(6,8,'Strongly Disagree'),
(6,9,'Disagree'),
(6,10,'Neither Agree nor Disagree'),
(6,11,'Disagree'),
(6,12,'Somewhat Agree'),
(6,13,'Neither Agree nor Disagree'),
(6,14,'Agree'),
(6,15,'Strongly Disagree'),
(6,16,'Strongly Disagree'),
(6,17,'Somewhat Disagree'),
(6,18,'Disagree');



INSERT INTO Episode (episode_id,name) VALUES
(1,'Knee-Deep In The Dead'),
(2,'The Shores Of Hell'),
(3,'Inferno'),
(4,'Thy Flesh Consumed');



INSERT INTO Map (map_id, map_code, episode_id) VALUES
(1,'EPISODE:1 MAP:1',1),
(1,'EPISODE:2 MAP:1',2),
(1,'EPISODE:3 MAP:1',3),
(1,'EPISODE:4 MAP:1',4),
(2,'EPISODE:1 MAP:2',1),
(2,'EPISODE:2 MAP:2',2),
(2,'EPISODE:3 MAP:2',3),
(2,'EPISODE:4 MAP:2',4),
(3,'EPISODE:1 MAP:3',1),
(3,'EPISODE:2 MAP:3',2),
(3,'EPISODE:3 MAP:3',3),
(3,'EPISODE:4 MAP:3',4),
(4,'EPISODE:1 MAP:4',1),
(4,'EPISODE:2 MAP:4',2),
(4,'EPISODE:3 MAP:4',3),
(4,'EPISODE:4 MAP:4',4),
(5,'EPISODE:1 MAP:5',1),
(5,'EPISODE:2 MAP:5',2),
(5,'EPISODE:3 MAP:5',3),
(5,'EPISODE:4 MAP:5',4),
(6,'EPISODE:1 MAP:6',1),
(6,'EPISODE:2 MAP:6',2),
(6,'EPISODE:3 MAP:6',3),
(6,'EPISODE:4 MAP:6',4),
(7,'EPISODE:1 MAP:7',1),
(7,'EPISODE:2 MAP:7',2),
(7,'EPISODE:3 MAP:7',3),
(7,'EPISODE:4 MAP:7',4),
(8,'EPISODE:1 MAP:8',1),
(8,'EPISODE:2 MAP:8',2),
(8,'EPISODE:3 MAP:8',3),
(8,'EPISODE:4 MAP:8',4),
(9,'EPISODE:1 MAP:9',1),
(9,'EPISODE:2 MAP:9',2),
(9,'EPISODE:3 MAP:9',3),
(9,'EPISODE:4 MAP:9',4);


INSERT INTO Game(game_id, player_id, starttime, endtime, map_code) VALUES 
(1,1,'2025-11-05 10:11:22','2025-11-05 10:20:00','EPISODE:1 MAP:2'),
(2,2,'2025-11-05 10:03:32','2025-11-05 10:07:08','EPISODE:1 MAP:5'),
(3,3,'2025-11-05 08:41:09','2025-11-05 09:16:06','EPISODE:1 MAP:5'),
(4,4,'2025-11-05 09:53:07','2025-11-05 10:01:37','EPISODE:3 MAP:5'),
(5,5,'2025-11-05 09:49:42','2025-11-05 09:50:21','EPISODE:2 MAP:7'),
(6,6,'2025-11-05 21:47:00','2025-11-05 22:17:44','EPISODE:4 MAP:1'),
(7,6,'2025-11-25 09:17:16','2025-11-25 09:32:37','EPISODE:2 MAP:3'),
(8,3,'2025-11-27 10:37:32','2025-11-27 10:41:07','EPISODE:1 MAP:2'),
(9,1,'2025-11-27 10:45:13','2025-11-27 10:50:27','EPISODE:4 MAP:1'),
(10,2,'2025-11-27 10:53:36','2025-11-27 10:56:12','EPISODE:3 MAP:5'),
(11,5,'2025-11-27 11:02:59','2025-11-27 11:04:58','EPISODE:2 MAP:2');


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


INSERT INTO Sector (Map_id, Map_code, Col, Row, Geom, Count)
SELECT DISTINCT
    m.Map_id,
    m.Map_code,
    (te.Posy / 250) AS Col,
    (te.Posx / 250) AS Row,
    NULL AS Geom,
    NULL::INTEGER AS Count
FROM TelemetryEvent te
JOIN Game g ON te.Game_id = g.Game_id
JOIN Map m ON g.Map_code = m.Map_code
WHERE te.Posx IS NOT NULL AND te.Posy IS NOT NULL
ON CONFLICT (Map_id, Col, Row) DO NOTHING;



--QUERYS------------


--1-----------------------

SELECT map_code, 
       AVG(EXTRACT(HOUR FROM (endtime - starttime)) * 3600 + 
           EXTRACT(MINUTE FROM (endtime - starttime)) * 60 + 
           EXTRACT(SECOND FROM (endtime - starttime))) AS avg_seconds 
FROM Game 
GROUP BY map_code;



--3-----------------------

WITH trajectory_distances AS (
    SELECT
        game_id,
        player_id,
        tic,
        posx,
        posy,
        posz,
        SQRT(
            POWER(posx - LAG(posx) OVER (PARTITION BY game_id, player_id ORDER BY tic), 2) +
            POWER(posy - LAG(posy) OVER (PARTITION BY game_id, player_id ORDER BY tic), 2) +
            POWER(posz - LAG(posz) OVER (PARTITION BY game_id, player_id ORDER BY tic), 2)
        ) AS distance_step
    FROM TelemetryEvent
),
total_distances_per_game AS (
    SELECT
        game_id,
        player_id,
        SUM(distance_step) AS total_distance
    FROM trajectory_distances
    WHERE distance_step IS NOT NULL
    GROUP BY game_id, player_id
)
SELECT
    player_id,
    MIN(total_distance) AS min_trajectory,
    MAX(total_distance) AS max_trajectory
FROM total_distances_per_game
GROUP BY player_id
ORDER BY player_id;


--4------------------------

SELECT DISTINCT ux.response_id, p.alias, ux.item_id, ux.response_value
FROM UX_responseItem ux
JOIN Game g ON ux.response_id = g.player_id
JOIN PLAYER p ON g.player_id = p.player_id
WHERE (g.endtime - g.starttime) > (SELECT AVG(endtime - starttime) FROM Game)
ORDER BY ux.response_id, ux.item_id;


--5------------------

WITH sector_visits AS (
  SELECT
    m.episode_id,
    m.map_code,
    s.col as sector_col,
    s.row as sector_row,
    COUNT(*) as visit_count
  FROM TelemetryEvent te
  JOIN Game g ON te.game_id = g.game_id AND te.player_id = g.player_id
  JOIN Map m ON g.map_code = m.map_code
  JOIN Sector s ON m.map_code = s.map_code
  GROUP BY m.episode_id, m.map_code, s.col, s.row
),
ranked_sectors AS (
  SELECT
    episode_id,
    map_code,
    sector_col,
    sector_row,
    visit_count,
    ROW_NUMBER() OVER (PARTITION BY episode_id, map_code ORDER BY visit_count DESC) as rank
  FROM sector_visits
)
SELECT
  rs.episode_id,
  e.name as episode_name,
  rs.map_code,
  rs.sector_col,
  rs.sector_row,
  rs.visit_count
FROM ranked_sectors rs
JOIN Episode e ON rs.episode_id = e.episode_id
WHERE rs.rank = 1
ORDER BY rs.episode_id, rs.map_code;


--7--------------------

WITH shortest_players AS (
    SELECT 
        g.player_id,
        m.episode_id,
        EXTRACT(EPOCH FROM (g.endtime - g.starttime)) as duration,
        p.alias
    FROM 
        Game g
    JOIN 
        Map m ON g.map_code = m.map_code
    JOIN 
        Player p ON g.player_id = p.player_id
    WHERE 
        EXTRACT(EPOCH FROM (g.endtime - g.starttime)) = (
            SELECT 
                MIN(EXTRACT(EPOCH FROM (g2.endtime - g2.starttime)))
            FROM 
                Game g2
            JOIN 
                Map m2 ON g2.map_code = m2.map_code
            WHERE 
                m2.episode_id = m.episode_id
        )
)

SELECT 
    sp.episode_id,
    sp.player_id,
    sp.alias,
    sp.duration,
    ROUND(
        AVG(
            CASE 
                WHEN ux.response_value = 'Strongly Disagree' THEN 1
                WHEN ux.response_value = 'Disagree' THEN 2
                WHEN ux.response_value = 'Somewhat Disagree' THEN 3
                WHEN ux.response_value = 'Neither Agree nor Disagree' THEN 4
                WHEN ux.response_value = 'Somewhat Agree' THEN 5
                WHEN ux.response_value = 'Agree' THEN 6
                WHEN ux.response_value = 'Strongly Agree' THEN 7
                ELSE 4
            END
        )::numeric,
        2
    ) as average_ux_score
FROM 
    shortest_players sp
JOIN 
    Ux_responseItem ux ON sp.player_id = ux.response_id
GROUP BY 
    sp.episode_id,
    sp.player_id,
    sp.alias,
    sp.duration
ORDER BY 
    sp.episode_id,
    sp.player_id;


--Q1--------------------
EXPLAIN ANALYZE SELECT COUNT(*) FROM TelemetryEvent WHERE game_id = 1 AND player_id = 1 AND tic BETWEEN 100 AND 500; 

CREATE INDEX telem_event1 ON TelemetryEvent (game_id, player_id, tic); 


--Q3---------------
EXPLAIN ANALYZE SELECT COUNT(*) FROM TelemetryEvent 

WHERE posx BETWEEN 100 AND 120 AND posy BETWEEN 100 AND 120; 

CREATE INDEX telem_3 ON TelemetryEvent (posx, posy); 



-Q4--------------

EXPLAIN ANALYZE SELECT g.game_id, p.alias, COUNT(te.tic) FROM Game g JOIN Player p ON g.player_id = p.player_id JOIN TelemetryEvent te ON g.game_id = te.game_id AND g.player_id = te.player_id WHERE g.player_id = 1 GROUP BY g.game_id, p.alias; 

CREATE INDEX game4 ON Game (player_id, game_id); 


-VISTAS-------

CREATE VIEW player_game_stats AS
SELECT 
    p.player_id,
    p.alias,
    COUNT(*) as total_games,
    AVG(EXTRACT(EPOCH FROM (g.endtime - g.starttime))) as avg_duration,
    COUNT(te.tic) as total_tics
FROM Player p
JOIN Game g ON p.player_id = g.player_id
LEFT JOIN TelemetryEvent te ON g.player_id = te.player_id
GROUP BY p.player_id, p.alias;


CREATE VIEW player_sessions AS
SELECT 
    p.player_id,
    p.alias,
    g.game_id,
    g.starttime,
    g.endtime,
    EXTRACT(EPOCH FROM (g.endtime - g.starttime)) as duration_seconds,
    m.map_code,
    e.name as episode_name
FROM Player p
JOIN Game g ON p.player_id = g.player_id
JOIN Map m ON g.map_code = m.map_code
JOIN Episode e ON m.episode_id = e.episode_id
ORDER BY p.player_id, g.starttime;


CREATE MATERIALIZED VIEW mv_player_ux_scores AS
SELECT
    p.player_id,
    p.alias,
    AVG(
        CASE
            WHEN ux.response_value = 'Strongly Disagree' THEN 1
            WHEN ux.response_value = 'Disagree' THEN 2
            WHEN ux.response_value = 'Somewhat Disagree' THEN 3
            WHEN ux.response_value = 'Neither Agree nor Disagree' THEN 4
            WHEN ux.response_value = 'Somewhat Agree' THEN 5
            WHEN ux.response_value = 'Agree' THEN 6
            WHEN ux.response_value = 'Strongly Agree' THEN 7
            ELSE 4
        END
    ) as avg_ux_score,
    COUNT(ux.item_id) as questions_answered
FROM Player p
JOIN Ux_responseItem ux ON p.player_id = ux.response_id
GROUP BY p.player_id, p.alias;
