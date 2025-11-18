create database pw;
use pw; # I am using that particular databse

#### DDL commands:
# Create:
create table Courses # After this I have to give its parameters
(Course_id char(10),
Course_name varchar(10),
Mode_of_delivery varchar(10),
Student_Intake int,
Faculty varchar(30)); # I just made columns [Here 'varchar' means variable character]

# Drop:
drop table courses;
drop database pw;

create table Courses 
(Course_id char(10),
Course_name varchar(10),
Mode_of_delivery varchar(10),
Student_Intake int,
Faculty varchar(30));

#Alter:
alter table Courses change column Mode_of_delivery Delivery_Mode varchar(10); #Give table name and in that table which column's name you want to change, specify that.(Prec col name) space (New col name)
alter table Courses change column Faculty Faculty varchar(25); # Changing data type

select * from courses;

alter table Courses add column Location varchar(20); # Adding a column
 
select * from Courses;

alter table Courses drop column Location; # dropping the new column


#Rename:
alter table Courses rename to PW_courses; # Renaming to another name
select * from PW_courses;

use pw;

create table Courses 
(Course_id char(10),
Course_name varchar(10),
Mode_of_delivery varchar(10),
Student_Intake int,
Faculty varchar(30));

alter table courses change column Course_name Course_name varchar(30);


#insert:
insert into Courses values
("PW101","Data Analytics","Recorded",100,"Suraj");

#inserting Multiple Rows:
insert into Courses values
("PW102","Generative AI","Recorded",100,"Rafsan"),
("PW103","FULL Stack","Live",130,"Kabir"),
("PW104","WEB DEV","Hybrid",200,"Fuad");

select * from Courses;