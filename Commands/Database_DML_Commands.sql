#### DML commands:

#insert:
create table Courses # After this I have to give its parameters
(Course_id char(30) unique,
Course_name varchar(30),
Mode_of_delivery varchar(30),
Student_Intake int,
Faculty varchar(30));

insert into Courses values
("PW101","Data Analytics","Recorded",100,"Suraj");

#inserting Multiple Rows:
insert into Courses values
("PW102","Generative AI","Recorded",100,"Rafsan"),
("PW103","FULL Stack","Live",130,"Kabir"),
("PW104","WEB DEV","Hybrid",200,"Fuad");

insert into Courses values("GN001","Game Dev","Class",450,"Abrar"),
("ML003","ML","Class session","200","Nazib"),
("PW105","Machine","MACHINE",350,"Rafsan");
# I can put multiple datas in the dataset all together.

select * from courses;

#	I can coustom set into the columns
insert into Courses(Course_name,Mode_of_delivery,Faculty) values("PW105","DBBB","Piyush");

#update: (If I want to change a specific data from a cell;
# -> update table -> set Column name -> locate a info from that row mentioning the column)
update Courses
set Mode_of_delivery = "SocioloGY" where Course_id = "PW105";

select * from courses