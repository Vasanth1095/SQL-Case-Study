-- Provide a report with all the unique product counts for each segment --
SELECT 
	segment, COUNT(product_code) AS product_count,
    ROUND(COUNT(product_code)*100/SUM(COUNT(product_code)) OVER(),2) AS Percentage_contribution
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC
 
