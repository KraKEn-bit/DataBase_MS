#### Assess flight frequency and identify high-traffic corridors
# To assess flight frequency and identify high-traffic corridors we will:
# 1> Count how often each route (origin->destination) appears which is flight frequency.
# 2. Identify routes with the highest number of flights which are high traffic corridors.


select 
	f.origin_airport_ID,
    f.dest_airport_ID,
    a1.city_name as origin_city,
    a2.city_name as dest_city,
    count(*) as flight_count

from flight f
join airport a1 on f.origin_airport_ID = a1.airport_ID
join airport a2 on f.Dest_airport_ID = a2.airport_ID
group by f.Origin_airport_ID, f.Dest_airport_ID
order by flight_count desc;



## Los angels is one of the top 10 busiest air routes


