---                     2. Monthly Performance
---- (Breaking down growth trends with a detailed time-based analysis)

/* QUESTION:
How do monthly sales, profit, and order volumes fluctuate over time, 
and what trends can we identify to optimize business performance?
     */

/*
QUESTION OVERVIEW - 
1. Business Challenge:
The company experiences fluctuations in sales and profitability without a clear
understanding of trends. While some months have strong sales, profit margins don’t 
always align. Management seeks to identify seasonal patterns, demand fluctuations, 
and inefficiencies to improve revenue forecasting, optimize promotions, 
and refine pricing strategies.

2. Objective of the Question:
This question aims to analyze  monthly sales, profit, and order volume trends to
uncover patterns that can guide marketing optimization, demand forecasting, 
and strategic decision-making for sustainable revenue growth.

3. Analytical Approach:
•	Write SQL queries to analyze monthly trends in sales, profit, order volume, and quantity sold.
•	Identify seasonal patterns and demand fluctuations.
•	Provide data-driven recommendations to enhance pricing, forecasting, and marketing strategies	
    */


SELECT 
    TO_CHAR(o.order_date, 'YY-Month') AS year_month,  
    SUM(o.profit) AS total_profit,
    SUM(o.sales) AS total_amount,
    SUM(o.quantity) AS total_quantity,
    COUNT(o.order_id) AS total_orders
FROM 
    staging_orders_2 o
JOIN 
    staging_customers c ON o.customer_id = c.customer_id
GROUP BY 
    TO_CHAR(o.order_date, 'YY-Month'),  
    EXTRACT(YEAR FROM o.order_date),  
    EXTRACT(MONTH FROM o.order_date)
ORDER BY 
    EXTRACT(YEAR FROM o.order_date),  
    EXTRACT(MONTH FROM o.order_date);


/*
Here's the breakdown of RESULT based on the QUERY above:

year_month	total_profit	total_amount	total_quantity	total_orders
Jan '20    	$2.45K	        $14.24K	         284	           79
Feb '20 	$0.86K	        $4.52K	         159	           46
Mar '20	    $0.50K	        $55.69K          585	          157
Apr '20	    $3.50K	        $28.01K	         534	          134
May '20	    $2.74K	        $23.65K       	 466	          122
Jun '20 	$4.98K	        $34.60K	         521	          135
Jul '20	   -$0.84K	        $33.95K	         550	          143
Aug '20	    $5.32K	        $27.91K	         609	          153
Sep '20	    $8.33K	        $81.78K	        1000	          268
Oct '20	    $3.45K	        $31.45K	         573	          159
Nov '20	    $9.29K	        $78.63K	        1219	          318
Dec '20	    $8.98K	        $69.55K	        1079	          278
Jan '21	   -$3.28K	        $18.17K	         236	           58
Feb '21	    $2.81K	        $11.95K	         239	           64
Mar '21	    $9.73K	        $38.73K	         515	          138
Apr '21  	$4.19K	        $34.20K	         543	          160
May '21	    $4.67K	        $30.13K	         575	          146
Jun '21	    $3.34K	        $24.80K	         486	          138
Jul '21	    $3.25K	        $28.68K	         551	          139
Aug '21	    $5.36K	        $36.90K	         598	          159
Sep '21	    $8.21K	        $64.60K	        1086	          293
Oct '21	    $2.82K	        $31.40K	         631	          166
Nov '21	    $12.47K	        $75.97K     	1310	          324
Dec '21	    $8.02K	        $74.92K	        1203	          316
Jan '22	    $2.82K	        $18.54K	         358	           89
Feb '22	    $5.00K	        $22.98K	         306	           83
Mar '22	    $3.46K	        $51.40K	         565	          162
Apr '22	    $2.92K	        $38.46K	         630	          169
May '22	    $8.66K	        $56.99K	         863	          225
Jun '22	    $4.75K	        $40.34K	         742	          199
Jul '22	    $4.43K	        $39.26K	         758	          201
Aug '22	    $2.06K	        $31.12K	         693	          176
Sep '22	    $9.32K	        $73.39K	        1314	          362
Oct '22	    $16.24K	        $59.69K	         767	          196
Nov '22	    $4.01K	        $79.41K	        1406	          370
Dec '22	    $17.80K	        $96.71K     	1411	          351
Jan '23	    $7.14K	        $43.97K	         597	          155
Feb '23	    $1.61K	        $20.30K	         363	          107
Mar '23	    $14.75K	        $58.87K	         885	          238
Apr '23	     $0.93K    	    $36.52K	         733	          203
May '23	     $6.34K	        $44.26K	         887	          242
Jun '23	     $8.22K	        $52.98K	         931	          245
Jul '23	     $6.95K	        $45.26K	         840	          226
Aug '23	     $9.04K	        $63.12K	         884	          218
Sep '23	    $10.99K	        $87.87K	        1660	          459
Oct '23	     $9.28K	        $77.78K	        1133	          298
Nov '23	     $9.22K	       $116.81K	        1831	          458
Dec '23      $8.47K         $83.73K        1715              461


INSIGHTS & TRENDS
1. Strongest Months: September – December 
•  Peak Sales & Profits in Q4 each year (Nov-Dec). Likely due to holiday sales, promotions, or seasonal demand.
•  September also shows high order volumes, hinting at early seasonal shopping.

2. Weakest Months: January & February 
•  January consistently records losses or low profits, likely due to post-holiday consumer spending dips.
•  February shows lower order volumes and sales.

3. Profitability Doesn’t Always Align with Sales 
•  2020-07 and 2021-01 showed losses despite decent sales → Indicates possible high costs, discounts, or operational inefficiencies.
•  2023-11 had the highest sales ($116,814) but not the highest profit ($9,216) → Potential margin pressure?

4. Order Volume & Quantity Trends 
•  Order volume increases steadily year over year (esp. in Q3-Q4).
•  2023-09 had the highest orders (459) & quantity (1,660 units) → indicates growing customer demand.
    */