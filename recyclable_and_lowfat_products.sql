-- Recyclable and Low Fat Products
-- Source: https://leetcode.com/problems/recyclable-and-low-fat-products/description

SELECT
    product_id
FROM
    Products
WHERE
    low_fats = 'Y' and recyclable = 'Y';