-- I create the database here --
CREATE DATABASE IF NOT EXISTS airlinedb;

-- Then I use this database --
USE airlinedb;

-- I drop all tables first to avoid conflicts on re-run --
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS aircrafts;
DROP TABLE IF EXISTS customers;

-- I create the aircrafts table here --
CREATE TABLE aircrafts (
                           id          INT             PRIMARY KEY,
                           name        VARCHAR(100)    NOT NULL UNIQUE,
                           total_seats INT             NOT NULL CHECK (total_seats > 0)
);

-- I create the flights table here --
CREATE TABLE flights (
                         flight_number   VARCHAR(10)     PRIMARY KEY,
                         aircraft_id     INT             NOT NULL,
                         mileage         INT             NOT NULL CHECK (mileage > 0),
                         CONSTRAINT fk_aircraft FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);

-- I create the customers table here --
CREATE TABLE customers (
                           id              INT             PRIMARY KEY,
                           name            VARCHAR(150)    NOT NULL UNIQUE,
                           status          VARCHAR(20)     NOT NULL DEFAULT 'None'
                               CHECK (status IN ('None', 'Silver', 'Gold')),
                           total_mileage   INT             NOT NULL DEFAULT 0 CHECK (total_mileage >= 0)
);

-- I create the bookings table here --
CREATE TABLE bookings (
                          id              INT             PRIMARY KEY,
                          customer_id     INT             NOT NULL,
                          flight_number   VARCHAR(10)     NOT NULL,
                          CONSTRAINT fk_customer FOREIGN KEY (customer_id)   REFERENCES customers(id),
                          CONSTRAINT fk_flight   FOREIGN KEY (flight_number) REFERENCES flights(flight_number),
                          UNIQUE (customer_id, flight_number)
);

-- Then I add some data to the aircrafts table --
INSERT INTO aircrafts (id, name, total_seats) VALUES
                                                  (1, 'Boeing 747',  400),
                                                  (2, 'Airbus A330', 236),
                                                  (3, 'Boeing 777',  264);

-- Then I add some data to the flights table --
INSERT INTO flights (flight_number, aircraft_id, mileage) VALUES
                                                              ('DL143', 1, 1351),
                                                              ('DL122', 2, 4370),
                                                              ('DL53',  3, 2078),
                                                              ('DL222', 3, 1765),
                                                              ('DL37',  1, 531);

-- Then I add some data to the customers table --
INSERT INTO customers (id, name, status, total_mileage) VALUES
                                                            (1, 'Agustine Riviera',  'Silver', 115235),
                                                            (2, 'Alaina Sepulvida',  'None',   6008),
                                                            (3, 'Tom Jones',         'Gold',   205767),
                                                            (4, 'Sam Rio',           'None',   2653),
                                                            (5, 'Jessica James',     'Silver', 127656),
                                                            (6, 'Ana Janco',         'Silver', 136773),
                                                            (7, 'Jennifer Cortez',   'Gold',   300582),
                                                            (8, 'Christian Janco',   'Silver', 14642);

-- Then I add some data to the bookings table --
INSERT INTO bookings (id, customer_id, flight_number) VALUES
                                                          (1,  1, 'DL143'),
                                                          (2,  1, 'DL122'),
                                                          (3,  2, 'DL122'),
                                                          (4,  3, 'DL122'),
                                                          (5,  3, 'DL53'),
                                                          (6,  3, 'DL222'),
                                                          (7,  4, 'DL143'),
                                                          (8,  4, 'DL37'),
                                                          (9,  5, 'DL143'),
                                                          (10, 5, 'DL122'),
                                                          (11, 6, 'DL222'),
                                                          (12, 7, 'DL222'),
                                                          (13, 8, 'DL222');

-- I get all data from each table to verify the inserts --
SELECT * FROM aircrafts;
SELECT * FROM flights;
SELECT * FROM customers;
SELECT * FROM bookings;