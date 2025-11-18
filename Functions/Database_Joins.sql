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