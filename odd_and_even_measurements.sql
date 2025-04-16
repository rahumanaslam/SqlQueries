-- Odd And Even Measurements
-- Source: https://datalemur.com/questions/odd-even-measurements

WITH nth_measurement_cte AS (
    SELECT
        measurement_value,
        CAST(measurement_time AS DATE) AS measurement_day,
        ROW_NUMBER() OVER (
            PARTITION BY CAST(measurement_time AS DATE)
            ORDER BY measurement_time
        ) AS nth_measurement
    FROM measurements
)

SELECT
    measurement_day,
    SUM(measurement_value) FILTER (
        WHERE nth_measurement % 2 <> 0
    ) AS odd_sum,
    SUM(measurement_value) FILTER (
        WHERE nth_measurement % 2 = 0
    ) AS even_sum
FROM nth_measurement_cte
GROUP BY measurement_day;