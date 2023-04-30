
WITH hired_trips AS (
    SELECT pickup_datetime, distance
    FROM taxi_trips
    WHERE pickup_datetime BETWEEN '2009-01-01' AND '2009-12-31'
    UNION ALL
    SELECT pickup_datetime, distance
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2009-01-01' AND '2009-12-31'
    )
SELECT 
    DATE(pickup_datetime) as date, 
    COUNT(*) as total_number, 
    AVG(distance) as avg_distance
FROM hired_trips
GROUP BY date
ORDER BY total_number DESC
LIMIT 10
