-- Compressed Mean
-- Source: https://datalemur.com/questions/alibaba-compressed-mean

SELECT
    ROUND(
      (SUM(item_count * order_occurrences) / SUM(order_occurrences))::DECIMAL, 1
    ) AS mean_number_of_items
FROM items_per_order;

