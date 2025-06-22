--  Biggest Single Number
-- Source : https://leetcode.com/problems/biggest-single-number/

SELECT
    MAX(num) AS num
FROM (
    SELECT
        num,
        COUNT(*) AS count
    FROM MyNumbers
    GROUP BY num
) c
WHERE
    count = 1;