-- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct 
-- for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields, customer_code customer average_discount_percentage

SELECT f.customer_code,c.customer,c.market,pre_invoice_discount_pct 
FROM fact_pre_invoice_deductions AS f
JOIN dim_customer AS c 
	ON c.customer_code = f.customer_code
WHERE fiscal_year = 2021 AND c.market = "India"
ORDER BY pre_invoice_discount_pct DESC
LIMIT 5