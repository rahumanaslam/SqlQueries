-- Employee Bonus
-- Source: https://leetcode.com/problems/employee-bonus/

SELECT
    emp.name,
    bon.bonus
FROM
    Employee AS emp
LEFT JOIN
    Bonus AS bon
ON 
    emp.empId = bon.empId
WHERE
    bon.bonus < 1000
    OR bon.bonus is NULL;