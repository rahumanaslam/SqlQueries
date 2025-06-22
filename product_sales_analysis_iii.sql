-- Product sales analysis III
-- Source : https://leetcode.com/problems/product-sales-analysis-iii/

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales s
WHERE year = (
    SELECT MIN(year)
    FROM Sales
    WHERE product_id = s.product_id
);