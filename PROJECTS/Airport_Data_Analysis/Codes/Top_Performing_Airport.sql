### Compare passenger numbers across origin cities to identify top performing airports
## Total passengers and TOtal no of flights


select 
	a.city_name as origin_city,
    sum(fm.passengers) as total_passengers,
    count(f.flight_ID) as total_flights
from flight f
join flightmatrics fm on f.flight_ID = fm.flight_ID
join airport a on f.Origin_airport_ID = a.airport_ID
group by a.city_name
order by total_flights desc;




#### Destination city:

select 
	a.city_name as origin_city,
    sum(fm.passengers) as total_passengers,
    count(f.flight_ID) as total_flights
from flight f
join flightmatrics fm on f.flight_ID = fm.flight_ID
join airport a on f.dest_airport_ID = a.airport_ID    # change here
group by a.city_name
order by total_flights desc;