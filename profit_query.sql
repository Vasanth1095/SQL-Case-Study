select mm_yy,fiscal_year,ns.product_code,customer_code,sold_quantity,
gross_sales,net_sales,round((manufacturing_cost*sold_quantity),2) AS total_manufacturing_cost,
round(gross_sales-(manufacturing_cost*sold_quantity),2) AS Profit
from net_sales_tb as ns
join fact_manufacturing_cost as mc
	on mc.product_code = ns.product_code AND
		mc.cost_year = ns.fiscal_year