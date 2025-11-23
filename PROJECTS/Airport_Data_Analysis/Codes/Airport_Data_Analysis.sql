#### Data analysis:

select 
	f.origin_airport_ID,
    f.dest_airport_ID,
    a1.city_name as origin_city,
    a2.city_name as dest_city,
    sum(fm.passengers) as total_passengers

from flight f
join flightmatrics fm on f.flight_ID = fm.flight_ID
join airport a1 on f.Origin_airport_ID = a1.airport_ID
join airport a2 on f.Dest_airport_ID = a2.airport_ID
group by f.Origin_airport_ID,f.Dest_airport_ID
order by total_passengers desc
limit 10;






#### Total passangers served in the duration

select 
	f.year,
    f.month,
    round(sum(fm.passengers)/1000000,2) as total_passengers

from flight f
join flightmatrics fm on f.flight_ID = fm.flight_ID
group by f.year, f.month
order by f.year,f.month;