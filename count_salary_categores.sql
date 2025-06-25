# Count Salary Categories
# Source: https://leetcode.com/problems/count-salary-categories/

-- With CTE and Union
WITH category_cte AS (
    SELECT
        income,
        (CASE
            WHEN income < 20000 THEN 'Low Salary' 
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END) AS category
    FROM Accounts
),
categories AS (
    SELECT 'Low Salary' as category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary' 
)
SELECT
    c.category,
    COUNT(cte.category) AS accounts_count
FROM categories c
LEFT JOIN category_cte cte
ON 
    c.category = cte.category
GROUP BY c.category;

-- With UNNEST and FILTER
SELECT
    UNNEST(
        ARRAY['Low Salary', 'Average Salary', 'High Salary']
    ) AS category,
    UNNEST(
        ARRAY[
            COUNT(*) FILTER (WHERE income < 20000),
            COUNT(*) FILTER (WHERE income BETWEEN 20000 AND 50000),
            COUNT(*) FILTER (WHERE income > 50000)
        ]
    ) AS accounts_count
FROM Accounts;

-- With UNNEST and CASE
SELECT
    UNNEST(
        ARRAY['Low Salary', 'Average Salary', 'High Salary']
    ) AS category,
    UNNEST(
        ARRAY[
            SUM (CASE WHEN income < 20000 THEN 1 ELSE 0 END),
            SUM (CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END), 
            SUM (CASE WHEN income > 50000 THEN 1 ELSE 0 END)
        ]
    ) AS accounts_count
FROM Accounts;