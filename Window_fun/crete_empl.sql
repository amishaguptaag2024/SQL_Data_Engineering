--Window Functions

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10, 2),
hire_date DATE
);

--insert sample data into the employees table

INSERT INTO employees (employee_id, employee_name, department, salary,
hire_date)
VALUES
(1, 'Amit', 'HR', 50000, '2022-01-15'),
(2, 'Neha', 'HR', 55000, '2023-03-10'),
(3, 'Suresh', 'HR', 48000, '2021-11-20'),
(4, 'Rohit', 'HR', 52000, '2022-09-05'),
(5, 'Raj', 'Finance', 60000, '2021-07-23'),
(6, 'Ravi', 'Finance', 62000, '2022-09-01'),
(7, 'Kiran', 'Finance', 58000, '2021-02-14'),
(8, 'Sunita', 'Finance', 61000, '2023-01-11'),
(9, 'Priya', 'IT', 70000, '2020-12-02'),
(10, 'Anjali', 'IT', 67000, '2021-11-19'),
(11, 'Vikas', 'IT', 69000, '2022-05-20'),
(12, 'Sanjay', 'IT', 72000, '2023-04-30'),
(13, 'Meena', 'IT', 68000, '2021-03-15');

-- find max salary for each department

select e.department,
    max(e.salary) as max_salary
from employees e 
group by e.department

-- employee_id, employee_name

with cte as (
    select e.employee_id,
        e.employee_name,
        e.department,
        e.salary,
        dense_rank() OVER (PARTITION BY e.department ORDER BY e.salary DESC) AS salary_rank
    from employees e
)select cte.employee_id,
    cte.employee_name,
    cte.salary,
    cte.department
from cte
where cte.salary_rank = 1

-- I want top 2 employees from each department

with cte as (
    select e.employee_id,
        e.employee_name,
        e.department,
        e.salary,
        dense_rank() OVER (PARTITION BY e.department ORDER BY e.salary DESC) AS salary_rank
    from employees e
)select cte.employee_id,
    cte.employee_name,
    cte.salary,
    cte.department
from cte
where cte.salary_rank <= 2

drop TABLE employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
city VARCHAR(50),
salary DECIMAL(10, 2),
hire_date DATE
);

-- inserts with few duplicate salaries
INSERT INTO employees (employee_id, employee_name, department, city,
salary, hire_date)
VALUES
(1, 'Amit', 'HR', 'Mumbai', 50000, '2022-01-15'),
(2, 'Neha', 'HR', 'Mumbai', 55000, '2023-03-10'),
(3, 'Suresh', 'HR', 'Delhi', 48000, '2021-11-20'),
(4, 'Rohit', 'HR', 'Delhi', 52000, '2022-09-05'),
(5, 'Raj', 'Finance', 'Mumbai', 60000, '2021-07-23'),
(6, 'Ravi', 'Finance', 'Delhi', 60000, '2022-09-01'),
(7, 'Kiran', 'Finance', 'Mumbai', 58000, '2021-02-14'),
(8, 'Sunita', 'Finance', 'Delhi', 60000, '2023-01-11'),
(9, 'Priya', 'IT', 'Mumbai', 70000, '2020-12-02'),
(10, 'Anjali', 'IT', 'Delhi', 68000, '2021-11-19'),
(11, 'Vikas', 'IT', 'Mumbai', 68000, '2022-05-20'),
(12, 'Sanjay', 'IT', 'Delhi', 72000, '2023-04-30'),
(13, 'Meena', 'IT', 'Delhi', 68000, '2021-03-15');

-- group by vs window function

--consider we have retail db
--6 tables

with cte as 
    (select p.product_category_id as category_id,
        oi.order_item_product_id as product_id,
        round(sum(oi.order_item_quantity)::numeric,2) as total_quantity,
        round(sum(oi.order_item_subtotal)::numeric,2) as total_amount
    from order_items oi
    join products p
        on p.product_id=oi.order_item_product_id
    group by 1,2
),temp as 
    (select *,
        dense_rank() OVER(PARTITION BY category_id ORDER BY total_amount desc,total_quantity desc) as rnk
    from cte
)select * from temp where rnk=1
-- we need to find top selling product in each category
-- products and order_items
-- category_id, product_id, product_name,
-- total_quantity, total_amount


