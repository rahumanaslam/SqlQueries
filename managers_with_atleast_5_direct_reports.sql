--  Managers with at least 5 direct reports
-- Source: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/

SELECT m.name
FROM Employee e
JOIN Employee m
ON e.managerid = m.id
GROUP BY m.id,m.name
HAVING COUNT(e.id) >= 5;