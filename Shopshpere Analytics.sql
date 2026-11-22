CREATE TABLE orders_Raw (
    order_id VARCHAR(30),
    order_date DATE,
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    discount_pct NUMERIC(5,2),
    sales_amount NUMERIC(12,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(30),
    sales_channel VARCHAR(50),
    ship_date DATE,
    delivery_date DATE,
    shipping_cost NUMERIC(10,2)
);

CREATE TABLE customers_Raw (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    email VARCHAR(150),
    city VARCHAR(100),
    region VARCHAR(100),
    signup_date DATE,
    customer_segment VARCHAR(50)
);

CREATE TABLE products_Raw (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    unit_price NUMERIC(10,2),
    unit_cost NUMERIC(10,2),
    supplier VARCHAR(150)
);

select * from orders_Raw;
select * from customers_Raw;
select * from products_Raw;


-- Core Performance Indicators (KPIs)
-- 1 total_revenue
SELECT CAST(SUM(CAST(sales_amount AS DECIMAL(12,2))) AS DECIMAL(12,2)) AS Total_revenue 
FROM orders_Raw;

 --2 : Gross Profit 
SELECT CAST(SUM(o.sales_amount - (o.quantity * p.unit_cost) - o.shipping_cost) AS DECIMAL(10,2)) AS Gross_Profit 
FROM orders_Raw o 
JOIN products_Raw p ON o.product_id = p.product_id;

-- 3:TOTAL UNIQUE ORDERS
select count(Distinct(order_id)) as total_order from orders_Raw;

--4:TOTAL Quantity  SOLD
select sum(quantity) As total_quantity  from orders_Raw

--5:AVG ITEMS PER ORDER
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
       CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
       AS avg_items_per_order 
FROM orders_Raw;

--   -- SectionB(Charts)
-- Time-Series Order Dynamics

-- 1 :Daily Order Distribution

SELECT TO_CHAR(order_date, 'DAY') AS order_day,       
       COUNT(DISTINCT order_id) AS total_orders 
FROM orders_Raw 
WHERE order_date IS NOT NULL
GROUP BY TO_CHAR(order_date, 'DAY'), EXTRACT(DOW FROM order_date)
ORDER BY EXTRACT(DOW FROM order_date);

2-- Monthly order Distribution order

SELECT TO_CHAR(order_date, 'Month') AS order_day,       
       COUNT(DISTINCT order_id) AS total_orders 
FROM orders_Raw 
WHERE order_date IS NOT NULL
GROUP BY TO_CHAR(order_date, 'Month'), EXTRACT(Month FROM order_date)
ORDER BY EXTRACT(Month FROM order_date);

-- SECTION(C)Category & Customer Segment Share

1--Product Category Revenue Share


select p.category,CAST(SUM(o.sales_amount) AS DECIMAL(12,2)) AS category_revenue,
       CAST(SUM(o.sales_amount) * 100.0 / SUM(SUM(o.sales_amount)) OVER () AS DECIMAL(5,2)) AS revenue_share_percentage
	   From orders_Raw o join products_Raw p on o.product_id=p.product_id 
	   where o.sales_amount is not null 
	   Group by p.category
	   order by category_revenue desc ;

2--Customer Segment Breakdown

SELECT c.customer_segment,
       COUNT(DISTINCT o.order_id) AS total_orders,
       CAST(SUM(o.sales_amount) AS DECIMAL(12,2)) AS total_revenue,
       CAST(SUM(o.sales_amount) * 100.0 / SUM(SUM(o.sales_amount)) OVER () AS DECIMAL(5,2)) AS revenue_share_percentage
FROM orders_Raw o
JOIN customers_Raw c ON o.customer_id = c.customer_id
WHERE o.sales_amount IS NOT NULL
GROUP BY c.customer_segment
ORDER BY total_revenue DESC;

-- Top Cities by Revenue & Orders  SECTION(D)
-- 1:Tier-1 metropolitan hubs drive the highest transaction volumes and aggregate top-line revenue

select c.city, Cast(sum(o.sales_amount) AS decimal(10,2)) As Total_revenue from orders_Raw o 
join  customers_Raw c on o.customer_id=c.customer_id 
where o.sales_amount is not null 
group by c.city
order by Total_revenue desc;

-- Top & Bottom Products by Revenue SECTION(E)

--1:Top 5 Revenue Generators

select p.product_id, p.product_name, p.category,
cast(sum(o.sales_amount) AS Decimal(10,2)) As  total_revenue from  orders_Raw o join  products_Raw p
on o.product_id=p.product_id 
where o.sales_amount is not null
group by p.product_id, p.product_name, p.category
order by total_revenue desc limit 5;

--2: Bottom 5 Revenue Generators

select p.product_id, p.product_name, p.category,
cast(sum(o.sales_amount) AS Decimal(10,2)) As  total_revenue from  orders_Raw o join  products_Raw p
on o.product_id=p.product_id 
where o.sales_amount is not null
group by p.product_id, p.product_name, p.category
order by total_revenue Asc limit 5;




	   



