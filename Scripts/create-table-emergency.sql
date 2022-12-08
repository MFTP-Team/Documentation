CREATE TABLE ALERT (
  id_alert SERIAL,
  date_alert TIMESTAMP,
  longitude_alert REAL,
  latitude_alert REAL,
  id_fire_alert INTEGER,
  PRIMARY KEY (id_alert)
);

CREATE TABLE FIRE (
  id_fire SERIAL,
  longitude_fire REAL,
  latitude_fire REAL,
  status_fire VARCHAR(50),
  PRIMARY KEY (id_fire)
);

CREATE TABLE FIREMAN (
  id_fireman SERIAL,
  firstname_fireman VARCHAR(50),
  lastname_fireman VARCHAR(50),
  id_station_fireman INTEGER,
  PRIMARY KEY (id_fireman)
);

CREATE TABLE INTERVENTION (
  id_intervention SERIAL,
  date_intervention TIMESTAMP,
  status VARCHAR(50),
  id_fire_intervention INTEGER,
  PRIMARY KEY (id_intervention)
);

CREATE TABLE TRUCK_INTERVENTION (
  id_truck_ti INTEGER,
  id_intervention_ti INTEGER,
  PRIMARY KEY (id_truck_ti, id_intervention_ti)
);

CREATE TABLE STATION (
  id_station SERIAL,
  longitude_station REAL,
  latitude_station REAL,
  PRIMARY KEY (id_station)
);

CREATE TABLE TRUCK (
  id_truck SERIAL,
  longitude_truck VARCHAR(50),
  latitude_truck VARCHAR(50),
  id_station_truck INTEGER,
  PRIMARY KEY (id_truck)
);

CREATE TABLE FIREMAN_INTERVENTION (
  id_fireman_fi INTEGER,
  id_intervention_fi INTEGER,
  PRIMARY KEY (id_fireman_fi, id_intervention_fi)
);

ALTER TABLE ALERT ADD FOREIGN KEY (id_fire_alert) REFERENCES FIRE (id_fire);
ALTER TABLE INTERVENTION ADD FOREIGN KEY (id_fire_intervention) REFERENCES FIRE (id_fire);
ALTER TABLE FIREMAN ADD FOREIGN KEY (id_station_fireman) REFERENCES STATION (id_station);
ALTER TABLE TRUCK_INTERVENTION ADD FOREIGN KEY (id_truck_ti) REFERENCES TRUCK (id_truck);
ALTER TABLE TRUCK_INTERVENTION ADD FOREIGN KEY (id_intervention_ti) REFERENCES INTERVENTION (id_intervention);
ALTER TABLE TRUCK ADD FOREIGN KEY (id_station_truck) REFERENCES STATION (id_station);
ALTER TABLE FIREMAN_INTERVENTION ADD FOREIGN KEY (id_fireman_fi) REFERENCES FIREMAN (id_fireman);
ALTER TABLE FIREMAN_INTERVENTION ADD FOREIGN KEY (id_intervention_fi) REFERENCES INTERVENTION (id_intervention);
