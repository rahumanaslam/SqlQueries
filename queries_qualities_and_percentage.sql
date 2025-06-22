-- Queries Qualities and Percentage
-- Source: https://leetcode.com/problems/queries-quality-and-percentage/description/

SELECT
    query_name,
    ROUND(
        SUM(rating::NUMERIC/position) / COUNT(query_name),
        2
    )  AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)* 100.0 / COUNT(query_name),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;