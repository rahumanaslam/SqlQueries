-- Mean Median Mode
-- Source: https://datalemur.com/questions/mean-median-mode

WITH mean_cte AS (
    SELECT
        ROUND(AVG(email_count)) AS mean
    FROM inbox_stats
),

median_cte AS (
    SELECT
        PERCENTILE_CONT(0.5) WITHIN GROUP (
            ORDER BY email_count
        ) AS median
    FROM inbox_stats
),

mode_cte AS (
    SELECT email_count AS mode
    FROM (
        SELECT
            email_count,
            COUNT(*) AS freq
            FROM inbox_stats
        GROUP BY email_count
        ORDER BY freq DESC
        LIMIT 1
    ) AS freq
)

SELECT
    mean_cte.mean,
    median_cte.median,
    mode_cte.mode
FROM
    mean_cte,
    median_cte,
    mode_cte;