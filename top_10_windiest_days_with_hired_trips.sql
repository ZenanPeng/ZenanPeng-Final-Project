
SELECT 
    DATE(daily_weather.date) as date,
    daily_weather.daily_average_wind_speed as daily_avg,
    COUNT(*)
FROM (
    SELECT pickup_datetime 
    FROM taxi_trips
    WHERE pickup_datetime BETWEEN '2014-01-01' AND '2014-12-31'
    UNION ALL
    SELECT pickup_datetime
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2014-01-01' AND '2014-12-31'
    ) AS hired_trips
INNER JOIN daily_weather
ON 
    DATE(hired_trips.pickup_datetime) = DATE(daily_weather.date)
WHERE 
    date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY 
    date
ORDER BY 
    daily_avg DESC
LIMIT 10 
