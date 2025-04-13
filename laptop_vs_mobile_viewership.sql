-- Laptop vs mobile viewership
-- Source: https://datalemur.com/questions/laptop-mobile-viewership

SELECT 
    COUNT(
        CASE
            WHEN device_type = 'laptop' THEN user_id
        END 
    ) AS laptop_views,
    COUNT(
        CASE
            WHEN device_type = 'tablet' OR device_type = 'phone' THEN user_id
        END
    ) AS mobile_views
FROM viewership;