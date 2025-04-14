--- Final Account Balance
-- Source: https://datalemur.com/questions/final-account-balance

-- Using COALESCE()
SELECT
    account_id,
    COALESCE(
        SUM(CASE WHEN LOWER(transaction_type) = 'deposit' THEN amount END), 0
    ) -
    COALESCE(
        SUM(CASE WHEN LOWER(transaction_type) = 'withdrawal' THEN amount END), 0
    ) AS final_balance
FROM transactions
GROUP BY account_id; 


-- Using Subquery
SELECT 
    account_id,
    deposit_amount - withdrawal_amount AS final_balance
(SELECT 
    account_id,
    SUM(
        CASE 
            WHEN LOWER(transaction_type) = 'deposit' THEN amount
            ELSE 0
        END
    ) AS deposit_amount,
    SUM(
        CASE
            WHEN LOWER(transaction_type) = 'withdrawal' THEN amount
            ELSE 0
        END
    ) AS withdrawal_amount
FROM transactions
group by account_id
) AS t;