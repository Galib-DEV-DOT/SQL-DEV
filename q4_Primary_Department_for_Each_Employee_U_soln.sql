WITH test_cte AS (
SELECT *,COUNT(*) OVER(PARTITION BY employee_id) AS emp_count
FROM employee
ORDER BY employee_id
)

SELECT employee_id,
MAX(CASE WHEN emp_count = 1 THEN department_id
    WHEN emp_count > 1 AND primary_flag = 'Y' THEN department_id
    END) AS department_id
FROM test_cte
GROUP BY employee_id

------------------------------------------------------------
--2nd version with help of chatgpt
WITH test_cte AS(

    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY (primary_flag='Y') DESC) AS rnk
    FROM employee
)

SELECT employee_id,department_id
FROM test_cte 
WHERE rnk = 1
