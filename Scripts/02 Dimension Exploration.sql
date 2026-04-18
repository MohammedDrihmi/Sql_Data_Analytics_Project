
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Retrieve a list of unique countries from which customers originate

SELECT DISTINCT country
FROM gold.dim_customers

-- Explore all cateogries 'the major division":

SELECT DISTINCT  category
FROM gold.dim_products

-- Explore all categories with their subcategories : 

SELECT DISTINCT category,subcategory 
FROM gold.dim_products 

-- Explore the big picture of products ( cat,subcat, and products)

SELECT DISTINCT category,subcategory,product_name
FROM gold.dim_products
