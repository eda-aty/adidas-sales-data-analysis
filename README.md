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
[View Dashboard on Tableau Public](https://public.tableau.com/views/Adidasproject/DeepInsightDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

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
**Business Question:**  
What is our monthly profit margin and growth rate (MoM)?

- **Highest Sales Month:** October 2023 with **$38,326.47** in total sales and **456 units sold**.  
- **Most Profitable Month:** March 2024 with **$11,856.63** in profit.  
- **Highest Profit Margins:**  
  - July 2025 → **31.71%**  
  - November 2023 → **31.56%**  
  - June 2024 → **31.49%**  
- March 2024 shows a **107.4% MoM growth**, with similar growth in May 2024.  
- The highest **AOV** was observed in April 2023 (**$291.05**).  

#### b) Year-over-Year (YoY) Growth
**Business Question:**  
What percentage did our sales grow compared to January of last year?

- January 2025 revenue: **$21,489.84**  
- January 2024 revenue: **$30,080.88**  
→ **YoY Growth: -28.56% (decline)**  

- January 2024 revenue: **$30,080.88**  
- January 2023 revenue: **$26,523.45**  
→ **YoY Growth: +13.41%**  

---

### 5. Product and Category Performance (Phase 6)
**Business Questions:**  
Which products and categories perform best?  
How do average unit prices vary?

- Top revenue-generating products:  
  - Predator Freak → **$94,797.24**  
  - Ultraboost Light → **$90,576.27**  
  - Primegreen Jacket → **$83,160.27**  
- **Footwear** is the strongest category with **$179,005.62**, while **Accessories** is the weakest with **$30,994.47**.  
- The average unit price in Footwear (**$128.62**) is approximately **4x higher** than Accessories (**$32.00**).  

---

### 6. Payment Method & AOV (Phase 7)
**Business Question:**  
How do payment methods affect AOV?

- Customers using **PayPal** and **internet banking** spend more per transaction.  
- Customers using **mobile wallets** and **cash** have lower average order values.  

---

### 7. Demographic Analysis (Phase 7)
**Business Question:**  
How do customer demographics reflect product preferences and revenue?

- The **Footwear (Shoes)** category is the top-performing category across all genders and age groups.  
- **Accessories** ranks second and **Purposewear** ranks third across segments.  

---

## 📢 Marketing Analysis

### 8. Region & Channel Based ROAS Analysis
**Business Question:**  
In which regions and channels do marketing expenditures yield the highest ROAS?

- **North America** achieves the highest ROAS (**14.85**) through **Email campaigns**.  
- It also performs strongly in:  
  - Instagram → **7.61 ROAS**  
  - Facebook → **3.79 ROAS**  
- **Asia-Pacific** ranks second with strong ROAS across multiple channels, including:  
  - Google Ads → **10.38 ROAS**  
  - Instagram, Facebook, and others  

---

### 9. Marketing Efficiency Trend
**Business Question:**  
Does revenue increase proportionally with increased marketing spend?  
Which is the most efficient month?

- **April 2023** is the most efficient month with the lowest cost ratio (**8.98**).  
- **February 2023** is the least efficient month with the highest ratio (**27.44**).  
- Marketing cost ratio fluctuates between **8.98 and 27.44**, indicating instability.  
- Revenue does not consistently increase with higher marketing spend, showing inefficiencies in budget allocation.  

---
---

## Recommendations
Based on the analysis, the following actions are recommended:

1. **Prioritize high-performing regions**  
   Focus growth efforts on Europe and Asia-Pacific for commercial performance, and North America / Asia-Pacific for marketing efficiency.

2. **Protect full-price sales**  
   Large discounts reduce both order volume and profitability. Use discounting selectively.

3. **Double down on hero products**  
   Support best-selling products such as Predator Freak and Ultraboost Light with better placement, inventory, and targeted campaigns.

4. **Scale efficient marketing channels**  
   Expand channels with proven ROAS such as Email in North America and high-performing paid channels in Asia-Pacific.

5. **Monitor monthly volatility closely**  
   Growth is not stable. Use MoM and YoY trend tracking to identify early changes in demand and profitability.

6. **Use customer segmentation for targeting**  
   Payment behavior and demographic patterns can support more focused pricing, promotion, and retention strategies.

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
Junior Data Analyst Portfolio Project
