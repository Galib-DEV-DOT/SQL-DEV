-- SELECT 
--     sell_date, 
--     COUNT(DISTINCT product) AS num_sold,
--     STRING_AGG(distinct product, ',') 
--         WITHIN GROUP (ORDER BY product ASC) AS products
-- FROM Activities
-- GROUP BY sell_date;

-- Above one is wrong

select
    sell_date , 
    count(product) as num_sold , 
    string_agg(product,',') 
    WITHIN GROUP (ORDER BY product asc) as products
from
(select distinct sell_date , product from Activities) de_dup
group by de_dup.sell_date;

-- finding perfrom de duplication in source side if one of your function not support distinct
-- Learn about array and string agg function to flatten the columnar data