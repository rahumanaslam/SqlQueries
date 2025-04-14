-- Quickbooks vs TurboTax
-- Source: https://datalemur.com/questions/quickbooks-vs-turbotax

SELECT
    COUNT(
        CASE
            WHEN product ILIKE '%QuickBooks%' THEN 1
        END
    ) AS quickbooks_total,
    COUNT(
        CASE
            WHEN product ILIKE '%TurboTax%' THEN 1
        END
    ) AS turbotax_total
FROM filed_taxes;