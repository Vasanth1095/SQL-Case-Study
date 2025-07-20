-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month .
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions.
-- The final report contains these columns: Month Year Gross sales Amount

SELECT MONTH(s.date) AS Month_no,monthname(s.date) AS Month_name, 
	   s.fiscal_year,CONCAT(ROUND(SUM(sold_quantity*gross_price)/100000,2), " L") AS Gross_sales_amount 
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
	ON c.customer_code = s.customer_code
JOIN fact_gross_price AS g
	ON g.product_code = s.product_code AND
	   g.fiscal_year = s.fiscal_year
WHERE c.customer = "Atliq Exclusive" 
GROUP BY Month_no , s.fiscal_year, Month_name   
ORDER BY s.fiscal_year;

-- Another query using views has also been done
SELECT MONTH(s.date) AS Month_no,monthname(s.date) AS Month_name, 
	   s.fiscal_year,sum(gross_sales)
FROM fact_gross_sales AS s
JOIN dim_customer AS c
	ON c.customer_code = s.customer_code
WHERE c.customer = "Atliq Exclusive" 
GROUP BY Month_no , s.fiscal_year, Month_name   
ORDER BY s.fiscal_year

    