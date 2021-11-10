create database TravelOnTheGo;
use TravelOnTheGo;
-- QUS 1 --
create table PASSENGER(Passenger_name varchar(255),Category varchar(255),Gender varchar(255),Boarding_City varchar(255),Destination_City varchar(255),Distance int(255),Bus_Type varchar(255));
create table PRICE(Bus_Type varchar(255),Distance int(255),Price int(255));

-- QUS 2 --
insert into PASSENGER values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");
insert into PASSENGER values ( "Sejal", "AC", 'F', "Bengaluru", "Chennai", 350, "Sleeper");
insert into PASSENGER values ( "Amol", "Non-AC", 'M', "Mumbai", "Hyderabad", 700, "Sitting");
insert into PASSENGER values ( "Pallavi", "AC", 'F', "Panji", "Bengaluru", 600, "Sleeper");
insert into PASSENGER values ( "Khusboo", "AC", 'F', "Chennai", "Mumbai", 1500, "Sleeper");
insert into PASSENGER values ( "Udit", "Non-AC", 'M', "Trivandrum", "Panji", 1000, "Sleeper");
insert into PASSENGER values ( "Ankur", "AC", 'M', "Nagpur", "Hyderabad", 500, "Sitting");
insert into PASSENGER values ( "Hemant", "Non-AC", 'M', "Panji", "Mumbai", 700, "Sleeper");
insert into PASSENGER values ( "Manish", "Non-AC", 'M', "Hyderabad", "Bengaluru", 500, "Sitting");

insert into PRICE values ("Sleeper", 350, 770);
insert into PRICE values ("Sleeper", 500, 1100);
insert into PRICE values ("Sleeper", 600, 1320);
insert into PRICE values ("Sleeper", 700, 1540);
insert into PRICE values ("Sleeper", 1000, 2200);
insert into PRICE values ("Sleeper", 1200, 2640);
insert into PRICE values ("Sleeper", 350, 434);
insert into PRICE values ("Sitting", 500, 620);
insert into PRICE values ("Sitting", 600, 744);
insert into PRICE values ("Sitting", 700, 868);
insert into PRICE values ("Sitting", 1000, 1240);
insert into PRICE values ("Sitting", 1200, 1488);
insert into PRICE values ("Sitting", 1500, 1860);




insert into PRICE values("Sitting",1500,1860);
-- QUS 3 -- 
select Gender, count(Gender) as number_of_passengers from PASSENGER where Distance >= 600 group by Gender;
-- QUS 4 --
select min(price) from PRICE;
-- QUS 5 --
select Passenger_name from PASSENGER where Passenger_name Like 'S%';
-- QUS 6 --
select ps.Passenger_name,ps.Boarding_City,ps.Destination_City,bus.Bus_Type,bus.Price from PASSENGER as ps inner join PRICE as bus on bus.Distance = ps.Distance ;
-- QUS 7 --
select Passenger_name from PASSENGER where Bus_Type = 'Sitting' and Distance =1000;
-- QUS 8 --
select Price,Bus_Type from PRICE where Distance = (select Distance from PASSENGER where Destination_City='Bengaluru' and Boarding_City='Panaji');
-- QUS 9 --
select distinct Distance from PASSENGER order by Distance desc;
-- QUS 10 --
select Passenger_name,Distance*100/(select sum(Distance) from PASSENGER ) as '% of distance' from PASSENGER;

-- QUS 11 --
select Distance,Price,case 
when Price > 1000 then "Expensive"
when Price between 500 AND 1000 then "Average Cost" 
else "Cheap"
end as Prices
from PRICE;