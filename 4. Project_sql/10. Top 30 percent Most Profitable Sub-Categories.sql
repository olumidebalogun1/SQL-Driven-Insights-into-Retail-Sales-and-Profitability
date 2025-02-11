---                              Top 30% Most Profitable Sub-Categories
---- (Ranks Sub-Categories more comprehensively, using a percentage-based threshold instead of a fixed count)

/*
1. PROJECT OVERVIEW
💡 Business Challenge:
The company is experiencing profitability challenges due to fluctuating sales and high market competition.
Despite offering a broad range of products, only a subset of sub-categories significantly contributes to
overall profitability, while others underperform or fail to generate enough revenue.

🎯 Project Goal:
This project aims to identify the top 30% most profitable product sub-categories based on profit contribution, 
sales volume, and margin. The insights derived will help optimize resource allocation, product offerings, and sales strategies
for maximum profitability. Additionally, it will improve inventory planning, marketing focus, and overall business
efficiency by prioritizing high-performing sub-categories.

2. KEY BUSINESS QUESTION 
🔍 Business Question:
Which product subcategories across different categories contribute the most to our profitability,
and how can we focus on the top 30% to optimize sales and resource allocation?

🛠 Approach:
•	Write SQL queries to analyze the top 30% of the most profitable sub-categories based on performance trends.
•   Rank product sub-categories based on profit contribution, sales, order frequency, average discount (in %), and profit margin (in %).
•   Provide actionable recommendations for resource allocation and strategy optimization.	
*/

WITH profitable_sub_category AS (
    SELECT 
        p.sub_category,
		p.category,
        SUM(o.profit) AS total_profit,
        SUM(o.sales) AS total_sales,
        SUM(o.quantity) AS total_quantity,
		COUNT(o.order_id) As total_orders_placed,
		ROUND(AVG(o.discount), 2) AS average_discount,
		ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_pct,
        ROUND(SUM(o.profit) / NULLIF(SUM(o.quantity), 0), 2) AS profit_per_unit,
		CUME_DIST() OVER (ORDER BY SUM(o.profit)  DESC) AS cumulative_distribution
    FROM 
        staging_products p
    JOIN 
        staging_orders_2 o ON p.product_id = o.product_id
    GROUP BY 
        sub_category, p.category
    ORDER BY 
        total_profit DESC
)
SELECT 
    sub_category,
	category,
    total_profit,
    total_sales,
	total_quantity,
	total_orders_placed,
	average_discount,
	profit_margin_pct,
	profit_per_unit,
    CAST(cumulative_distribution AS NUMERIC(5,2))
FROM 
    profitable_sub_category
WHERE 
    cumulative_distribution <= 0.3
ORDER BY 
    total_profit DESC;

/*
Here's the breakdown of RESULT based on the QUERY above:

Sub-Category	Category	     Total Profit	 Total Sales	Total Quantity	 Total Orders Placed	 Avg. Discount	  Profit Margin %	 Profit per Unit	 Cumulative Distribution
Copiers	        Technology	       $55,617.90	 $149,528.01	     234	         68	                     16%	               37.2%	        $237.68	                 6%
Accessories	    Technology	       $48,290.40	 $192,565.73	   3,125	        814           	          8%	               25.08%	         $15.45	                12%
Phones	        Technology	       $46,936.74	 $356,702.42	   3,415	        925	                     16%	               13.16%	         $13.74	                18%
Paper	        Office Supplies    $36,824.10	  $84,786.16	   5,489	      1,454           	          8%	               43.43%	          $6.71	                24%
Binders	        Office Supplies	   $30,331.66	 $211,141.67	   6,113	      1,561	                     37%	               14.37%	          $4.96	                29%

🔎 INSIGHTS & TRENDS
1. Top Performers in Profit: 
•  The Copiers sub-category leads in total profit with $55.62K, followed by Accessories at $48.29K. These sub-categories are the most profitable, contributing significantly to the overall business success.

2. Profit Margin: 
•  Paper has the highest profit margin at 43.43%, indicating strong profitability despite lower total sales. The Phones sub-category, though generating significant sales, has a relatively lower margin at 13.16%.

3. Profit Per Unit: 
•  Copiers has the highest profit per unit at $237.68, which means each unit sold is contributing significantly to profit. In comparison, Binders and Phones have much lower profit per unit, at $4.96 and $13.74, respectively.

4. Volume-Driven Categories:
•  Accessories and Phones generate impressive total sales and volumes, but with lower margins and profit per unit (around $15.45 and $13.74 respectively).
•  These categories rely on volume rather than premium pricing to drive profit.

5. High Discounts and Lower Profitability:
•  Binders Have High Discounts (37%) and Lower Profitability despite high total sales. Discounts may be eating into profits, leading to low per-unit profit ($4.96) despite high sales volume (6,113 units).

6. Cumulative Profit Distribution:
•  The top 30% most profitable sub-categories (Copiers, Accessories, Phones) account for roughly 70% of total profit.
•  Binders and Paper contribute less to overall profit, despite high sales and order volumes.
*/