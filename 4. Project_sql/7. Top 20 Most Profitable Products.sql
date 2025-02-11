---                              Top 20 Most Profitable Products
---- (Expanding product-level profitability analysis beyond the top 3  for a more comprehensive view)

/*
1. PROJECT OVERVIEW 
💡 Business Challenge:
The company offers a wide range of products, but some significantly outperform others in terms
of profitability. To streamline the product portfolio and boost overall profitability, the business
needs a structured, data-driven approach to identifying and prioritizing high-performing products.

🎯 Project Goal:
This project aims to identify the top 20 most profitable products using key metrics such as profit,
sales, quantity sold, and order volume. The insights derived will help the company refine pricing strategies,
optimize inventory management, and enhance product offerings for sustained growth.

2. KEY BUSINESS QUESTION
🔍 Business Question:
Which 20 products are generating the highest profit across different categories, and how can we leverage
this data to optimize product offerings, pricing strategies, and inventory management for maximum profitability?

🛠 Approach:
•	Write SQL queries to analyze product-level profitability trends.
•	Identify top 20 most profitable products based on profit, sales, quantity sold, order volume, average discount (in %), and profit margin (in %).
•	Provide data-driven recommendations for inventory optimization, pricing adjustments, and strategic product positioning.
*/

SELECT 
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
    p.product_name, p.category
ORDER BY 
    total_profit DESC
LIMIT 20;

/*
Here's the breakdown of RESULT based on the QUERY above:

Product Name	                                     Category	      Total Profit	 Total Sales	    Total Quantity	 Total Orders Placed      Avg. Discount     Profit Margin %	 Profit per Unit
Canon imageCLASS 2200 Advanced Copier	            Technology	        $25.20K	          $61.60K	            20	               5	                 12%	         40.91%	            $1,260
Fellowes PB500 Electric Punch Binding Machine	    Office Supplies      $7.75K	          $27.45K	            31	              10	                 24%	         28.24%	               $250.10
Hewlett Packard LaserJet 3310 Copier	            Technology	         $6.98K	          $18.84K	            38	               8	                 20%	         37.07%	               $183.79
Canon PC1060 Personal Laser Copier	            Technology	         $4.57K	          $11.62K	            19	               4	                 15%	         39.34%       	       $240.58
Logitech G19 Gaming Keyboard	                    Technology	         $4.43K	          $13.76K	            60	              15	                  4%	         32.17%	                $73.76
Plantronics Savi W720 Wireless Headset	            Technology	         $4.43K	          $13.76K	            60	              15	                  4%	         32.17%	                $73.76
HP Designjet T520 Large Format Printer	            Technology	         $4.09K	          $18.37K	            12	               3	                 17%	         22.29%	               $341.25
Ativa V4110MDD Micro-Cut Shredder	            Technology	         $3.77K	           $7.70K	            11	               2	                  0%	         49%	               $343
3D Systems Cube Printer, 2nd Gen	            Technology	         $3.72K	          $14.30K	            11	               2	                  0%	         26%	               $338
Ibico EPK-21 Electric Binding System	            Office Supplies	 $3.35K	          $15.88K	            13	               3	                 33%	         21.07%	               $257.33
Zebra ZM400 Thermal Label Printer	            Technology	         $3.34K	           $6.97K	             6	               2	                  0%	         48%	               $557.26
Honeywell HEPA Air Cleaner	                    Office Supplies	 $3.25K	          $11.30K	            40	               8	                  5%	         28.72%	                $81.18
Hewlett Packard 610 Digital Copier/Printer	    Technology	         $3.12K	           $8.90K	            21	               7	                 14%	         35.11%	               $148.81
Plantronics CS510 Wireless Headset	            Technology	         $3.09K	          $10.82K	            35	              10	                  8%	         28.51%	                $88.14
Canon ImageCLASS D680 Copier/Fax	            Technology	         $2.80K	           $8.96K	            16	               5	                 20%	         31.25%                $175
Fellowes PB300 Plastic Comb Binding Machine	    Office Supplies	 $2.52K	           $8.07K	            27	               6	                 23%	         31.2%	                $93.26
Ibico Ibimaster 300 Manual Binding System	    Office Supplies	 $2.32K	           $7.99K                   28	               8	                 16%	         29.03%	                $82.80
Logitech Z-906 Home Theater Speaker System	    Technology	         $2.24K	           $5.61K	            17	               4	                  0%	         40%	               $132
GBC DocuBind TL300 Electric Binding System	    Office Supplies	 $2.23K	          $19.82K	            37	              11	                 30%	         11.27%	                 $60.36
Razer Tiamat 7.1 Surround Sound Headset	            Technology	         $2.16K	           $5.12K	            26	               7	                  3%	         42.11%	                 $82.92

🔎 INSIGHTS & TRENDS
1. High-Profit Leaders: 
•  Canon imageCLASS 2200 Advanced Copier dominates with $25.2K profit, making it the most profitable product.

2. Technology Drives Profitability:
•  Majority of top products fall under Technology, particularly printers, copiers, and accessories.

3. High Profit Margin Products:
•  Ativa Micro-Cut Shredder (49%) and Zebra Thermal Printer (48%) boast the highest profit margins, making them high-value, low-quantity items.

4. High Unit Profitability:
•  Products like the Canon imageCLASS 2200 and Zebra ZM400 Thermal Printer generate over $500 per unit, making them key revenue drivers.

5. Office Supplies Need Optimization: 
•  Some Office Supplies like the GBC DocuBind TL300 have low-profit margins (11.27%) despite high sales, suggesting low-pricing or excessive discounts.

6. Low Discount, High Returns: 
•  Products with little to no discounting (e.g., Zebra Printer, Ativa Shredder, Logitech Z-906 Speaker) still perform well, indicating premium pricing power.

7. Impact of Discounts:
•  Products with higher average discounts (e.g., Ibico EPK-21, 33%) tend to have lower profit margins.
*/
