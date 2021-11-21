DROP DATABASE IF EXISTS craigslists;

CREATE DATABASE craigslists;

\c craigslists

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL,
    email TEXT not NULL UNIQUE,
    password TEXT NOT NULL,
    preferred_region INTEGER REFERENCES region 
); 

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name Text Not null
);


CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users,
    title TEXT NOT NULL,
    post TEXT NOT NULL,
    category INTEGER REFERENCES categories,
    location INTEGER REFERENCES location
);