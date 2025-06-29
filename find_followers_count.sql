-- Find Followers Count
-- Source : https://leetcode.com/problems/find-followers-count/

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;