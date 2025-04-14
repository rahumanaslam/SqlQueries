-- Highest Grossing Items
-- Source: https://datalemur.com/questions/sql-highest-grossing

WITH top_grossing_cte AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend,
        RANK() OVER(
            PARTITION BY category
            ORDER BY SUM(spend) DESC
        ) AS spend_rank
    FROM product_spend
    WHERE
        EXTRACT('year' FROM transaction_date) = 2022
    GROUP BY category, product
)

SELECT
    category,
    product,
    total_spend
FROM top_grossing_cte
WHERE
    spend_rank <= 2
ORDER BY category, spend_rank;
