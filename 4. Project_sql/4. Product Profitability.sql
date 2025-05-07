---                    4. Product Profitability
---- (Highlighting the most profitable products driving sales growth)

/* QUESTION:
Which three products across different categories consistently generate the highest profit each year, and 
how can we optimize our product strategies, pricing, and inventory management to maximize their potential?
     */

/*
QUESTION OVERVIEW - 
1. Business Challenge:
The company offers a diverse range of products but lacks a structured approach to
consistently identify top-performing products based on profitability. Some products
generate higher profits than others, but without data-driven insights,
resource allocation, pricing, and inventory decisions are not optimized.

2. Objective of the Question:
This question aims to identify the top 3 most profitable products each year by
analyzing their sales, quantity, and order metrics. The insights derived will help the
company refine pricing strategies, optimize inventory, and enhance marketing efforts
to maximize profitability and sustain growth.

3. Analytical Approach:
•	Develop SQL queries to analyze year-over-year performance for each product.
•	Focus on key metrics: profitability, sales, quantity sold, order volume, average discount (in %), and profit margin (in %) for each top product. 
•	Provide data-driven recommendations to improve pricing, inventory, and marketing strategies for top-performing products.	
    */


WITH PYP AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS year,
        p.product_name,
		p.category,
        SUM(o.profit) AS total_profit,
        SUM(o.sales) AS total_sales,
		SUM(o.quantity) AS total_quantity,
	    COUNT(o.order_id) As total_orders_placed,
		ROUND(AVG(o.discount), 2) AS average_discount,
		ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_pct,
        ROUND(SUM(o.profit) / NULLIF(SUM(o.quantity), 0), 2) AS profit_per_unit
	FROM 
        staging_products p
    JOIN 
        staging_orders_2 o ON p.product_id = o.product_id
    GROUP BY 
        EXTRACT(YEAR FROM o.order_date), p.product_name, p.category
),
ranked_products AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY year ORDER BY total_profit DESC) AS RN
    FROM
        PYP
)
SELECT
    year,
	product_name,
	category,
    total_profit,
    total_sales,
	total_quantity,
	total_orders_placed,
	average_discount, 
	profit_margin_pct,
	profit_per_unit
FROM
    ranked_products
WHERE
    RN <= 3
ORDER BY
    year,
    total_profit DESC;
	

/*
Here's the breakdown of RESULT based on the QUERY above:

Year	 Product Name	                          Category	        Total Profit	 Total Sales	 Total Quantity	  Total Orders	 Avg. Discount	 Profit Margin %	 Profit per Unit
2020	Ibico EPK-21 Electric Binding System	 Office Supplies	   $4.63K	       $9.45K	          5	                 1	          0%	         49.00%          	$926.10
2020	Canon imageCLASS MF7460 Copier	         Technology            $1.99K	       $3.99K	          2	                 1	          0%	         50.00%	            $998.00
2020	Ativa V4110MDD Micro-Cut Shredder	     Technology	           $1.37K	       $2.79K	          4	                 1	          0%	         49.00%	            $343.00
2021	Fellowes PB500 Binding Machine	         Office Supplies	   $7.50K	      $15.76K	         13	                 4	          5%	         47.58%        	    $576.83
2021	Zebra ZM400 Thermal Label Printer	     Technology      	   $3.34K	       $6.97K	          6	                 2	          0%	         48.00%	            $557.26
2021	Canon PC1060 Personal Laser Copier	     Technology	           $2.68K	       $6.02K	          9              	 2	         10%	         44.53%	            $297.88
2022	Canon imageCLASS 2200 Copier	         Technology	           $9.52K	      $25.90K	          9	                 2	         20%	         36.76%   	       $1057.78
2022	GBC Ibimaster 500 Binding System	     Office Supplies	   $2.97K	      $12.86K	         26	                 4	         53%	         23.08%	            $114.15
2022	HP Designjet T520 Printer	             Technology	           $2.80K	       $8.75K	          5	                 1	          0%	         32.00%	            $560.00
2023	Canon imageCLASS 2200 Copier	         Technology	          $15.68K	      $35.70K	         11	                 3	          7%	         43.92%	           $1425.45
2023	Hewlett Packard LaserJet 3310 Copier	 Technology	           $3.62K	       $9.24K	         18	                 4	         15%	         39.22%         	$201.33
2023	GBC DocuBind TL300 Binding System	     Office Supplies	   $1.91K	      $10.94K	         19	                 5	         32%	         17.46%	            $100.56


INSIGHTS & TRENDS
1.  Technology Products Drive Profitability
•   Canon imageCLASS 2200 Advanced Copier (2022 & 2023) consistently tops profitability, showing strong and increasing demand.
•   Printers and copiers (Canon, HP, Zebra) dominate high-profit products yearly.

2.  Office Supplies Perform Well but Face Margin Declines
•   Ibico EPK-21 (2020) & Fellowes PB500 (2021) were highly profitable, proving strong demand for binding systems.
•   However, DocuBind TL300 (2023) saw a decline in profit margins (17.46%), suggesting increased competition or pricing challenges.

3.  Profitability Per Unit Matters
•   Canon imageCLASS 2200 (2023) had the highest per-unit profit ($1,425.45/unit), showing premium pricing potential.
•   Other high-profit-per-unit products (HP Designjet T520, Zebra ZM400) could benefit from targeted marketing and pricing optimization.

4.  Sales Growth Doesn’t Always Equal Profit Growth
•   While sales grew for Canon imageCLASS, profitability didn’t always scale at the same rate.
•   HP Designjet T520 (2022) had strong sales but a lower profit margin (32%), signaling potential pricing or cost inefficiencies.

5.  Orders vs. Profitability Disparity
•   High order volume doesn’t always translate to high profitability.
•   Canon imageCLASS & HP Designjet had fewer orders but high profitability, indicating a focus on high-value products over volume sales.

6.  Inventory & Demand Management
•   Canon imageCLASS 2200 (2022-2023) is on an upward trend, meaning stable stock availability is crucial to avoid missed sales.
•   GBC Ibimaster 500 had high sales but suffered from deep discounts, reducing overall profitability.

7.  Discounting Strategies Impact Margins
•   Fellowes PB500 (2021) sustained strong profitability despite a 5% discount, showing that strategic discounting can drive sales while protecting margins.
•   Canon PC1060 (2021) & GBC Ibimaster 500 (2022) had excessive discounts (10-53%), leading to reduced profit margins, indicating the need for better discount control.
     */