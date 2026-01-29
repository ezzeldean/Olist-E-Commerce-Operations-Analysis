-- 1. Clean Orders Table

DROP TABLE IF EXISTS clean_orders;

CREATE TABLE clean_orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

INSERT IGNORE INTO clean_orders
SELECT 
    order_id,
    customer_id,
    order_status,
    NULLIF(order_purchase_timestamp, '') AS order_purchase_timestamp,
    NULLIF(order_approved_at, '') AS order_approved_at,
    NULLIF(order_delivered_carrier_date, '') AS order_delivered_carrier_date,
    NULLIF(order_delivered_customer_date, '') AS order_delivered_customer_date,
    NULLIF(order_estimated_delivery_date, '') AS order_estimated_delivery_date
FROM olist_orders;

-- 2. Clean Items Table

DROP TABLE IF EXISTS clean_items;

CREATE TABLE clean_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

INSERT IGNORE INTO clean_items
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    NULLIF(shipping_limit_date, ''),
    CASE WHEN price <= 0 THEN NULL ELSE price END,
    CASE WHEN freight_value < 0 THEN NULL ELSE freight_value END
FROM olist_order_items;