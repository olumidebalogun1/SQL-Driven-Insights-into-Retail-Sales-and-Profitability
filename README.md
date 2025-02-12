# **📊 RETAIL SALES & PROFITABILITY INSIGHTS: DATA-DRIVEN STRATEGIES FOR GROWTH WITH SQL ANALYTICS**

 ## **INTRODUCTION**
In today’s fast-moving business world, **data isn’t just numbers—it’s the secret weapon for growth and competitive advantage**. Businesses that master the art of **data-driven decision-making** don’t just survive; they thrive. But growth isn’t just about increasing sales—it’s about knowing where, how, and why it’s happening (or not happening).

If you've ever asked yourself:

**❓ Which products bring in the most profit?**

**❓ Which customers should we prioritize for retention and loyalty programs?**

**❓ Which regions deserve more marketing investment?**

Then you’re in the right place!

This project takes a **deep dive into a company’s financial health** using **SQL-powered data extraction, analytics, and visualization**. By transforming raw data into **meaningful, strategic insights**, I will uncover **hidden growth opportunities, identify high-impact revenue drivers, and provide clear, data-backed recommendations** that fuel **long-term success**.

🔍 SQL queries? Check them out here: [Project_sql_folder](https://github.com/olumidebalogun1/Data-Driven-Strategies-for-Growth-with-SQL-Analytics/tree/main/4.%20Project_sql)

## **🏢 BACKGROUND**
A company experiencing **steady revenue and profit growth** wants to dig deeper—are they truly thriving, or is the momentum slowing down? Leadership seeks to move beyond surface-level financial reports to **understand key performance trends, identify growth drivers, and detect potential red flags** before they impact long-term success.

### **The key business questions I intend to answer while uncovering valuable insights include:**
1.  How has the company’s annual sales, profit, and order quantity evolved over time, and what trends indicate potential growth or decline?

2.  How do monthly sales, profit, and order volumes fluctuate over time, and what trends can we identify to optimize business performance?

3.  Which customers across different states have been the top three contributors to our profit each year, and how can we leverage this insight to strengthen customer relationships and drive sales growth?

4.  Which three products across different categories consistently generate the highest profit each year, and how can we optimize our product strategies, pricing, and inventory management to maximize their potential?

5.  Which three states consistently generate the highest profits year over year, and how can we focus our resources and marketing efforts on these high-performing regions for sustainable growth?

6.  Who are the top 20 customers generating the most profit across different states, and how can we tailor our strategies to further increase profitability with these high-value customers?

7.  Which 20 products are generating the highest profit across different categories, and how can we leverage this data to optimize product offerings, pricing strategies, and inventory management for maximum profitability?

8.  Which 20 cities generate the highest profit across different states, and how can we use this insight to prioritize high-impact regions for optimizing sales strategies, discounts, and order management?

9.  Which states contribute the most to our profitability, and how can we focus on the top 30% to maximize sales, orders, and resource allocation?

10.  Which product subcategories across different categories contribute the most to our profitability, and how can we focus on the top 30% to optimize sales and resource allocation?

Through data exploration, visualization, and actionable insights, this project empowers stakeholders with a clear, data-driven roadmap to refine their strategies, optimize resource allocation, and maximize profitability.

## **🛠 TOOLS I USED**
My analysis was powered by a suite of tools and techniques, including:
-	**SQL 🖥️** – The powerhouse of my analysis, enabling me to extract, transform, and uncover hidden job market trends.
-	**PostgreSQL 🛢️** – A robust, scalable database management system, ideal for handling complex queries and large datasets with ease.
-	**Excel 📑** – Essential for intuitive data visualization and dynamic dashboard creation, turning numbers into compelling insights.
-	**Git & GitHub 🌐** – Crucial for version control, seamless collaboration, and sharing my SQL scripts and findings with the data community.

## **🚀 APPROACH, ANALYSIS & TECHNICAL CHALLENGES**
**📥 Data Collection**:
-	I gathered and integrated relevant data tables to establish a strong foundation for in-depth analysis.

**🛠️ Data Preparation**:
-	I cleaned, standardized, and transformed raw data into a structured, high-quality dataset to ensure accuracy and consistency.

**🧩 Data Enhancement**:
-	I engineered calculated variables and key metrics to enrich the dataset, enabling deeper and more meaningful analysis.

**🤖 Advanced SQL Analysis**:
-	I leveraged complex SQL queries to uncover key performance drivers, identify patterns, and extract actionable insights.

By following this structured approach, I ensured data clarity, tackled technical challenges effectively, and transformed raw information into valuable, data-driven insights for informed decision-making.


## **📊 THE ANALYSIS 1 - 🧹DATA CLEANING & FORMATTING**
Raw data is often messy and requires refinement before analysis. Proper data cleaning ensures accuracy, reliability, and efficiency, leading to better insights and informed decision-making. Below are the steps I took to prepare the dataset:

**1️  Removing Special Characters**:
-	 Eliminated special characters from text fields to ensure data consistency.

**2️  Standardizing Formats**:
-	Ensured consistency in date formats.
-	Formatted numerical values correctly.

**3️  Removing Duplicates & Outliers**:
-	Identified and removed duplicate records to prevent skewed analysis.
-	Used statistical methods to detect and handle outliers in the dataset.

**4️  Handling Missing Values**:
-	Replaced blank fields with NULL values for proper handling.
-	Checked for null values and decided on appropriate imputation or removal

**5️  Removing Unwanted Columns**:
-	Dropped irrelevant or redundant columns that do not contribute to the analysis

🔍 SQL queries? Check them out here: [Clean and Format_sql](https://github.com/olumidebalogun1/Data-Driven-Strategies-for-Growth-with-SQL-Analytics/tree/main/3.%20Clean%20and%20Format_sql)


## **📈 THE ANALYSIS 2**

### **1.  ANNUAL SALES, PROFIT, AND QUANTITY PERFORMANCE WITH PERCENTAGE GROWTH**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company wants to assess its financial health and long-term growth trajectory. While sales and profits may be increasing, leadership seeks deeper insights into whether this growth is accelerating, stagnating, or declining.

**🎯 Project Goal**:
This project aims to analyze year-over-year (YoY) trends in sales, profit, and order quantity to identify potential growth opportunities and warning signs of decline, thereby helping the business refine pricing strategies, optimize sales efforts, and improve operational efficiency for sustained profitability.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
How has the company’s annual sales, profit, and order quantity evolved over time, and what trends indicate potential growth or decline?

**🛠 Approach**:
-	Write SQL queries to calculate YoY percentage changes in key business metrics.
-	Identify high-performing years and warning signs of decline.
-	Provide data-driven recommendations to sustain business growth.

![1  Annual Sales, Profit, and Quantity Performance with Percentage Growth](https://github.com/user-attachments/assets/b876c32d-5388-4368-8a7c-4f2dc00eec18)

![1  Annual Performance with Percentage Growth - To be Use](https://github.com/user-attachments/assets/a0deabd8-9b5a-41b3-aff3-b67332b7a6cd)


### **Here's the breakdown of RESULT based on the QUERY above**: 

![1](https://github.com/user-attachments/assets/6f6f25a3-dbe9-4903-837e-fadb3ca57a29)

### **🔎 Key Trends & Insights**
**1.   ✅Positive Trends**:
-	**✔️ Sales Recovery & Growth**: After a dip in 2021 (-2.79%), sales rebounded strongly in 2022 (+29.30%) and continued growing in 2023 (+20.25%).
-	**✔️ Profit Surge**: Profit grew steadily each year, with the most significant jump in 2022 (+32.35%).
-	**✔️ Order Quantity Growth**: Increased every year, peaking in 2023 with a +26.96% boost.
	
**2.   ⚠️ Potential Concerns**:
-	**🔸 Sales Decline in 2021 (-2.79%)**: The dip in revenue indicates external challenges or strategy misalignment.
-	**🔸 Slower Profit Growth in 2023 (14.05% vs. 32.35% in 2022)**: Growth is positive but decelerating, which may suggest increasing costs or competitive pricing pressures.
-	**🔸 Order Growth is greater than Profit Growth**: The number of units sold is growing faster than profit in 2023, signalling possible margin compression or pricing inefficiencies.

### 🎯**Strategic Recommendations**
**1. Enhance Pricing Strategy**:
-	**Optimize pricing models** to balance revenue growth and profitability.
-	**Analyse high-selling but low-profit items** to adjust pricing or improve margins.
  
**2. Expand Sales Channels**:
-	**Leverage e-commerce and digital marketing** for increased market penetration.
-	Identify **best-selling products** and double down on high-performing categories.
  
**3. Operational Efficiency & Cost Control**:
-	Assess rising costs affecting **profit margins** in 2023.
-	Optimize supply chain and **negotiate better supplier contracts** to sustain   profitability.

**4. Customer Retention & Loyalty**:
-	**Increase repeat purchases** through loyalty programs and targeted promotions.
-	Use **customer insights** to tailor offerings and improve overall shopping experience.

**5. Data-Driven Decision-Making**:
-	Track **profit per unit** to ensure sustainable sales growth.
-	Conduct **market research** to anticipate shifts in demand and competitor strategies.


### **2.  MONTHLY SALES AND PROFIT TRENDS**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company experiences fluctuations in sales and profitability without a clear understanding of trends. While some months have strong sales, profit margins don’t always align. Management seeks to identify seasonal patterns, demand fluctuations, and inefficiencies to improve revenue forecasting, optimize promotions, and refine pricing strategies.

**🎯 Project Goal**:
This project aims to analyse monthly sales, profit, and order volume trends to uncover patterns that can guide marketing optimization, demand forecasting, and strategic decision-making for sustainable revenue growth.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
How do monthly sales, profit, and order volumes fluctuate over time, and what trends can we identify to optimize business performance?

**🛠 Approach**:
-	Write SQL queries to analyze monthly trends in sales, profit, order volume, and quantity sold.
-	Identify seasonal patterns and demand fluctuations.
-	Provide data-driven recommendations to enhance pricing, forecasting, and marketing strategies

![2  Monthly Sales   Profit Trends](https://github.com/user-attachments/assets/3b3d70d0-800c-4909-82f5-dac7be2fccd5)

![2a  Monthly Sales   Profit Trends](https://github.com/user-attachments/assets/83174601-a9ca-4fe4-a987-f1d6959900e7)

![2b  Monthly Profit Trends](https://github.com/user-attachments/assets/5458988a-bc30-40df-a73a-1f4c46ddd11c)


### **Here's the breakdown of RESULT based on the QUERY above**:

![2](https://github.com/user-attachments/assets/31e198a1-9da6-438a-8bd2-26c3d4e33d80)

### **🔎 Key Trends & Insights**
**1. Strongest Months**: September – December 
-	**Peak Sales & Profits in Q4 each year (Nov-Dec)**. Likely due to holiday sales, promotions, or seasonal demand.
-	**September** also shows high order volumes, hinting at early seasonal shopping.

**2. Weakest Months**: January & February 
-	**January** consistently records losses or low profits, likely due to post-holiday consumer spending dips.
-	**February** shows lower order volumes and sales.

**3. Profitability Doesn’t Always Align with Sales**: 
-	**2020-07 and 2021-01** showed losses despite decent sales → Indicates possible high costs, discounts, or operational inefficiencies.
-	**2023-11** had the **highest sales ($116,814) but not the highest profit ($9,216)** → Potential margin pressure?

**4. Order Volume & Quantity Trends**: 
-	**Order volume increases steadily** year over year **(esp. in Q3-Q4)**.
-	**2023-09 had the highest orders (459) & quantity (1,660 units)** → indicates growing customer demand.

### 🎯**Strategic Recommendations**
**1. Capitalize on Q4 Demand (Peak Season Strategy)**:
-	**Ramp up marketing & promotions** from **September – December** to maximize holiday sales.
-	**Launch pre-holiday discounts** in September to capture early shoppers.
-	**Ensure inventory is stocked & supply chains optimized** before peak demand.

**2. Combat Q1 Slumps (January & February)**:
-	Introduce **New Year promotions or loyalty programs** to encourage spending.
-	**Bundle slow-moving products** with bestsellers to boost Q1 sales.
-	Offer **subscription models or discounts** to maintain revenue flow post-holidays.

**3. Improve Profitability – Not Just Sales**:
-	**Analyse cost structure & pricing models** to avoid months with high sales but low profits.
-	**Identify & reduce discounting practices** that hurt margins.
-	**Negotiate better supplier deals** for bulk purchases before high-demand periods.

**4. Improve Demand Forecasting & Inventory Planning**:
-	Use **historical trends to predict demand spikes** (e.g., Sept-Dec growth).
-	**Adjust staffing, logistics, & production** to handle order surges efficiently.
-	**Prevent stockouts** in peak months & avoid excess inventory in slow months.

**5. Optimize Digital Marketing & Customer Retention**:
-	**Boost advert spending & targeted campaigns** leading up to Q4.
-	**Loyalty & referral programs** to drive repeat purchases in slow months.
-	**Personalized email marketing & abandoned cart reminders** to capture lost sales.


### **3.  THE TOP 3 MOST PROFITABLE CUSTOMERS PER YEAR**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The business has observed fluctuations in profitability and aims to identify the customers driving the highest profits each year. With a large customer base, understanding which customers consistently contribute the most profit will enable the company to develop targeted loyalty programs, personalized marketing campaigns, and optimize customer engagement.

**🎯 Project Goal**:
This project aims to identifying the top 3 most profitable customers each year and analysing their sales and order metrics. The insights derived will help the business nurture relationships, refine sales strategies, and implement incentives to maximize profitability and drive long-term growth.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which customers across different states have been the top three contributors to our profit each year, and how can we leverage this insight to strengthen customer relationships and drive sales growth?

**🛠 Approach**:
-	Create SQL queries to identify and prioritize the top-performing customers each year.
-	Include key metrics such as profit, sales, order frequency, average discount (in %), and profit margin (in %) for each top customer.
-	Provide data-driven recommendations to refine customer engagement strategies and maximize revenue.

![3  The Top 3 Most Profitable Customers per Year](https://github.com/user-attachments/assets/5d141a5a-83ce-48b4-8a81-e2628c1bf1b2)

![3a  The Top 3 Most Profitable Customers per Year - Showcasing Sales   Profitability](https://github.com/user-attachments/assets/3da54ada-bd34-4849-b2d7-50ab62b5f7e4)

![3b  The Top 3 Most Profitable Customers per Year](https://github.com/user-attachments/assets/39497f7c-93e3-4fbf-a128-2330efed7ce1)


### **Here's the breakdown of RESULT based on the QUERY above**:

![3](https://github.com/user-attachments/assets/0d07ed5c-7753-4a93-86a4-c281895f9931)

### **🔎 Key Trends & Insights**
**1.  Consistently High Performers in Certain States**:
-	**New York has had at least one top-performing customer** every year (Nathan Mautz, Keith Dawkins, Tom Ashbrook), making it a crucial state for business profitability.
-	**Indiana (Tamara Chand) and Washington (Raymond Buch)** showed **exceptional profits in 2022 and 2023**, respectively, suggesting new high-value customer segments.

**2.  Profit Per Unit Varies Significantly**:
-	**Hunter Lopez (2023) had the highest profit per unit ($1,680)**, meaning he is either buying premium products or extremely high-margin items.
-	**Sanjit Engle (2022) had a relatively low profit per unit ($141.26)**, despite a decent total profit of $2.83K, which suggests that he is buying large quantities at a lower margin.

**3.  Order & Quantity Trends**:
-	Some high-profit customers, like **Hunter Lopez (2023) and Tom Boeckenhauer (2020), placed very few orders**, yet generated high profits—likely due to premium or bulk sales.
-	**Customers with frequent orders**, such as **Tamara Chand (2022) and Christopher Martinez (2021)**, might be excellent loyalty program targets.

**4.  Profit Margins & Discounts**:
-	**Customers with 0% discounts (e.g., Raymond Buch, Hunter Lopez, Sanjit Chand)** had higher profit margins, suggesting that discounts aren’t always necessary for top buyers.
-	**Some customers (e.g., Tom Ashbrook in 2023)** received **higher discounts (4%)** yet still contributed significantly to profits—indicating strategic discounting opportunities.

**5.  Minimal Discounts Across High-Profit Customers**:
-	The average discount across all years is close to zero. This suggests that **high-profit customers are not highly sensitive to discounts**, and their loyalty may be influenced by other factors such as service quality, product availability, and engagement strategies.

**6.  Emerging High-Value Customers in Recent Years**:
-	**Tamara Chand (2022) and Raymond Buch (2023)** had exceptionally **high profits ($8.76K and $6.73K, respectively)**, suggesting that the business should focus on retaining and further engaging these customers.

### 🎯**Strategic Recommendations**
**1.  Nurture Relationships with Top Customers**: 
-	**Reward loyalty**: Create personalized loyalty programs for top customers like **Sanjit Chand, Tamara Chand, and Raymond Buch**, offering exclusive deals and early access to new products.
-	Develop **VIP customer support services** for high-profit clients, ensuring they feel valued.
-	Offer exclusive **discounts, personalized deals, and priority service** to encourage loyalty.

**2.  Expand in High-Profit States**:
-	Focus **marketing and sales efforts on New York, Washington, and Indiana**, where high-profit customers reside.

**3.  Promote High-Profit, Low-Volume Sales**:
-	Increase **targeted ads and promotions** for premium customers who order less but **generate high profits per unit**.

**4.  Optimize Pricing & Refine Discount Strategy**:
-	Analyze discount effectiveness—some customers had **zero discounts** and still produced high margins.
- **Experiment with small discounts** for high-potential customers (e.g., **Tom Ashbrook’s 4% discount** seems to work well).

**5.  Leverage Data for Predictive Marketing**:
-	Use **past sales data** to identify future high-potential customers, ensuring that the marketing budget is directed toward the most profitable segments.
-	**Segment customers** by spending, frequency, and loyalty to better tailor promotional campaigns and pricing models.
 

### **4.  THE TOP 3 MOST PROFITABLE PRODUCTS PER YEAR**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company offers a diverse range of products but lacks a structured approach to consistently identify top-performing products based on profitability. Some products generate higher profits than others, but without data-driven insights, resource allocation, pricing, and inventory decisions are not optimized.

**🎯 Project Goal**:
This project aims to identifying the top 3 most profitable products each year by analysing their sales, quantity, and order metrics. The insights derived will help the company refine pricing strategies, optimize inventory, and enhance marketing efforts to maximize profitability and sustain growth.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which three products across different categories consistently generate the highest profit each year, and how can we optimize our product strategies, pricing, and inventory management to maximize their potential?

**🛠 Approach**:
-	Develop SQL queries to analyze year-over-year performance for each product.
-	Focus on key metrics: profitability, sales, quantity sold, order volume, average discount (in %), and profit margin (in %) for each top product. 
-	Provide data-driven recommendations to improve pricing, inventory, and marketing strategies for top-performing products.	

![4  The Top 3 Most Profitable Products per Year](https://github.com/user-attachments/assets/d63f4dd3-eb15-48df-aa75-a9203c77ded2)

![4a  The Top 3 Most Profitable Products per Year - Showcasing Sales   Profitability](https://github.com/user-attachments/assets/db86b7e2-a8bf-4d3d-a51a-cd226dd35a99)

![4b  The Top 3 Most Profitable Products per Year](https://github.com/user-attachments/assets/4d8c9660-c11d-44ed-902b-72f4d5f695f5)


### **Here's the breakdown of RESULT based on the QUERY above**:

![4](https://github.com/user-attachments/assets/c2266795-8315-4fdc-8828-536094c76279)

### **🔎 Key Trends & Insights**
**1.  Technology Products Drive Profitability**:
-	**Canon imageCLASS 2200 Advanced Copier (2022 & 2023)** consistently tops profitability, showing strong and increasing demand.
-	Printers and copiers (Canon, HP, Zebra) dominate high-profit products yearly.

**2.  Office Supplies Perform Well but Face Margin Declines**:
-	**Ibico EPK-21 (2020) & Fellowes PB500 (2021)** were highly profitable, proving strong demand for binding systems.
-	However, **DocuBind TL300 (2023)** saw a **decline in profit margins (17.46%)**, suggesting increased competition or pricing challenges.

**3.  Profitability Per Unit Matters**:
-	**Canon imageCLASS 2200 (2023)** had the **highest per-unit profit ($1,425.45/unit)**, showing premium pricing potential.
-	Other high-profit-per-unit products **(HP Designjet T520, Zebra ZM400)** could benefit from targeted marketing and pricing optimization.

**4.  Sales Growth Doesn’t Always Equal Profit Growth**:
-	While **sales grew for Canon imageCLASS, profitability didn’t always scale at the same rate**.
-	**HP Designjet T520 (2022) had strong sales but a lower profit margin (32%)**, signaling potential pricing or cost inefficiencies.

**5.  Orders vs. Profitability Disparity**:
-	**High order volume** doesn’t always translate to** high profitability**.
-	**Canon imageCLASS & HP Designjet had fewer orders but high profitability**, indicating a focus on high-value products over volume sales.

**6.  Inventory & Demand Management**:
-	**Canon imageCLASS 2200 (2022-2023) is on an upward trend**, meaning stable stock availability is crucial to avoid missed sales.
-	**GBC Ibimaster 500 had high sales but suffered from deep discounts**, reducing overall profitability.

**7.  Discounting Strategies Impact Margins**:
-	**Fellowes PB500 (2021)** sustained **strong profitability** despite a **5% discount**, showing that strategic discounting can drive sales while protecting margins.
-	**Canon PC1060 (2021) and GBC Ibimaster 500 (2022) had excessive discounts (10-53%)**, leading to reduced profit margins, indicating the need for better discount control.


### 🎯**Strategic Recommendations**
**1.  Prioritize High-Profit, High-Demand Products**:
-	**Canon imageCLASS 2200 Copier** should be a **flagship product**, with **consistent stock, targeted marketing, and upselling opportunities**.
-	Invest in **high-margin technology products** (e.g., Canon MF7460 and Zebra ZM400 Printers), which deliver **strong profits without discounts**.

**2.  Optimize Discount Strategies**:
-	Reduce **heavy discounts** on GBC Ibimaster 500 (53%) and DocuBind TL300 (32%) to improve profit margins.
-	**Test price increases** for low-discount, high-performing items like **Ibico EPK-21 and Zebra ZM400**, as they have proven demand.

**3.  Improve Product-Specific Marketing & Sales Focus**:
-	**For premium technology products (Canon imageCLASS 2200, HP Designjet T520)**, offer **bundled service plans or maintenance packages** to increase revenue.
-	**For office supplies (binding machines, shredders)**, focus on **bulk sales promotions** rather than discount-driven strategies.

**4.  Inventory & Supply Chain Optimization**:
-	Ensure **high-demand items like Canon imageCLASS 2200 are always in stock**.
-	Reduce slow-moving, low-profit products, and **invest more in high-turnover, high-profit products**.


### **5.  THE TOP 3 MOST PROFITABLE STATES PER YEAR**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company has observed significant performance variations across different states but lacks a structured approach to identifying top-performing regions. Despite evenly distributed resources, there is no clear visibility into which states consistently drive the highest profits.

**🎯 Project Goal**:
This project aims to identifying the top 3 most profitable states each year, enabling the business to optimize regional strategies, adjust inventory, fine-tune pricing and improve marketing efforts to maximize profitability.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which three states consistently generate the highest profits year over year, and how can we focus our resources and marketing efforts on these high-performing regions for sustainable growth?

**🛠 Approach**:
-	Write SQL queries to analyze year-over-year profitability trends by state.
-	Identify top-performing regions based on sales, profit, order volume , average discount (in %), and profit_margin (in %).
-	Provide data-driven recommendations to refine marketing, inventory allocation, and regional business strategies.	

![5  The Top 3 Most Profitable States per Year](https://github.com/user-attachments/assets/ab8aefeb-93b9-443d-a836-d430ca0079ad)

![5a  The Top 3 Most Profitable States per Year - Showcasing Sales   Profitability](https://github.com/user-attachments/assets/76dadd9e-59bd-4ce1-a12f-078895ca91f7)

![5b  The Top 3 Most Profitable States per Year](https://github.com/user-attachments/assets/17386511-4648-4bee-a118-86a7e6f4cdc9)


### **Here's the breakdown of RESULT based on the QUERY above**:

![5](https://github.com/user-attachments/assets/83a34c50-465d-4639-9ee4-b5e9885ea7ec)

### **🔎 Key Trends & Insights**
**1.  Consistently High-Performing States**:
-	**New York and California** have consistently ranked in the top 2 in profitability every year (2020-2023).
-	**Washington** also appears frequently but with **slightly lower total profits than New York and California**.

**2.  New York Leads in Profit Margins**:
-	**New York's profit margin** has grown from **21.22% in 2020 to 25.93% in 2023**, indicating strong pricing power and profitability growth. 
-	**Washington has high profit margins (26.33% in 2023) but lower total sales**, meaning it has strong profitability per unit but lower market penetration.

**3.  California Dominates Sales but Not Margins**:
-	**California** has the highest total sales volume each year, reaching **$147.36K in 2023**.
-	However, its **profit margins remain relatively lower (14-20%)**, suggesting a focus on high sales volume but lower profit efficiency.


**4.  Indiana’s Surprising Profitability Spike in 2022**:
-	**Indiana had an exceptionally high profit margin (40.79%) in 2022**, despite lower sales and order volume.
-	This suggests high-margin products were sold in Indiana that year, but it did not continue into 2023.

**5.  Discounting Strategies and Their Impact**:
-	**New York keeps discounts low (5-6%)** while increasing profitability.
-	**California applies higher discounts (7-8%)** but still maintains the highest sales volume.



### 🎯**Strategic Recommendations**
**1.  Prioritize New York & California**:
-	Increase marketing efforts and inventory allocation in these states.
-	Invest in customer engagement & regional partnerships.

**2.  Capitalize on High-Margin States**:
-	**Washington (26.33%) and Indiana (40.79%)** had high-profit margins—focus on expanding profitable product lines in these areas.

**3.  Adjust Regional Pricing & Discounts**:
-	**California had a lower profit margin (approximately 15%)** but high sales—optimize pricing strategy to increase profitability per unit.

**4.  Optimize Supply Chain & Inventory Management**:
-	Increase stock levels in top-performing states to meet demand.
-	Focus on efficient distribution to reduce costs in high-margin states.


### **6.  TOP 20 MOST PROFITABLE CUSTOMERS**
**I. PROJECT OVERVIEW**

**💡 Business Challenge**:
Customer profitability varies significantly, with some customers contributing much higher profits than others. The business needs a structured approach to identifying high-value customers across different states to optimize sales strategies, enhance loyalty programs, and improve marketing efforts.

**🎯 Project Goal**:
This project aims to identify the top 20 most profitable customers across states using key metrics such as profit, sales, and order frequency. The insights derived will help the company refine customer engagement strategies, increase retention, and drive sustainable profitability.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Who are the top 20 customers generating the most profit across different states, and how can we tailor our strategies to further increase profitability with these high-value customers?

**🛠 Approach**:
-	Write SQL queries to analyze profitability trends by customer and state.
-	Identify top 20 high-value customers based on profit, sales, order frequency, average discount (in %), and profit margin (in %).
-	Provide data-driven recommendations for targeted marketing, personalized engagement, and loyalty programs.

![6  Top 20 Most Profitable Customers](https://github.com/user-attachments/assets/158aeda7-f212-47a8-b2f8-490bfd525fa4)

![6a  Top 20 Most Profitable Customers - Showcasing Profitability   Sales](https://github.com/user-attachments/assets/8fe6c8d7-f1ee-41b4-a912-57bbebe67f22)

![6b  Top 20 Most Profitable Customers](https://github.com/user-attachments/assets/a74c0f90-3a85-48e6-be84-f878880b68d1)


### **Here's the breakdown of RESULT based on the QUERY above**:

![6](https://github.com/user-attachments/assets/20b20f33-441c-49ab-bec6-fb7a731447e6)

### **🔎 Key Trends & Insights**
**1.  High-Value Customers Driving Profitability**:
-	**Tamara Chand (Indiana, $8.76K profit, 47.79% margin) and Raymond Buch (Washington, $6.73K profit, 47.92% margin)** are the top contributors, indicating strong purchasing power.
-	**Hunter Lopez (Delaware, $5.04K profit, 48% margin, $1680 profit/unit)** stands out with the highest profit per unit, suggesting premium product purchases.

**2.	Customer Profitability by State**:
-	**New York has multiple high-value customers**, including **Tom Ashbrook ($4.60K profit), Keith Dawkins ($2.51K profit), Karen Daniels ($2.28K profit), and Steven Roelle ($1.86K profit)**.
-	**Michigan also has strong contributors**, like **Adrian Barton ($4.95K profit) and Andy Reiter ($2.60K profit)**.

**3.	Order Frequency vs. Profitability**:
-	Some **customers generate high profits with fewer orders**, such as **Hunter Lopez (1 order, $5.04K profit) and Tom Boeckenhauer (1 order, $2.24K profit)**, indicating premium purchases.
-	Others, like **Karen Daniels (6 orders, $2.28K profit), have steady repeat purchases**, suggesting long-term engagement potential.

**4.	Frequent Buyers with Moderate Profit**:
-	**Jane Waco (CA, 33 units, $2.07K profit)** and **Steven Roelle (NY, 21 units, $1.86K profit)** are making frequent purchases but at lower profit per unit.
-	Potential opportunity to upsell higher-margin products to these customers.

**5.	Impact of Discounts**:
-	**Customers with higher discounts (e.g., Jane Waco, 13%) tend to have lower profit margins**, highlighting the need for discount optimization.
-	**Top-performing customers received little to no discounts**, reinforcing the effectiveness of premium pricing for high-value customers.

### 🎯**Strategic Recommendations**
**1.  Implement VIP & Loyalty Programs for Top Customers**:
-	**Offer exclusive discounts**, early access to new products, and personalized services for high-value customers.
-	**Example**: Target **Tamara Chand & Raymond Buch** with priority services & retention plans.

**2.   Engage Low-Frequency, High-Profit Customers More**:
-	**Customers like Hunter Lopez & Adrian Barton made 1-3 orders but brought huge profits**.
-	Use **targeted outreach (personal calls/emails) & incentives** to **convert them into repeat buyers**.

**3.   Expand Focus on High-Profit States (New York, Michigan, Washington)**:
-	**5 customers from New York alone**.  Invest in localized marketing & tailored campaigns.

-	**Michigan has 3 top customers**.  Consider special deals for customers in this state.
**4.   Leverage High Profit-Per-Unit Buyers**:
-	 **Hunter Lopez ($1680 per unit), Tom Boeckenhauer ($560 per unit), Adrian Barton ($380 per unit)**.  They prefer premium products.
-	**Sell high-end or bundled products** to these customers for maximum profitability.

**5.  Optimize Discount Strategy**:
-	Given that **top customers buy at full price, avoid unnecessary discounts and focus on value-based upselling**.

**6.   Data-Driven Personalized Marketing**:
-	Use **customer segmentation** to craft hyper-personalized offers & retention strategies**.
-	Target **repeat buyers differently from one-time big spenders** to increase engagement.


### **7.   TOP 20 MOST PROFITABLE PRODUCTS**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company offers a wide range of products, but some significantly outperform others in terms of profitability. To streamline the product portfolio and boost overall profitability, the business needs a structured, data-driven approach to identifying and prioritizing high-performing products.

**🎯 Project Goal**:
This project aims to identify the top 20 most profitable products using key metrics such as profit, sales, quantity sold, and order volume. The insights derived will help the company refine pricing strategies, optimize inventory management and enhance product offerings for sustained growth.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which 20 products are generating the highest profit across different categories, and how can we leverage this data to optimize product offerings, pricing strategies, and inventory management for maximum profitability?

**🛠 Approach**:
-	Write SQL queries to analyze product-level profitability trends.
-	Identify top 20 most profitable products based on profit, sales, quantity sold, order volume, average discount (in %), and profit margin (in %).
-	Provide data-driven recommendations for inventory optimization, pricing adjustments, and strategic product positioning.

![7   Top 20 Most Profitable Products](https://github.com/user-attachments/assets/ae1335a8-1207-49e6-a7ec-ebf0bed14c51)

![7a  Top 20 Most Profitable Products - Showcasing Profitability   Sales ](https://github.com/user-attachments/assets/26b89cbc-b126-43c8-a909-bde6391c84c8)

![7b  Top 20 Most Profitable Products](https://github.com/user-attachments/assets/3a603761-3a16-4b70-98b4-cf6577b36e66)


### **Here's the breakdown of RESULT based on the QUERY above**:

![7](https://github.com/user-attachments/assets/3648342d-da9d-46a0-b65f-0e620a9f29ee)

### **🔎 Key Trends & Insights**
**1.  High-Profit Leaders**: 
-	**Canon imageCLASS 2200 Advanced Copier dominates with $25.2K profit**, making it the most profitable product.

**2.  Technology Drives Profitability**:
-	**Majority of top products fall under Technology**, particularly printers, copiers, and accessories.

**3.  High Profit Margin Products**:
-	**Ativa Micro-Cut Shredder (49%) and Zebra Thermal Printer (48%) boast the highest profit margins**, making them high-value, low-quantity items.

**4.  High Unit Profitability**:
-	**Products like the Canon imageCLASS 2200 and Zebra ZM400 Thermal Printer generate over $500 per unit**, making them key revenue drivers.

**5.  Office Supplies Need Optimization**: 
-	Some **Office Supplies like the GBC DocuBind TL300 have low-profit margins (11.27%) despite high sales**, suggesting low-pricing or excessive discounts.

**6.  Low Discount, High Returns**: 
-	**Products with little to no discounting (e.g., Zebra Printer, Ativa Shredder, Logitech Z-906 Speaker) still perform well**, indicating premium pricing power.

**7.  Impact of Discounts**:
-	**Products with higher average discounts (e.g., Ibico EPK-21, 33%)** tend to have lower profit margins.

### 🎯**Strategic Recommendations**
**1.  Double Down on High-Profit Technology Products**:
-	Prioritize **premium copiers, printers & shredders (Canon, HP, Zebra**)
-	**Expand marketing** for high-margin products ($300+ per unit profit)

**2.  Optimize Inventory for High-Demand, Lower-Margin Products**:
-	**Gaming accessories & headsets** have strong sales but lower per-unit profit
-	**Stock efficiently** to meet demand without overinvesting in low-margin items

**3.  Refine Pricing & Discounts for High-Volume Products**:
-	**Reduce discounts** on high-margin products (Canon, Zebra, HP)
-	**Optimize pricing** for binding machines and gaming accessories

**4.  Phase Out or Improve Low-Profit Products**:
-	Products with margins below 20% should be reassessed
-	Reallocate inventory & marketing spend to high-margin products


### **8.  TOP 20 MOST PROFITABLE CITIES**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company is looking to optimize its performance across different cities. Despite having operations in many areas, some cities significantly outperform others in terms of profitability, sales volume, and order frequency.

**🎯 Project Goal**:
This project aims to identify the top 20 most profitable cities based on sales, profit, and order frequency. The insights derived will help the company to optimize sales strategies, discount offerings, and regional operations for maximum profitability.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which 20 cities generate the highest profit across different states, and how can we use this insight to prioritize high-impact regions for optimizing sales strategies, discounts, and order management?

**🛠 Approach**: 
-	 Write SQL queries to analyze profit and sales trends across different cities. 
-	Identify top 20 most profitable cities based on profitability, sales, quantity sold, order volume, average discount (in %), and profit margin (in %).
-	Provide actionable recommendations for regional marketing strategies, discount optimization, and investment focus.

![8  Top 20 Most Profitable Cities](https://github.com/user-attachments/assets/83348eb2-ce15-44e1-bcb5-83a98b2b8595)

![8a  Top 20 Most Profitable Cities - Showcasing Sales   Profitability](https://github.com/user-attachments/assets/9816b0cf-6957-4489-9054-8384e0d891e9)

![8b  Top 20 Most Profitable Cities ](https://github.com/user-attachments/assets/eaec405b-a3f4-4555-ad0e-3a1d2b408d51)


### **Here's the breakdown of RESULT based on the QUERY above**:

![8](https://github.com/user-attachments/assets/7e74eff1-b8af-407e-ade6-b42cdcdcb4bc)

### **🔎 Key Trends & Insights**
**1.  Top Profitable Cities**:
-	**New York City leads in total profit ($62,025.54) and sales ($256,343.56)**.
-	**Los Angeles and Seattle follow**, though with **lower profit margins**.
-	**Lafayette, IN has an exceptionally high profit per unit ($208.75)**, indicating niche, high-margin products.

**2.  High Profit Margins (%)**:
-	**Lafayette (45.73%), Atlanta (40.67%), and Minneapolis (40.45%) show strong profitability** despite lower total sales.
-	**Detroit (31.05%) also has a healthy profit margin**, making it an attractive city for business expansion.

**3.  Impact of Discounts**:
-	**Cities with low or no discounts (Lafayette, Newark, Atlanta, Minneapolis) tend to have higher profit margins**.
-	**San Diego (0.08 avg discount) has the lowest profit margin (13.4%)**, indicating discounting may be eroding profitability.

**4. Sales vs. Orders**:
-	**New York City (914 orders) and Los Angeles (747 orders) generate the highest order volumes**.
-	**Detroit and Lafayette have far fewer orders** but **extremely high profit per unit**.

**5. Hidden High-Margin Cities**:
-	**Detroit, Jackson, and Newark all maintain profit margins above 30%**, suggesting strong pricing power.
-	**Providence and Columbia have profit per unit above $40**, making them prime candidates for selective marketing strategies.

### 🎯**Strategic Recommendations**
**1.  Double Down on High-Performing Cities**:
-	**Increase marketing spend and expand product offerings in New York, Los Angeles, and Seattle**—these cities are high-volume, high-profit hubs.
-	Strengthen operations in these cities to maintain a **competitive edge and sustain growth**.

**2.  Expand High-Margin, Low-Volume Areas**:
-	**Cities like Lafayette, Minneapolis, and Jackson** show high profit per unit. **Test market expansion strategies, premium pricing models, or bundled services to maximize their profitability**.
-	**Investigate product types driving high margins in these cities** and replicate successful pricing strategies elsewhere.

**3.  Optimize Low-Margin, High-Sales Cities**:
-	**San Diego and San Francisco need pricing adjustments**, bundled offers, or cost optimizations to improve margins.
-	**Conduct cost analysis** to see if pricing tweaks can increase overall profit without significantly reducing sales.

**4.  Identify Emerging Growth Markets**:
-	**Cities like Providence, Columbia, and Newark show strong profit margins** but lower total sales. Targeted investment in sales incentives, regional discounts, or localized marketing could boost their overall contribution.
-	These cities may also be great testing grounds for new pricing or promotion models.

**5.  Strategic Discounting & Promotions**:
-	**Use targeted discount strategies for price-sensitive markets** while maintaining premium pricing in high-margin cities.
-	**Avoid blanket discounts that dilute profitability**—instead, focus on strategic promotions where high-margin products can be upsold.


### **9.   TOP 30% MOST PROFITABLE STATES**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company operates across multiple states, but profitability varies significantly. Some states outperform others in terms of profit, order volume, and sales, while others lag behind.

**🎯 Project Goal**:
This project aims to identify the top 30% of the most profitable states based on profit contribution, sales volume, and order frequency. The insights derived will help optimize marketing efforts, resource allocation, and sales strategies to maximize profitability inhigh-performing states while enhancing performance in underperforming regions.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which states contribute the most to our profitability, and how can we focus on the top 30% to maximize sales, orders, and resource allocation?

**🛠 Approach**:
-	Write SQL queries to analyze the top 30% of the most profitable states based on performance trends.
-	Rank states based on profit contribution, sales, order frequency, average discount (in %), and profit margin (in %).
-	Provide actionable recommendations for resource allocation and strategy optimization.

![9](https://github.com/user-attachments/assets/bf627f9d-1233-4b80-9cb7-6afa92868a62)

![9a  Top 30% Most Profitable States - Showcasing Sales   Profitability](https://github.com/user-attachments/assets/5f179bb0-1ebe-41bb-bbf6-4c92a137ab45)

![9b  Top 30% Most Profitable States](https://github.com/user-attachments/assets/d4eeec0c-ccf9-4525-a06d-05860693d61a)


### **Here's the breakdown of RESULT based on the QUERY above**:

![9](https://github.com/user-attachments/assets/3cfff934-6362-4e57-b2ef-7d938d36fe23)

### **🔎 Key Trends & Insights**
**1.  Top 5 Most Profitable States (Top 30%)**:
-	**California leads with $77.84K in profit** and the **highest sales volume ($465.33K)**, showing strong market demand.
-	**New York** follows closely with **$74.03K in profit** but achieves it with **lower sales ($310.85K), meaning higher profit efficiency (profit margin: 23.81%)**.
-	**Washington ranks third with $33.40K profit and a strong 24.09% margin**, indicating profitability despite lower sales.
-	**Michigan and Virginia complete the top 5**, with **high profit margins (32.07% and 26.32%)**, suggesting cost efficiency and strong pricing strategies.

**2.	Profit Efficiency vs. total Sales**: 
-	**Indiana (34.33%) and Minnesota (36.24%) have some of the highest profit margins**, meaning they generate more profit per dollar of sales.
-	**California (16.73%) and Massachusetts (23.7%) have lower profit margins despite high sales**, indicating room for pricing optimization.

**3.	High Profit per Unit States**:
-	**Rhode Island (36.61 profit/unit), Indiana (31.8), and Minnesota (32.7) show high profitability per unit sold**, indicating premium product sales or effective cost management.
-	**California has the lowest profit per unit ($9.97/unit)**, meaning sales volume drives its profitability more than pricing strategy.

**4.	Low Average Discount Across All States**: 
-	**Most states operate at full price**, suggesting minimal reliance on discount-driven sales.

**5.	Cumulative Distribution & Market Coverage**:
-	**The top 5 states (California, New York, Washington, Michigan, Virginia) contribute to 10% of cumulative profit distribution**, making them key focus areas for marketing and resource allocation.

### 🎯**Strategic Recommendations**
**1.   Top 30% of States Drive Profitability**:
-	**California, New York, Washington, Michigan, and Virginia** contribute the highest profits.
-	These states account for a significant portion of total sales and orders, making them prime targets for increased investment.

**2.  High Profit Margins in Mid-Tier States**:
-	States like **Indiana (34.33%), Minnesota (36.24%), and Delaware (36.35%)** have **high-profit margins** but lower total profits.
-	This suggests opportunities to **expand sales volume** while maintaining strong profitability.

**3.  Profit Per Unit Efficiency**:
-	**Rhode Island ($36.61), Indiana ($31.80), and Minnesota ($32.70)** generate high profits per unit, meaning they **maximize profit with fewer sales**.
-	Targeting premium pricing and niche marketing in these states could enhance returns.

**4.  Cumulative Profit Distribution**:
-	The **top five states contribute 30% of cumulative profit**, reinforcing the need to **prioritize these markets**.
•	States beyond **Indiana (cumulative >12%) show diminishing returns**, meaning investment should be strategic.


### **10.   TOP 30% MOST PROFITABLE SUB-CATEGORIES**
**I. PROJECT OVERVIEW** 

**💡 Business Challenge**:
The company is experiencing profitability challenges due to fluctuating sales and high market competition. Despite offering a broad range of products, only a subset of sub-categories significantly contributes to overall profitability, while others underperform or fail to generate enough revenue.

**🎯 Project Goal**:
This project aims to identify the top 30% most profitable product sub-categories based on profit contribution, sales volume, and margin. The insights derived will help optimize resource allocation, product offerings, and sales strategies for maximum profitability. Additionally, it will improve inventory planning, marketing focus, and overall business efficiency by prioritizing high-performing sub-categories.

**II. KEY BUSINESS QUESTION** 

**🔍 Business Question**:
Which product subcategories across different categories contribute the most to our profitability, and how can we focus on the top 30% to optimize sales and resource allocation?

**🛠 Approach**:
-	Write SQL queries to analyse the top 30% of the most profitable sub-categories based on performance trends.
-	Rank product sub-categories based on profit contribution, sales, order frequency, average discount (in %), and profit margin (in %).
-	Provide actionable recommendations for resource allocation and strategy optimization.	

![9](https://github.com/user-attachments/assets/de83b01e-563f-407e-acac-02c135abf981)

![10a  Top 30% Most Profitable Sub-Categories - Showcasing Sales   Profitability](https://github.com/user-attachments/assets/791980e1-3297-4703-a44d-e08d7333d743)

![10b  Top 30% Most Profitable Sub-Categories](https://github.com/user-attachments/assets/bc09ccae-3bb9-4602-95fa-45ee82d05315)


### **Here's the breakdown of RESULT based on the QUERY above**:

![10](https://github.com/user-attachments/assets/7c16a184-6c1b-49a7-a74e-45686396730f)

### **🔎 Key Trends & Insights**
**1.   Top Performers in Profit**: 
-	**The Copiers sub-category leads in total profit with $55.62K**, followed by **Accessories at $48.29K**. These sub-categories are the most profitable, contributing significantly to the overall business success.

**2.   Profit Margin**: 
-	**Paper has the highest profit margin at 43.43%**, indicating strong profitability despite lower total sales. The **Phones sub-category**, though generating **significant sales, has a relatively lower margin at 13.16%**.

**3.   Profit Per Unit**: 
-	**Copiers has the highest profit per unit at $237.68**, which means each unit sold is contributing significantly to profit. In comparison, **Binders and Phones have much lower profit per unit, at $4.96 and $13.74**, respectively.

**4.   Volume-Driven Categories**:
-	**Accessories and Phones generate impressive total sales and volumes**, but with **lower margins and profit per unit (around $15.45 and $13.74 respectively)**.
-	These categories rely on volume rather than premium pricing to drive profit.

**5.   High Discounts and Lower Profitability**:
-	**Binders Have High Discounts (37%) and Lower Profitability despite high total sales**. Discounts may be eating into profits, leading to low per-unit profit ($4.96) despite high sales volume (6,113 units).

**6.   Cumulative Profit Distribution**:
-	The top 30% most profitable sub-categories (Copiers, Accessories, Phones) account for roughly 70% of total profit.
-	**Binders and Paper contribute less to overall profit**, despite high sales and order volumes.

### 🎯**Strategic Recommendations**
**1.   Prioritize High-Value, High-Profit Sub-Categories**:
-	**Copiers & Paper**: Increase marketing for **premium copier sales** and **bulk purchasing incentives** for paper.
-	**Accessories**: Maintain **steady promotions** while ensuring **cost efficiency**.

**2.   Improve Profit Margins in High-Revenue but Low-Profit Categories**:
-	**Phones & Binders**: Focus on **upselling accessories**, offering **bundles**, and optimizing pricing.
-	** Review supplier negotiations** to lower costs and enhance profit margins.

**3.   Strategic Inventory & Resource Allocation**:
-	**More resources into Copiers, Paper, and Accessories** due to their strong **profitability and margin performance**.
-	**Adjust marketing and inventory for Binders & Phones** to improve profit efficiency.

**4.    Marketing Strategy**: 
-	Shift marketing efforts to emphasize the high-performing sub-categories. 
-	**Target campaigns that highlight the high value and quality of Copiers and Accessories**, which can increase customer interest and boost profitability.


### **OVERALL ESTIMATED BUSINESS IMPACT**
**1.   Revenue Growth**: **12-20**% increase

**2.   Profit Margin Improvement**: **5-15**% uplift

**3.   Customer Retention**: **10-20**% improvement

**4.   Cost Savings (Efficiency & Optimization)**: **8-12**% reduction in operational expenses

**5.   Marketing ROI**: **8-15**% improvement in efficiency

**6.   Regional Expansion Benefits**: **Up to 10**% increase in state-level sales


## **🎓 WHAT I LEARNED**
-	**SQL Query Optimization**: Efficient ways to extract and analyze business data.
-	**Pattern Recognition**: Identifying key trends that influence profitability.
-	**Business Strategy Alignment**: Connecting insights with actionable recommendations.
-	**Data Visualization**: Enhancing storytelling through dashboards and reports.

## **🏁 CONCLUSION**
This project demonstrates the power of data analytics in guiding business decisions. By leveraging SQL and visualization tools, we successfully uncovered insights that can drive profitability, enhance customer retention, and optimize operational strategies. The findings can help the business focus on high-impact areas while mitigating potential risks.

## **💡 CLOSING THOUGHT**
Informed decision-making is the foundation of a successful business. With the right data and analytical approach, companies can achieve sustained growth and stay ahead of the competition.

**🚀 TRANSFORMING DATA INTO DECISIONS!**
Explore, share, and connect as we turn raw data into actionable insights that drive real impact. Let's make data work for you!

## **🌟 CONNECT WITH ME**
- **📞 +234-8065060691**
- **📧 Email: krisbalo11@gmail.com**
- **🔗 LinkedIn**: [Connect with me on LinkedIn](https://www.linkedin.com/in/olumide-balogun1/)
- **🔗 Medium**: [Explore my Data Storytelling articles](https://medium.com/@Olumide-Balogun)

