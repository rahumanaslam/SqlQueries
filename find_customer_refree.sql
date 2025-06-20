-- Find Customer Refree
-- Source: https://leetcode.com/problems/find-customer-referee/description/

SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id is NULL;