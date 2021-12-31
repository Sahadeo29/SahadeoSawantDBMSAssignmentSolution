create schema Travel_On_The_Go;

use Travel_On_The_Go;

create table Passenger(Passenger_name varchar (50), Category varchar(20), Gender varchar(1), Boarding_City varchar(50), Destination_City varchar(50), Distance int(5), Bus_Type varchar(10));

create table Price(Bus_Type varchar(10), Distance int(5), Price int(5));

insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500,'Sleeper');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into Passenger(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)values('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

insert into Price(Bus_Type,Distance,Price)values('Sleeper', 350, 770);
insert into Price(Bus_Type,Distance,Price)values('Sleeper', 500, 1100);
insert into Price(Bus_Type,Distance,Price)values('Sleeper', 600, 1320);
insert into Price(Bus_Type,Distance,Price)values('Sleeper', 700, 1540);
insert into Price(Bus_Type,Distance,Price)values('Sleeper', 1000, 2200);
insert into Price(Bus_Type,Distance,Price)values('Sleeper', 1200, 2640);
insert into Price(Bus_Type,Distance,Price)values('Sleeper', 350, 434);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 500, 620);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 500, 620);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 600, 744);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 700, 868);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 1000, 1240);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 1200, 1488);
insert into Price(Bus_Type,Distance,Price)values('Sitting', 1500, 1860);


-- Numbers of female and male passengers travelled for a minimum distance of 600 KM s.
select Gender,COUNT(Gender) from Passenger where Distance>=600 Group by Gender;

-- The minimum ticket price for Sleeper Bus.
select MIN(Price) from Price where Bus_Type='Sleeper';


-- Passenger names whose names start with character 'S'.
select * from Passenger where Passenger_name like 'S%' order by Passenger_name;


-- Price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select Passenger_name,Boarding_City,Destination_City,Bus_Type,Price from Passenger,Price where (Passenger.Bus_Type=Price.Bus_Type and Passenger.Distance=Price.Distance);


-- Passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s.
select Passenger_name,Price from Passenger,Price where(Passenger.Bus_Type='Sitting' and Price.Bus_Type='Sitting' and Passenger.Distance=700 and Price.Distance=700);


-- The Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji.
select Price from Price where Distance=(select Distance from Passenger where Passenger_name='Pallavi');


-- Distances from Passenger table which are unique(non-repeated distances) in descending order.
select distinct(Distance) from Passenger order by Distance desc;


-- The Passenger name and percentage of Distance travelled by that Passenger from the total distance travelled by all Passengers without using user variables.
select Passenger_name, (Distance/sum(Distance)*100) as percentage_travel from Passenger order by Passenger_name;


-- The Distance,Price in three categories in table Price
select Distance,Price, CASE when Price>1000 THEN 'Expensive' when Price>500 and Price<1000 THEN 'Average Cost' ELSE 'Cheap' END as Cost from Price;