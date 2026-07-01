-- running total for each product
select *,
sum(units_sold) over (partition by product_id order by sale_date)
as running_total
from sales;

-- what if I remove partition by
-- in case of duplicates it consider it as one group
select *,
sum(units_sold) over (order by sale_date)
as running_total
from sales;

-- you can always give a second column in order to remove the ties.
select *,
sum(units_sold) over (order by sale_date,product_id)
as running_total
from sales;

----IMPORTANT
---running window total
-- what if I need to have a moving window of 3 days
select *,
sum(units_sold) over (partition by product_id order by sale_date
rows between 2 preceding and current row)
from sales;

---
select *,
sum(units_sold) over (partition by product_id order by sale_date desc
rows between current row and 2 following) 
from sales;

-- what if I say
--prev 2 + current + 2 next
select *,
sum(units_sold) over (partition by product_id order by sale_date
rows between 2 preceding and 2 following) as 5_day_sales
from sales;

-- 
select *,
sum(units_sold) over (partition by product_id order by sale_date
rows between unbounded preceding and current row) as 5_day_sales
from sales;

--
select *,
sum(units_sold) over (partition by product_id order by sale_date
rows between unbounded preceding and current row) as running_total1,
sum(units_sold) over (partition by product_id order by sale_date)
as running_total2
from sales;


-- this is the default behaviour also
select *,
sum(units_sold) over (partition by product_id order by sale_date desc
rows between current row and unbounded following) as running_total
from sales;

select *,
sum(units_sold) over (partition by product_id order by sale_date desc
rows between unbounded preceding and unbounded following) as
running_total
from sales;

select *,
sum(units_sold) over (partition by product_id order by sale_date desc
rows between unbounded preceding and unbounded following) as
running_total1,
sum(units_sold) over (partition by product_id) as running_total2
from sales;

-- sum(salary) over (<partition by> <order by>)
-- rows between
-- current row
-- 2 preceding
-- 2 following
-- unbounded preceding
-- unbounded following