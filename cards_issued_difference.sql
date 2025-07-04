-- Cards issued difference
-- Source: https://datalemur.com/questions/cards-issued-difference

SELECT 
    card_name,
    MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY card_name DESC;