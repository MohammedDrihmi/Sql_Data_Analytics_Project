/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

/* Segment products into cost ranges and count how many products fall into each segment */ 

WITH cost_segment AS (
SELECT
product_key,
product_name,
CASE 
	WHEN product_cost < 100 THEN 'Below 100 ' 
	WHEN product_cost < 500 THEN '100 -500 '
	WHEN product_cost < 1000 THEN '500 -1000 '
	ELSE 'Above 1000'
END cost_segmentation
FROM gold.dim_products ) 

SELECT 
cost_segmentation,
COUNT(DISTINCT product_key) AS number_products
FROM cost_segment 
GROUP BY cost_segmentation
ORDER BY number_products DESC

/* 
Group customers in three segmenets based on their spending behavior 
- VIP : Customer with at least 12 months and spending more than 5000 
- Regular : Customer with at least 10 months and spending less or equal to 5000
- New : Customers with a lifespan less than 12 months
Add the number of customer on each segment 
*/
-- First we should calculate the lifespan ( Duration between first(MIN)and last order(MAX)) + total spending

WITH lifespan AS (
SELECT 
customer_key,
SUM(sales_amount) AS total_sales,
DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) AS lifespans
FROM gold.fact_sales
GROUP BY customer_key )

SELECT 
COUNT(customer_key) AS Number_of_customer,
customer_segment 
FROM (
SELECT 
customer_key,
CASE 
	WHEN lifespans >= 12 AND total_sales > 5000 THEN 'VIP'
	WHEN lifespans >= 12 AND total_sales <= 5000 THEN 'REGULAR'
	ELSE 'New Customers'
END customer_segment
FROM lifespan  ) t 
GROUP BY customer_segment