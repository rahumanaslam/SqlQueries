-- Supercloud Customer
-- Source: https://datalemur.com/questions/supercloud-customer

WITH supercloud_customer_cte AS (
    SELECT
        customer.customer_id AS customer_id,
        COUNT(DISTINCT product.product_category) AS product_count
    FROM customer_contracts AS customer
    INNER JOIN products AS product
    ON
        customer.product_id = product.product_id
    GROUP BY customer.customer_id
)

SELECT customer_id
FROM supercloud_customer_cte
WHERE product_count = (
    SELECT COUNT(DISTINCT product_category) FROM products
);