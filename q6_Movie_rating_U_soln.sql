--unrefined version
WITH test_cte AS (
SELECT u.name, COUNT(*) AS total_count
FROM MovieRating m JOIN Users u
ON u.user_id = m.user_id
GROUP BY u.name
ORDER BY COUNT(*) DESC
),
test_cte2 AS (
SELECT name, total_count,ROW_NUMBER() OVER(ORDER BY total_count DESC, name ) AS row_num
FROM test_cte
),
test_cte3 AS (
    SELECT mr.movie_id, m.title,AVG(rating) AS avg_rating
    FROM MovieRating mr JOIN Movies m
    ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01'
        AND mr.created_at < '2020-03-01'
    GROUP BY mr.movie_id,m.title

),
test_cte4 AS (
    SELECT title,avg_rating,ROW_NUMBER() OVER(ORDER BY avg_rating DESC, title ) AS row_num
    FROM test_cte3
)
SELECT name AS results FROM test_cte2 WHERE row_num = 1
UNION ALL
SELECT title FROM test_cte4 WHERE row_num = 1


-----------------------------------------------------
--2nd version help of chatGPT

-- Top user (most ratings overall)
(
SELECT u.name AS results
FROM MovieRating m
JOIN Users u ON u.user_id = m.user_id
GROUP BY u.name
ORDER BY COUNT(*) DESC, u.name
LIMIT 1
)
UNION ALL
(
-- Top movie (highest avg rating in Feb 2020)
SELECT m.title
FROM MovieRating mr
JOIN Movies m ON mr.movie_id = m.movie_id
WHERE mr.created_at >= '2020-02-01'
  AND mr.created_at < '2020-03-01'
GROUP BY m.movie_id, m.title
ORDER BY AVG(rating) DESC, m.title
LIMIT 1
)

