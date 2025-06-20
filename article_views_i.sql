-- Article Views I
-- Source: https://leetcode.com/problems/article-views-i/description/

SELECT
    DISTINCT author_id as id
FROM Views
WHERE 
    author_id = viewer_id;
