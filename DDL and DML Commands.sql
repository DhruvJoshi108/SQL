create database COMPANY1;
use company1;
create table employee1
( id int unique not null,
name varchar(100),
position varchar(100),
salary decimal (10,2),
date_of_joining date
);

insert into employee1 ( id , name , position, salary, date_of_joining)
values( 1 , "John Doe" , 'Manager' , 55000.00, '2020-01-15'),
( 2 , 'Jane Smith', 'Developer', 48000.00, '2019-07-10'),
( 3  , 'Alice Johnson', 'Designer', 45000.00, '2021-03-22'),
( 4 , 'Bob Brown', 'Developer', 50000.00, '2018-11-01');

# Write a query to retrieve all employees who are Developers.

select * from employee1 where position = 'developer';

# We use the following command to disable safe update mode, allowing us to modify the table columns.

set sql_safe_updates=0;

# Write a query to update the salary of Alice Johnson to 46000.00.

update employee1
set salary = 46000.00 where id=3;

# Write a query to delete the employee record for Bob Brown.

delete from employee1 where name = 'Bob Brown';

# Write a query to find the employees who have a salary greater than 48000.

select * from employee1 where salary > 48000;

# Write a query to add a new column email to the employees table.

alter table employee1
add email varchar(100);

# Write a query to update the email for John Doe to john.doe@company.com.

update employee1
 set email = 'john.doe@company.com' where name = 'John Doe';
 
 # Write a query to retrieve only the name and salary of all employees.
 
 select name , salary from employee1;
 
 # Write a query to count the number of employees who joined after January 1, 2020.
 
 select count(*) from employee1 where date_of_joining > '2020-01-01';
 
 # Write a query to order the employees by salary in descending order.
 
 select * from employee1 order by salary desc;
 
 # Write a query to order the employees by salary in descending order.
 
  alter table employee1
  drop email;
  
  # Write a query to find the employee with the highest salary.

select * from employee1 order by salary desc limit 1;