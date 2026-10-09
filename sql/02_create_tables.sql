USE ecommerce_etl;
SHOW TABLES;
CREATE TABLE IF NOT EXISTS clickstream_clean (
    user_id VARCHAR(50),
    session_id VARCHAR(50),
    event_type VARCHAR(50),
    event_time DATETIME,
    product_id VARCHAR(50),
    category_id VARCHAR(50),
    price DECIMAL(12,2)
);
CREATE TABLE IF NOT EXISTS sales_clean (
    customer_id VARCHAR(50),
    transaction_id VARCHAR(50),
    date_time VARCHAR(50),
    quantity INT,
    price DECIMAL(12,2),
    product_id VARCHAR(50),
    status VARCHAR(30),
    transaction_time DATETIME,
    total_amount DECIMAL(14,2)
);
CREATE TABLE IF NOT EXISTS hourly_sales_summary (
    sale_date DATE,
    sale_hour INT,
    total_revenue DECIMAL(14,2),
    total_quantity BIGINT,
    total_transactions BIGINT
);