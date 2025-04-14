-- Pharmacy Analytics Part 4
-- Source: https://datalemur.com/questions/top-drugs-sold

WITH top_drugs AS (
    SELECT
        manufacturer,
        drug,
        ROW_NUMBER() OVER (
        PARTITION BY manufacturer
        ORDER BY units_sold DESC
        ) AS drug_position
    FROM pharmacy_sales
)

SELECT
    manufacturer, 
    drug AS top_drugs
FROM top_drugs
WHERE drug_position <= 2
ORDER BY manufacturer, drug;
