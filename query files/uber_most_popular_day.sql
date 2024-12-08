
SELECT
    STRFTIME('%w', pickup_datetime) AS day_of_week,
    COUNT(*) AS trip_count
FROM
    uber_trips
GROUP BY
    day_of_week
ORDER BY
    trip_count DESC;
