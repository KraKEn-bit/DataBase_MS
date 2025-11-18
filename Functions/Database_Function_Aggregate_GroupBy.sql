use world;
select * from country;

select Population from country;

select sum(Population) as Total_Pop from country;


select round(avg(Population)/10000,2) as Avg_Pop_mn from country;



#### Doing multiple operations on multiple rows at a time:


select sum(Population) as Total_World_Pop,
round(avg(LifeExpectancy)) as Avg_LE,
round(avg(GNP)/100,2) as Avg_GNP,
round(avg(GNPOld),0) as Avg_Old_GNP
from country;



select 
count(name) as No_Country_Name,
count(distinct Region) as No_Country_Region, # Ignoring the duplicates as used 'distinct'
count(distinct Continent) as No_Continent
from Country;



#### Group by: used in SQL when you want to group rows that have the same values and then apply an aggregate function

select 
Continent,
sum(Population) as Total_World_Pop,
round(avg(LifeExpectancy)) as Avg_LE,
round(avg(GNP)/100,2) as Avg_GNP,
round(avg(GNPOld),0) as Avg_Old_GNP
from country
group by Continent;


## Having: used to filter results after a GROUP BY operation.
# Since aggregate functions like COUNT(), SUM(), AVG(), etc., 
#cannot be used in WHERE, SQL uses HAVING for those conditions.

# 'Where' used to filter out ROWS and 'Having' used to fliter out GROUPS


select 
Continent,
sum(Population) as Total_World_Pop,
round(avg(LifeExpectancy)) as Avg_LE,
round(avg(GNP)/100,2) as Avg_GNP,
round(avg(GNPOld),0) as Avg_Old_GNP
from country
group by Continent
having Avg_LE>70;


