-- Immediate Food Delivery II
-- Source: https://leetcode.com/problems/immediate-food-delivery-ii/

WITH first_orders AS (
    SELECT *
    FROM Delivery d
    WHERE order_date = (
        SELECT MIN(order_date)
        FROM Delivery
        WHERE customer_id = d.customer_id
    )
)

SELECT
    ROUND(
        COUNT(*) FILTER (WHERE order_date = customer_pref_delivery_date) * 100.0 / COUNT(*),
        2
    ) AS immediate_percentage
FROM first_orders;

