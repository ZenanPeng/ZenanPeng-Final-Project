
WITH 
    RECURSIVE date_hour(hour) AS (
      SELECT '2012-10-22 00:00:00' AS hour
          UNION ALL
      SELECT datetime(hour, '+1 hour') 
      FROM date_hour
      WHERE hour < '2012-11-06 23:00:00'
      ),
      
    hired_trips AS (
        SELECT 
            datetime(strftime('%Y-%m-%d %H:00:00', pickup_datetime)) AS pickup_hour,
            COUNT(*) AS hourly_trips
        FROM (
            SELECT pickup_datetime
            FROM taxi_trips
            UNION ALL
            SELECT pickup_datetime
            FROM uber_trips
            )
        WHERE pickup_hour BETWEEN '2012-10-22 00:00:00' AND '2012-11-06 23:00:00'
        GROUP BY pickup_hour
        ),
      
    hurricane_weather AS (
        SELECT 
            datetime(strftime('%Y-%m-%d %H:00:00', date)) AS hourly_date,
            SUM(hourly_precipitation) AS total_precipitation,
            AVG(hourly_wind_speed) AS hourly_avg_wind_speed
        FROM hourly_weather
        WHERE hourly_date BETWEEN '2012-10-22 00:00:00' AND '2012-11-06 23:00:00'
        GROUP BY hourly_date
        )
        
SELECT 
    strftime('%Y-%m-%d %H', date_hour.hour),
    COALESCE(hired_trips.hourly_trips, 0),
    COALESCE(hurricane_weather.total_precipitation, 0),
    COALESCE(hurricane_weather.hourly_avg_wind_speed, 0)
FROM date_hour
LEFT JOIN 
    hired_trips ON date_hour.hour = hired_trips.pickup_hour
LEFT JOIN
    hurricane_weather ON date_hour.hour = hurricane_weather.hourly_date
ORDER BY
    hour ASC
