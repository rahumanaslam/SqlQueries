-- Top Three Salaries
-- Source: https://datalemur.com/questions/sql-top-three-salaries

WITH salary_ranks AS (
    SELECT
        emp.name AS name,
        emp.salary AS salary,
        dept.department_name AS department_name,
        DENSE_RANK() OVER (
            PARTITION BY dept.department_name
            ORDER BY emp.salary DESC, dept.department_name ASC 
        ) AS salary_ranking
    FROM employee AS emp
    INNER JOIN department AS dept
    ON
        emp.department_id = dept.department_id
)

SELECT
    department_name,
    name,
    salary
FROM salary_ranks
WHERE
    salary_ranking <= 3;
    
