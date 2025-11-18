#### Window: performs calculations across rows without grouping them (unlike GROUP BY).

#Syntax:
/*
function_name(expression) OVER (
    [PARTITION BY column]
    [ORDER BY column]
)
*/


/*
| Function Name  | Purpose                                                |
| -------------- | ------------------------------------------------------ |
| `ROW_NUMBER()` | Assigns a unique number to each row                    |
| `RANK()`       | Ranking with gaps for ties                             |
| `DENSE_RANK()` | Ranking without gaps                                   |
| `NTILE(n)`     | Splits rows into `n` equal groups (percentile buckets) |
*/


#### row_number():
/*
	-> Always gives a unique sequential number to each row.
	-> Even if values are the same, it does NOT repeat or skip numbers.
*/

/*
| Value | ROW_NUMBER() |
| ----- | ------------ |
| 100   | 1            |
| 100   | 2            |
| 90    | 3            |
| 80    | 4            |
*/

use world;
select * from country;
select 
row_number() over (partition by Continent order by Name) as Row_numb, # Once 1 continent is done, numbering starts again
Name,Continent,Population,
LifeExpectancy
from country;





#### rank():

/*
	-> Rows with the same value get the same rank.
	-> But the next rank is skipped depending on how many duplicates there were.
*/

/*
| Value | RANK() |
| ----- | ------ |
| 100   | 1      |
| 100   | 1      |
| 90    | 3      |
| 80    | 4      |
*/

select 
rank() over (partition by Continent order by LifeExpectancy) as Row_numb, # Once 1 continent is done, numbering starts again
Name,Continent,Population,
LifeExpectancy
from country;






#### Ntile: used to divide rows into a specified number of equal (or nearly equal) groups/buckets based on an ordering.
select *, ntile(4) over(order by Population) as Pop_cat 
from city;





#### lag: allows you to access the value of a previous row in the result set without using a self-join.
# “I want to compare this row with the row before it.”

# Syntax: 
/*
LAG(expression, offset, default) OVER (
    [PARTITION BY column]
    ORDER BY column
)
*/


/*
	- expression → Column or value you want from previous row
	- offset → How many rows back (default = 1)
	- default → Value if previous row doesn’t exist (optional)
	- PARTITION BY → Optional, like “mini-groups”
	- ORDER BY → Required to define row order
*/

select name,Population,
lag(Population,1) over (order by Population) as Previous_Pop
from country;


#### lead: opposite of LAG() — it lets you look at the next row instead of the previous one.
# Syntax:
/*
LEAD(expression, offset, default) OVER (
    [PARTITION BY column]
    ORDER BY column
)
*/

SELECT Name, Continent, Population,
       LEAD(Population) OVER (PARTITION BY Continent ORDER BY Population) AS next_pop
FROM Country;
