-- Teams power users
-- Source: https://datalemur.com/questions/teams-power-users

SELECT
    sender_id,
    COUNT(message_id) AS total_number_of_messages
FROM
    messages
WHERE
    DATE_PART('month', sent_date) = 08 AND
    DATE_PART('year', sent_date) = 2022
GROUP BY sender_id
ORDER BY total_number_of_messages DESC
LIMIT 2;