insert ignore into airline (airline_ID,unique_carrier,unique_carrier_name,unique_carrier_entity)
select distinct
	airline_ID,
    unique_carrier,
    unique_carrier_name,
    unique_carrier_entity
from airport_project_data
where airline_ID is not null;

select * from airline;


select count(distinct airline_ID) from airline;







####  Origin Airports:
insert into airport(airport_ID,airport_seq_ID,city_market_ID,airport_code,city_name,
					state_abr,state_fips,state_nm,wac)

select distinct
	origin_airport_ID,
    origin_airport_seq_ID,
    origin_city_market_ID,
    origin,
    origin_city_name,
    origin_state_ABR,
    origin_state_fips,
    origin_state_nm,
    origin_wac
from airport_project_data;







####  Dest Airports:
insert into airport(airport_ID,airport_seq_ID,city_market_ID,airport_code,city_name,
					state_ABR,state_fips,state_nm,wac)


select distinct
	dest_airport_ID,
    dest_airport_seq_ID,
    dest_city_market_ID,
    dest,
    dest_city_name,
    dest_state_ABR,
    dest_state_fips,
    dest_state_nm,
    dest_wac
from airport_project_data
where dest_airport_id not in (
	select airport_ID from airport
);


select * from airport;







#### Flight:

insert into flight(airline_ID,origin_airport_ID,dest_airport_ID,distance,
					distance_group,year,quarter,month,class)
select
	airline_ID,
    origin_airport_ID,
    dest_airport_ID,
    distance,
    distance_group,
    year,
    quarter,
    month,
    class
from airport_project_data;

select * from flight;






#### FlightMatrics:
ALTER TABLE flightMatrics 
MODIFY PASSENGERS FLOAT NULL,
MODIFY FREIGHT FLOAT NULL,
MODIFY MAIL FLOAT NULL;

UPDATE airport_project_data
SET FREIGHT = NULL
WHERE FREIGHT IN ('NaN', 'nan', '', 'NULL');


INSERT INTO flightMatrics (FLIGHT_ID, PASSENGERS, FREIGHT, MAIL)
SELECT
    f.FLIGHT_ID,
    SUM(CASE WHEN m.PASSENGERS REGEXP '^[0-9]+(\.[0-9]+)?$' THEN m.PASSENGERS ELSE 0 END),
    SUM(CASE WHEN m.FREIGHT REGEXP '^[0-9]+(\.[0-9]+)?$' THEN m.FREIGHT ELSE 0 END),
    SUM(CASE WHEN m.MAIL REGEXP '^[0-9]+(\.[0-9]+)?$' THEN m.MAIL ELSE 0 END)
FROM airport_project_data m
JOIN flight f
  ON f.AIRLINE_ID = m.AIRLINE_ID
 AND f.ORIGIN_AIRPORT_ID = m.ORIGIN_AIRPORT_ID
 AND f.DEST_AIRPORT_ID = m.DEST_AIRPORT_ID
 AND f.YEAR = m.YEAR
 AND f.MONTH = m.MONTH
 AND f.QUARTER = m.QUARTER
GROUP BY f.FLIGHT_ID;





#### city:

insert into city(Cityname,state_ABR,state_nm)
select distinct
	origin_city_name,
    origin_state_abr,
    origin_state_nm
from airport_project_data;

describe city; 


insert into city(CityName, state_ABR,state_nm)
select distinct	
	dest_city_name,
    dest_state_ABR,
    dest_state_NM
from airport_project_data
where DEST_CITY_NAME not in(
	select cityname from city
);
 
select * from city
order by cityID asc;
