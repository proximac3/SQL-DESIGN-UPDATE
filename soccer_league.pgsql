DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE  teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    ranking INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL UNIQUE,
    team INTEGER REFERENCES team
);


CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    referee TEXT NOT NULL
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    team_1 INTEGER REFERENCES teams,
    team_2 INTEGER REFERENCES teams,
    head_referee INTEGER REFERENCES referee,
    assistant_referee_1 INTEGER REFERENCES referee,
    assistant_referee_2 INTEGER REFERENCES referee,
    league INTEGER REFERENCES league,
    winner TEXT REFERENCES teams(team_name) DEFAULT 'DRAW'
);

CREATE TABLE goals_per_game(
    id SERIAL PRIMARY KEY,
    game INTEGER REFERENCES games,
    player INTEGER REFERENCES players,
    goals_scored INTEGER NOT NULL
);


CREATE TABLE league (
    id serial PRIMARY KEY,
    league_name TEXT NOT NULL UNIQUE,
    season_start_date DATE,
    season_end_date DATE
);




