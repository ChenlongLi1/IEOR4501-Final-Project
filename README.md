# IEOR4501-Final-Project

## Group Name: Group 13

## UNIs: [cl4589, dz2564]

## NYC Hired Rides Data Analysis Project

This project provides analysis of NYC taxi and Uber rides data from January 2020 to August 2024. 

## What we have implemented

1. Part 1: Cleaning raw datasets.
2. Part 2: Storing cleaned data in an SQLite database.
3. Part 3: Analytical queries for data analysis.
4. Part 4: Visualizing the results for better understanding.


### 1. Data Cleaning
The raw data is cleaned by:
- Remove all unnecessary columns that will not be use for part 3 and part 4.
- Remove All location outside of (40.560445, -74.242330) and (40.908524, -73.717047) region.
- Remove all rows with invalid location id. (ID not included in the zone id table).
- Remove all rows with negative trip durations. (We only want to keep trips that actually happened).
- Remove all rows with null values in all columns. (For only required columns of Taxi and Uber data).
- Sampling data.
- Normalize column naming and formatting.

### 2. Data Storage
- Cleaned data is stored in an SQLite database.
- Four tables are created:
  - `taxi_trips`
  - `uber_trips`
  - `hourly_weather`
  - `daily_weather`
- Each table is defined using an SQL schema stored in `schema.sql`.

### 3. Data Understanding
Questions about the data using SQL queries:
1. Most popular hour for taking a taxi.
2. Most popular day for hiring an Uber.
3. 95% percentile of trip distances in January 2024.
4. Weather of busiest day in 2023.
5. Number of rides hired in snowday.
6. Questions about the data base on Tropical Storm Ophelia.

### 4. Data Visualization
Six visualizations are created to deeper understanding the Data
