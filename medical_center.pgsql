DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id serial PRIMARY KEY,
    doctor_name TEXT NOT NULL
);

CREATE TABLE patients (
    id serial PRIMARY KEY,
    patient_name TEXT
);

CREATE TABLE patient_visit (
    id serial PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    diagnosis TEXT NOT NULL
);