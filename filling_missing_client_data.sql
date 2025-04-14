-- Filling Missing Client Data
-- Source: https://datalemur.com/questions/fill-missing-product

WITH counting_cte AS (
    SELECT
        product_id,
        name,
        category,
        SUM(
            CASE
                WHEN category IS NOT NULL THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY product_id ASC
        ) AS count_grp
    FROM products
)

SELECT
    product_id,
    FIRST_VALUE(category) IGNORE NULLSOVER (
        PARTITION BY count_grp
        ORDER BY product_id ASC
    ) AS category,
    name
FROM counting_cte;


