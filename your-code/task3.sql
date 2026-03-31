-- I use the airline database here --
USE airlinedb;

-- I get the total number of distinct flights here --
SELECT COUNT(DISTINCT flight_number) AS total_flights
FROM flights;

-- I get the average flight distance here --
SELECT AVG(mileage) AS avg_flight_distance
FROM flights;

-- I get the average number of seats per aircraft here --
SELECT AVG(total_seats) AS avg_seats_per_aircraft
FROM aircrafts;

-- I get the average mileage of customers grouped by status here --
SELECT
    status,
    AVG(total_mileage) AS avg_mileage
FROM customers
GROUP BY status;

-- I get the max mileage of customers grouped by status here --
SELECT
    status,
    MAX(total_mileage) AS max_mileage
FROM customers
GROUP BY status;

-- I count the aircraft that have Boeing in their name here --
SELECT COUNT(*) AS boeing_aircraft_count
FROM aircrafts
WHERE name LIKE '%Boeing%';

-- I get all flights with mileage between 300 and 2000 here --
SELECT *
FROM flights
WHERE mileage BETWEEN 300 AND 2000;

-- I get the average booked flight distance grouped by customer status here --
SELECT
    c.status,
    AVG(f.mileage) AS avg_booked_distance
FROM bookings b
         JOIN customers c ON b.customer_id   = c.id
         JOIN flights   f ON b.flight_number = f.flight_number
GROUP BY c.status;

-- I get the most booked aircraft among Gold customers here --
SELECT
    a.name       AS aircraft,
    COUNT(*)     AS total_bookings
FROM bookings b
         JOIN customers c ON b.customer_id   = c.id
         JOIN flights   f ON b.flight_number = f.flight_number
         JOIN aircrafts a ON f.aircraft_id   = a.id
WHERE c.status = 'Gold'
GROUP BY a.name
ORDER BY total_bookings DESC
    LIMIT 1;