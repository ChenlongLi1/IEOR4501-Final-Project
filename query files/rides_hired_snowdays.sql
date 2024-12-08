
WITH all_rides AS (
    SELECT DATE(pickup_time) AS ride_date
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2020-01-01' AND '2024-08-31'
    UNION ALL
    SELECT DATE(pickup_datetime) AS ride_date
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
),
daily_ride_counts AS (
    SELECT 
        ride_date,
        COUNT(*) AS total_rides
    FROM all_rides
    GROUP BY ride_date
),
snow_days AS (
    SELECT 
        date AS snow_date,
        total_snowfall
    FROM daily_weather
    WHERE total_snowfall > 0 AND date BETWEEN '2020-01-01' AND '2024-08-31'
),
snowiest_days AS (
    SELECT 
        snow_date,
        total_snowfall
    FROM snow_days
    ORDER BY total_snowfall DESC
    LIMIT 10
)
SELECT 
    snowiest_days.snow_date,
    snowiest_days.total_snowfall,
    COALESCE(daily_ride_counts.total_rides, 0) AS total_rides
FROM snowiest_days
LEFT JOIN daily_ride_counts
ON snowiest_days.snow_date = daily_ride_counts.ride_date
ORDER BY snowiest_days.total_snowfall DESC;
