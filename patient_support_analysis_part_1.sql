--  Patient Support Analysis Part 1
-- Source: https://datalemur.com/questions/frequent-callers

WITH policy_holder_cte AS(
    SELECT
        policy_holder_id
    FROM callers
    GROUP BY policy_holder_id
    HAVING COUNT(case_id) >= 3
)

SELECT 
    COUNT(policy_holder_id) as policy_holder_count
FROM policy_holder_cte;