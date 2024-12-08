
DROP TABLE IF EXISTS hourly_weather;
CREATE TABLE IF NOT EXISTS hourly_weather (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME NOT NULL,
    hourlyprecipitation FLOAT,
    hourlywindspeed FLOAT,
    dailysnowfall FLOAT
);

DROP TABLE IF EXISTS daily_weather;
CREATE TABLE IF NOT EXISTS daily_weather (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE NOT NULL,
    average_precipitation FLOAT,
    average_wind_speed FLOAT,
    total_snowfall FLOAT
);

DROP TABLE IF EXISTS taxi_trips;
CREATE TABLE IF NOT EXISTS taxi_trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pickup_time DATETIME NOT NULL,
    dropoff_time DATETIME NOT NULL,
    trip_distance FLOAT,
    pick_up_location INT,
    drop_off_location INT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    congestion_surcharge FLOAT,
    airport_fee FLOAT,
    pick_up_lat FLOAT,
    pick_up_lon FLOAT,
    drop_off_lat FLOAT,
    drop_off_lon FLOAT
);

DROP TABLE IF EXISTS uber_trips;
CREATE TABLE IF NOT EXISTS uber_trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    uber_license_num STRING,
    pickup_datetime DATETIME NOT NULL,
    dropoff_datetime DATETIME NOT NULL,
    pick_up_location INT,
    drop_off_location INT,
    trip_miles FLOAT,
    sales_tax FLOAT,
    congestion_surcharge FLOAT,
    airport_fee FLOAT,
    tips FLOAT,
    driver_pay FLOAT,
    base_passenger_fare FLOAT,
    tolls FLOAT,
    trip_duration FLOAT,
    pick_up_lat FLOAT,
    pick_up_lon FLOAT,
    drop_off_lat FLOAT,
    drop_off_lon FLOAT
  
);
