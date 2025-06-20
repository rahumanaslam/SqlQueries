-- Replace Employee ID with Unique Identifier
-- Source: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/

SELECT 
    uni.unique_id,
    emp.name
FROM EmployeeUNI as uni
RIGHT JOIN Employees as emp
    ON uni.id = emp.id;