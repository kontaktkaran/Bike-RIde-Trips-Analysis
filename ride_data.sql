use data_analysis_bike
-- Business Problem 1st Part--
-- Member Vs Casual--
  select 
     count(ride_id) as Total_Trips,
     member_casual
  from ride_data
  group by member_casual

  -- Bike types--
  select 
       count(ride_id) as Total_Trips,
       rideable_type
  from ride_data
  group by rideable_type

-- Business Problem 2nd Part-- 
  -- Business Problem-- 
  -- Find Peak_ hours , busy week-day , busiest_month
  select 
       datepart(hour,started_at) as Hour,
       count(ride_id) as total_trips
   from ride_data
   group by datepart(hour,started_at)
   order by datepart(hour,started_at) asc
   
   -- Trends over Month
   select 
        datepart(month,started_at) as Month,
       count(ride_id) as total_trips
   from ride_data
   group by datepart(month,started_at)
   order by datepart(month,started_at) asc
   -- Trends Over Week
    select 
        datepart(WEEKDAY,started_at) as day,
        count(ride_id) as total_trips
   from ride_data
   group by datepart(WEEKDAY,started_at)
   order by datepart(weekday,started_at) asc
   
   --- Trends over Trip Duraton--
WITH RideBuckets AS (
    SELECT 
        ride_id,
        CASE 
            WHEN DATEDIFF(minute, started_at, ended_at) BETWEEN 0 AND 30 THEN '0-0.5H'
            WHEN DATEDIFF(minute, started_at, ended_at) BETWEEN 31 AND 60 THEN '0.5-1H'
            WHEN DATEDIFF(minute, started_at, ended_at) BETWEEN 61 AND 120 THEN '1-2H'
            ELSE '2H+'
        END AS trip_duration
    FROM ride_data
)
SELECT trip_duration, COUNT(ride_id) AS total_trips
FROM RideBuckets
GROUP BY trip_duration
order by trip_duration asc 

-- Business Problem 3rd Part-  
  --Bikes are often picked up at one station but returned somewhere else,
  -- leaving some station empty and other and other overcrowed
  -- Bikes are often not available at busiest station

-- Identify Station with frequent start, frequent end and top paths which is prefferred most.
-- Top 10 Paths 
  select top 10
       start_station_name,end_station_name ,
       count(ride_id) as total_trips
  from ride_data
  where start_station_name <>'unknown' 
  and end_station_name <>'unknown'
  and start_station_name <> end_station_name
  group by start_station_name,end_station_name
  order by count(ride_id) desc

 -- Top 10 Starting Stations

  select top 10
      start_station_name,
      count(ride_id) as total_trips
  from ride_data
  where start_station_name <>'unknown' 
  group by start_station_name
  order by count(ride_id) desc

  -- Top 10 Ending Stations
  
  select top 10
     end_station_name,
  count(ride_id) as total_trips
  from ride_data
  where end_station_name <>'unknown' 
  group by end_station_name
  order by count(ride_id) desc

  -- Bottom 10 starting Station 
  
  select top 10
      start_station_name,
      count(ride_id) as total_trips
  from ride_data
  where start_station_name <>'unknown' 
  group by start_station_name
  order by count(ride_id) asc

-- Impact--
  -- High distribution costs(trucks moving bikes back to balance supply )
  -- Poor Customer experience if  a station runs out of bikes

  -- Business Action --
  -- optimize station placement , add docks where demand is high , reduce logistic costs. 
  -- Offer discounts or campaigns to boost usage at weak stations.






































































































































































































