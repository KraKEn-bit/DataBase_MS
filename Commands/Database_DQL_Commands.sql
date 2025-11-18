#### DQL Commands:

use world;
select * from city;
select * from country;
select * from countrylanguage;

# Selecting specific columns from the dataset:
select SurfaceArea,IndepYear,
Population,LifeExpectancy
from country;


# Adding a new column that is a custom operation of other columns
# For example I want to find the population of each area:
select SurfaceArea,IndepYear,Population,
LifeExpectancy,GNP,
Population/SurfaceArea
from Country;


# Rounding up the operation column according to its decimal position. In this case we use round()
#For example: Rounding up to 2 decimal position
select SurfaceArea,IndepYear,Population,
LifeExpectancy,GNP,
round(Population/SurfaceArea,2)
from Country;


# Renaming that custom operated column (We use 'as' .... )
# Example-1: (Population densitiy)
select Name,SurfaceArea,IndepYear,Population,
LifeExpectancy,GNP,
round(Population/SurfaceArea,2) as Pop_density
from Country;


# Example-2: (GNP per Capita)
select Name,SurfaceArea,IndepYear,Population,
LifeExpectancy,GNP,
round(Population/SurfaceArea,2) as Pop_density,
round(GNP*1000000/Population,0) 
from Country;


## **If you click on the column name, It will order the names according to its 
## alphabetical order in ascending/descending order. (sorts automatically) **


