#### Where:
use world;
select * from city;
select * from country;
select * from countrylanguage;

select continent,name,
Region,Population,
GNP 
from Country;


select continent,name,
Region,Population,
GNP 
from Country
where Population>=50000 # Checking/Filtering the dataset using 'where'
order by Population desc;


select * from city 
where Population>=10000
order by Population asc;


## ** Relational Operators: <,>,<=,>=, <>(Not equal to) ,=


select continent,name,
Region,Population,
GNP 
from Country
order by Population desc;


select continent,name,
Region,Population,
round(GNP,0) 
from Country
where GNP <> 283
order by Population desc;




#### AND/OR Usage:
# AND:
select continent,name,
Region,Population,
round(GNP,0) 
from Country
where continent="Asia" and Population>5000000
order by Population asc;


#OR:
select continent,name,
Region,Population,
round(GNP,0) 
from Country
where continent="Asia" or Population>5000000
order by Population asc;


select continent,name,
Region,Population,
round(GNP,0) 
from Country
where continent="Asia" or continent = "Africa" or continent = "Europe"
order by Population asc;



#### In operator:(A shorter way of writing multiple OR conditions)
select continent,name,
Region,Population,
round(GNP,0) 
from Country
where continent in ("Asia","Africa","Europe")
order by Population asc;



#### between operator:

## between used for numerical values:
select continent,name,
Region,Population,
round(GNP,0),LifeExpectancy as LE
from Country
where LifeExpectancy between 40 and 70
order by LE desc;


## between used for textual datas:
select continent,name,
Region,Population,
round(GNP,0),LifeExpectancy as LE
from country
where name between "America" and "Denmark"
Order by name asc