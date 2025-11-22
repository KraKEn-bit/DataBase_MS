use world;
select * from city;
select * from country;

## Display all the cities whose pop are greater than the avg

select avg(Population) as Avg_pop
from city;

select * from city 
where Population >= 350468;


#### Now writing all of those together: (We use SUbquesry):

select * from city 
where Population >= (
select avg(Population) as Avg_pop
from city);   # Here in the bracket it is called "SubQuery" - A single Row Subquery because it gives the output as 1 row. Avg(Pop) - Gives output in a single row. That's why!
# Here used '=' because subquery is returning just one row


## Display the data of all cities in continent Asia:

select * from city
where continent="Asia";



select ID,Name,CountryCode 
from city
where CountryCode in       # Using '=' instead of 'in' would only work if the subquery returns exactly one value. 
(select Code 
from Country 
where Continent="Asia"); 



select Code from country
where continent = "Asia";  # Multi Row SubQuery because it has Multiple Rows



select ID,name,CountryCode,Population,
(select name from Country co
where co.Code = ci.Countrycode)  ## 'where' - SQL is matching rows based on the value, not based on row order.
from city ci;

/*
 - The outer SELECT pulls columns from the city table (aliased as ci).
 - The inner subquery runs once per row and finds the country name 
    whose Code matches the CountryCode from the city table.
*/


/* 
- city has 500 rows
- country has only 50 rows
and the rows appear in random order
SQL will still correctly find which country belongs to which city.
*/