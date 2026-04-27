/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/
-- Which categories contribute the most to overall sales?

WITH category_sales AS 
( 
SELECT
p.category,
SUM(s.sales_amount) AS sales_category
FROM gold.fact_sales s 
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key 
GROUP BY p.category 
) 

SELECT 
*,
SUM(sales_category)OVER() AS total_sales,
CONCAT(ROUND(CAST(sales_category AS float)/SUM(sales_category)OVER()*100 ,2),'%') AS percentage
FROM category_sales 
ORDER BY sales_category
