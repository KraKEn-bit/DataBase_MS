use world;
select * from country;

#### Common Table Expression (CTE): a temporary result set that you create and reuse in the same query.

/*
WITH cte_name AS (
    SELECT ...
)
SELECT * FROM cte_name;
*/

### Task: Fetch data of no of cities against every Country:
## Step 1: Create aggregation on city table (No of Cities against every country code)
## Step 2: Join this temporary table with country table to fetch no of cities

with Agg_City_data as 
(select CountryCode, count(Name) as No_of_cities
from city
group by CountryCode)
select Name,Continent,
Code,No_of_cities
from Country c left join Agg_City_data acd   # Here c and acd is like an alias. Something like 'int a' . 'a' represents them
on c.Code = acd.CountryCode;


USE world;
WITH Languages_Data AS (
    SELECT CountryCode, COUNT(Language) AS No_of_Languages
    FROM countrylanguage
    GROUP BY CountryCode
)
SELECT Name, Continent, Code, No_of_Languages
FROM country c LEFT JOIN Languages_Data ld 
ON c.Code = ld.CountryCode;



## Adding those 2:
WITH Agg_City_data AS (
    SELECT CountryCode, COUNT(Name) AS No_of_cities
    FROM city
    GROUP BY CountryCode
), 
Languages_Data AS (
    SELECT CountryCode, COUNT(Language) AS No_of_Languages
    FROM countrylanguage
    GROUP BY CountryCode
)
SELECT c.Name, c.Continent, c.Code, acd.No_of_cities, ld.No_of_Languages
FROM country c 
LEFT JOIN Agg_City_data acd 
    ON c.Code = acd.CountryCode
LEFT JOIN Languages_Data ld 
    ON c.Code = ld.CountryCode;
    
    
    
    
    
    


    
#### Join: used to combine rows from two or more tables based on a related column between them.



# Syntax:
/*
Select Column_names from table_1
Type_of_Join table_2
On table_1.common_column = 
table_2.common_column
*/




## Inner Join: Returns only matching rows from both tables.
use world;
select * from city;
select * from country;
select * from countrylanguage;

select count(distinct(Countrycode)) as City_counts from city;
select count(distinct(code)) as Country_counts from country;
select count(distinct(Countrycode)) as Language_counts from countrylanguage;


select ID,CountryCode
from
city inner join country
on
city.CountryCode = country.Code;





## Left Join: Returns all rows from the left table, and matching rows from the right.Non-matching rows will show NULL.
SELECT co.Code,co.Name, COUNT(ci.ID) AS No_of_Cities
FROM country co LEFT JOIN city ci
ON 
co.Code = ci.CountryCode
GROUP BY co.Code, co.Name;





## Right Join: A RIGHT JOIN returns all rows from the right table, and matching rows from the left table.
# If there is no match in the left table → columns from the left table will be NULL

SELECT
  co.Code AS CountryCode,
  co.Name AS CountryName,
  ci.ID   AS CityID,
  ci.Name AS CityName,
  ci.Population AS CityPopulation
FROM country co RIGHT JOIN city ci
  ON 
co.Code = ci.CountryCode;
