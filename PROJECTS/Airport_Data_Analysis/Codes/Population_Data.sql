use airportdata;


##########  CITY POPULATION:

#### Correlation between population and air traffic:

select * from city;

select * from all_city_pop
order by population asc;


select substring_index(CityName,',',1) as City_Name,State_ABR,
state_nm,Population
from city c
left join all_city_pop as a
on a.city_name = c.CityName;


update city
set CityName = substring_index(cityname,',',1);



set sql_safe_updates = 0;




select * from city;




create table City_New
(select CityID,substring_index(CityName,',',1) as City_Name,State_ABR,
state_nm,Population
from city c
left join all_city_pop as a
on a.city_name = c.CityName);





select * from city_new;









########## Population vs Origin City:

#### Analyse the Relation between City Population and Airport Traffic:

select * from airport;
alter table city_new rename City;
select * from city;


update airport
set City_Name = substring_index(city_name,',',1);


set sql_safe_updates = 0;



## CITIES AS ORIGIN: 

select 
	c.City_Name,
    c.Population, 
    sum(fm.Passengers) as Total_Passengers
from city c
join airport a on a.city_name = c.city_name
join flight f on f.origin_airport_ID = a.airport_ID
join flightmatrics fm on f.flight_ID = fm.flight_ID
group by c.city_Name, c.population
order by total_Passengers desc;



select 
	c.City_Name,
    c.Population, 
    sum(fm.Passengers) as Total_Passengers,
    round(sum(fm.Passengers)/c.population,2) as Passengers_Pop_Ration
from city c
join airport a on a.city_name = c.city_name
join flight f on f.origin_airport_ID = a.airport_ID
join flightmatrics fm on f.flight_ID = fm.flight_ID
group by c.city_Name, c.population
order by Passengers_Pop_ration desc;







########## POP VS DESTINATION CITY:

## CITIES AS DESTINATIONS:

select 
	c.City_Name,
    c.Population, 
    sum(fm.Passengers) as Total_Passengers
from city c
join airport a on a.city_name = c.city_name
join flight f on f.dest_airport_ID = a.airport_ID
join flightmatrics fm on f.flight_ID = fm.flight_ID
group by c.city_Name, c.population
order by total_Passengers desc;




select 
	c.City_Name,
    c.Population, 
    sum(fm.Passengers) as Total_Passengers,
    count(f.flight_ID) as Total_Flights,
    round(sum(fm.Passengers)/c.population,2) as Passengers_Pop_Ration
from city c
join airport a on a.city_name = c.city_name
join flight f on f.dest_airport_ID = a.airport_ID
join flightmatrics fm on f.flight_ID = fm.flight_ID
group by c.city_Name, c.population
order by Passengers_Pop_ration desc;



