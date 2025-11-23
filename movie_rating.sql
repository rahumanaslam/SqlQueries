-- Movie Rating
-- source: https://leetcode.com/problems/movie-rating

(
    -- User who rated the most movies
    SELECT name AS results
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY name
    ORDER BY COUNT(*) DESC, name ASC
    LIMIT 1
)
UNION ALL
(
    -- Movie with highest avg rating in Feb 2020
    SELECT title AS results
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE TO_CHAR(mr.rating_date, 'YYYY-MM') = '2020-02'
    GROUP BY title
    ORDER BY AVG(mr.rating) DESC, title ASC
    LIMIT 1
);
