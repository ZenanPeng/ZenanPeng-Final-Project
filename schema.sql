
CREATE TABLE IF NOT EXISTS hourly_weather (
    id INTEGER PRIMARY KEY,
    Date DATE,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather (
    id INTEGER PRIMARY KEY,
    Date DATE,
    DailyPrecipitation FLOAT,
    DailyAverageWindSpeed FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    id INTEGER PRIMARY KEY,
    pickup_datetime DATE,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    tip_amount FLOAT,
    distance FLOAT
);

CREATE TABLE IF NOT EXISTS uber_trips (
    id INTEGER PRIMARY KEY,
    pickup_datetime DATE,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    distance FLOAT
    );
