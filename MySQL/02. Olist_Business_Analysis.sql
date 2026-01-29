-- 1. Delivery Performance
SELECT 
    (CAST(SUM(
        CASE 
            WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 
            ELSE 0 
        END) / COUNT(*) * 100 AS DECIMAL(10,2))) AS late_delivery_percentage
FROM clean_orders
WHERE order_status = 'delivered';

-- 2. Top 5 Categories by Revenue
SELECT 
    cate.product_category_name_english, 
    CAST(SUM(cit.price) AS DECIMAL(15,2)) AS total_revenue
FROM clean_items cit
JOIN olist_products opr ON cit.product_id = opr.product_id
JOIN product_category_name_translation cate ON cate.product_category_name = opr.product_category_name
GROUP BY cate.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 5;

-- 3. Payment Methods Analysis
SELECT
    CASE
        WHEN payment_type = 'boleto' THEN 'Cash (Boleto)'
        WHEN payment_type = 'credit_card' THEN 'Credit Card'
        ELSE 'Others'
    END AS payment_method, 
    COUNT(*) AS transactions_count,
    CAST(AVG(payment_value) AS DECIMAL(10,2)) AS avg_order_value
FROM olist_order_payments
GROUP BY payment_method
ORDER BY transactions_count DESC;