create database AirportData;
use AirportData;
select * from airport_project_data;


create table airline(
	airline_ID int primary key,
	unique_carrier varchar(10),
	unique_carrier_name varchar(100),
	unique_carrier_entity varchar(10)
);


create table airport(
	airport_ID int primary key,
    airport_seq_ID int,
    city_market_ID int,
    airport_code varchar(100),
    city_name varchar(100),
    state_abr char(2),
    state_fips int,
    state_nm varchar(100),
    wac int
);


 create table flight(
	flight_ID int auto_increment primary key,
    airline_ID int,
    Origin_airport_ID int,
    Dest_airport_ID int,
    distance float,
    distance_group int,
    year int,
    quarter int,
    month int,
    class char(1),
    foreign key (airline_id) references airline(airline_ID),
	foreign key (origin_airport_ID) references airport(airport_ID),
    foreign key (dest_airport_ID) references airport(airport_ID)
);


create table flightMatrics(
	flight_ID int,
    passengers float,
    freight float,
    mail float,
    foreign key (flight_ID) references flight(flight_ID)
);
 


create table city(
	cityID int auto_increment primary key,
    cityName varchar(100),
    state_abr char(2),
    state_nm varchar(100),
    unique (CityName, State_ABR,state_nm)
);