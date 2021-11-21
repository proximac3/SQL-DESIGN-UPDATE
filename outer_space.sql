-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planet (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL UNIQUE,
  orbits_around TEXT NOT NULL,
  orbital_period_in_years Float NOT NULL,
  solar_system INTEGER REFERENCES solar_system
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  orbits_around INTEGER REFERENCES planet
);

CREATE TABLE solar_system (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  galaxy INTEGER NOT NULL REFERENCES galaxies
);

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);


INSERT INTO galaxies
  (name)
VALUES ('Milky Way');

INSERT INTO solar_system 
  (name)
VALUES 
  ('The Solar System'),
  ('Alpha Centauri'),
  ('Bernard Star');

INSERT INTO planet 
  (name, orbits_around, orbital_period_in_years, solar_system)
VALUES 
  ('Earth', 'The Sun', 1.00, 1),
  ('Mars', 'The Sun', 1.88, 1),
  ('Venus', 'The Sun', 0.62, 1),
  ('Proxima Centauri b', 'Toliman', 0.03, 2);

INSERT INTO 
  (name, orbits_around)
VALUES 
  ('Moon', 1)
  ('Phobes', 2)
  ('Deomos', 2);