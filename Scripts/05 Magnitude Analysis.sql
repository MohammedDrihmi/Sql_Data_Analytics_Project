/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/

-- Compare the measure value by categories (Dimensions) :

-- Total customers by country 
SELECT 
country,
COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY COUNT(customer_key) DESC;

-- Total customers by gender 
SELECT 
gender,
COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY COUNT(customer_key) DESC;

-- total products by category 
SELECT 
Category,
COUNT(DISTINCT product_name ) AS total_products
FROM gold.dim_products
GROUP BY category
ORDER BY COUNT(DISTINCT product_name ) DESC;

-- average costs in each category 
SELECT 
category,
AVG(product_cost) AS avg_cost 
FROM gold.dim_products
GROUP BY category
ORDER BY AVG(product_cost) DESC;

-- total revenue per customer

SELECT 
c.customer_key,
c.first_name,
c.last_name,
SUM(s.sales_amount) AS total_sales
FROM gold.fact_sales s 
LEFT JOIN gold.dim_customers c 
ON  s.customer_key = c.customer_key
GROUP BY c.customer_key,
c.first_name,
c.last_name
ORDER BY SUM(s.sales_amount) DESC;


-- distribution of sold items per COUNTRIES
SELECT 
c.country,
SUM(s.quantity) AS total_items
FROM gold.fact_sales s 
LEFT JOIN gold.dim_customers c 
ON s.customer_key = c.customer_key
GROUP BY c.country  
ORDER BY SUM(s.quantity) DESC
