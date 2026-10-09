CREATE DATABASE ecommerce_etl;

USE ecommerce_etl;
SHOW DATABASES;
USE ecommerce_etl;
SELECT DATABASE();

USE ecommerce_etl;
SHOW TABLES;
SELECT COUNT(*) FROM clickstream_clean;
SELECT COUNT(*) FROM sales_clean;
SELECT * FROM clickstream_clean LIMIT 5;
SELECT * FROM sales_clean LIMIT 5;
SELECT
    SUM(quantity * price) AS total_revenue
FROM sales_clean;

SELECT
    product_id,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM sales_clean
GROUP BY product_id
ORDER BY total_revenue DESC;

SELECT
    customer_id,
    COUNT(DISTINCT transaction_id) AS total_orders,
    SUM(quantity * price) AS total_spent
FROM sales_clean
GROUP BY customer_id
ORDER BY total_spent DESC;

SELECT
    event_type,
    COUNT(*) AS total_events
FROM clickstream_clean
GROUP BY event_type
ORDER BY total_events DESC;

SELECT
    product_id,
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS views,
    SUM(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS cart_events,
    SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM clickstream_clean
GROUP BY product_id
ORDER BY views DESC;

SELECT *
FROM hourly_sales_summary
ORDER BY sale_date, sale_hour;

