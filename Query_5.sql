-- Get the products that have the highest and lowest manufacturing costs. --
-- The final output should contain these fields, product_code product manufacturing_cost --

WITH cte_1 AS(
	SELECT product_code, manufacturing_cost
	FROM fact_manufacturing_cost 
    WHERE manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
    OR manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost))

SELECT c.product_code, d.product, c.manufacturing_cost 
FROM cte_1 AS c
JOIN dim_product AS d
	 ON d.product_code = c.product_code
ORDER BY manufacturing_cost DESC