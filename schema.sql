
CREATE TABLE IF NOT EXISTS hourly_weather (
    id INTEGER PRIMARY KEY,
    date DATE,
    hourly_precipitation FLOAT,
    hourly_wind_speed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather (
    id INTEGER PRIMARY KEY,
    date DATE,
    daily_average_wind_speed FLOAT
);

CREATE TABLE IF NOT EXISTS sun_weather (
    id INTEGER PRIMARY KEY,
    date DATE,
    sunrise DATE,
    sunset DATE
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
