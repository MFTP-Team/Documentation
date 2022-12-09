-- Database: simulator

-- DROP DATABASE IF EXISTS simulator;

DROP TABLE IF EXISTS ALERT;
DROP TABLE IF EXISTS SENSOR;
DROP TABLE IF EXISTS FIRE;
DROP TABLE IF EXISTS TRUCK;

CREATE TABLE ALERT (
  id SERIAL,
  latitude REAL,
  longitude REAL,
  intensity INTEGER,
  id_sensor INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE FIRE (
  id SERIAL,
  latitude REAL,
  longitude REAL,
  intensity INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE SENSOR (
  id SERIAL,
  latitude REAL,
  longitude REAL,
  PRIMARY KEY (id)
);

CREATE TABLE TRUCK (
  id SERIAL,
  latitude REAL,
  longitude REAL,
  power INTEGER,
  PRIMARY KEY (id)
);

ALTER TABLE ALERT ADD FOREIGN KEY (id_sensor) REFERENCES SENSOR (id);
