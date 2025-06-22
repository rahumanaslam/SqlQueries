-- Percentage of users attended
-- Source: https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/

SELECT
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / total.total_users, 2) AS percentage
FROM Register r
CROSS JOIN (
    SELECT COUNT(*) AS total_users FROM Users
) AS total
GROUP BY r.contest_id, total.total_users
ORDER BY percentage DESC, r.contest_id ASC;