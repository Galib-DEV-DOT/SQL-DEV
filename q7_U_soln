WITH test_cte AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted

)

SELECT id,COUNT(id) AS num FROM test_cte
GROUP BY id
ORDER BY COUNT(id) DESC
LIMIT 1
