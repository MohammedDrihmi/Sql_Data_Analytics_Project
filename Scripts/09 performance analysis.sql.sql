/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */


WITH yearly_product_perfomance AS (

SELECT 
	year(s.order_date) as order_date,
	p.product_name,
	SUM(s.sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
WHERE order_date is not null
GROUP BY year(s.order_date), p.product_name
)

SELECT 
	order_date,
	product_name,
	total_sales,
	-- Current vs average analysis 
	AVG(total_sales)OVER(PARTITION BY product_name) Average_product,
	LAG(total_sales)OVER(PARTITION BY product_name ORDER BY order_date) AS previous_year,
	total_sales - AVG(total_sales)OVER(PARTITION BY product_name) AS cuurent_vs_avg,
	CASE	 
		WHEN total_sales - AVG(total_sales)OVER(PARTITION BY product_name) > 0 Then 'ABOVE AVG'
		WHEN total_sales - AVG(total_sales)OVER(PARTITION BY product_name) < 0 THEN 'BELOW AVG'
		ELSE 'Avg'
	END avg_change,
	-- Year over year Analysis
	LAG(total_sales)OVER(PARTITION BY product_name ORDER BY order_date) py_year,
	total_sales - LAG(total_sales)OVER(PARTITION BY product_name ORDER BY order_date) AS current_vs_prev,
	CASE 
	WHEN total_sales - LAG(total_sales)OVER(PARTITION BY product_name ORDER BY order_date) > 0 THEN 'Increase'
	WHEN total_sales - LAG(total_sales)OVER(PARTITION BY product_name ORDER BY order_date) < 0 THEN 'Decrease'
	ELSE 'No change'
END yoy_variation
FROM yearly_product_perfomance