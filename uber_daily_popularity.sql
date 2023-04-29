
SELECT 
    strftime('%w', pickup_datetime) AS day,
    COUNT(id) as popularity
FROM 
    uber_trips
WHERE
    pickup_datetime BETWEEN '2009-01-01' AND '2015-06-30'
GROUP BY
    day
ORDER BY
    popularity DESC
