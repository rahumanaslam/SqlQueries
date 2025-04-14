-- App click through rate
-- Source: https://datalemur.com/questions/click-through-rate

-- Using Subquery
SELECT
    app_id,
    ROUND(100.0 * number_of_clicks/number_of_impressions, 2)
FROM (
SELECT
    app_id,
    COUNT(
        CASE
            WHEN event_type = 'click' THEN 1 ELSE NULL
        END
    ) AS number_of_clicks,
    COUNT(
        CASE
            WHEN event_type = 'impression' THEN 1 ELSE NULL
        END
    ) AS number_of_impressions
FROM events
WHERE DATE_PART('year', timestamp) = 2022
GROUP BY app_id
) AS e;

-- Using COUNT(CASE)
SELECT
    app_id,
    ROUND(100.0 *
        COUNT(
            CASE 
                WHEN event_type = 'click' THEN 1 ELSE NULL
            END
        ) / 
        COUNT(
            CASE
                WHEN event_type = 'impression' THEN 1 ELSE NULL
            END
        ), 2
    ) AS click_through_rate
FROM events
WHERE DATE_PART('year', timestamp) = 2022
GROUP BY app_id;

-- Using FILTER() [for PostgreSQL]
SELECT
    app_id,
    ROUND(100.0 *
        COUNT(*) FILTER (WHERE event_type = 'click') /
        COUNT(*) FILTER (WHERE event_type = 'impression'), 2
    ) AS click_through_rate
FROM events
WHERE DATE_PART('year', timestamp) = 2022
GROUP BY app_id;
