-- Sending vs Opening Snaps
-- https://datalemur.com/questions/time-spent-snaps

WITH time_spent_cte AS (
    SELECT
        age.age_bucket AS age_bucket,
        (SUM(activity.time_spent) 
            FILTER (WHERE activity.activity_type = 'open')) AS time_spent_opening,
        (SUM(activity.time_spent) 
            FILTER (WHERE activity.activity_type = 'send')) AS time_spent_sending
    FROM age_breakdown AS age
    INNER JOIN activities AS activity
    ON
        age.user_id = activity.user_id
    WHERE 
        activity.activity_type IN ('open', 'send')
    GROUP BY
        age.age_bucket
)

SELECT
    age_bucket,
    ROUND(
        100 * (time_spent_opening) / (time_spent_opening + time_spent_sending),
        2
    ) AS open_perc,
    ROUND(
        100 * (time_spent_sending) / (time_spent_opening + time_spent_sending),
        2
    ) AS send_perc
FROM time_spent_cte;