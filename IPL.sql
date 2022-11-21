CREATE TABLE matches(                                                         
id INTEGER PRIMARY KEY,
season INTEGER,
city VARCHAR(50),
date VARCHAR(50),
team1 VARCHAR(50),
team2 VARCHAR(50),
toss_winner VARCHAR(50),
toss_decision VARCHAR(50),
result VARCHAR(50),
dl_applied INTEGER(50),
winnner VARCHAR(50),
win_by_runs INTEGER(50),
win_by_wickets INTEGER(50),
player_of_match VARCHAR(50),
venue VARCHAR(50),
umpire1 VARCHAR(50),
umpire2 VARCHAR(50),
umpire3 VARCHAR(50));

\copy matches FROM '/home/dell/Downloads/matches.csv' DELIMITE ',' CSV HEADER;

CREATE TABLE Delivery(                                                             
match_id INT,
inning INT,
batting_team VARCHAR(50),
bowling_team VARCHAR(50),
over INT,
ball INT,
batsman VARCHAR(50),
non_striker VARCHAR(50),
bowler VARCHAR(50),
is_super_over INT,
wide_runs INT,
bye_runs INT,
legbye_runs INT,
noball_runs INT,
penalty_runs INT,
batsman_runs INT,
extra_runs INT,
total_runs INT,
player_dismissed VARCHAR(50),
dismissal_kind VARCHAR(50),
fielder VARCHAR(50),
FOREIGN KEY(match_id) REFERENCES matches(id));

\copy Delivery FROM '/home/dell/Downloads/deliveries.csv' DELIMITER ',' CSV HEADER;

SELECT season , Count(season) as MatchesPlayedPerYear 
From matches 
GROUP BY season;

SELECT winner, Count(winner) as NumberofMatchesWonPerTeam 
From matches 
WHERE winner IS NOT NULL 
GROUP BY winner;

SELECT batting_team, sum(extra_runs) as extrarunsconcededperteam 
FROM matches 
JOIN Delivery ON matches.id = Delivery.match_id 
WHERE season = 2016 
GROUP BY batting_team;

SELECT economicbowler.bowler AS Economicbowler
FROM 
(SELECT bowler, AVG(total_runs)*6 as Average 
FROM matches JOIN Delivery on matches.id = Delivery.match_id 
WHERE season = 2015 
GROUP BY bowler 
ORDER BY Average) as economicbowler 
LIMIT 1;

SELECT toss_winner , Count(toss_winner) as TossWinnersPerTeam 
From matches 
GROUP BY toss_winner;