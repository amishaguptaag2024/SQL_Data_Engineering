-- ROW_NUMBER
-- RANK
-- DENSE_RANK

-- when there are no ties/duplicates then all of them will give
-- the same result.
-- the difference comes when there are ties
-- rank leaves gaps in ranking for tied data.
-- while row_number assigns a unique number to each row without
-- considering the ties.
-- dense_Rank assigns identical ranks to tied data, without any gaps

--LAG(column_name, offset, default_value) looks at a previous row.
--LEAD(column_name, offset, default_value) looks at a next row.


CREATE TABLE sales (
sale_date DATE,
product_id INT,
product_name VARCHAR(100),
units_sold INT
);
INSERT INTO sales (sale_date, product_id, product_name, units_sold)
VALUES
('2024-08-15', 1, 'Laptop', 4),
('2024-08-16', 1, 'Laptop', 6),
('2024-08-17', 1, 'Laptop', 5),
('2024-08-18', 1, 'Laptop', 7),
('2024-08-19', 1, 'Laptop', 4),
('2024-08-20', 1, 'Laptop', 5),
('2024-08-21', 1, 'Laptop', 8),
('2024-08-22', 1, 'Laptop', 3),
('2024-08-23', 1, 'Laptop', 7),
('2024-08-24', 1, 'Laptop', 6),
('2024-08-25', 1, 'Laptop', 9),
('2024-08-26', 1, 'Laptop', 7),
('2024-08-15', 2, 'Smartphone', 15),
('2024-08-16', 2, 'Smartphone', 18),
('2024-08-17', 2, 'Smartphone', 12),
('2024-08-18', 2, 'Smartphone', 20),
('2024-08-19', 2, 'Smartphone', 17),
('2024-08-20', 2, 'Smartphone', 14),
('2024-08-21', 2, 'Smartphone', 19),
('2024-08-22', 2, 'Smartphone', 13),
('2024-08-23', 2, 'Smartphone', 21),
('2024-08-24', 2, 'Smartphone', 16),
('2024-08-25', 2, 'Smartphone', 18),
('2024-08-26', 2, 'Smartphone', 20),
('2024-08-15', 3, 'Tablet', 8),
('2024-08-16', 3, 'Tablet', 10),
('2024-08-17', 3, 'Tablet', 7),
('2024-08-18', 3, 'Tablet', 12),
('2024-08-19', 3, 'Tablet', 9),
('2024-08-20', 3, 'Tablet', 8),
('2024-08-21', 3, 'Tablet', 11),
('2024-08-22', 3, 'Tablet', 6),
('2024-08-23', 3, 'Tablet', 9),
('2024-08-24', 3, 'Tablet', 10),
('2024-08-25', 3, 'Tablet', 13),
('2024-08-26', 3, 'Tablet', 12);

--find previoud and next day sales for each product
select s.sale_date,
    s.product_id,
    s.product_name,
    s.units_sold,
    lag(s.units_sold, 1, 0) over (partition by s.product_id order by s.sale_date) as previous_day_sales,
    lead(s.units_sold, 1, 0) over (partition by s.product_id order by s.sale_date desc) as lead_desc_previous_day_sales,

    lead(s.units_sold, 1, 0) over (partition by s.product_id order by s.sale_date) as next_day_sales,
-- lead with order by asc == lag with order by desc
    lag(s.units_sold, 1, 0) over (partition by s.product_id order by s.sale_date desc) as lag__desc_next_day_sales
from sales s
order by s.product_id, s.sale_date;