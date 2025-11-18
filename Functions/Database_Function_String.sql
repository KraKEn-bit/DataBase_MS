use sakila;
select * from actor;
select actor_id,first_name,last_name from actor;


#### Concat:
select actor_id,first_name,last_name, concat(first_name," ",last_name) as "Full_name" 
from actor;



#### Upper/Lower:
select actor_id, lower(first_name) as Lower_First_name,
upper(last_name) as Upper_Last_name
from actor;



#### Replace: used to find a substring inside text and replace it with another substring.
# Syntax: REPLACE(text, old_string, new_string)
# You can replace a certain text with another
select replace("Rafsan Kabir Taaseen","Taaseen","Jack") as Rep_Example;



#### Left/Right: used to extract characters from the beginning or end of a string.
# Syntax: LEFT(text, number_of_characters)
#Syntax: RIGHT(text, number_of_characters)

select * from address;
select Left(district,3) New_District 
from address;


select * from address;
select address_id,city_id,district,
upper(Left(district,3)) as New_district1,  # Giving left most 3 characters
upper(Right(district,4)) as New_District2  # Giving right most 4 characters
from address;




#### Substring: used to extract a specific part of a string, starting at a certain position and for a certain length.
# Syntax: SUBSTRING(text, start_position, length)
select * from customer;
select customer_id,first_name,
last_name,email,substring(email,1,4) as sub  # From email: For extraction starts from its 1st postion and prints the after 4 characters
from customer;




#### Trim: used to remove extra spaces from a string — usually spaces at the beginning and/or end.
# Syntax: TRIM(text)
# Will trim out all the unwanted spaces from left/right
select * from address;
select address_id,address,
concat("           ",district,"         ") as new_des
from address;


select * from address;
select address_id,address,
trim(concat("           ",district,"         ")) as new_des # 'trim' will ignore any unnecessary spaces
from address;




#### Reverse:
select reverse("Rafsan Kabir") as rev_name;


select * from customer;
select customer_id,first_name,last_name,
reverse(concat(first_name," ",last_name)) as "Full Name"
from customer;




#### Length:
select * from customer;
select customer_id,email,
length(email) as length_of_email
from customer
order by Length_of_email asc