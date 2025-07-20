-- What is the percentage of unique product increase --
		-- in 2021 vs. 2020? --
SELECT 
  unique_products_2020,
  unique_products_2021,
  ROUND ((unique_products_2021 - unique_products_2020) * 100.0 / unique_products_2020, 2) AS "2021vs2020"
FROM (
  SELECT 
    COUNT(DISTINCT CASE WHEN fiscal_year = '2020' THEN product_code END) AS unique_products_2020,
    COUNT(DISTINCT CASE WHEN fiscal_year = '2021' THEN product_code END) AS unique_products_2021
  FROM fact_sales_monthly
) AS sub
