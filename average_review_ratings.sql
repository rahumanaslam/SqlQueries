-- Average Star Rating
-- Source: https://datalemur.com/questions/sql-avg-review-ratings

SELECT
    EXTRACT('month' FROM submit_date) AS "month",
    product_id,
    ROUND(AVG(stars),2) AS average_star_rating
FROM reviews
GROUP BY EXTRACT('month' FROM submit_date), product_id
ORDER BY "month", product_id ASC;
