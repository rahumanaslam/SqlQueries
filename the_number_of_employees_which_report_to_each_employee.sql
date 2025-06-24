-- The Number of Employees Who Report to Each Employee
-- Source: https://leetcode.com/problems/the-number-of-employees-who-report-to-each-employee/

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(
        AVG(e.age)
    ) AS average_age
FROM Employees e
JOIN Employees m
    ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY employee_id;