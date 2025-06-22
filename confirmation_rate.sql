-- Confirmation Rate
-- Source: https://leetcode.com/problems/confirmation-rate/description/

SELECT
    s.user_id,
    ROUND(
        (COUNT(c.user_id) FILTER (WHERE c.action = 'confirmed') 
        / NULLIF(COUNT(s.user_id),0)::NUMERIC),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON
    s.user_id = c.user_id
GROUP BY s.user_id;