# Adidas Sales & Marketing Analysis  
**Portfolio Project | PostgreSQL + Tableau Public**

## Project Overview
Adidas sales performance fluctuates from month to month, making it difficult to clearly identify which categories, channels, and regions are driving growth, which areas are hurting profitability, and how marketing spend contributes to business performance. This project analyzes sales and marketing data using PostgreSQL and Tableau to uncover performance drivers, track key KPIs, and translate findings into actionable business recommendations.

## Business Problem
Management needs a clearer view of:
- which products, categories, channels, and regions generate the strongest results,
- how discounting affects revenue and profit,
- whether marketing spend is producing efficient returns,
- and how sales performance changes over time.

## Project Objectives
- Track core business KPIs: **Sales, Profit, Units, Orders**
- Analyze **month-over-month (MoM)** and **year-over-year (YoY)** trends
- Evaluate **category, product, region, and store type** performance
- Measure **marketing effectiveness** using **ROAS, CTR, and CVR**
- Build an interactive **4-panel Tableau dashboard**
- Translate data into **business recommendations**

## Tools Used
- **PostgreSQL** — data preparation, KPI calculations, trend analysis, SQL views
- **Tableau Public** — dashboard design, filters, navigation, interactive analysis

## Dataset
This project uses a Adidas sales Kaggle dataset enriched with additional marketing data to support performance marketing analysis.

## Tableau Dashboard
[View Dashboard on Tableau Public](https://public.tableau.com/views/Adidasproject/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Business Questions
This project was built to answer the following questions:

### Sales & Profitability
- What is the store sales channel for our highest-revenue “high-value” orders, and which regions are these sales concentrated in?
- Which geographic regions contribute most to profitability, and where should investment priority be given?
- What is our monthly profit margin and growth rate (MoM)?
- By what percentage have our sales grown compared to January of last year?

### Product & Commercial Performance
- Which products and categories are performing best?
- How do average unit prices vary by category?
- How do payment methods affect Average Order Value (AOV)?
- How do customer demographics (age and gender) reflect product preferences and revenue contribution?

### Pricing & Discount Strategy
- How are orders distributed relative to total revenue when categorized?
- Do discount rates increase sales volume, or do they mainly reduce profitability?

### Marketing Performance
- In which regions and channels do marketing expenditures yield the highest ROAS?
- Does revenue increase proportionally when marketing spend increases?
- Which month is the most efficient from a marketing perspective?

---

## 📊 Key Insights

### 1. Order-Based Performance and High-Value Sales (Phase 1)
**Business Question:**  
What is the store sales channel for our highest-revenue "High-Value" orders, and which region are these sales concentrated in?

- Online sales contribute the most to total revenue with **$399,621.36**, followed by Retail sales with **$306,441.24**.  
- The top 3 highest-revenue orders (e.g., first place with **$1,526.11**) are from the **European region** and the **Retail sales channel**.  
- The Asia-Pacific region and Retail channel rank 4th with a revenue of **$1,405**.  

---

### 2. Regional Revenue and Profit Distribution (Phase 2)
**Business Question:**  
Which geographic regions contribute significantly to total profitability, and where should investment priority be given?

- In terms of profitable orders, **Europe** and **Asia-Pacific** regions lead the list.  

---

### 3. Order Classification and Discount Effect (Phase 3)
**Business Questions:**  
When we classify orders, how is the distribution relative to total revenue?  
Do discount rates increase sales volume, or do they erode profit margins?

- The **Footwear** category ranks first with total revenue of **$537,016.86**, while **Accessories** ranks lowest with **$92,983.41**.  
- The highest profit (**$136,722.75**) and highest number of orders (**1,794**) come from **non-discounted sales**.  
- When discount rates exceed **10%**, order volume drops from **1,326 to 381**, and profit decreases significantly to **$5,545.41**.  

---

### 4. Monthly KPIs and Growth Trends (MoM & YoY) (Phase 5 & 6)

#### a) Monthly Performance
**Business Question:**  a)  "What is our monthly profit margin and growth rate (MoM)?" “
- **Highest Sales Month:** According to the data, October 2023 is an all-time high with total sales of $38,326.47. This month also marks the highest sales volume with 456 units.
- **Most Profitable Month:** March 2024 leads in total profit with $11,856.63.
- **Highest Profit Margins:**  : The months with the highest profit margins are July 2025 (31.71%), November 2023 (31.56%), and June 2024 (31.49%).
In March 2024, sales showed a record growth of 107.4% (1.0744) compared to the previous month. There is similar growth in May 2024. March-May 2024 stand out in terms of sales growth. - The highest **AOV** was observed in April 2023 with **$291.05**). 


#### b) Year-over-Year (YoY) Growth
“I tried to write code for total sales (revenue) and year-on-year growth (YoY) for each month to compare the total revenue data for January 2025 with the total revenue data for January 2024 using YoY calculations.” 
**Business Questions:**    "What percentage did our sales grow compared to January of last year?"
**January 2025:** total revenue: $21,489.84, 2024 total revenue: $30,080.88
YOY revenue growth: -28.56
January 2024: $30,080.88, 2023 total revenue: $26,523.45
YOY revenue growth: 13.41
Sales in 2025 decreased by 28.56% compared to January of last year (2024) (there is a contraction, not growth). Sales in 2024, however, showed a growth of 13.41% compared to January 2023.


---

### 5. Product and Category Performance (Phase 6)
**Business Questions:**  
Which products and categories perform best?  How do average unit prices vary?
-The product **“Predator Freak”** is the top revenue-generating product with **$94,797.24**, followed by **Ultraboost Light** with $90,576.27 and Primegreen Jacket with $83,160.27. The top 3 categories are **Footwear** and **Apparelv.
-The Footwear category is the strongest category with a total revenue of $179,005.62, while the Accessories category shows the lowest performance with $30,994.47.
-The average unit price of products in the footwear category ($128.62) is approximately 4 times that of accessories ($32.00).

---

### 6. Payment Method & AOV (Phase 7)
**Business Question:**  
How do payment methods affect AOV?

-It is observed that customers using **PayPal** and **internet banking** spend more per transaction, while those using mobile wallets and cash have lower average order amounts. 

---

### 7. Demographic Analysis (Phase 7)
**Business Question:**  
How do customer demographics reflect product preferences and revenue?

-The **“Shoes”** category is the best performing category across all genders and age groups, consistently ranking first in terms of revenue generation. The **“Accessories”** category ranks 2nd and the “Purposewear” category ranks 3rd for both genders.


---

## 📢 Marketing Analysis

### 8. Region & Channel Based ROAS Analysis
**Business Question:**  
In which regions and channels do marketing expenditures yield the highest ROAS?
- **North America** has the highest return on advertising spend with 14.85 ROAS, achieved through email campaigns. The North American region also generates high ROAS through Instagram (7.61 ROAS) and Facebook (3.79 ROAS) channels.
- **Asia-Pacific** region ranks 2nd in terms of region ROAS with 10.38 ROAS through Google Ads and stands out in achieving high returns with ROAS across multiple channels such as Instagram, Google Ads, and Facebook.

---

### 9. Marketing Efficiency Trend
**Business Question:**  
Does revenue increase proportionally with increased marketing spend?  Which is the most efficient month?
- **April 2023**  was the most efficient month, achieving the lowest cost ratio of 8.98 and the highest return on marketing spending. - **February 2023** represents the least efficient period, with marketing spending significantly exceeding revenue at 27.44.
- **Marketing cost** ratio fluctuates between **8.98 and 27.44**, indicating instability. 
Revenues related to increasing or decreasing marketing spending show significant fluctuations between months.

---

##  🚀 Recommendations

Based on my analysis, I recommend these:

**1.** Customer experience in the "Retail" channel, where high-value orders are concentrated, can be improved by integrating it with the "Online" channel, pushing it further up the basket.  

**2.** Regional campaign budgets can be optimized to increase market share in the European market, where profitability is highest. Data shows a lack of response to high discounts worldwide. Therefore, instead of a "Discount of more than 10%" model, a "No Discount or Less than 10% Discount" sales strategy that protects brand value can be tried.  

**3.** The increase in demand in March and April (seasonality) suggests that stocking and marketing expenditures should be significant. The low-performing category of accessories can be positioned not as an undesirable "hero product," but as basket complementary products.  

**4.** Increase total revenue per order through targeted incentives with PayPal and internet banking support. You can organize different marketing campaigns with PayPal and internet banking companies and use payment as a behavioral segmentation variable in marketing campaigns and advertisements.  

**5.** In the North American region, high efficiency from email marketing is evident, leading to increased revenue and profit through targeted marketing strategies and email-specific campaigns. In the Asia Pacific region, data is largely collected through Google Ads, resulting in expanding Google ad budgets. Performance marketing can be prioritized by experimenting with different Google Ads.  

**6.** Generally, Instagram ads appear to generate high revenue while incurring high costs; therefore, experiments can be conducted to see how lower the return on investment is with Story ads, or to assess the success of ad trials through A/B testing. The overall system can be weighted by measuring channel-based marketing performance.


---

## Dashboard Structure
The Tableau solution is designed as a 4-panel analytics dashboard covering:
- Executive KPI Overview
- Product Performance
- Trend Analysis
- Marketing KPI's

---

## SQL Skills Demonstrated
- Aggregation and grouping
- CASE-based business logic
- Window functions (`LAG`, ranking)
- MoM and YoY calculations
- KPI calculations
- View creation for dashboard-ready datasets
- Marketing and sales performance integration
---

## Author
**[Eda]**  
Junior Data Analyst- Portfolio Project
