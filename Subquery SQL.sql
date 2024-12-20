create database subquery;
use subquery;

create table employee5(emp_id int primary key auto_increment , name varchar(20) , department varchar(30) , salary int);
insert into employee5( name , department , salary)
values('John' , 'HR' ,5000),
('Alice' , 'IT' , 7000),
('Bob' , 'Finance' , 6000),
('Eve' , 'IT' , 8000),
('Charlie' , 'Finance' , 7500);
create table department5(dept_id int primary key , dept_name varchar(30));
insert into department5(dept_id , dept_name )
values(1 , 'HR'),
(2 , 'IT'),
(3 , 'Finance');

-- 1. Find employees with salaries greater than the average salary of all employees. 
select name as 'Name' , salary as 'Salary'
from employee5
where salary > (select avg(salary) from employee5);


-- 2. Find employees whose salary is higher than the salary of 'Alice'. 
select name  , salary 
from employee5 
where salary > (select salary from employee5 where name = 'Alice');

-- 3. List employees who belong to a department that has the name 'IT'. 
select name 
from employee5
where department =(select dept_name from department5 where dept_name =  'IT');

-- 4. Get the names of employees who earn the highest salary in their department. 
select name , salary , department
from employee5 
where salary in (select max(salary) from employee5  group by department )  ;

-- 5. Retrieve the departments where at least one employee earns more than 7000. 
select dept_name 
from department5
where dept_name in (select department from employee5 where salary > 7000);

-- 6. List employees who do not belong to any department in the departments table. 
select name 
from employee5
where department = (select dept_name from department5 group by dept_name having count(dept_name ) = (select count(name) from employee5));

-- 7. Find the second-highest salary among employees.
select name ,  salary
from employee5 
where salary = (select max(salary) from employee5);

-- 8. Retrieve the names of employees who work in the department with the highest number of employees. 
select name ,  department
from employee5  
where department in  (
select department 
from employee5 
group by department having count(name) = (
 select count(name) 
 from employee5 
 group by department order by count(name) desc limit 1));
 
-- 9. Find employees who earn more than the average salary in their department.
select NAME , department
from employee5 
where salary > ( select avg(salary) from employee5); 
-- 10. Retrieve employees whose salary is above 7000 and belong to departments in the departments table. 
select name , department
from employee5
where salary > 7000
and department in (select dept_name  from department5);

-- 11. List all departments that have no employee
select department
from employee5 
where name  = ( select name from employee5 where name is null);

-- 12. Find employees who have the same salary as another employee in a different department. 
select e1.name , e1.salary  
from employee5 e1 
where salary in (
select salary 
from employee5 e2  
where e1.department != e2.department  );


-- 13. Get the total salary of the department with the maximum total salary. 
select department , sum(salary) 
from employee5
group by department order by  sum(salary) = (select sum(salary) from employee5 order by sum(salary) desc limit 1 );

-- 14. Retrieve employees whose department has more than two employees. 
select name from employee5
where department in (select department from employee5 group by department having count(name) > 2);

-- 15.  Find employees whose salary is higher than the average salary of employees in the IT department. 
select Name from employee5 
where salary in (select avg(salary) from employee5 where department = 'IT');
