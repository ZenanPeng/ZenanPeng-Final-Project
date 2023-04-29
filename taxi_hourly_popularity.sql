
SELECT 
    strftime('%H', pickup_datetime) AS hour,
    COUNT(id) AS popularity
FROM 
    taxi_trips
WHERE
    pickup_datetime BETWEEN '2009-01-01' AND '2015-06-30'
GROUP BY
    hour
ORDER BY
    popularity DESC
