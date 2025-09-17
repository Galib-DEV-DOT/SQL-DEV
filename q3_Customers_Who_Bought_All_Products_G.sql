/* Write your T-SQL query statement below */
with cte as (
select customer_id , count(distinct product_key) as bought
from Customer
group by customer_id)

select cte.customer_id
from cte where cte.bought = (select count(product_key) from Product p)
