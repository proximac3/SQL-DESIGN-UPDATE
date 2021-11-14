-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL UNIQUE
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  publisher TEXT DEFAULT 'independent'
);

CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  number_of_songs INTEGER not null,
  release_date DATE NOT NULL,
  producers TEXT NOT NULL
);

CREATE TABLE song (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  album INTEGER REFERENCES album,
  song_duration FLOAT
);


CREATE TABLE artist_producer_of_song(
  id SERIAL PRIMARY KEY,
  song TEXT REFERENCES song (title),
  artist TEXT NOT NULL REFERENCES artists(artist_name),
  producers TEXT NOT NULL REFERENCES producers(name)
);

INSERT INTO artists (artist_name)
VALUES
  ('Mac Miller'), ('Adele'), ('Drake');

INSERT INTO producers(name, publisher)
VALUES 
  ('Mac Miller', 'Werner'), ('Timberland', 'Geko');

Insert into album (album_name, number_of_songs, release_date, producers)
VALUES
  ('GO:ODAM', 17, '2015-08-08', '{"Mac Miller", "Werner"}');


INSERT INTO song (title, album, song_duration) 
VALUES ('weekend', 1, 3.40);

INSERT INTO artist_producer_of_song(song, artist, producers)
VALUES 
  ('weekend', 'Mac Miller', 'Timberland');






-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );


-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
