-- Data Science Skills  
-- Source: https://datalemur.com/questions/matching-skills

SELECT 
    DISTINCT candidate_id
FROM candidates
WHERE 
    skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING 
    COUNT(DISTINCT skill) = 3
ORDER BY candidate_id ASC;