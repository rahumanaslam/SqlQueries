-- Second Day Confirmation
-- Source: https://datalemur.com/questions/second-day-confirmation

SELECT
    em.user_id
FROM emails AS em
INNER JOIN texts AS txt
ON
    em.email_id = txt.email_id
WHERE
    txt.signup_action = 'Confirmed' AND
    em.signup_date = txt.action_date - INTERVAL '1 day' ;