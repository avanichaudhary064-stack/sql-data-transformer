create database data_transformer;
use data_transformer;
create table customertable(
   customer_id int primary key,
   first_name varchar(50),
   last_name varchar(50),
   email varchar(100),
   reg_date date
);

create table ordertable(
   order_id int primary key,
   customer_id int,
   order_date date,
   total_amount decimal(10,2)
);

create table employeetable(
   emp_id int primary key,
   first_name varchar(50),
   last_name varchar(50),
   department varchar(50),
   hire_date date,
   salary decimal(10,2)
);

insert into customertable values
(1,"John","Doe","john@email.com",'2022-03-15'),
(2,"Jane","Smith","jane@email.com",'2021-11-02');

insert into ordertable values
(101,1,'2023-07-01',150.50),
(102,2,'2023-07-03',200.75);

insert into employeetable values
(1,"Mark","Johnson","Sales",'2022-03-10',40000),
(2,"Susan","Lee","HR",'2021-06-20',50000);

select c.first_name, o.order_id, o.total_amount
from customertable c
inner join ordertable o
on c.customer_id = o.customer_id;

select c.first_name, o.order_id
from customertable c
left join ordertable o
on c.customer_id = o.customer_id;

select c.first_name, o.order_id
from customertable c
right join ordertable o
on c.customer_id = o.customer_id;

select *
from ordertable
where total_amount > (select avg(total_amount) from ordertable);

select *
from employeetable
where salary > (select avg(salary) from employeetable);

select order_id, year(order_date), month(order_date)
from ordertable;



select order_id, date_format(order_date,'%d-%m-%Y')
from ordertable;

select concat(first_name," ",last_name)
from customertable;

select upper(first_name), lower(last_name)
from customertable;

select replace(first_name,"John","Johnny")
from customertable;

select trim(email)
from customertable;

select order_id, total_amount,
sum(total_amount) over(order by order_id)
from ordertable;

select order_id, total_amount,
rank() over(order by total_amount desc)
from ordertable;

select order_id, total_amount,
case
 when total_amount > 500 then "High"
 when total_amount > 200 then "Medium"
 else "Low"
end
from ordertable;

select first_name, salary,
case
 when salary > 50000 then "High"
 when salary > 30000 then "Medium"
 else "Low"
end
from employeetable;

select * from customertable;
select * from ordertable;
select * from employeetable;

