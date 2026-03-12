-----Marketing Campaign Analysis----

--creating table marketing
create table marketing(Brand varchar,Campaign_ID varchar,Campaign_Type varchar,Target_Audience varchar,Duration integer,
Channel_Used varchar,Impressions integer,Clicks integer,Leads integer,Conversions integer,Revenue numeric(20,2),Acquistion_Cost numeric(10,2),
ROI numeric(10,2),Language varchar,Engagement_Score numeric(10,2),Customer_Segment varchar,Date DATE);

select * from marketing;

--  Data Cleaning
UPDATE marketing
SET campaign_type = 'Seo'
WHERE campaign_type = 'SEO';

---Analysing Queries---

--Total Revenue By Brand
select Brand,sum(Revenue) as Total_Revenue 
from marketing
group by brand
order by Total_Revenue desc;

--ROI by Campaign type
select campaign_type,round(avg(roi),3) as avg_roi
from marketing
group by campaign_type
order by avg_roi desc;


-- Conversions by Channel
SELECT channel_used, SUM(conversions)
FROM marketing
GROUP BY channel_used;

-- Revenue by Customer Segment
SELECT customer_segment, SUM(revenue)
FROM marketing
GROUP BY customer_segment;

-- Revenue Trend
SELECT date, SUM(revenue)
FROM marketing
GROUP BY date;

--Average Engagement by Campaign_type
SELECT campaign_type,
AVG(engagement_score) AS avg_engagement
FROM marketing
GROUP BY campaign_type
ORDER BY avg_engagement DESC;

--Total Clicks and Conversion by Brand
SELECT brand,
SUM(clicks) AS total_clicks,
SUM(conversions) AS total_conversions
FROM marketing
GROUP BY brand
ORDER BY total_conversions DESC;

--Top 5 Campaign by ROI
SELECT campaign_id, brand, roi
FROM marketing
ORDER BY roi DESC
LIMIT 5;

--Conversion Rate by Channel
SELECT channel_used,
SUM(conversions) * 100.0 / SUM(clicks) AS conversion_rate
FROM marketing
GROUP BY channel_used
ORDER BY conversion_rate DESC;
