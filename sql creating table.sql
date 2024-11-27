create database company ;
use company;
create table personal (
id int not null unique , 
name varchar (50) not null, 
age int not null check (age  >= 18), 
gender varchar (1) not null,
phone varchar (10) not null unique,
city varchar (15) not null default 'agra'
);
insert into personal (id , name , age ,gender, phone)
values (7, 'ram kumar', 19 ,'M', '4022155');

insert into personal (id , name , age ,gender, phone, city)
values (2, 'sarita kumari', 21, 'f', '4034421', 'delhi');

insert into personal (id , name , age ,gender, phone)
values (8,'salman khan' , 20 , 'm', '4056221' );

insert into personal (id , name , age ,gender, phone, city)
values (9,'juhi chawala' , 18 , 'f' , '4089821' , 'bhopal');

insert into personal (id , name , age ,gender, phone, city)
values (5,  'anil kapoor', 22, "m", 4025221);

insert into personal (id , name , age ,gender, phone, city)
values (6, 'john abraham', 21, 'm', 4033776 , 'delhi');
use company ;
select * from personal;

select name from personal ;

select id , name from personal;

select id as "student id" , name as "student name " from personal;

select name from personal where gender = "m" ; 

select id as student_id from personal;

select * from personal where age <21;
use company ;

select * from personal where city = 'agra' ;

select * from personal where city != 'agra';

select * from personal where age >= 18 or age =21;

select * from personal where age >= 18 and age <=21;

select * from personal where age >= 18 and gender = 'm';

select * from personal where age >= 18 and gender = 'f';

select * from personal where city  = 'bhopal' or city = 'agra';

select * from personal where city != 'bhopal' and city != 'agra';

select * from personal where NOT(city  = 'bhopal' or city = 'agra');

select * from personal where age <=19 or age =21 ;

select * from personal where not ( age = 18 and age = 19 and age =21) ;

select * from personal where age in(18,19,21);

select * from personal where city in ('delhi', 'bhopal');

select * from personal where city not in ('delhi', 'bhopal');

use company;

create table info (
id int not null unique , 
name varchar (50) not null, 
age int not null check (age  >= 18), 
gender varchar (1) not null,
phone varchar (10) not null unique,
city varchar (15) not null default 'agra'
);
insert into info (id , name , age ,gender, phone)
values (1, 'ram kumar', 19 ,'M', '4022155');

insert into info (id , name , age ,gender, phone, city)
values (2, 'sarita kumari', 21, 'f', '4034421', 'delhi');

insert into info (id , name , age ,gender, phone)
values (3,'salman khan' , 20 , 'm', '4056221' );

insert into info (id , name , age ,gender, phone, city)
values (4,'juhi chawala' , 18 , 'f' , '4089821' , 'bhopal');

insert into info (id , name , age ,gender, phone, city)
values (7,  'anil kapoor', 22, "m", 4025221, 'agra');

insert into info (id , name , age ,gender, phone, city)
values (8, 'john abraham', 21, 'm', 4033776 , 'delhi');

update personal 

set phone=6396276848 where id=2;

select * from personal;

update personal

set age=20 where id=2;

select * from personal;

update personal
set age=22 where id in( 6 , 7);

update personal
set age =19;
update personal
set phone = 112 , city = 'uttarakhand' where id = 7;
select * from personal;

delete from personal where id =2;
set sql_safe_updates=0;

delete from personal where gender = 'f';
select * from personal;
delete from personal;

select * from personal;

insert into info (id , name , age ,gender, phone, city)
values ( 10, 'john wick', 45, 'm', 1544555, 'uttarakhand');

truncate table personal;
drop table personal;

select * from info where age between 18 and 21;

select * from info where age not between 18 and 21;

select * from info where id  between 2 and 5;

select * from info where name  between 'a'and 'k';

select * from info where name like "S%";

select * from info where name like "%S";
select * from info where name like "%S%";
select * from info where name like "%am%";
select * from info where name like "__h%";
select * from info where name like '%ta%';
select * from info where phone like '40%';
select * from info where name not like 'r%';
select * FROm info where name regexp 'ra';
select * FROm info where name regexp '^ra';
select * FROm info where name regexp 'an$';
select * FROm info where name regexp 'ram|kapoor|khan';
select * FROm info where name regexp '^ram|kapoor|^khan';
select * FROm info where name regexp '^ram|kapoor|khan$';

select * from info  order by name ;
select * from info  order by name asc;
select * from info  order by name desc;
select * from info  order by city;
select * from info  order by name , city;
select * from info  order by city , name;
select * from info  order by city desc , name desc;
select * from info  where  age >19  order by name desc ;
select distinct city from info;
select distinct age from info order by age ;

insert into info (id , name , age ,gender, phone, city)
values (11, 'sachin', 19, 'm', 40334776 , 'agra');

select age from info where age>=19 order by age;

select * from info  where city = 'agra' order by name limit 2,2;

# AGGREGATE FUNCTION
select * from info;
# neema.jha@asms.edu.in 
select count(*)  from info;
select  count( distinct city) from info;
select max(age)  as maximum_age from info;
select min(age) as minimum_age from info;
select avg(age) as average_age from info;
select sum(age) as sum_of_age from  info;
select 5+9;
select 5*6 as total;
select 15/3;
select 16%3;
select id, name, (age+5) as 'New_age' from info;
select pi();
select round(pi(),2);
select round (14.3); 
select round(14.6);
select round(14.5);
select ceil(14.3);
select floor(14.3);
select pow(4,3);
select sqrt(64);
select sqrt(5) , round(sqrt(5),2)  ;
select abs(-2);
select abs(2);
select abs(2.25);
select abs(-2.25);
select sign(25);
select sign(-25);
select sign(0);
select rand()*100;

# STRING FUNCTIONS

select id , upper(name) as Name from info;
select id , ucase(name) as Name from info;
select id , lower(name) as Name from info;
select id , lcase(name) as Name from info;
select id , name , character_length(name) as length from info;
select id , name , length(name) as length from info;
select id , name , char_length(name) as length from info;
select id , city , char_length(city) as length from info;
select * from info;
select  concat(name, '' , age) as student  from info;

select concat(name , '-') as Name from info;

select concat('Dhruv' , ' ' , '-' , ' ' ,  'Joshi') as Name;

# Display ur name in with cap letters along with your age with '-' between it;
select ucase(concat('Dhruv' , '-' , 19)) as Name_Age;
select concat_ws( '  ' , 'Konichiwa' , 'Chaitanya' ,  'Wassup'  ) as name;
select '                Dhruv Joshi                     ' as name;
select ltrim( '                Dhruv Joshi                     ') as name;
select rtrim( '                Dhruv Joshi                     ') as name;
select trim( '                Dhruv Joshi                     ') as name;
select position('world' in 'hello world') as position;
select position('o' in 'hello world') as position;
select instr('hello world' , 'ell') as position;
select locate('ell', 'hello world') as position;
select locate('l', 'hello world' , 3) as position;
select locate('l', 'hello world' , 5) as position;
select locate('l', 'hello world' , 7) as position;
select locate('d', 'hello world' ) as position;
select substring('Dhruv Joshi' , 3);
select substring('Dhruv Joshi' , 5);
select substring('Dhruv Joshi' , 3 , 6);
select mid('Dhruv Joshi' , -7 , 3);
select substring('Dhruv Joshi' , -6 , 3);
select substring_index('www.dhruvjoshi.net', '.' , 1);
select substring_index('www.dhruvjoshi.net', '.' , 2);
select substring_index('www.dhruvjoshi.net', 'h' , 2);
select substring_index('www.dhruvjoshi.net', '.' , -2);
select left('Dhruv Joshi' , 3);
select right('Dhruv Joshi' , 3);
select rpad('Dhruv Joshi' , 20 , '*');
select lpad('Dhruv Joshi' , 20 , '+');
select reverse('Dhruv Joshi');
select replace('Dhruv Joshi' , 'Dhruv' , 'Shubham');
select strcmp('Dhruv Joshi' , 'Dhruv Joshi');
select strcmp('Dhruv Joshi' , 'Joshi'); # left string is greater than right string
select strcmp( 'Joshi' , 'Dhruv Joshi'); # left string is smaller than right string
select field( 'a' , 'X', 'a', 'k');
select field( 'k' , 'X', 'A', 'k');
select field( 5 , 2 , 8 , 0 , 20 , 5 , 6);
select field('raju', 'avi' , 'raj' , 'golu' , 'raju');
select find_in_set('golu', 'raj, raju, ravi, golu , suneel');
select hex('dhruv joshi');
select format(2345.9876,5);

# DATE FUNCTIONS

SELECT CURRENT_date();
select curdate();
select sysdate();
select now();
select date('2019-10-15 09:34:21');
select month('2019-10-15 09:34:21');
select monthname('2019-10-15 09:34:21');
select year('2019-10-15 09:34:21');
select quarter('2019-10-15 09:34:21');
select day('2019-10-15 09:34:21');
select dayname('2019-10-15 09:34:21');
select dayofweek('2019-10-15 09:34:21');
select dayofyear('2019-10-15 09:34:21');
select week('2019-10-15 09:34:21');
select weekday('2019-10-15 09:34:21');
select yearweek('2019-10-15 09:34:21');
select last_day ('2019-02-15 09:34:21');
select extract( month from'2019-10-15 09:34:21');
select extract(  day from'2019-10-15 09:34:21');
select extract( month from'2019-10-15 09:34:21');
select extract( year from'2019-10-15 09:34:21');
select extract( hour from'2019-10-15 09:34:21');
select extract( second from'2019-10-15 09:34:21');
select adddate('2005-12-10' , interval 10 day);
select adddate('2005-12-10' , interval 1 month); 
select adddate('2005-12-10' , interval 5000 minute);
select makedate(2024,10);
select subdate('2005-12-10', interval 1 day);
-- Time Function
select current_time;
select curtime(); 
select current_timestamp();
select localtime();
select localtimestamp();
select time('2005-12-10 07:30:02');
select hour('2005-12-10 07:30:02');
select minute('2005-12-10 07:30:02');
select timediff('09:54:57' , '07:30:20');
select * from product;
# Group BY & Having
-- 1. Find the total quantity sold for each product.
# select product_name, sum(quantity) as "total quantity" from product;
# group by product name ;
# select Laptop, sum(quantity) as "total quantity" from product;
select count(distinct name) from product;
select count(*)  from product;
select 'laptop' , sum(quantity) as 'total quantity' from product;
select 'phone', sum(quantity) as 'total quantity' from product;
-- 2. Find average price of each product
select 'laptop' , avg(price ) as 'Average Quantity' from product;
select 'phone' , avg(price) as 'Average Quantity' from product;
select 'tablet' , avg(price ) as 'Average Quantity' from product;

-- 3. Get total number of sales(sales_id), count) for each region
select 'laptop' , sum(quantity) , count(distinct quantity);
-- 3i. select region, count
-- 4. Find total quantity sold for each region
select "north" , sum(quantity) as "total quantity" from Product;
-- find the region where more than 10 items have been sold
select 'east' , sum(quantity) as "Total quantity" from product Group by 'east' having sum(quantity)>10;
select 'west' , sum(quantity) as "Total quantity" from product Group by 'west' having sum(quantity)>10;
select * from product;
use company;
-- 6. Find total sales amount for each product
select name  as "Product" , sum(price * quantity ) as "Total Sales" from product group by name ; 
-- 7. Find the regions where total sales amount exceeds 5000.  
select region as 'Region' , sum(price * quantity) as 'Total Sales Amount' from product group by region having sum(price * quantity)>5000;
-- 8. Find average quantity sold for each product & only show products with an average quantity greater than 4.
select name as "Product", avg(quantity) as "average" from product group by name having avg(quantity)>4;
-- 9. Get the number of different products sold in each region.
select * from product;
select region , count(distinct name) as number_of_products from product group by region;
-- 10. Find the product with highest total sales amount. 
select name, sum(quantity * price) as total_sales from product group by name limit 1;
     
     
     
     
     
 use company;
 create table student(
 student_id int primary key ,
 name varchar(50));
 create table course(
 student_id int primary key,
 course varchar(50));
 insert into student(student_id,name)
 values(101,'Adam'),
 (102,'Bob'),
 (103,'Casey');
 insert into course(student_id,course)
 values(102,'english'),
 (103,'math'),
 (105,'science'),
 (107,'computer science');
 select *  from student;
 select * from course;
 
 select student.student_id,name,course
 from student
 inner join course
 on student.student_id=course.student_id;
 
 select d.student_id,name,course
 from student  d
 inner join course j
 on d.student_id=j.student_id;
 
 select d.student_id,name,course
 from student  d
 left join course j
 on d.student_id=j.student_id;
 
 select d.student_id,name,course
 from student  d
 right join course j
 on d.student_id=j.student_id;
 
 select d.student_id,name,course
 from student  d
 cross join course j
 on d.student_id=j.student_id;

