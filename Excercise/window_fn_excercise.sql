-- drop table employees;

-- CREATE TABLE employees (
-- employee_id INT PRIMARY KEY,
-- employee_name VARCHAR(50),
-- department VARCHAR(50),
-- city VARCHAR(50),
-- salary DECIMAL(10, 2),
-- hire_date DATE
-- );
-- INSERT INTO employees (employee_id, employee_name, department, city,
-- salary, hire_date)
-- VALUES
-- (1, 'Amit', 'HR', 'Mumbai', 50000, '2022-01-15'),
-- (2, 'Neha', 'HR', 'Mumbai', 55000, '2023-03-10'),
-- (3, 'Suresh', 'HR', 'Delhi', 48000, '2021-11-20'),
-- (4, 'Rohit', 'HR', 'Delhi', 52000, '2022-09-05'),
-- (5, 'Raj', 'Finance', 'Mumbai', 60000, '2021-07-23'),
-- (6, 'Ravi', 'Finance', 'Delhi', 62000, '2022-09-01'),
-- (7, 'Kiran', 'Finance', 'Mumbai', 58000, '2021-02-14'),
-- (8, 'Sunita', 'Finance', 'Delhi', 61000, '2023-01-11'),
-- (9, 'Priya', 'IT', 'Mumbai', 70000, '2020-12-02'),
-- (10, 'Anjali', 'IT', 'Delhi', 67000, '2021-11-19'),
-- (11, 'Vikas', 'IT', 'Mumbai', 69000, '2022-05-20'),
-- (12, 'Sanjay', 'IT', 'Delhi', 72000, '2023-04-30'),
-- (13, 'Meena', 'IT', 'Delhi', 68000, '2021-03-15');

-- we have a requirement to find total salary paid for each department along with all columns from employees table. How would you approach this ?
-- ideally how you approach this based on whatever you have learnt ?

-- select e.department,
--     e.employee_id,
--     e.employee_name,
--     e.salary,
--     sum(e.salary) over (partition by e.department) as total_salary
-- from employees e

--total salary for each city
--Method 1 - using window function
--output rows will be same as employees table with additional column total_salary
-- select e.city,
--     sum(e.salary) over (partition by e.city) as total_salary
-- from employees e

--Method 2 - using group by

-- select  e.city,
--     sum(e.salary)  as total_salary
-- from employees e
-- group by e.city

