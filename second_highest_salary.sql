-- Second Highest Salary
-- Source: https://datalemur.com/questions/sql-second-highest-salary

WITH salary_ranks_cte AS(
    SELECT
        salary,
        RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_ranks
    FROM employee
)

SELECT
    salary AS second_highest_salary
FROM salary_ranks_cte
WHERE
    salary_ranks = 2;