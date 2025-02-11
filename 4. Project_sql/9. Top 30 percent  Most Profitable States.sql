---                                Top 30% Most Profitable States
----  (Ranking states more comprehensively, using a percentage-based threshold instead of a fixed count)

/*
1. PROJECT OVERVIEW
💡 Business Challenge:
The company operates across multiple states, but profitability varies significantly. Some states 
outperform others in terms of profit, order volume, and sales, while others lag behind.

🎯 Project Goal:
This project aims to identify the top 30% of the most profitable states based on profit
contribution, sales volume, and order frequency. The insights derived will help optimize marketing
efforts, resource allocation, and sales strategies to maximize profitability in
high-performing states while enhancing performance in underperforming regions.

2. KEY BUSINESS QUESTION 
🔍 Business Question:
Which states contribute the most to our profitability, and how can we
focus on the top 30% to maximize sales, orders, and resource allocation?

🛠 Approach:
•	Write SQL queries to analyze the top 30% of the most profitable states based on performance trends.
•   Rank states based on profit contribution, sales, order frequency, average discount (in %), and profit margin (in %).
•   Provide actionable recommendations for resource allocation and strategy optimization.
*/

WITH profitable_state AS (
    SELECT 
        l.state,
        SUM(o.profit) AS total_profit,
        SUM(o.sales) AS total_sales,
        SUM(o.quantity) AS total_quantity,
		COUNT(o.order_id) As total_orders_placed,
		ROUND(AVG(o.discount), 2) AS average_discount,
	    ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_pct,
        ROUND(SUM(o.profit) / NULLIF(SUM(o.quantity), 0), 2) AS profit_per_unit,
		CUME_DIST() OVER (ORDER BY SUM(o.profit)  DESC) AS cumulative_distribution
    FROM 
        staging_location l
    JOIN 
        staging_orders_2 o ON l.postal_code = o.postal_code
    GROUP BY 
        state
    ORDER BY 
        total_profit DESC
)
SELECT 
    state,
    total_profit,
    total_sales,
	total_quantity,
	total_orders_placed,
	average_discount,
	profit_margin_pct,
	profit_per_unit,
    CAST(cumulative_distribution AS NUMERIC(5,2))
FROM 
    profitable_state
WHERE 
    cumulative_distribution <= 0.3
ORDER BY 
    total_profit DESC;
	
/*
Here's the breakdown of RESULT based on the QUERY above:

 State	        Total Profit	 Total Sales	 Total Quantity	 Total Orders Placed	 Avg. Discount	 Profit Margin %	 Profit per Unit	 Cumulative Distribution
California	     $77.84K	      $465.33K	       7,805	         2,040	                  7%	          16.73%	          $9.97                	2%
New York	     $74.03K	      $310.85K	       4,222	         1,127	                  6%	          23.81%	         $17.53                	4%
Washington	     $33.40K	      $138.64K	       1,883	           506	                  6%	          24.09%	         $17.74                	6%
Michigan	     $24.46K	      $76.27K	         946	           255	                  1%	          32.07%	         $25.86	                    8%
Virginia	     $18.51K	      $70.35K	         890	           223	                  0%	          26.32%	         $20.80	                   10%
Indiana       	 $18.38K	      $53.56K	         578	           149	                  0%	          34.33%	         $31.80	                   12%
Georgia	         $16.25K	      $49.10K	         705	           184	                  0%	          33.10%	         $23.05	                   14%
Kentucky	     $13.40K	      $45.43K	         567	           149	                  0%	          29.50%	         $23.64	                   16%
Minnesota	     $10.82K	      $29.86K	         331	            89	                  0%	          36.24%	         $32.70	                   18%
Delaware	      $9.98K	      $27.45K	         367	            96	                  1%	          36.35%	         $27.19	                   20%
New Jersey	      $9.77K	      $35.76K	         454	           130	                  0%	          27.33%	         $21.53	                   22%
Wisconsin	      $8.40K	      $32.11K	         463	           110	                  0%	          26.16%	         $18.15	                   24%
Rhode Island	  $7.29K	      $22.63K	         199	            56	                  2%	          32.20%	         $36.61	                   26%
Massachusetts	  $6.79K	      $28.63K	         491	           135	                  2%	          23.70%	         $13.82	                   28%
Maryland	      $6.56K	      $22.07K	         411	           104	                  1%	          29.71%	         $15.96	                   30%

🔎 INSIGHTS & TRENDS
1.	Top 5 Most Profitable States (Top 30%)
• 	California leads with $77.84K in profit and the highest sales volume ($465.33K), showing strong market demand.
• 	New York follows closely with $74.03K in profit but achieves it with lower sales ($310.85K), meaning higher profit efficiency (profit margin: 23.81%).
• 	Washington ranks third with $33.40K profit and a strong 24.09% margin, indicating profitability despite lower sales.
• 	Michigan and Virginia complete the top 5, with high profit margins (32.07% and 26.32%), suggesting cost efficiency and strong pricing strategies.

2.	Profit Efficiency vs. total Sales 
• 	Indiana (34.33%) and Minnesota (36.24%) have some of the highest profit margins, meaning they generate more profit per dollar of sales.
• 	California (16.73%) and Massachusetts (23.7%) have lower profit margins despite high sales, indicating room for pricing optimization.

3.	High Profit per Unit States
• 	Rhode Island (36.61 profit/unit), Indiana (31.8), and Minnesota (32.7) show high profitability per unit sold, indicating premium product sales or effective cost management.
• 	California has the lowest profit per unit ($9.97/unit), meaning sales volume drives its profitability more than pricing strategy.

4.	Low Average Discount Across All States 
•   Most states operate at full price, suggesting minimal reliance on discount-driven sales.

5.	Cumulative Distribution & Market Coverage
•   The top 5 states (California, New York, Washington, Michigan, Virginia) contribute to 10% of cumulative profit distribution, making them key focus areas for marketing and resource allocation.
*/