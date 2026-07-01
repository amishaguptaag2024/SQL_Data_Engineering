CREATE TABLE student_scores (
    student_id INT PRIMARY KEY,
    student_score INT
);

select * from student_scores;

insert INTO student_scores (student_id, student_score) VALUES
(6, 85)

--RANKING FUNCTIONS 

select student_id,
    student_score,
    rank() OVER (ORDER BY student_score DESC) AS rank,
    dense_rank() OVER (ORDER BY student_score DESC) AS dense_rank,
    row_number() OVER (ORDER BY student_score DESC) AS row_number   
from student_scores;

