--- Annual Sales, Profit, and Quantity Performance with Percentage Growth 
----  (Providing a broad overview of the business's growth over time)

/*
1. PROJECT OVERVIEW 
💡 Business Challenge:
The company wants to assess its financial health and long-term growth trajectory.
While sales and profits may be increasing, leadership seeks deeper insights into
whether this growth is accelerating, stagnating, or declining.

🎯 Project Goal:
This project aims to analyze year-over-year (YoY) trends in sales, profit, 
and order quantity to identify potential growth opportunities and warning signs of decline,
thereby helping the business refine pricing strategies, optimize sales efforts, 
and improve operational efficiency for sustained profitability.

2. KEY BUSINESS QUESTION 
🔍 Business Question:
How has the company’s annual sales, profit, and order quantity evolved over time,
and what trends indicate potential growth or decline?

🛠 Approach:
•	Write SQL queries to calculate YoY percentage changes in key business metrics.
•	Identify high-performing years and warning signs of decline.
•	Provide data-driven recommendations to sustain business growth.
*/

WITH annual_performance_growth AS (
    SELECT 
        EXTRACT(YEAR FROM order_date) AS year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        SUM(quantity) AS total_quantity
    FROM staging_orders_2
    GROUP BY 
	    EXTRACT(YEAR FROM order_date)
    ORDER BY
	    year
)
SELECT 
    year,
    TO_CHAR(total_sales, 'FM$999,999.00') AS Total_Sales, 
    TO_CHAR(total_profit, 'FM$999,999.00') AS Total_Profit,
    TO_CHAR(total_quantity, 'FM999,999 Unit') AS Total_Quantity,
    TO_CHAR(ROUND((total_sales - LAG(total_sales) OVER (ORDER BY year)) * 100.0 / LAG(total_sales) OVER (ORDER BY year), 2), 'FM99.00%') AS Sales_Growth_Percent,
    TO_CHAR(ROUND((total_profit - LAG(total_profit) OVER (ORDER BY year)) * 100.0 / LAG(total_profit) OVER (ORDER BY year), 2), 'FM99.00%') AS Profit_Growth_Percent,
    TO_CHAR(ROUND((total_quantity - LAG(total_quantity) OVER (ORDER BY year)) * 100.0 / LAG(total_quantity) OVER (ORDER BY year), 2), 'FM99.00%') AS Quantity_Growth_Percent
FROM 
    annual_performance_growth;

/*
Here's the breakdown of RESULT based on the QUERY above:

Year	Total Sales 	 Total Profit 	 Total Quantity 	   Sales Growth 📉📈	  Profit Growth 🚀	   Quantity Growth 📉📈
2020	$483,966.19	     $49,556.12	         7,579 Units	       ❌ N/A	             ❌ N/A	           ❌ N/A
2021	$470,442.40	     $61,577.26	         7,973 Units	       🔻 -2.79%	         🚀 +24.26%	       🚀 +5.20%
2022	$608,283.20	     $81,498.85	         9,813 Units	       🚀 +29.30%	         🚀 +32.35%	       🚀 +23.08%
2023	$731,479.71 	 $92,952.09	        12,459 Units	       🚀 +20.25%	         🚀 +14.05%	       🚀 +26.96%

🔎 INSIGHTS & TRENDS
✅ Positive Trends:
✔️ Sales Recovery & Growth: After a dip in 2021 (-2.79%), sales rebounded strongly in 2022 (+29.30%) and continued growing in 2023 (+20.25%).
✔️ Profit Surge: Profit grew steadily each year, with the most significant jump in 2022 (+32.35%).
✔️ Order Quantity Growth: Increased every year, peaking in 2023 with a +26.96% boost.

⚠️ Potential Concerns:
🔸 Sales Decline in 2021 (-2.79%): The dip in revenue indicates external challenges or strategy misalignment.
🔸 Slower Profit Growth in 2023 (14.05% vs. 32.35% in 2022): Growth is positive but decelerating, which may suggest increasing costs or competitive pricing pressures.
🔸 Order Growth > Profit Growth: The number of units sold is growing faster than profit in 2023, signaling possible margin compression or pricing inefficiencies.
*/