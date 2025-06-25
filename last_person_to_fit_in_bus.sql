-- Last Person to Fit in the Bus
-- Source: https://leetcode.com/problems/last-person-to-fit-in-the-bus/

SELECT
    person_name
FROM (
    SELECT
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS running_weight
    FROM Queue
) q
WHERE
    running_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
