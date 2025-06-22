--  Customers Who Bought All Products
-- Source : https://leetcode.com/problems/customers-who-bought-all-products/

-- With CTE
WITH counts_cte AS (
    SELECT
        c.customer_id as customer_id,
        COUNT(DISTINCT c.product_key) AS cust_count
    FROM Customer c
    JOIN Product p
    ON c.product_key = p.product_key
    GROUP BY c.customer_id
)

SELECT
    customer_id
FROM counts_cte
WHERE
    cust_count = (
        SELECT 
            COUNT(DISTINCT product_key)
        FROM Product
    );

-- Without CTE
SELECT
    c.customer_id as customer_id
FROM Customer c
JOIN Product p
    ON c.product_key = p.product_key
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (
    SELECT
        COUNT(DISTINCT product_key)
    FROM Product
);