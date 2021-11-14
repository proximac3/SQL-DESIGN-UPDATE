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
  moons TEXT []
);

CREATE TABLE solar_system (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE current_system (
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL references galaxies(name),
  solar_system TEXT NOT NULL references solar_system(name),
  planet text NOT NULL references planet(name)
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
  (name, orbits_around, orbital_period_in_years, moons)
VALUES 
  ('Earth', 'The Sun', 1.00, '{"The Moon"}'),
  ('Mars', 'The Sun', 1.88, '{"Phobes", "Deimos"}'),
  ('Venus', 'The Sun', 0.62, '{}'),
  ('Proxima Centauri b', 'Toliman', 0.03, '{}');


INSERT INTO current_system 
  (galaxy, solar_system, planet)
VALUES 
  ('Milky Way', 'The Solar System', 'Earth'),
  ('Milky Way', 'The Solar System', 'Mars'),
  ('Milky Way', 'Alpha Centauri', 'Proxima Centauri b');

