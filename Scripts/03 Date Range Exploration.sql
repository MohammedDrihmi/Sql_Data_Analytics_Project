/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Find the earliest and lastest Order date in date column 
-- find the duration( difference between them )  

SELECT
    MIN(order_date) AS earliest_date,
    MAX(order_date) AS lastest_date,
    DATEDIFF(MONTH, MIN(order_date),MAX(order_date)) AS diff
FROM gold.fact_sales

-- Find the youngest & oldest customers :

SELECT 

MIN(BIRTHDATE) AS oldest,
MAX(BIRTHDATE)as youngest,
DATEDIFF(YEAR,MIN(BIRTHDATE),GETDATE()) AS oldest_age,
DATEDIFF(YEAR,MAX(BIRTHDATE),GETDATE()) AS youngest_age
FROM gold.dim_customers