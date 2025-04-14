-- Users Third Transaction
-- Source: https://datalemur.com/questions/sql-third-transaction

WITH users_spend_rank_cte AS(
    SELECT
        user_id, 
        spend,
        transaction_date,
        RANK() OVER (
            PARTITION BY user_id 
            ORDER BY transaction_date) AS rank_num
    FROM transactions
)

SELECT
    user_id,
    spend,
    transaction_date
FROM users_spend_rank_cte
WHERE
    rank_num = 3;

