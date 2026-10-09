-- A. Verify loaded data
USE ecommerce_etl;
SELECT COUNT(*) AS clickstream_records
FROM clickstream_clean;
SELECT COUNT(*) AS sales_records
FROM sales_clean;
SELECT *
FROM clickstream_clean
LIMIT 5;
SELECT *
FROM sales_clean
LIMIT 5;

-- B.Calculate total sales revenue
SELECT
    SUM(quantity * price) AS total_revenue
FROM sales_clean;

-- C. Revenue by product
SELECT
    product_id,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM sales_clean
GROUP BY product_id
ORDER BY total_revenue DESC;

-- D.Customer purchase summary
SELECT
    customer_id,
    COUNT(DISTINCT transaction_id) AS total_orders,
    SUM(quantity * price) AS total_spent
FROM sales_clean
GROUP BY customer_id
ORDER BY total_spent DESC;

-- E.Clickstream event analysis
SELECT
    event_type,
    COUNT(*) AS total_events
FROM clickstream_clean
GROUP BY event_type
ORDER BY total_events DESC;


-- F. Product views, cart events, and purchases
SELECT
    product_id,
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS views,
    SUM(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS cart_events,
    SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM clickstream_clean
GROUP BY product_id
ORDER BY views DESC;

-- G. Hourly sales summary
SELECT *
FROM hourly_sales_summary
ORDER BY sale_date, sale_hour;
