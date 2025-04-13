-- Cities with completed trade
-- Source: https://datalemur.com/questions/completed-trades

SELECT
    us.city,
    COUNT(quantity) AS total_orders
FROM trades AS tr
INNER JOIN users AS us
ON
    tr.user_id = us.user_id AND
    tr.status = 'Completed'
GROUP BY us.city
ORDER BY total_orders DESC
LIMIT 3;