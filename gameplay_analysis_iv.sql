-- Game Play Analysis IV
-- Source: https://leetcode.com/problems/game-play-analysis-iv/

SELECT
    ROUND(
        COUNT(*)::NUMERIC /
        (SELECT COUNT(DISTINCT player_id)
        FROM Activity),
        2
    ) AS fraction
FROM Activity
WHERE
    (player_id,event_date) IN (
        SELECT
            player_id,
            MIN(event_date) + 1
        FROM   
            Activity
        GROUP BY player_id
    );