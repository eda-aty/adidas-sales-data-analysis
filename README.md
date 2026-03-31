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

## Key Insights

### 1) High-Value Orders & Sales Channel Performance
- Online sales generated the highest total revenue (**$399,621.36**), followed by Retail (**$306,441.24**).
- The top three highest-revenue orders were concentrated in the **Europe** region and mainly came through the **Retail** channel.
- Asia-Pacific also appeared among the top-performing high-value transactions.

**Business takeaway:**  
High-value orders are concentrated in a small number of regions and channels, suggesting that commercial performance is not evenly distributed.

---

### 2) Regional Profitability
- **Europe** and **Asia-Pacific** emerged as the leading regions in profitable orders.

**Business takeaway:**  
These regions should remain top priorities for investment, optimization, and commercial scaling.

---

### 3) Category Performance & Discount Impact
- **Footwear** ranked first in revenue contribution (**$537,016.86**), while **Accessories** ranked last (**$92,983.41**).
- The highest profit (**$136,722.75**) and the highest number of orders (**1,794**) came from **non-discounted sales**.
- When discount rates exceeded 10%, order volume fell sharply from **1,326 to 381**, while profit dropped to only **$5,545.41**.

**Business takeaway:**  
Discounting does not appear to be a sustainable growth lever in this dataset. Full-price sales drive both stronger profitability and higher order volume.

---

### 4) Monthly KPI Trends (MoM & YoY)
- **October 2023** was the highest sales month with **$38,326.47** in total sales and **456 units sold**.
- **March 2024** was the most profitable month with **$11,856.63** in total profit.
- The strongest profit margins were observed in:
  - **July 2025** → **31.71%**
  - **November 2023** → **31.56%**
  - **June 2024** → **31.49%**
- **March 2024** recorded the strongest MoM sales growth at **107.4%**, with another strong jump in **May 2024**.
- The highest AOV was reached in **April 2023** at **$291.05**.
- **January 2025** sales declined **28.56% YoY** versus January 2024.
- **January 2024** sales grew **13.41% YoY** versus January 2023.

**Business takeaway:**  
Sales momentum is highly volatile. Growth is possible, but not stable, which makes monthly monitoring essential.

---

### 5) Product Performance & Pricing
- Top revenue-generating products:
  1. **Predator Freak** → **$94,797.24**
  2. **Ultraboost Light** → **$90,576.27**
  3. **Primegreen Jacket** → **$83,160.27**
- **Footwear** is the strongest category overall with **$179,005.62** in revenue.
- **Accessories** is the weakest category with **$30,994.47**.
- Average unit price in **Footwear ($128.62)** is about **4x higher** than **Accessories ($32.00)**.

**Business takeaway:**  
A small number of top products and high-value categories drive a disproportionate share of revenue.

---

### 6) Payment Method & AOV
- Customers using **PayPal** and **internet banking** spend more per order.
- Customers using **mobile wallets** and **cash** show lower AOV.

**Business takeaway:**  
Payment method appears to be linked with basket size and may reflect different customer value segments.

---

### 7) Demographic Analysis
- **Shoes / Footwear** is the top-performing category across all age and gender groups.
- The remaining categories rank behind it consistently across segments.

**Business takeaway:**  
Customer demographics influence scale, but not the overall category leader — Footwear is the dominant category across segments.

---

### 8) Marketing Performance (ROAS)
- **North America** achieved the highest ROAS through **Email campaigns (14.85)**.
- North America also performed strongly in:
  - **Instagram (7.61)**
  - **Facebook (3.79)**
- **Asia-Pacific** ranked second, with high ROAS through:
  - **Google Ads (10.38)**
  - and strong results across **Instagram, Google Ads, and Facebook**

**Business takeaway:**  
Marketing efficiency depends heavily on the region-channel combination rather than spend level alone.

---

### 9) Marketing Efficiency Trend
- **April 2023** was the most efficient month with the lowest marketing cost ratio (**8.98**).
- **February 2023** was the least efficient month with the highest ratio (**27.44**).
- Marketing spend to revenue ratios ranged from **8.98 to 27.44**, showing significant instability.
- Revenue did not increase proportionally in months with higher marketing spend.

**Business takeaway:**  
Higher marketing spend does not automatically generate higher returns. Efficiency varies significantly by month.

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
