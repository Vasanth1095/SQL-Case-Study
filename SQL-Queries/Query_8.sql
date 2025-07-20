-- In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the total_sold_quantity, Quarter total_sold_quantity

-- 1st query using UDF
explain analyze
SELECT 
	get_quarter(date) AS quarters,
    CONCAT(ROUND(SUM(sold_quantity)/100000,2)," L") AS total_sold_qty
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quarters  ;

-- Optimized query
explain analyze
SELECT 
	CASE
	  WHEN MONTH(date) IN (9,10,11) THEN "Q1"
      WHEN MONTH(date) IN (12,1,2) THEN "Q2"
      WHEN MONTH(date) IN (3,4,5) THEN "Q3"
      ELSE "Q4"
    END AS Quarters,
    CONCAT(ROUND(SUM(sold_quantity)/100000,2)," L") AS total_sold_qty
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quarters    
