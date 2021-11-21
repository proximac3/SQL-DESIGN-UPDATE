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

CREATE TABLE terminal_gates (
    id SERIAL PRIMARY KEY,
    gate_number Text NOT NULL
);

CREATE TABLE flight (
  id SERIAL PRIMARY KEY,
  airline Integer not null REFERENCES airline,
  from_country INTEGER REFERENCES country,
  from_city INTEGER REFERENCES from_city,
  to_city Integer REFERENCES to_city,
  to_country INTEGER REFERENCES to_country,
  departure_time TIMESTAMP,
  arrival_time TIMESTAMP,
  flight_date Date
);

CREATE TABLE ticket 
(
  id SERIAL PRIMARY KEY,
  name INTEGER not null REFERENCES passenger,
  seat TEXT NOT NULL,
  flight INTEGER REFERENCES flight,
  boarding_time Timestamp,
  gate INTEGER REFERENCES terminal_gates
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

INSERT INTO terminal_gates 
  (gate_number)
VALUES
  ('3A')
  ('4C')
  ('9B')
  ('4T')
  ('69');

INSERT INTO flight
  (airline, from_country, from_city, to_city, to_country, 
  departure_time, arrival_time, flight_date)
VALUES
  (1, 1, 3, 2, 2, '2021-19-15', '2021-19-16', '2021-09-15')


INSERT INTO ticket
  (name, seat, fligh, boarding_time, gate)
VALUES
  (1 , '11B', 1, '2021-19-20', 5);
