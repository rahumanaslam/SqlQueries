-- Human Traffic of Stadium
-- source: https://leetcode.com/problems/human-traffic-of-stadium/

WITH t AS (
  SELECT
    *,
    id - ROW_NUMBER() OVER (ORDER BY id) AS grp
  FROM Stadium
  WHERE people >= 100
)
SELECT id, visit_date, people
FROM t
WHERE grp IN (
    SELECT grp
    FROM t
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;
