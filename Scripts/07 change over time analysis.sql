/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATETRUNC()
    - Aggregate Functions: SUM(), COUNT()
===============================================================================
*/


SELECT 
DATETRUNC(YEAR,Order_date) AS order_year,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS number_of_customer,
SUM(quantity) AS Items_sold
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP BY DATETRUNC(YEAR,Order_date)
ORDER BY DATETRUNC(YEAR,Order_date)

-- Change over month : total sales per month
SELECT 
MONTH(order_date) AS order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS number_of_customer,
SUM(quantity) AS Items_sold
FROM gold.fact_sales 
WHERE order_date IS NOT NULL 
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)


-- sesonality by combining both year and month 
SELECT 
DATETRUNC(MONTH,order_date)	AS date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS #_of_customer,
SUM(quantity) AS items_sold
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP BY DATETRUNC (MONTH,order_date)
ORDER BY DATETRUNC(MONTH,order_date) 