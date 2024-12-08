
WITH rides_data AS (
    SELECT trip_distance
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2024-01-01' AND '2024-01-31'
    UNION ALL
    SELECT trip_miles AS trip_distance
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
),
ordered_distances AS (
    SELECT trip_distance
    FROM rides_data
    ORDER BY trip_distance
),
percentile AS (
    SELECT CAST((COUNT(*) - 1) * 0.95 AS INTEGER) AS position
    FROM ordered_distances
)
SELECT trip_distance AS p95_trip_distance
FROM ordered_distances
LIMIT 1
OFFSET (SELECT position FROM percentile);
