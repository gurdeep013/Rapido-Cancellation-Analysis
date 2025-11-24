CREATE DATABASE rapido_july2025;
USE rapido_july2025;

/*Create SQL TABLE STRUCTURE*/
CREATE TABLE rides (
    Booking_ID VARCHAR(50),
    Booking_Status VARCHAR(20),
    Booking_Value DECIMAL(10,2),
    Customer_ID VARCHAR(50),
    Driver_ID VARCHAR(50),
    Pickup_Location VARCHAR(50),
    Drop_Location VARCHAR(50),
    Ride_Distance_km DECIMAL(10,2),
    Ride_Time_min INT,
    Date DATE,
    Time TIME,
    Payment_Method VARCHAR(20),
    Platform_Fee DECIMAL(10,2),
    Driver_Earning DECIMAL(10,2),
    Customer_Rating DECIMAL(3,1),
    Driver_Rating DECIMAL(3,1),
    Cancelled_by_Customer INT,
    Cancelled_by_Driver INT,
    Incomplete_Rides INT,
    Incomplete_Rides_Reason VARCHAR(100),
    Total_Bookings INT,
    Canceled_Bookings INT,
    Canceled_Percentage DECIMAL(5,2),
    V_TAT INT,
    C_TAT INT,
    Vehicle_Type VARCHAR(10)
);

/*1. Total Rides, Revenue, Cancellations ( KPI Overview )*/
SELECT
    COUNT(*) AS Total_Rides,
    SUM(CASE WHEN Booking_Status = 'Completed' THEN Booking_Value ELSE 0 END) AS Total_Revenue,
    SUM(CASE WHEN Booking_Status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Rides,
    ROUND(100 * SUM(CASE WHEN Booking_Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Cancellation_Rate
FROM rides;

/*2. Customer Segmentation (One-time / Occasional / Frequent)*/
SELECT
    CASE 
        WHEN ride_count = 1 THEN 'One-time'
        WHEN ride_count BETWEEN 2 AND 5 THEN 'Occasional'
        ELSE 'Frequent'
    END AS Customer_Segment,
    COUNT(*) AS Num_Customers
FROM (
    SELECT Customer_ID, COUNT(*) AS ride_count
    FROM rides
    GROUP BY Customer_ID
) AS sub
GROUP BY Customer_Segment;

/*3. Cancellation by Customer vs Driver*/
SELECT
    SUM(Cancelled_by_Customer) AS Cancelled_By_Customer,
    SUM(Cancelled_by_Driver) AS Cancelled_By_Driver
FROM rides;

 /*4. Payment Method Distribution*/
SELECT 
    Payment_Method,
    COUNT(*) AS Ride_Count,
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM rides), 2) AS Percentage
FROM rides
GROUP BY Payment_Method;

/*5. Peak Hour Analysis*/
SELECT 
    HOUR(Time) AS Hour_of_Day,
    COUNT(*) AS Ride_Count
FROM rides
GROUP BY Hour_of_Day
ORDER BY Ride_Count DESC;

/*6. Pickup → Drop Location Matrix (Heatmap)*/
SELECT
    Pickup_Location,
    Drop_Location,
    COUNT(*) AS Rides
FROM rides
GROUP BY Pickup_Location, Drop_Location
ORDER BY Rides DESC;

/*7. Vehicle Type Performance*/
SELECT
    Vehicle_Type,
    ROUND(AVG(Ride_Distance_km), 2) AS Avg_Distance,
    ROUND(AVG(Ride_Time_min), 2) AS Avg_Time,
    ROUND(AVG(Booking_Value), 2) AS Avg_Fare
FROM rides
GROUP BY Vehicle_Type;

/* 8. Daily Revenue Trend (Time Series)*/
SELECT
    Date,
    SUM(Booking_Value) AS Daily_Revenue
FROM rides
WHERE Booking_Status = 'Completed'
GROUP BY Date
ORDER BY Date;

/*9. Incomplete Ride Reasons*/
SELECT
    Incomplete_Rides_Reason,
    COUNT(*) AS Num_Cases
FROM rides
WHERE Incomplete_Rides = 1
GROUP BY Incomplete_Rides_Reason
ORDER BY Num_Cases DESC;

/*10. Top Performing Drivers (Completion Rate)*/
SELECT
    Driver_ID,
    SUM(CASE WHEN Booking_Status='Completed' THEN 1 ELSE 0 END) AS Completed,
    COUNT(*) AS Total_Assigned,
    ROUND(100 * SUM(CASE WHEN Booking_Status='Completed' THEN 1 ELSE 0 END)/COUNT(*), 2) AS Completion_Rate
FROM rides
GROUP BY Driver_ID
ORDER BY Completion_Rate DESC
LIMIT 10;

