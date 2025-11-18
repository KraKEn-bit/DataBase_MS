use world;

select * from country;
select * from city;
select * from countrylanguage;


#### Order by:

# Manually ordering the dataset in ascending/descending order 
# (you don't need to click on the column name to order automatically which you can do in mysql)
select name,Continent,
SurfaceArea,Population,
GNP
from country
order by SurfaceArea; # By default it will be setting the order in ascending


# Ordering in descending Order:
select name,Continent,
SurfaceArea,Population,
GNP
from country
order by SurfaceArea desc; 


select name,Continent,
SurfaceArea,Population,
GNP, GNP*1000000/Population as Pop_Density
from country
order by Pop_Density asc; 


select Continent,name,Region,
SurfaceArea,Population,
GNP,GNP*1000000/Population as Pop_Density
from country
order by Region desc,Pop_density asc; 
# It first sorts the data according to region (Sorts Region column in descending order)
# then in that region It sorts the Pop_desnsity in ascending order.
# We can have ordering based on multiple Regions. 1st Western Europe's then Western Africa.....


#### Limit:

