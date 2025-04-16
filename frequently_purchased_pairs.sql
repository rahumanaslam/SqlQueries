-- Frequently Purchased Pairs
-- Source: https://datalemur.com/questions/frequently-purchased-pairs

-- Variation 1:
-- Count the number of unique product pairs bought together in the same transaction
SELECT COUNT(
    DISTINCT CONCAT(
        p1.product_id, '-', p2.product_id
        )
    ) AS combo_num
FROM transactions p1
JOIN transactions p2
ON 
    p1.transaction_id = p2.transaction_id AND 
    p1.product_id < p2.product_id;

-- Variation 2:
-- Get a list of distinct full combinations of products in transactions (not just pairs), as sorted arrays.
WITH combinations_cte AS (
SELECT
    transaction_id,
    ARRAY_AGG(
        CAST(product_id AS TEXT)
        ORDER BY product_id
    ) AS combinations
FROM transactions
GROUP BY transaction_id
)

SELECT
    combination
FROM combinations_cte
WHERE
    ARRAY_LENGTH(combinations, 1) > 1
ORDER BY combination;

