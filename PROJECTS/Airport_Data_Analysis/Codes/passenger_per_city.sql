use airport_project_data;


## Avg passengers per origin city:

select 
	f.origin_airport_ID,
    a.city_name as origin_city,
    count(f.flight_ID) as total_flights,
    sum(fm.passengers) as total_passengers,
    round(avg(fm.passengers),2) as avg_passenger_per_flight

from flight f
join flightmatrics fm on f.flight_ID = fm.flight_ID
join airport a on f.Origin_airport_ID = a.airport_ID
group by f.Origin_airport_ID
order by avg_passenger_per_flight desc; 



## Avg passengers per Destination city:

select 
	f.dest_airport_ID,
    a.city_name as dest_city,
    count(f.flight_ID) as total_flights,
    sum(fm.passengers) as total_passengers,
    round(avg(fm.passengers),2) as avg_passengers_per_flight

from flight f
join flightmatrics fm on f.flight_ID = fm.flight_ID
join airport a on f.Dest_airport_ID = a.airport_ID
group by f.Dest_airport_ID
order by avg_passengers_per_flight desc;   