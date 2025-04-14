-- Well Paid Employees
-- Source: http://datalemur.com/questions/sql-well-paid-employees

SELECT 
    emp.employee_id,
    emp.name
FROM employee as mgr
INNER JOIN employee as emp
ON
    mgr.employee_id = emp.manager_id
WHERE
    emp.salary > mgr.salary;
