-- Product Price at a Given Date
-- Source: https://leetcode.com/problems/product-price-at-a-given-date/

-- Using CTEs and Window Functions
WITH recent_changes AS (
    SELECT
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER (
            PARTITION BY product_id 
            ORDER BY change_date DESC
        ) AS rn
    FROM Products
    WHERE
        change_date <= '2019-08-16'
),
all_products AS(
    SELECT DISTINCT product_id FROM Products
)

SELECT
    ap.product_id,
    COALESCE(rc.new_price, 10) AS price
FROM all_products ap
LEFT JOIN recent_changes rc
ON  
    ap.product_id = rc.product_id
    AND rc.rn = 1;

-- Using UNION
SELECT 
    DISTINCT product_id,
    10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'

UNION

SELECT 
    product_id,
    new_price AS price
FROM Products
WHERE 
(
    product_id, change_date
) IN (
    SELECT
        product_id,
        MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
);

