DROP database IF EXISTS GriffinAir;
CREATE database GriffinAir;

use GriffinAir;

DROP TABLE IF EXISTS aircraft;
CREATE TABLE aircraft
(
  id int(11) NOT NULL auto_increment,
  icao_code varchar(4),
  iata_code varchar(3),
  model varchar(255),
  manufacturer varchar(255),
  description text,
  size enum('small','medium','large'),
  lastupdate timestamp(6),
  PRIMARY KEY (id)
);

INSERT INTO aircraft (icao_code,iata_code,model,manufacturer,description,size,lastupdate) VALUES('A320','320','Airbus A320','Airbus','The A320 is the most broadly represented aircraft in the fleet – except for its big brother, the A321. Its fly-by-wire system was once considered revolutionary, but today it is the standard digital control system','medium',NOW());
INSERT INTO aircraft (icao_code,iata_code,model,manufacturer,description,size,lastupdate) VALUES('A346','346','Airbus A340-600','Airbus','The Airbus A340-600 is 75.3 meters in length and currently the second longest passenger aircraft in the world after the Boeing 747-8. The A340-600 has a range of 12,200 kilometers.','large',NOW());
INSERT INTO aircraft (icao_code,iata_code,model,manufacturer,description,size,lastupdate) VALUES('B744','744','Boeing 747-400','Boeing','When it went into service more than 40 years ago, the Boeing 747 acquired its nickname jumbo because of gigantic dimensions, which were at that time unique in the civil aviation scene. Its fuselage is just under 71 meters long, its wingspan more than 64 meters, and its has two passenger decks. The 747-400 is Boeing‘s best-selling jumbo jet.','large',NOW());


DROP TABLE IF EXISTS schedules;
CREATE TABLE schedules
(
  id int(11) NOT NULL auto_increment,
  flightnumber varchar(128)NOT NULL,
  aircraft_iata_code varchar(3) NOT NULL,
  dep_airport_iata_code varchar(3) NOT NULL,
  dep_scheduled_time_local  datetime NOT NULL,
  dep_terminal_name varchar(128) NOT NULL,
  arr_airport_iata_code varchar(3) NOT NULL,
  arr_scheduled_time_local  datetime NOT NULL,
  arr_terminal_name varchar(128) NOT NULL,
  lastupdate timestamp(6),
  PRIMARY KEY (id)
);

  
INSERT INTO schedules (flightnumber,aircraft_iata_code,dep_airport_iata_code,dep_scheduled_time_local,dep_terminal_name,arr_airport_iata_code,arr_scheduled_time_local,arr_terminal_name,lastupdate) VALUES('GA231','320','FRA','2019-10-02 16:10:00','1','CDG','2019-10-02 17:18:00','2',NOW());
INSERT INTO schedules (flightnumber,aircraft_iata_code,dep_airport_iata_code,dep_scheduled_time_local,dep_terminal_name,arr_airport_iata_code,arr_scheduled_time_local,arr_terminal_name,lastupdate) VALUES('GA431','744','FRA','2019-10-01 09:00:00','1','PHX','2019-10-02 19:18:00','1',NOW());

