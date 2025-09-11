WITH test_cte AS(

SELECT ticker,TO_CHAR(date, 'Mon-YYYY') AS new_date, open,
ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open) AS row_asc,
ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open DESC) AS row_dsc
--,MIN(open) OVER(PARTITION BY ticker) AS min_open
FROM stock_prices
)

SELECT 
    ticker,
    MAX(CASE WHEN row_dsc = 1 THEN new_date END) AS highest_mth,
    MAX(CASE WHEN row_dsc = 1 THEN open END)     AS highest_open,
    MAX(CASE WHEN row_asc = 1 THEN new_date END) AS lowest_mth,
    MAX(CASE WHEN row_asc = 1 THEN open END)     AS lowest_open
FROM test_cte
GROUP BY ticker;