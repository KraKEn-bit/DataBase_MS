-- LAB 2: INITIAL TABLE CREATION AND SAMPLE DATA
-- DATABASE: cse4308_230041137   
-- USER: rafsan kabir taaseen              
-- =============================================================

use cse4308_230041137;

# If needed:
Drop Table If exists students CASCADE;
DROP Table IF exists courses CASCADE;


# Creating Tables:
Create table students (
    student_id int primary key,
    name varchar(50) not null,
    major varchar(10),
    gpa numeric(3,2)
);

select * from students;

Create table courses (
    course_id int primary key,
    course_name varchar(100) not null,
    credits int
);

select * from courses;


# Inserting Sample Records:
insert into students (student_id, name, major, gpa) values
(101, 'Rafsan Kabir Taaseen', 'CSE', 3.80),
(102, 'Bob', 'EEE', 3.45),
(103, 'Charlie', 'CSE', 3.10);

insert into courses (course_id, course_name, credits) values
(1, 'Database Systems', 3),
(2, 'Operating Systems', 3),
(3, 'Digital Electronics', 2);

Insert into students (student_id, name, major, gpa) values 
(104, 'David', 'ME', 3.60);

insert into courses (course_id, course_name, credits) values
(4, 'Machine Learning', 3);


Select name, gpa from students where major = 'CSE';

select course_name FROM courses where credits = 3;

select * from students order by gpa desc;


# Update:
Update students
Set gpa = 3.55
Where student_id = 104;

Update courses
Set credits = 4
Where course_id = 4;



# Delete:
delete from students
where student_id = 103;

delete from courses
where course_id = 3;





select * from students;

select * from courses;
