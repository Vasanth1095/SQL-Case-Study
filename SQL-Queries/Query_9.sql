-- Which channel helped to bring more gross sales in the fiscal year 2021
-- and the percentage of contribution? 
-- The final output contains these fields, channel gross_sales_mln percentage
-- Another query using views has also been done
WITH cte_1 AS(
	SELECT c.channel,
		CONCAT(ROUND(SUM(sold_quantity*gross_price)/1000000,2), " M") AS Gross_sales_amount 
	FROM fact_sales_monthly AS s
	JOIN dim_customer AS c
		ON c.customer_code = s.customer_code
	join fact_gross_price AS g
		ON g.product_code = s.product_code AND
		   g.fiscal_year = s.fiscal_year
WHERE s.fiscal_year	 = 2021       
GROUP BY c.channel)

SELECT *,
	CONCAT(ROUND(gross_sales_amount*100/sum(gross_sales_amount) OVER(),2)," %") AS Percentage_contribution 
FROM cte_1
ORDER BY percentage_contribution DESC;

-- Another query using views has also been done

WITH cte_1 AS(
	SELECT c.channel,
		CONCAT(ROUND(SUM(gross_sales)/1000000,2), " M") AS Gross_sales_amount 
	FROM fact_gross_sales AS s
	JOIN dim_customer AS c
		ON c.customer_code = s.customer_code
WHERE s.fiscal_year	 = 2021       
GROUP BY c.channel)

SELECT *,
	CONCAT(ROUND(gross_sales_amount*100/sum(gross_sales_amount) OVER(),2)," %") AS Percentage_contribution 
FROM cte_1
ORDER BY percentage_contribution DESC
