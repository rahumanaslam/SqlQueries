-- User activities for the past 30 days I
-- Source : https://leetcode.com/problems/user-activities-for-the-past-30-days/

SELECT
    activity_date as day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE 
    activity_date BETWEEN '2019-06-28'::DATE 
    AND '2019-07-27'::DATE
GROUP BY activity_date;