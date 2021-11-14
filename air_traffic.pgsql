-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  DOB DATE
);


CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);


CREATE TABLE city 
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);


CREATE TABLE airline 
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);


CREATE TABLE ticket 
(
  id SERIAL PRIMARY KEY,
  name INTEGER not null REFERENCES passenger,
  airline INTEGER NOT NULL REFERENCES airline,
  seat TEXT NOT NULL,
  from_country INTEGER REFERENCES country,
  from_city INTEGER REFERENCES city,
  to_city INTEGER REFERENCES city,
  to_country INTEGER REFERENCES country,
  departure TIMESTAMP,
  arrival Timestamp
);


INSERT INTO passenger(first_name, last_name, DOB)
VALUES
  ('Jennifer', 'Finch', '1993-09-15');

INSERT INTO country 
  (country_name) 
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('Canada'),
  ('Morocco'),
  ('chile'),
  ('china'),
  ('UAE'),
  ('brazil'),
  ('france');

INSERT INTO city (city_name) VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo'),
  ('London'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Casablanca'),
  ('Beijing'),
  ('Santiago');

INSERT INTO airline
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil'),
  ('KLM');



INSERT INTO ticket
  (name, airline, seat, from_country, from_city, to_city, to_country, departure, arrival)
VALUES
  (1 , 1,'33B', 1, 1, 4, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00' );
