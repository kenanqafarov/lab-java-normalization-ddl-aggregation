-- 1. Total number of flights
SELECT COUNT(DISTINCT flight_number) FROM flights;


-- 2. Average flight distance
SELECT AVG(flight_mileage) FROM flights;


-- 3. Average number of seats per aircraft
SELECT AVG(total_seats) FROM aircrafts;


-- 4. Average miles flown by customers, grouped by status
SELECT status, AVG(total_mileage)
FROM customers
GROUP BY status;


-- 5. Max miles flown by customers, grouped by status
SELECT status, MAX(total_mileage)
FROM customers
GROUP BY status;


-- 6. Number of aircrafts with "Boeing" in their name
SELECT COUNT(*)
FROM aircrafts
WHERE model LIKE '%Boeing%';


-- 7. Flights with distance between 300 and 2000 miles
SELECT *
FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;


-- 8. Average flight distance booked, grouped by customer status
SELECT c.status, AVG(f.flight_mileage)
FROM bookings b
         JOIN customers c ON b.customer_id = c.customer_id
         JOIN flights f ON b.flight_id = f.flight_id
GROUP BY c.status;


-- 9. Most booked aircraft among Gold status members
SELECT a.model, COUNT(*) AS total_bookings
FROM bookings b
         JOIN customers c ON b.customer_id = c.customer_id
         JOIN flights f ON b.flight_id = f.flight_id
         JOIN aircrafts a ON f.aircraft_id = a.aircraft_id
WHERE c.status = 'Gold'
GROUP BY a.model
ORDER BY total_bookings DESC
    LIMIT 1;