SELECT * FROM adidas_sales LIMIT 10;
Select * from adidas_marketing_data LIMIT 10;

--PHASE 1 — SELECT / WHERE / ORDER BY
--#High revenue orders >500

select 
order_id,
order_date,
region,
store_type,
revenue,
profit
from adidas_sales
WHERE revenue>500
ORDER BY revenue desc
lIMIT 100;

---phase 1 için daha kapsamlı kod yazmayı denedim:
SELECT 
    order_id, 
    order_date, 
    region, 
    store_type, 
    revenue, 
    profit,
    -- Tekil sipariş bazlı gerçekçi sınıflandırma
    CASE 
        WHEN revenue >= 1000 THEN 'Premium Transaction'
        WHEN revenue >= 500 THEN 'High-Value Order'
        ELSE 'Standard Order'
    END AS order_segment
FROM adidas_sales
WHERE revenue > 500 
ORDER BY revenue DESC
LIMIT 100;

---
select 
store_type,
SUM(revenue) AS total_revenue,
SUM(profit) as total_profits
from adidas_sales
GROUP BY 1
ORDER BY total_revenue desc


--Latest orders 
select *
from adidas_sales
ORDER BY order_date DESC
LIMIT 10;


✅ PHASE 2 — GROUP BY & Aggregations

-- Total revenue & profit by region

SELECT 
order_id,
region,
sum(profit) as total_profit,
sum(revenue) as total_revenue
FROM adidas_sales
group by order_id,region
order by total_revenue desc;

----- Avg unit price by category

select category,
avg(unit_price)
FROM adidas_sales
group by 1;

✅ PHASE 3 — CASE WHEN

---A) Product performance classification (High/Medium/Low Performer” based on revenue)
-->= 500000 'High Performer'
-->= 200000 THEN 'Medium Performer'

select
 category,
 sum(revenue) as TOTAL_REVENUE,
CASE
 WHEN sum (revenue)>= 500000 THEN 'High Performer'
 WHEN sum(revenue )>= 200000 THEN 'Medium Performer'
 ELSE 'Low Performer'
END AS revenue_level
   FROM adidas_sales
   GROUP BY category;

--    -- Verideki Footwear (~179k) ve Apparel (~77k) rakamlarına göre yukarıdaki phase3 çalışması revize edildi.
---Bu kod, sadece 500'den büyükleri listelemekle kalmaz, aynı zamanda her bir siparişi kendi içinde sınıflandırır:

SELECT 
    category, 
    SUM(revenue) AS total_revenue,
    -- Verideki Footwear (~179k) ve Apparel (~77k) rakamlarına göre revize edildi
    CASE 
        WHEN SUM(revenue) >= 150000 THEN 'High Performer' -- Footwear buraya girer
        WHEN SUM(revenue) >= 50000 THEN 'Medium Performer' -- Apparel buraya girer
        ELSE 'Low Performer' -- Accessories buraya girer
    END AS revenue_level
FROM adidas_sales
GROUP BY category
ORDER BY total_revenue DESC;

b) discount classification(discound band)

select
case
WHEN discount = 0 THEN 'No Discount'
    WHEN discount <= 10 THEN 'Low (1-10%)'
    WHEN discount <= 20 THEN 'Medium (11-20%)'
else 'High(%21+)'
END AS discount_band,

 COUNT(*) AS total_orders,
 SUM(revenue) as revenue,
 sum(profit) as profit
FROM adidas_sales
group by discount_band
ORDER BY revenue DESC;



---
✅ PHASE 4 — JOIN 
---Marketing + Sales JOIN

SELECT * FROM adidas_sales LIMIT 10;
Select * from adidas_marketing_data LIMIT 10;

select
date_trunc('month',order_date) as month,
s.region,
s.store_type,
sum(s.revenue) as total_revenue,
sum(m.spend) as total_spend,
round(sum(s.revenue)/sum(m.spend)) as roas
FROM adidas_sales s
JOIN adidas_marketing_data m 
ON s.region=m.region
group by 1,2,3
order by month desc;

--- ### MARKETİNG ANALYSİS QUERİES: 

WITH monthly_marketing AS (
    -- 1️⃣ Marketing: Ay + Bölge bazında toplama
    SELECT 
        DATE_TRUNC('month', campaign_date) AS month,
        region,
        SUM(spend) AS marketing_spend
    FROM adidas_marketing_data
    GROUP BY 1, 2
),

monthly_sales AS (
    -- 2️⃣ Sales: Ay + Bölge + Store Type bazında toplama
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        region,
        store_type,
        SUM(revenue) AS total_revenue
    FROM adidas_sales
    GROUP BY 1, 2, 3
)

-- 3️⃣ JOIN (Doğru grain: month + region)
SELECT
    s.month,
    s.region,
    s.store_type,
    s.total_revenue,
    m.marketing_spend,
    ROUND(s.total_revenue / NULLIF(m.marketing_spend, 0), 2) AS roas
FROM monthly_sales s
LEFT JOIN monthly_marketing m
    ON s.month = m.month
    AND s.region = m.region
ORDER BY s.month DESC, roas DESC;

----2. Aylık Pazarlama Verimliliği Trendi
SELECT 
    DATE_TRUNC('month', s.order_date)::date AS month,
    SUM(s.revenue) AS monthly_revenue,
    SUM(m.spend) AS monthly_marketing_spend,
    -- Gelirin içindeki pazarlama maliyeti oranı
    ROUND((SUM(m.spend) / NULLIF(SUM(s.revenue), 0)) * 100, 2) AS marketing_cost_ratio_pct
FROM adidas_sales s
JOIN adidas_marketing_data m ON s.region = m.region
GROUP BY 1
ORDER BY 1;

-----3. Sipariş Başına Pazarlama Maliyeti (CPO - Cost Per Order)

WITH monthly_marketing AS (
    -- 1️⃣ Marketing: m_date ve spend sütunlarını kullanıyoruz
    SELECT 
        DATE_TRUNC('month', campaign_date) AS month,
        region,
        SUM(spend) AS marketing_spend
    FROM adidas_marketing_data
    GROUP BY 1, 2
),

monthly_sales AS (
    -- 2️⃣ Sales: "Order_Date", "Region" ve "Order_ID" sütunlarını kullanıyoruz
    -- Sipariş sayısını SUM ile değil COUNT ile hesaplıyoruz
    SELECT 
        DATE_TRUNC('month', "order_date") AS month,
        region,
        COUNT("order_id") AS order_count, -- Sipariş bazında sayım
        SUM("revenue") AS total_revenue
    FROM adidas_sales
    GROUP BY 1, 2
)

SELECT 
    s.region,
    SUM(s.order_count) AS total_orders,
    ROUND(SUM(m.marketing_spend), 2) AS total_spend,
    -- CPO (Cost Per Order): Toplam Harcama / Toplam Sipariş Sayısı
    ROUND(SUM(m.marketing_spend) / NULLIF(SUM(s.order_count), 0), 2) AS cost_per_order,
    -- Bonus: ROAS hesaplamasını da ekleyelim
    ROUND(SUM(s.total_revenue) / NULLIF(SUM(m.marketing_spend), 0), 2) AS roas
FROM monthly_sales s
JOIN monthly_marketing m 
    ON s.month = m.month 
    AND s.region = m.region
GROUP BY s.region
ORDER BY cost_per_order ASC;




✅ PHASE 5— — Monthly KPI Model (CTE)
--Business Questions
--AOV, profit margin, total units aylık nasıl gidiyor?

WITH monthly_kpi AS (
  SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_sales,
    SUM(profit)  AS total_profit,
    SUM(units_sold) AS total_units,
    AVG(discount) AS avg_discount
  FROM adidas_sales
  GROUP BY 1
)
SELECT
  month,
  total_sales,
  total_profit,
  ROUND(total_sales / NULLIF(total_orders,0), 2) AS aov,
  ROUND(total_profit / NULLIF(total_sales,0) * 100, 2) AS profit_margin,
  total_units,
  ROUND(avg_discount, 2) AS avg_discount
FROM monthly_kpi
ORDER BY month;
---

total_sales by months


WITH monthly_kpi AS (
  SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_sales,
    SUM(profit)  AS total_profit,
    SUM(units_sold) AS total_units,
    AVG(discount) AS avg_discount
  FROM adidas_sales
  GROUP BY 1
)
SELECT
  month,
  total_sales,
  total_profit,
  ROUND(total_sales / NULLIF(total_orders,0), 2) AS aov,
  ROUND(total_profit / NULLIF(total_sales,0) * 100, 2) AS profit_margin,
  total_units,
  ROUND(avg_discount, 2) AS avg_discount
FROM monthly_kpi
ORDER BY total_sales desc;


✅ PHASE 6 — Window Functions (OVER / Rank / LAG)
--Business Questions:
--Ay bazında Sales MoM değişim nedir?
-- En çok revenue getiren ürünler hangileri?
---Top products ranking by revenue

Select product_name,
category,
sum( revenue) as total_revenue,
rank() over (order by sum(revenue)desc) as revenue_rank
from adidas_sales
group by product_name,2

-----MoM büyüme hesabı (LAG  kullanımını ile )

WITH monthly_revenue AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS total_sales
  FROM adidas_sales
  GROUP BY 1
)

SELECT
  month,
  total_sales,
  LAG(total_sales) OVER (ORDER BY month) AS previous_total_sales,
  total_sales - LAG(total_sales) OVER (ORDER BY month) AS revenue_difference,
  ROUND(
    (total_sales - LAG(total_sales) OVER (ORDER BY month))
    / NULLIF(LAG(total_sales) OVER (ORDER BY month), 0),
    4
  ) AS mom_pct
FROM monthly_revenue
ORDER BY month;

--

WITH monthly_revenue AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS total_sales
  FROM adidas_sales
  GROUP BY 1
)

SELECT
  month,
  total_sales,
  LAG(total_sales) OVER (ORDER BY month) AS previous_total_sales,
  total_sales - LAG(total_sales) OVER (ORDER BY month) AS revenue_difference,
  ROUND(
    (total_sales - LAG(total_sales) OVER (ORDER BY month))
    / NULLIF(LAG(total_sales) OVER (ORDER BY month), 0),
    4
  ) AS mom_pct
FROM monthly_revenue
ORDER BY revenue_difference DESC;

---- YoY Gelir ve Kâr Büyümesi (Revenue & Profit Growth)

WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('year', "order_date") AS year,
        DATE_TRUNC('month', "order_date") AS month,
        SUM("revenue") AS total_revenue
    FROM adidas_sales
    GROUP BY 1, 2
)
SELECT 
    month,
    total_revenue,
    -- Bir önceki yılın aynı ayındaki veriyi getirir
    LAG(total_revenue, 12) OVER (ORDER BY month) AS last_year_total_revenue,
    -- YoY Büyüme Oranı Hesaplama
    ROUND(
        (total_revenue - LAG(total_revenue, 12) OVER (ORDER BY month)) / 
        NULLIF(LAG(total_revenue, 12) OVER (ORDER BY month), 0) * 100, 2
    ) AS yoy_revenue_growth
FROM monthly_metrics
order by MONTH DESC;



---⭐ PHASE 7 — ADİDAS Sales KPI'larının oluşturulması

--a)#tabloyu kontrol edelim önce: 

SELECT * FROM adidas_sales LIMIT 10;
----
b)

CREATE OR REPLACE VIEW adidas_sales_kpis AS
SELECT 
region,
store_type,
category,
COUNT(DISTINCT order_id) as total_orders,
SUM(units_sold ) as total_solds,
SUM(revenue) as total_revenue,
ROUND(sum(profit)::NUMERIC / sum(revenue), 2)
from adidas_sales
group by 1,2,3

---# checking VIEW adidas_sales_kpi 

SELECT * FROM adidas_sales_kpis
lIMIT 20

-------- (phase 7)
-- (phase 7)İndirim Hassasiyeti (Discount Elasticity) Analizi
--##İş Sorusu:Uygulanan indirim oranları (Discount) satış hacmini (Units_Sold) ve kâr marjını nasıl etkiliyor?
--Toplam kârı maksimize eden "ideal indirim aralığı" (Sweet Spot) nedir?

SELECT 
    CASE 
        WHEN discount = 0 THEN '0% (İndirimsiz)'
        WHEN discount > 0 AND discount <= 0.10 THEN '1-10% (Düşük İndirim)'
        WHEN discount > 0.10 AND discount <= 0.20 THEN '11-20% (Orta İndirim)'
        ELSE '>20% (Yüksek İndirim)' 
    END AS discount_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(units_sold) AS total_units_sold,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    -- Kâr Marjı
    ROUND((SUM(profit) / NULLIF(SUM(revenue), 0)) * 100, 2) AS profit_margin_pct
FROM adidas_sales
GROUP BY 1
ORDER BY total_profit DESC;



---- Ödeme Yöntemi ve Sepet Büyüklüğü (AOV) İlişkisi  (phase 7)
##İş Sorusu:Müşterilerin tercih ettiği ödeme yöntemleri (Payment_Method),
##sipariş başına harcadıkları tutarı (Ortalama Sepet Değeri - AOV) değiştiriyor mu?

SELECT 
    payment_method,
    COUNT(DISTINCT order_id) AS total_transactions,
    SUM(revenue) AS total_revenue,
    -- Ortalama Sepet Değeri (Average Order Value)
    ROUND(SUM(revenue) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS aov
FROM adidas_sales
GROUP BY payment_method
ORDER BY aov DESC;


----  (phase 7) Demografik Analysis(Customer Profiling) 

### İş Sorusu:Farklı yaş grupları (Customer_Age) ve cinsiyetler (Gender) arasında en popüler harcama kategorileri hangileridir? 

WITH customer_demographics AS (
    SELECT 
        gender,
        category,
        CASE 
            WHEN customer_age BETWEEN 18 AND 24 THEN '18-24 (Gen Z)'
            WHEN customer_age BETWEEN 25 AND 34 THEN '25-34 (Millennials)'
            WHEN customer_age BETWEEN 35 AND 44 THEN '35-44 (Gen X)'
            ELSE '45+ (Boomers)' 
        END AS age_group,
        SUM(revenue) AS total_revenue
    FROM adidas_sales
    GROUP BY 1, 2, 3
)
SELECT 
    gender,
    age_group,
    category,
    total_revenue,
    -- Her demografik grubun kendi içindeki favori kategorisini sıralıyoruz
    RANK() OVER(PARTITION BY gender, age_group ORDER BY total_revenue DESC) AS category_rank
FROM customer_demographics
ORDER BY gender, age_group, category_rank;



--*** Marketing Questions (phase 8)

---Q1
SELECT
    channel,
    SUM(conversions) AS total_conversions
FROM adidas_marketing_data
GROUP BY channel
ORDER BY total_conversions DESC;

--Q2-
SELECT
    channel,
    SUM(spend) AS total_spend,
    SUM(conversions) AS conversions,
    ROUND(SUM(spend) / NULLIF(SUM(conversions),0), 2) AS cpa
FROM adidas_marketing_data
GROUP BY channel
ORDER BY cpa ASC;

 --Q3-
SELECT
    channel,
    ROUND(SUM(clicks)::numeric / NULLIF(SUM(impressions),0) * 100, 2) AS ctr
FROM adidas_marketing_data
GROUP BY channel
ORDER BY ctr DESC;
--Q4-
SELECT
    channel,
    ROUND(SUM(conversions)::numeric / NULLIF(SUM(clicks),0) * 100, 2) AS cvr
FROM adidas_marketing_data
GROUP BY channel
ORDER BY cvr DESC;

--Q5-
SELECT
    region,
    SUM(spend) AS total_spend
FROM adidas_marketing_data
GROUP BY region
ORDER BY total_spend DESC;

--Q6-
SELECT
    region,
    channel,
    ROUND(SUM(spend) / NULLIF(SUM(conversions),0), 2) AS cpa
FROM adidas_marketing_data
GROUP BY region, channel
ORDER BY cpa ASC;

--Q7-
SELECT
    DATE_TRUNC('month', campaign_date) AS month,
    SUM(spend) AS total_spend,
    SUM(conversions) AS conversions
FROM adidas_marketing_data
GROUP BY 1
ORDER BY month;

--Q8 MARKETİNG+SALES JOIN

WITH marketing AS (
    SELECT
        DATE_TRUNC('month', campaign_date) AS month,
        region,
        SUM(spend) AS marketing_spend
    FROM adidas_marketing_data
    GROUP BY 1,2
),
sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        region,
        SUM(revenue) AS sales_revenue
    FROM adidas_sales
    GROUP BY 1,2
)
SELECT
    m.month,
    m.region,
    m.spend,
    s.revenue,
    ROUND(s.revenue / NULLIF(m.spend,0), 2) AS roas
FROM adidas_marketing_data m
JOIN sales s
ON m.month = s.month AND m.region = s.region
ORDER BY roas DESC;


---which channel high spend >50000 but low performance?

SELECT
    channel,
    SUM(spend) AS spend,
    SUM(conversions) AS conversions,
    ROUND(SUM(spend) / NULLIF(SUM(conversions),0), 2) AS cpa
FROM adidas_marketing_data
GROUP BY channel
HAVING SUM(spend) > 500000
ORDER BY cpa DESC;

---MARKETİNG QUESTİONS

-----🎯 Q1. Bölge ve Kanal Bazlı ROAS (Reklam Harcaması Getirisi) Analizi

WITH marketing AS (
    SELECT
        DATE_TRUNC('month', campaign_date) AS month,
        region,
        channel,
        SUM(impressions) AS total_impressions,
        SUM(clicks) AS total_clicks,
        SUM(conversions) AS total_conversions,
        SUM(spend) AS total_spend
    FROM adidas_marketing_data
    GROUP BY 1, 2, 3
),

sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        region,
        SUM(revenue) AS total_revenue
    FROM adidas_sales
    GROUP BY 1, 2
),

roas_table AS (
    SELECT
        m.month,
        m.region,
        m.channel,
        m.total_impressions,
        m.total_clicks,
        m.total_conversions,
        m.total_spend,
        s.total_revenue,

        ROUND(
            (m.total_clicks::numeric / NULLIF(m.total_impressions, 0)) * 100, 2) AS ctr,

        ROUND(
            (m.total_conversions::numeric / NULLIF(m.total_clicks, 0)) * 100,2) AS cvr,

        ROUND(s.total_revenue / NULLIF(m.total_spend, 0),2) AS roas,

        CASE
            WHEN s.total_revenue / NULLIF(m.total_spend, 0) >= 2 THEN '🎯 High'
            WHEN s.total_revenue / NULLIF(m.total_spend, 0) >= 1 THEN '🟢 Good'
            WHEN s.total_revenue / NULLIF(m.total_spend, 0) >= 0.5 THEN '🟡 Low'
            ELSE 'Poor'
        END AS performance

    FROM marketing m
    LEFT JOIN sales s
        ON m.month = s.month
       AND m.region = s.region
)

SELECT *
FROM roas_table
ORDER BY roas DESC NULLS LAST;

-----Q2 ✅ Aylık Harcama ve Gelir + Oranı
WITH monthly_marketing AS (
    SELECT
        DATE_TRUNC('month', campaign_date) AS month,
        SUM(spend) AS total_spend
    FROM adidas_marketing_data
    GROUP BY 1
),

monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(revenue) AS total_revenue
    FROM adidas_sales
    GROUP BY 1
)

SELECT
    m.month,
    s.total_revenue,
    m.total_spend,

    -- Marketing Cost Ratio
    ROUND(m.total_spend / NULLIF(s.total_revenue, 0), 2) AS marketing_cost_ratio,

    -- ROAS
    ROUND(s.total_revenue / NULLIF(m.total_spend, 0), 2) AS roas

FROM monthly_marketing m
JOIN monthly_sales s
    ON m.month = s.month
ORDER BY m.total_spend desc;

----En verimli ay hangisidr?
WITH monthly_marketing AS (
    SELECT
        DATE_TRUNC('month', campaign_date) AS month,
        SUM(spend) AS total_spend
    FROM adidas_marketing_data
    GROUP BY 1
),

monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(revenue) AS total_revenue
    FROM adidas_sales
    GROUP BY 1
),

monthly_performance AS (
    SELECT
        m.month,
        s.total_revenue,
        m.total_spend,
        ROUND(m.total_spend / NULLIF(s.total_revenue, 0), 2) AS marketing_cost_ratio
    FROM monthly_marketing m
    JOIN monthly_sales s
        ON m.month = s.month
)

SELECT *
FROM monthly_performance
ORDER BY marketing_cost_ratio ASC


---













