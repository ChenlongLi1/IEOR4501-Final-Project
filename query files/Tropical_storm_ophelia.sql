
WITH all_rides AS (
    SELECT strftime('%Y-%m-%d %H:00:00', pickup_time) AS ride_hour
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2023-09-25 00:00:00' AND '2023-10-03 23:59:59'
    UNION ALL
    SELECT strftime('%Y-%m-%d %H:00:00', pickup_datetime) AS ride_hour
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2023-09-25 00:00:00' AND '2023-10-03 23:59:59'
),
hourly_ride_counts AS (
    SELECT 
        ride_hour,
        COUNT(*) AS total_rides
    FROM all_rides
    GROUP BY ride_hour
),
hourly_weather_with_rides AS (
    SELECT 
        strftime('%Y-%m-%d %H:00:00', date) AS weather_hour,
        SUM(hourlyprecipitation) AS total_precipitation,
        AVG(hourlywindspeed) AS avg_wind_speed,
        0 AS hourly_ride_counts
    FROM hourly_weather
    WHERE date BETWEEN '2023-09-25 00:00:00' AND '2023-10-03 23:59:59'
    GROUP BY weather_hour
)
SELECT 
    hourly_weather_with_rides.weather_hour,
    (hourly_weather_with_rides.hourly_ride_counts + COALESCE(hourly_ride_counts.total_rides, 0)) AS total_rides,
    hourly_weather_with_rides.total_precipitation,
    hourly_weather_with_rides.avg_wind_speed
FROM hourly_weather_with_rides
LEFT JOIN hourly_ride_counts
ON hourly_weather_with_rides.weather_hour = hourly_ride_counts.ride_hour
ORDER BY hourly_weather_with_rides.weather_hour ASC;

