-- Swapped Food Delivery
-- Source: https://datalemur.com/questions/sql-swapped-food-delivery

WITH order_count_cte AS (
    SELECT
        COUNT(order_id) AS total_orders
    FROM orders
)

SELECT 
    CASE
        WHEN order_id % 2 != 0 AND order_id != total_orders THEN order_id + 1 -- If the order is odd, add 1 to the order_id
        WHEN order_id % 2 !=0 AND order_id = total_orders THEN order_id -- If the order is even and the last order, return the order_id
        ELSE order_id - 1 -- If the order is even and not the last order, subtract 1 from the order_id
    END AS corrected_order_id,
    item
FROM orders
CROSS JOIN order_count_cte -- To populate the count of orders in each row
ORDER BY corrected_order_id;


