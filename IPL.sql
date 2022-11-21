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

