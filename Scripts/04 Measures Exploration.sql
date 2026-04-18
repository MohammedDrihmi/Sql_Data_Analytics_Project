/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG(), UNION ALL
===============================================================================
*/

-- calculate & explore the big number metric using aggregation functions 
-- Find the total sales 
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales 

-- Find how many items sold
SELECT SUM(quantity) AS total_items_sold FROM gold.fact_sales 

-- find average selling price 
SELECT AVG(price) AS Average_price FROM gold.fact_sales 

-- find Price standard deviation
SELECT STDEV(price) AS price_variability FROM gold.fact_sales 

-- total number of orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT( DISTINCT order_number) Unique_total_orders FROM gold.fact_sales

-- total number of products
SELECT COUNT( product_key) As total_products FROM gold.dim_products
SELECT COUNT(DISTINCT product_key) As total_products FROM gold.dim_products

-- total number of customers 
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers 
SELECT COUNT(DISTINCT customer_key ) AS Total_unique_customers FROM gold.dim_customers 

-- total number of customers that has placed an order 
SELECT COUNT (DISTINCT customer_key) AS customers_with_order FROM gold.fact_sales


-- GENERATE A REPORT THAT REGROUP ALL THIS METRICS USING  UNION ALL 
SELECT 'Total_sales' AS measure_name, SUM(sales_amount) AS Measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total_items' AS measure_name, SUM(quantity) AS Measure_Value FROM gold.fact_sales
UNION ALL
SELECT 'Average_price' AS measure_name, AVG(price) AS Measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'Total_orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'Total_products' measure_name, COUNT(DISTINCT product_key) as measure_value FROM gold.dim_products
UNION ALL 
SELECT 'Total customers' AS measure_name, COUNT(DISTINCT customer_key) as measure_value FROM gold.dim_customers
UNION ALL 
SELECT 'Total customers with order' AS measure_name, COUNT(DISTINCT customer_key) as measure_value FROM gold.fact_sales