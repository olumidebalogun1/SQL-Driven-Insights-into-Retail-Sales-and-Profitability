---                                Top 20 Most Profitable Cities 
----  (Diving deeper into regional profitability at the city level, supplementing state-level insights)

/*
1. PROJECT OVERVIEW 
💡 Business Challenge:
The company is looking to optimize its performance across different cities. 
Despite having operations in many areas, some cities significantly outperform
others in terms of profitability, sales volume, and order frequency.

🎯 Project Goal:
This project aims to identify the top 20 most profitable cities based on sales,
profit, and order frequency. The insights derived will help the company to optimize
sales strategies, discount offerings, and regional operations for maximum profitability.

2. KEY BUSINESS QUESTION 
🔍 Business Question:
Which 20 cities generate the highest profit across different states, and how can we use this insight
to prioritize high-impact regions for optimizing sales strategies, discounts, and order management?

🛠 Approach:
•	Write SQL queries to analyze profit and sales trends across different cities.
•	Identify top 20 most profitable cities based on profitability, sales volume, order frequency, average discount (in %), and profit margin (in %).
•	Provide actionable recommendations for regional marketing strategies, discount optimization, and investment focus.
*/

SELECT 
	l.city,
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
    l.city, l.state
ORDER BY 
    total_profit DESC
LIMIT 20;

/*
Here's the breakdown of RESULT based on the QUERY above:

City	          State	       Total Profit	    Total Sales	  Total Quantity	 Total Orders Placed	 Avg. Discount     Profit Margin %   Profit per Unit
New York City	  New York	    $62,025.54	    $256,343.56 	3,415	               914	                6%                 24.2%	        $18.16
Los Angeles	      California	$30,440.94	    $175,851.33	    2,879	               747	                7%                 17.31%         	$10.57
Seattle	          Washington	$29,156.13	    $119,540.74	    1,590	               428	                6%                 24.39%         	$18.34
San Francisco	  California	$17,507.39	    $112,669.09	    1,935	               510	                7%                 15.54%	         $9.05
Detroit	          Michigan	    $13,181.79	     $42,446.94	      441	               115	                1%                 31.05%	        $29.89
Lafayette	      Indiana	     $8,976.10	     $19,630.45	       43	                12	                0%                 45.73%	       $208.75
Newark	          Delaware	     $8,086.18	     $20,448.05	      225	                60	                0%                 39.54%	         $35.94
Atlanta	          Georgia	     $6,993.69	     $17,197.84    	  156	                39	                0%                 40.67%	         $44.83
Minneapolis	      Minnesota	     $6,824.61	     $16,870.54	       80	                23	                0%                 40.45%	         $85.31
Henderson	      Kentucky	     $6,763.81	     $24,590.38	      235	                59	                0%                 27.51%	         $28.78
San Diego	      California	 $6,448.30	     $48,113.03   	  683	               175	                8%                 13.4%	          $9.44
Jackson	          Michigan	     $5,525.19	     $15,420.03	      132	                38	                1%                 35.83%	         $41.86
Providence	      Rhode Island	 $5,505.67	     $15,980.65  	  118	                31	                1%                 34.45%	         $46.66
Springfield	      Virginia	     $4,485.56	     $16,342.15	      195	                49	                0%                 27.45%	         $23.00
Arlington	      Virginia	     $4,424.09	     $14,366.76   	  128	                32	                0%                 30.79%	         $34.56
Columbus	      Georgia	     $4,104.12	     $14,845.05	      258	                68	                0%                 27.65%	         $15.91
Springfield   	  Missouri	     $3,905.59	     $15,051.38  	  151	                39	                0%                 25.95%	         $25.86
Lakewood	      New Jersey	 $3,526.67	     $14,852.04	       93	                24	                0%                 23.75%	         $37.92
Columbia	      Maryland	     $3,301.59	      $9,329.21  	   81	                22	                0%                 35.39%	         $40.76
Milwaukee	      Wisconsin      $2,793.09	     $11,410.22	      201	                45	                0%                 24.48%	         $13.90

🔎 INSIGHTS & TRENDS
1. Top Profitable Cities:
•  New York City leads in total profit ($62,025.54) and sales ($256,343.56).
•  Los Angeles and Seattle follow, though with lower profit margins.
•  Lafayette, IN has an exceptionally high profit per unit ($208.75), indicating niche, high-margin products.

2. High Profit Margins (%):
•  Lafayette (45.73%), Atlanta (40.67%), and Minneapolis (40.45%) show strong profitability despite lower total sales.
•  Detroit (31.05%) also has a healthy profit margin, making it an attractive city for business expansion.

3. Impact of Discounts:
•  Cities with low or no discounts (Lafayette, Newark, Atlanta, Minneapolis) tend to have higher profit margins.
•  San Diego (0.08 avg discount) has the lowest profit margin (13.4%), indicating discounting may be eroding profitability.

4. Sales vs. Orders:
•  New York City (914 orders) and Los Angeles (747 orders) generate the highest order volumes.
•  Detroit and Lafayette have far fewer orders but extremely high profit per unit.

5. Hidden High-Margin Cities:
•  Detroit, Jackson, and Newark all maintain profit margins above 30%, suggesting strong pricing power.
•  Providence and Columbia have profit per unit above $40, making them prime candidates for selective marketing strategies.
*/
