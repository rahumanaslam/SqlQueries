-- Consecutive Numbers
-- Source: https://leetcode.com/problems/consecutive-numbers/

-- Using WHERE clause
SELECT
    DISTINCT num as ConsecutiveNums
FROM Logs
WHERE
    (id + 1,  num) IN (SELECT * FROM Logs) AND
    (id + 2, num) IN (SELECT * FROM Logs);

