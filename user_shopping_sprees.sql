-- User Shopping Sprees
-- Source: https://datalemur.com/questions/amazon-shopping-spree

-- self join
SELECT
    DISTINCT T1.user_id
FROM transactions AS T1
JOIN transactions AS T2
    ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
JOIN transactions AS T3
    ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
ORDER BY T1.user_id;