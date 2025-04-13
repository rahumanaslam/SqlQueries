-- Page with no likes
-- Source: https://datalemur.com/questions/sql-page-with-no-likes

SELECT 
    p.page_id
FROM pages AS p
LEFT JOIN page_likes AS pl 
    ON p.page_id = pl.page_id
WHERE 
    pl.page_id IS NULL
ORDER BY p.page_id ASC;
