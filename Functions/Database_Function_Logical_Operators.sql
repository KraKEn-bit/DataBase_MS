use world;
select * from country;


#### if:
# Syntax: IF(condition, value_if_true, value_if_false)

select name,Region,
Population, if(Population>=3427800,"Above Global Avg","Below Global Avg") as Pop_Status
from country;


## group by with condition:
select if(Population>=3427800,"Above Global Avg","Below Global Avg") as Pop_Status,
count(name) as No_of_countries
from country
group by Pop_status;




#### ifnull:
select * from country;
select name,Region, IndepYear,ifnull(IndepYear,0) as New_Indep_year
from country;





#### nullif: 
# syntax: NULLIF(expression1, expression2)

/*Compares expression1 and expression2.
-> If they are equal → returns NULL
->If they are different → returns expression1
*/

select * from country;
select name,Region,GNP,GNPOld, nullif(GNP,GNPOld) as check_GNP
from country
order by check_GNP asc;





#### Whenever I want multiple categorization I use 'Case' values
#### Case: CASE works like an IF-ELSE or SWITCH statement in programming.

# Syntax:
/*
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE default_result
END
*/

## Task: Categorize Population among: <=50000 , 50000-300000,300000-1000000,>=1000000
select * from country;
select name,Region,Population,
Case 
	when Population <= 50000 then "Low"
	when Population between 50000 and 300000 then "Medium"
    when Population between 300000 and 1000000 then "High"
    when Population >= 1000000 then "Very High"
End as Pop_cat
from Country;




# More specifically:
select * from country;
select
Case 
	when Population <= 50000 then "Low"
	when Population between 50000 and 300000 then "Medium"
    when Population between 300000 and 1000000 then "High"
    when Population >= 1000000 then "Very High"
End as Pop_cat,
count(name) as No_of_Countries
from Country
group by Pop_cat;







#### Coalesce: returns the first non-NULL value from a list of expressions.
# Syntax: COALESCE(expression1, expression2, ..., expressionN)
/*
-> It checks each expression in order.
-> Returns the first value that is not NULL.
-> If all values are NULL, it returns NULL.
*/
select * from country;
select GNP,GNPOld , coalesce(GNP,GNPOld,0) as GNP_Check  # Here, Instead of 0 I can give any value such as numeric,character,string etc
from country