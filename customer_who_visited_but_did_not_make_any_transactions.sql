-- Customer Who Visited But Did Not Make Any Transactions
-- Source: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/

SELECT 
    v.customer_id, count(*) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t 
ON 
    t.visit_id = v.visit_id
WHERE 
    t.transaction_id IS NULL
GROUP BY v.customer_id