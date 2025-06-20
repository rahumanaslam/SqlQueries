-- Product Sales Analysis I
-- Source: https://leetcode.com/problems/product-sales-analysis-i/description/

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales AS s
INNER JOIN Product AS p
ON p.product_id = s.product_id;