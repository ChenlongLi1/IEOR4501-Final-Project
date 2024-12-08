
WITH all_rides_2023 AS (
    SELECT DATE(pickup_time) AS ride_date
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2023-01-01' AND '2023-12-31'
    UNION ALL
    SELECT DATE(pickup_datetime) AS ride_date
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
),
daily_ride_counts AS (
    SELECT 
        ride_date,
        COUNT(*) AS total_rides
    FROM all_rides_2023
    GROUP BY ride_date
),
daily_avg_distance AS (
    SELECT 
        DATE(pickup_time) AS ride_date,
        AVG(trip_distance) AS avg_distance
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY DATE(pickup_time)
    UNION ALL
    SELECT 
        DATE(pickup_datetime) AS ride_date,
        AVG(trip_miles) AS avg_distance
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY DATE(pickup_datetime)
),
busiest_days AS (
    SELECT 
        daily_ride_counts.ride_date,
        daily_ride_counts.total_rides,
        grouped_avg_distance.avg_distance
    FROM daily_ride_counts
    JOIN (
        SELECT daily_avg_distance.ride_date, AVG(daily_avg_distance.avg_distance) AS avg_distance
        FROM daily_avg_distance
        GROUP BY daily_avg_distance.ride_date
    ) grouped_avg_distance
    ON daily_ride_counts.ride_date = grouped_avg_distance.ride_date
    ORDER BY daily_ride_counts.total_rides DESC
    LIMIT 10
)
SELECT 
    busiest_days.ride_date,
    busiest_days.total_rides,
    busiest_days.avg_distance,
    daily_weather.average_precipitation,
    daily_weather.average_wind_speed
FROM busiest_days
LEFT JOIN daily_weather
ON busiest_days.ride_date = daily_weather.date
ORDER BY busiest_days.total_rides DESC;

