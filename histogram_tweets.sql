-- Histogram of tweets
-- Source: https://datalemur.com/questions/sql-histogram-tweets

SELECT
    DISTINCT tweets_num AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM (
    SELECT 
        user_id ,
        COUNT(tweet_id) AS tweets_num
    FROM tweets
    WHERE 
        EXTRACT('year' FROM tweet_date) = '2022'
    GROUP BY user_id) AS total_tweets
GROUP BY tweets_num;
