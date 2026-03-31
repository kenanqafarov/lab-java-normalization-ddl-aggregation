-- Aircrafts table
CREATE TABLE aircrafts (
                           aircraft_id   INT          PRIMARY KEY,
                           model         VARCHAR(50)  NOT NULL,
                           total_seats   INT          NOT NULL
);

-- Flights table
CREATE TABLE flights (
                         flight_id       INT         PRIMARY KEY,
                         flight_number   VARCHAR(10) NOT NULL UNIQUE,
                         aircraft_id     INT         NOT NULL,
                         flight_mileage  INT         NOT NULL,
                         CONSTRAINT fk_flight_aircraft
                             FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);

-- Customers table
CREATE TABLE customers (
                           customer_id     INT          PRIMARY KEY,
                           name            VARCHAR(100) NOT NULL,
                           status          VARCHAR(20)  NOT NULL DEFAULT 'None',
                           total_mileage   INT          NOT NULL DEFAULT 0
);

-- Bookings table
CREATE TABLE bookings (
                          booking_id    INT  PRIMARY KEY,
                          customer_id   INT  NOT NULL,
                          flight_id     INT  NOT NULL,
                          CONSTRAINT fk_booking_customer
                              FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                          CONSTRAINT fk_booking_flight
                              FOREIGN KEY (flight_id)   REFERENCES flights(flight_id),
                          CONSTRAINT uq_booking
                              UNIQUE (customer_id, flight_id)
);


-- Insert aircraft data
INSERT INTO aircrafts (aircraft_id, model, total_seats) VALUES
                                                            (1, 'Boeing 747',   400),
                                                            (2, 'Airbus A330',  236),
                                                            (3, 'Boeing 777',   264);

-- Insert flight data
INSERT INTO flights (flight_id, flight_number, aircraft_id, flight_mileage) VALUES
                                                                                (1, 'DL143', 1, 1351),
                                                                                (2, 'DL122', 2, 4370),
                                                                                (3, 'DL53',  3, 2078),
                                                                                (4, 'DL222', 3, 1765),
                                                                                (5, 'DL37',  1,  531);

-- Insert customer data
INSERT INTO customers (customer_id, name, status, total_mileage) VALUES
                                                                     (1, 'Agustine Riviera',  'Silver', 115235),
                                                                     (2, 'Alaina Sepulvida',  'None',     6008),
                                                                     (3, 'Tom Jones',         'Gold',   205767),
                                                                     (4, 'Sam Rio',           'None',     2653),
                                                                     (5, 'Jessica James',     'Silver', 127656),
                                                                     (6, 'Ana Janco',         'Silver', 136773),
                                                                     (7, 'Jennifer Cortez',   'Gold',   300582),
                                                                     (8, 'Christian Janco',   'Silver',  14642);

-- Insert booking data
INSERT INTO bookings (booking_id, customer_id, flight_id) VALUES (1, 1, 1),
                                                              (2, 1, 2),
                                                              (3, 2, 2),
                                                              (4, 3, 2),
                                                              (5, 3, 3),
                                                              (6, 3, 4),
                                                              (7, 4, 1),
                                                              (8, 4, 5),
                                                              (9, 5, 1),
                                                              (10, 5, 2),
                                                              (11, 6, 4),
                                                              (12, 7, 4),
                                                              (13, 8, 4);