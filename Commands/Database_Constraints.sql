#### CONSTRAINTS:
# unique: (Won't allow any duplicate)

use pw;
create table Courses 
(Course_id char(10) unique, # I just gave a constraint - unique
Course_name varchar(30),
Mode_of_delivery varchar(10),
Student_Intake int,
Faculty varchar(30));

select * from Courses;

insert into Courses(Course_id,Course_name,Student_Intake) values
("PW104","Data Science",90); 
# As I declared 'unique' before after assigning the same it will say,
#Error Code: 1062. Duplicate entry 'PW104' for key 'courses.Course_id'


# not null: (the database forces a value to be entered.You must give a value otherwise, MySQL will throw an error.
create table Courses 
(Course_id char(10) unique, 
Course_name varchar(30) not null,
Mode_of_delivery varchar(10),
Student_Intake int,
Faculty varchar(30));

select * from courses;

insert into Courses(Course_id,Course_name,Student_Intake,Faculty) values
("PW105","DBMS",169,"Reaz"); 
# As you set 'not null' If you run this you'll get this error: 
#Error Code: 1364. Field 'Course_name' doesn't have a default value


#check: (It's actually for checking given conditions)
create table Courses 
(Course_id char(10) unique, 
Course_name varchar(30) not null,
Mode_of_delivery varchar(10),
Student_Intake int check(Student_Intake>=78),
Faculty varchar(30));

select * from courses;

insert into Courses values("PW105","Coding","Live","57","Abrar"); 
# If you give this you'll get this response as you violated the 'checking' condition: 
# Error Code: 3819. Check constraint 'courses_chk_1' is violated.


# Default: (Automatically inserts a value if the user does not provide one when inserting data)
use pw;
create table Courses 
(Course_id char(10) unique, 
Course_name varchar(30) not null,
Mode_of_delivery varchar(30) default("Live Session"),
Student_Intake int check(Student_Intake>=78),
Faculty varchar(30));

insert into Courses(Course_id,Course_name,Student_Intake,Faculty) values
("PW105","DBMS",169,"Reaz"); 
# Even if I didn't give Mode_of_delivery , It will auto filled it with given 'default' value

select * from courses;