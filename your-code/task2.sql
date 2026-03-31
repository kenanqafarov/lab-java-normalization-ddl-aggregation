CREATE TABLE aircrafts (
                           aircraft_id   INT         PRIMARY KEY,
                           model         VARCHAR(50) NOT NULL,
                           total_seats   INT         NOT NULL
);

CREATE TABLE flights (
                         flight_number   VARCHAR(10) PRIMARY KEY,
                         aircraft_id     INT         NOT NULL,
                         flight_mileage  INT         NOT NULL,

                         CONSTRAINT fk_flight_aircraft
                             FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);

CREATE TABLE customers (
                           customer_id    INT          PRIMARY KEY,
                           name           VARCHAR(100) NOT NULL,
                           status         VARCHAR(20)  NOT NULL DEFAULT 'None',
                           total_mileage  INT          NOT NULL DEFAULT 0
);

CREATE TABLE bookings (
                          booking_id     INT         PRIMARY KEY,
                          customer_id    INT         NOT NULL,
                          flight_number  VARCHAR(10) NOT NULL,

                          CONSTRAINT fk_booking_customer
                              FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

                          CONSTRAINT fk_booking_flight
                              FOREIGN KEY (flight_number) REFERENCES flights(flight_number),

                          CONSTRAINT uq_booking
                              UNIQUE (customer_id, flight_number)
);

INSERT INTO aircrafts (aircraft_id, model, total_seats) VALUES
                                                            (1, 'Boeing 747',   400),
                                                            (2, 'Airbus A330',  236),
                                                            (3, 'Boeing 777',   264);

INSERT INTO flights (flight_number, aircraft_id, flight_mileage) VALUES
                                                                     ('DL143', 1, 1351),
                                                                     ('DL122', 2, 4370),
                                                                     ('DL53',  3, 2078),
                                                                     ('DL222', 3, 1765),
                                                                     ('DL37',  1,  531);

INSERT INTO customers (customer_id, name, status, total_mileage) VALUES
                                                                     (1, 'Agustine Riviera',  'Silver', 115235),
                                                                     (2, 'Alaina Sepulvida',  'None',     6008),
                                                                     (3, 'Tom Jones',         'Gold',   205767),
                                                                     (4, 'Sam Rio',           'None',     2653),
                                                                     (5, 'Jessica James',     'Silver', 127656),
                                                                     (6, 'Ana Janco',         'Silver', 136773),
                                                                     (7, 'Jennifer Cortez',   'Gold',   300582),
                                                                     (8, 'Christian Janco',   'Silver',  14642);

INSERT INTO bookings (booking_id, customer_id, flight_number) VALUES
                                                                  (1, 1, 'DL143'),
                                                                  (2, 1, 'DL122'),
                                                                  (3, 2, 'DL122'),
                                                                  (4, 3, 'DL122'),
                                                                  (5, 3, 'DL53'),
                                                                  (6, 3, 'DL222'),
                                                                  (7, 4, 'DL143'),
                                                                  (8, 4, 'DL37'),
                                                                  (9, 5, 'DL143'),
                                                                  (10,5, 'DL122'),
                                                                  (11,6, 'DL222'),
                                                                  (12,7, 'DL222'),
                                                                  (13,8, 'DL222');