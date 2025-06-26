-- Exchange Seats
-- Source: https://leetcode.com/problems/exchange-seats/

SELECT(
    CASE 
        WHEN id % 2 = 1 and  id = (SELECT MAX(id) FROM Seat) THEN id
        WHEN id % 2 = 1 THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
    END ) AS id, 
    student 
FROM Seat
ORDER BY id;

-- Alternative : MOD()
SELECT
    CASE 
        WHEN MOD(id,2) = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        WHEN MOD(id,2) = 1 THEN id + 1
        WHEN MOD(id,2) = 0 THEN id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;