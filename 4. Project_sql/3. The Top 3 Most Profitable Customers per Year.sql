---             The Top 3 Most Profitable Customers per Year
---- (Identifying key customers contributing to profitability each year)

/*
1. PROJECT OVERVIEW
💡 Business Challenge:
The business has observed fluctuations in profitability and aims to identify 
the customers driving the highest profits each year. With a large customer base,
understanding which customers consistently contribute the most profit will
enable the company to develop targeted loyalty programs, personalized marketing
campaigns, and optimize customer engagement.

🎯 Project Goal:
This project aims to identifying the top 3 most profitable customers each year
and analyzing their sales and order metrics. The insights derived will help the business
nurture relationships, refine sales strategies, and implement incentives to
maximize profitability and drive long-term growth.

2. KEY BUSINESS QUESTION
🔍 Business Question:
Which customers across different states have been the top three contributors to our profit each year,
and how can we leverage this insight to strengthen customer relationships and drive sales growth?"

🛠 Approach:
•	Create SQL queries to identify and prioritize the top-performing customers each year.
•	Include key metrics such as profit, sales, order frequency, average discount (in %), and profit margin (in %) for each top customer.
•	Provide data-driven recommendations to refine customer engagement strategies and maximize revenue.	
*/

WITH CSY AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS year,
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
        EXTRACT(YEAR FROM o.order_date), c.customer_name, l.state
),
ranked_customers AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY year ORDER BY total_profit DESC) AS RN
    FROM
        CSY
)
SELECT
    year,
    customer_name,
	state,
    total_profit,
    total_sales,
	total_quantity,
	total_orders_placed,
    average_discount, 
	profit_margin_pct,
	profit_per_unit
FROM
    ranked_customers
WHERE
    RN <= 3
ORDER BY
    year,
    total_profit DESC;

/*
Here's the breakdown of RESULT based on the QUERY above:

Year	Customer Name	          State	       Total Profit	   Total Sales	   Total Quantity     Total Orders    Avg. Discount	 Profit Margin %     Profit per Unit
2020	Sanjit Chand	        Minnesota	  $4.67K	      $9.90K	           17	           4	          0%	           47.16%	          $274.63
2020	Nathan Mautz	        New York	  $2.24K	      $4.81K	           14	           5	          2%	           46.65%	          $160.20
2020	Tom Boeckenhauer	New York	  $2.24K	      $7.00K	            4	           1	          0%	           32.00%	          $560.00
2021	Christopher Martinez	Georgia	          $3.19K	      $6.41K	           12	           4	          0%	           49.78%	          $266.01
2021	Keith Dawkins	        New York	  $2.51K	      $5.85K	           16	           5	          2%	           42.89%	          $156.82
2021	Harry Marie	        Missouri	  $2.31K	      $4.91K	            9	           2	          0%	           46.98%	          $256.31
2022	Tamara Chand	        Indiana 	  $8.76K	      $18.34K	           18	           5	          0%	           47.79%	          $486.80
2022	Adrian Barton	        Michigan	  $4.95K	      $9.89K	           13	           1	          0%	           50.00%	          $380.49
2022	Sanjit Engle	        Virginia	  $2.83K	      $8.81K	           20	           3	          0%	           32.09%	          $141.26
2023	Raymond Buch	        Washington	  $6.73K	      $14.05K	            9	           3	          0%	           47.92%	          $748.27
2023	Hunter Lopez	        Delaware	  $5.04K	      $10.50K	            3	           1	          0%	           48.00%	         $1680.00
2023	Tom Ashbrook	        New York	  $4.60K	      $13.72K	           22	           5	          4%	           33.51%	          $209.06

🔎 INSIGHTS & TRENDS
1.	Consistently High Performers in Certain States:
•	New York has had at least one top-performing customer every year (Nathan Mautz, Keith Dawkins, Tom Ashbrook), making it a crucial state for business profitability.
•	Indiana (Tamara Chand) and Washington (Raymond Buch) showed exceptional profits in 2022 and 2023, respectively, suggesting new high-value customer segments.

2.	Profit Per Unit Varies Significantly:
•	Hunter Lopez (2023) had the highest profit per unit ($1,680), meaning he is either buying premium products or extremely high-margin items.
•	Sanjit Engle (2022) had a relatively low profit per unit ($141.26), despite a decent total profit of $2.83K, which suggests that he is buying large quantities at a lower margin.

3.  Order & Quantity Trends:
•   Some high-profit customers, like Hunter Lopez (2023) and Tom Boeckenhauer (2020), placed very few orders, yet generated high profits—likely due to premium or bulk sales.
•   Customers with frequent orders, such as Tamara Chand (2022) and Christopher Martinez (2021), might be excellent loyalty program targets.

4.  Profit Margins & Discounts:
•   Customers with 0% discounts (e.g., Raymond Buch, Hunter Lopez, Sanjit Chand) had higher profit margins, suggesting that discounts aren’t always necessary for top buyers.
•   Some customers (e.g., Tom Ashbrook in 2023) received higher discounts (4%) yet still contributed significantly to profits—indicating strategic discounting opportunities.

5.	Minimal Discounts Across High-Profit Customers:
•	The average discount across all years is close to zero. This suggests that high-profit customers are not highly sensitive to discounts, and their loyalty may be influenced by other factors such as service quality, product availability, and engagement strategies.

6.	Emerging High-Value Customers in Recent Years:
•	Tamara Chand (2022) and Raymond Buch (2023) had exceptionally high profits ($8.76K and $6.73K, respectively), suggesting that the business should focus on retaining and further engaging these customers.
*/
