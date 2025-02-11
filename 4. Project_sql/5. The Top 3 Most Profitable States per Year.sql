---         The Top 3 Most Profitable States per Year
---- (Identifying key states driving profitability annually)

/*
1. PROJECT OVERVIEW
💡 Business Challenge:
The company has observed significant performance variations across 
different states but lacks a structured approach to identifying 
top-performing regions. Despite evenly distributed resources, there 
is no clear visibility into which states consistently drive the highest profits.

🎯 Project Goal:
This project aims to identifying the top 3 most profitable states each year,
enabling the business to optimize regional strategies, adjust inventory,
fine-tune pricing, and improve marketing efforts to maximize profitability.

2. KEY BUSINESS QUESTION 
🔍 Business Question:
Which three states consistently generate the highest profits year over year, and how can we focus
our resources and marketing efforts on these high-performing regions for sustainable growth?

🛠 Approach:
•	Write SQL queries to analyze year-over-year profitability trends by state.
•	Identify top-performing regions based on sales, profit, order volume , average discount (in %), and profit_margin (in %).
•	Provide data-driven recommendations to refine marketing, inventory allocation, and regional business strategies.	
*/

WITH SYP AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS year,
        l.state,
        SUM(o.profit) AS total_profit,
        SUM(o.sales) AS total_sales,
		SUM(o.quantity) AS total_quantity,
	    COUNT(o.order_id) As total_orders_placed,
		ROUND(AVG(o.discount), 2) AS average_discount,
	    ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_pct,
        ROUND(SUM(o.profit) / NULLIF(SUM(o.quantity), 0), 2) AS profit_per_unit 
    FROM
        staging_location l
    JOIN
        staging_orders_2 o ON l.postal_code = o.postal_code
    GROUP BY
        EXTRACT(YEAR FROM o.order_date),l.state
),
ranked_states AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY year ORDER BY total_profit DESC) AS RN
    FROM
        SYP
)
SELECT
    year,
	state,
    total_profit,
    total_sales,
	total_quantity,
	total_orders_placed,
	average_discount,
	profit_margin_pct,
	profit_per_unit
FROM
    ranked_states
WHERE
    RN <= 3
ORDER BY
    year,
    total_profit DESC;

/*
Here's the breakdown of RESULT based on the QUERY above:

Year	 State	     Total Profit	 Total Sales   Total Quantity	 Total Orders	 Avg. Discount	  Profit Margin %	  Profit per Unit
2020	New York	   $13.75K	       $64.79K	        746	             194	          6%	         21.22%	             $18.43
2020	California	   $13.49K	       $95.44K	       1584	             428	          7%	         14.14%	              $8.52
2020	Washington	    $6.61K	       $29.87K	        351     	      94	          7%	          22.12%	         $18.82
2021	New York	   $19.28K	       $80.32K	        966	             262	          5%	          24.00%	         $19.96
2021	California	   $14.58K	       $89.25K	       1519	             403	          7%	          16.34%	          $9.60
2021	Washington	    $5.33K	       $23.42K	        275	              75	          5%	          22.76%	         $19.38
2022	California	   $20.11K	      $133.29K	       2029	             535	          8%	          15.09%	          $9.91
2022	New York	   $16.64K	       $71.82K	       1191	             319	          6%	          23.17%	         $13.97
2022	Indiana	       $10.39K	       $25.46K	        134	              35	          0%	          40.79%	         $77.50
2023	California	   $29.65K	      $147.36K	       2673	             674	          7%	          20.12%	         $11.09
2023	New York	   $24.36K	       $93.92K	       1319      	     352	          5%	          25.93%	         $18.47
2023	Washington	   $17.26K	       $65.54K	        806	             215	          6%	          26.33%	         $21.41

🔎 INSIGHTS & TRENDS
1.  Consistently High-Performing States:
•   New York and California have consistently ranked in the top 2 in profitability every year (2020-2023).
•   Washington also appears frequently but with slightly lower total profits than New York and California.

2.  New York Leads in Profit Margins:
•   New York's profit margin has grown from 21.22% in 2020 to 25.93% in 2023, indicating strong pricing power and profitability growth.
•   Washington has high profit margins (26.33% in 2023) but lower total sales, meaning it has strong profitability per unit but lower market penetration.

3.  California Dominates Sales but Not Margins:
•   California has the highest total sales volume each year, reaching $147.36K in 2023.
•   However, its profit margins remain relatively lower (~14-20%), suggesting a focus on high sales volume but lower profit efficiency.

4.  Indiana’s Surprising Profitability Spike in 2022:
•   Indiana had an exceptionally high profit margin (40.79%) in 2022, despite lower sales and order volume.
•   This suggests high-margin products were sold in Indiana that year, but it did not continue into 2023.

5.  Discounting Strategies and Their Impact:
•   New York keeps discounts low (~5-6%) while increasing profitability.
•   California applies higher discounts (~7-8%) but still maintains the highest sales volume.
*/