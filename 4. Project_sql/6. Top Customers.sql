---                             6. Top Customers
----  (Broadening the customer analysis to a larger dataset for a more comprehensive view)

/* 
QUESTION:
Who are the top 20 customers generating the most profit across different states, and how can
we tailor our strategies to further increase profitability with these high-value customers?
    */

/*
QUESTION OVERVIEW - 
1. Business Challenge:
Customer profitability varies significantly, with some customers contributing much higher profits
than others. The business needs a structured approach to identifying high-value customers across different
states to optimize sales strategies, enhance loyalty programs, and improve marketing efforts

2. Objective of the Question:
This project aims to identify the top 20 most profitable customers across states using key metrics
such as profit, sales, and order frequency. The insights derived will help the company refine
customer engagement strategies, increase retention, and drive sustainable profitability.

3. Analytical Approach:
•  Write SQL queries to analyze profitability trends by customer and state.
•  Identify top 20 high-value customers based on profit, sales, order frequency, average discount (in %), and profit margin (in %).
•  Provide data-driven recommendations for targeted marketing, personalized engagement, and loyalty programs.
          */


SELECT 
    c.customer_name,
	l.state,
    SUM(o.profit) AS total_profit,
    SUM(o.sales) AS total_sales,
	SUM(o.quantity) AS total_quantity,
	COUNT(o.order_id) As total_orders_placed,
    ROUND(AVG(o.discount), 2) AS average_discount,
	ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_pct,
    ROUND(SUM(o.profit) / NULLIF(SUM(o.quantity), 0), 2) AS profit_per_unit 
FROM 
    staging_customers c
JOIN 
    staging_orders_2 o ON c.customer_id = o.customer_id
JOIN 
    staging_location l ON l.postal_code = o.postal_code
GROUP BY 
    c.customer_name, l.state
ORDER BY 
    total_profit DESC
LIMIT 20;


/*
Here's the breakdown of RESULT based on the QUERY above:

Customer Name	         State	      Total Profit	 Total Sales	 Total Quantity	 Total Orders Placed	 Avg. Discount	 Profit Margin %	 Profit per Unit
Tamara Chand	        Indiana	        $8.76K	      $18.34K	             18         	5	                 0%	             47.79%	             $486.80
Raymond Buch	        Washington	    $6.73K	      $14.05K	              9	            3	                 0%           	 47.92%     	     $748.27
Hunter Lopez	        Delaware	    $5.04K	      $10.50K	              3	            1	                 0%	             48%	            $1,680.00
Adrian Barton	        Michigan	    $4.95K	      $9.89K	             13          	1	                 0%	             50%	              $380.49
Sanjit Chand	        Minnesota	    $4.67K	      $9.90K	             17	            4	                 0%	             47.16%	              $274.63
Tom Ashbrook	        New York	    $4.60K	      $13.72K	             22	            5	                 4%	             33.51%	              $209.06
Christopher Martinez	Georgia	        $3.19K	      $6.41K	             12	            4	                 0%	             49.78%	              $266.01
Sanjit Engle	        Virginia        $2.83K	      $8.81K	             20	            3	                 0%	             32.09%           	  $141.26
Daniel Raglin	        Rhode Island	$2.64K	      $5.55K	             13	            3	                 0%	             47.58%	              $203.11
Andy Reiter	            Michigan	    $2.60K	      $5.80K	             14	            3	                 0%	             44.84%	              $185.86
Keith Dawkins	        New York	    $2.51K	      $5.85K	             18          	6	                 2%	             42.89%	              $139.49
Bill Shonely	        New Jersey	    $2.38K	      $9.14K	             14	            3	                 0%	             26.07%	              $170.08
Harry Marie	            Missouri	    $2.31K	      $4.91K	              9	            2	                 0%	             46.98%	              $256.31
Karen Daniels	        New York	    $2.28K	      $6.24K	             22	            6	                 7%	             36.58%	              $103.78
Nathan Mautz	        New York	    $2.25K	      $4.82K	             17	            6	                 5%	             46.61%	              $132.19
Tom Boeckenhauer	    New York	    $2.24K	      $7.00K	              4   	        1	                 0%	             32.00%	              $560.00
Jane Waco	            California	    $2.07K	      $7.38K	             33         	6	                13%	             28.04%           	    $62.72
Shirley Daniels	        Michigan	    $1.95K	      $4.00K	              4	            2	                 5%	             48.7%	               $487.00
Fred Hopkins	        Washington	    $1.93K	      $4.61K	             12	            3	                 0%	             41.9%	               $160.87
Steven Roelle	        New York	    $1.86K	      $3.90K	             21	            4	                 0%	             47.74%   	            $88.76


INSIGHTS & TRENDS
1.  High-Value Customers Driving Profitability:
•	Tamara Chand (Indiana, $8.76K profit, 47.79% margin) and Raymond Buch (Washington, $6.73K profit, 47.92% margin) are the top contributors, indicating strong purchasing power.
•	Hunter Lopez (Delaware, $5.04K profit, 48% margin, $1680 profit/unit) stands out with the highest profit per unit, suggesting premium product purchases.

2.	Customer Profitability by State:
•	New York has multiple high-value customers, including Tom Ashbrook ($4.60K profit), Keith Dawkins ($2.51K profit), Karen Daniels ($2.28K profit), and Steven Roelle ($1.86K profit).
•	Michigan also has strong contributors, like Adrian Barton ($4.95K profit) and Andy Reiter ($2.60K profit).

3.	Order Frequency vs. Profitability:
•	Some customers generate high profits with fewer orders, such as Hunter Lopez (1 order, $5.04K profit) and Tom Boeckenhauer (1 order, $2.24K profit), indicating premium purchases.
•	Others, like Karen Daniels (6 orders, $2.28K profit), have steady repeat purchases, suggesting long-term engagement potential.

4.	Frequent Buyers with Moderate Profit:
•	Jane Waco (CA, 33 units, $2.07K profit) and Steven Roelle (NY, 21 units, $1.86K profit) are making frequent purchases but at lower profit per unit.
•	Potential opportunity to upsell higher-margin products to these customers.

5.	Impact of Discounts:
•	Customers with higher discounts (e.g., Jane Waco, 13%) tend to have lower profit margins, highlighting the need for discount optimization.
•	Top-performing customers received little to no discounts, reinforcing the effectiveness of premium pricing for high-value customers.
      */
	