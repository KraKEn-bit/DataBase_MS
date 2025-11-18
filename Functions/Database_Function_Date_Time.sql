use sakila;
select * from rental;


# Giving the current date: (Present)
select current_date();



# Giving the current time: (Present)
select current_time();


# Giving the current date and time: (Present)
select now();



#### Date and Time:
select * from rental;
select rental_id,rental_date,
date(rental_date) as R_Date,
time(rental_date) as R_Time
from rental;



#### Day,Month,year:
select * from rental;
select rental_id,rental_date,
day(rental_date) as R_Day,
month(rental_date) as R_Month,
year(rental_date) as R_Year
from rental;




#### Time:
select * from rental;
select rental_id,rental_date,
Time(rental_date) as R_Time,
hour(rental_date) as R_Hour,
minute(rental_date) as R_Min,
second(rental_date) as R_Sec
from rental;




## date_add():used to add a time interval (days, months, years, hours, minutes, etc.) to a date or datetime value.
# Syntax: DATE_ADD(date, INTERVAL value unit)
 select * from rental;
 select rental_id,
 date(rental_date) as Rental_date,
 date_add(rental_date,interval 4 day) as target_date 
 from rental;
 
 
 
 
 
 ## date_sub():
 select * from rental;
 select rental_id,
 date(rental_date) as Rental_date,
 date_sub(rental_date,interval 5 day) as target_date 
 from rental;
 
 
 
 
 
## datdiff():
use sakila;
select * from rental;
select rental_id,customer_id, 
date(rental_date) as R_date,
date(return_date) as R_date,
datediff(return_date,rental_date) as Holding_days
from rental;



select customer_id,
avg(datediff(return_date,rental_date)) as Holding_days
from rental
group by customer_id;



select customer_id,
if(datediff(return_date,rental_date)>7,"Late","Not-Late") as Return_Status
from rental
order by customer_id asc;


