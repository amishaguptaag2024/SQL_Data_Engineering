-- CREATE TABLE courses (
--     course_id SERIAL PRIMARY KEY,
--     course_name VARCHAR(60),
--     course_author VARCHAR(40),
--     course_status VARCHAR(9),
--     course_published_dt DATE
-- );


-- INSERT INTO courses
--     (course_name, course_author, course_status, course_published_dt)
-- VALUES
--     ('Programming using Python', 'Bob Dillon', 'published', '2020-09-30'),
--     ('Data Engineering using Python', 'Bob Dillon', 'published', '2020-07-15'),
--     ('Data Engineering using Scala', 'Elvis Presley', 'draft', null),
--     ('Programming using Scala' , 'Elvis Presley' , 'published' , '2020-05-12'),
--     ('Programming using Java' , 'Mike Jack' , 'inactive' , '2020-08-10'),
--     ('Web Applications - Python Flask' , 'Bob Dillon' , 'inactive' , '2020-07-20'),
--     ('Web Applications - Java Spring' , 'Bob Dillon' , 'draft' , null),
--     ('Pipeline Orchestration - Python' , 'Bob Dillon' , 'draft' , null),
--     ('Streaming Pipelines - Python' , 'Bob Dillon' , 'published' , '2020-10-05'),
--     ('Web Applications - Scala Play' , 'Elvis Presley' , 'inactive' , '2020-09-30'),
--     ('Web Applications - Python Django' , 'Bob Dillon' , 'published' , '2020-06-23'),
--     ('Server Automation - Ansible' , 'Uncle Sam' , 'published' , '2020-07-05');

-- select * from courses;


-- Let us take care of exercises related to filtering and aggregations using SQL.
-- * Get all the details of the courses which are in `inactive` or `draft` state.

-- select *
-- from courses
-- where course_status IN ('inactive', 'draft');

-- * Get all the details of the courses which are related to `Python` or `Scala`.

select *
from courses
where course_name LIKE '%Python%' OR course_name LIKE '%Scala%';

-- * Get count of courses by `course_status`. The output should contain `course_status` and `course_count`.

select course_status, count(*) as course_count
from courses
group by course_status;

-- * Get count of `published` courses by `course_author`. The output should contain `course_author` and `course_count`.
select course_author, count(*) as course_count
from courses
where course_status = 'published'
group by course_author;

-- * Get all the details of `Python` or `Scala` related courses in `draft` status.
select *
from courses
where (course_name LIKE '%Python%' OR course_name LIKE '%Scala%')
  and course_status = 'draft';

-- * Get the author and count where the author have more than **one published** course. The output should contain `course_author` and `course_count`.
select course_author, count(*) as course_count
from courses
where course_status = 'published'
group by course_author
having count(*) > 1;
