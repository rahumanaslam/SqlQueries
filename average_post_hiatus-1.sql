-- Average post hiatus
-- Source: https://datalemur.com/questions/sql-average-post-hiatus-1

SELECT
    user_id,
    EXTRACT('day' FROM MAX(post_date) - MIN(post_date)) AS days_in_between
FROM posts
WHERE
    EXTRACT('year' FROM post_date) = 2021
GROUP BY user_id
HAVING
    COUNT(post_id) >= 2;