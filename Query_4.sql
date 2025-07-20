-- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? --
-- The final output contains these fields, segment product_count_2020 product_count_2021 difference --

SELECT 
	segment, Unique_products_2020, Unique_products_2021,
    Unique_products_2021-Unique_products_2020 AS product_difference,
    ROUND((Unique_products_2021-Unique_products_2020) * 100 / Unique_products_2020,2)  AS Percentage_increase
FROM(
  SELECT 
	p.segment,
    COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN f.product_code END) AS Unique_products_2020,
    COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN f.product_code END) AS Unique_products_2021
  FROM fact_sales_monthly AS f
  JOIN dim_product AS p
  ON f.product_code = p.product_code
  GROUP BY segment) AS sub
ORDER BY percentage_increase DESC