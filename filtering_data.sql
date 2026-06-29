-- 1. Taking distinct order status from the order table and ordering by the first column

select distinct order_status 
from orders
order by 1;

-- 2. Filter orders which is in complete order status

select *
from orders
where order_status = 'COMPLETE';

-- 3. Filter orders which is in closed order status
 
select *
from orders
where order_status = 'CLOSED';


-- 4. Filter orders which is in closed or complete order status

select *
from orders
where order_status = 'COMPLETE' OR order_status = 'CLOSED';

-- 5. Filter the orders which is in closed or complete by using IN operator

select *
from orders
where order_status IN ('COMPLETE', 'CLOSED');