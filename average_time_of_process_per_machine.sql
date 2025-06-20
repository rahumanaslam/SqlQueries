-- Average Time of Process per Machine
-- Source: https://leetcode.com/problems/average-time-of-process-per-machine/description/

-- Using Self Join
SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp-a.timestamp)::NUMERIC, 3) AS processing_time
FROM
    Activity a 
JOIN 
    Activity b
ON
    a.machine_id = b.machine_id
    AND a.process_id = b.process_id
    AND a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY
    a.machine_id;

-- Using CTE
WITH process_times AS (
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
)

SELECT
    machine_id,
    ROUND(
        AVG(
            end_time - start_time
        )::NUMERIC, 3
    ) AS processing_time
FROM process_times
GROUP BY machine_id;