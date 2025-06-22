-- Monthly Transaction I
-- Source: https://leetcode.com/problems/monthly-transactions-i/description/

SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(*) FILTER (WHERE state = 'approved') AS approved_count,
    COALESCE(SUM(amount),0) AS trans_total_amount,
    COALESCE(SUM(amount) FILTER (WHERE state = 'approved'),0) AS approved_total_amount
FROM
    Transactions
GROUP BY
    TO_CHAR(trans_date, 'YYYY-MM'), country;