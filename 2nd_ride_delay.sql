-- 2nd ride delay
-- Source: https://datalemur.com/questions/2nd-ride-delay

WITH moment_users AS(
    SELECT
        DISTINCT u.user_id
        FROM rides r
        JOIN users u 
            ON r.user_id = u.user_id
            AND u.registration_date = r.ride_date
),

cte AS(
    SELECT
        m.user_id,
        r.ride_date,
        ROW_NUMBER() OVER(
            PARTITION BY m.user_id
            ORDER BY r.ride_date
        ) AS ride_row,
        LAG(rides.ride_date) OVER(
            PARTITION BY m.user_id
            ORDER BY r.rides_date
        ) AS lag_date
    FROM moment_users m
    JOIN rides
        ON m.user_id = r.user_id
)

SELECT
    ROUND(AVG(ride_date - lag_date), 2) AS average_delay
    FROM cte
    WHERE ride_row = 2;