--  Classes with at least 5 students
-- Source : https://leetcode.com/problems/classes-with-at-least-5-students/description/

SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

