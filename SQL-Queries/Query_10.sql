-- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields, division product_code product total_sold_quantity rank_order
WITH cte_1 AS (
	SELECT p.division,s.product_code,p.product,
		SUM(sold_quantity) AS Total_sold_quantity,
		RANK() OVER(PARTITION BY division ORDER BY SUM(sold_quantity) DESC) AS Rk    
	FROM fact_sales_monthly AS s 
	JOIN dim_product AS p
		ON p.product_code = s.product_code
	WHERE s.fiscal_year = 2021    
	GROUP BY s.product_code,p.product,p.division)
    
SELECT * FROM cte_1 WHERE rk<4
    