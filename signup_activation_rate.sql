-- Signup Activation Rate
-- Source: https://datalemur.com/questions/signup-confirmation-rate

SELECT
    ROUND(
        COUNT(t.email_id)::DECIMAL / COUNT(e.email_id),
        2
    )
FROM emails AS e
LEFT JOIN texts AS t
ON
    e.email_id = t.email_id AND
    t.signup_action = 'Confirmed';