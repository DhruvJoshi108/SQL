create database assign5;
use assign5;
create table employee2(emp_id int unique not null , emp_name varchar(50) , dept_id int not null);
insert into employee2(emp_id , emp_name , dept_id)
values(1 , "Alice",10),
(2, "Bob" , 20),
(3,'Charlie',30),
(4,'David' , 10),
(5, 'Eve' , 40);

create table department2(dept_id int primary key  , dept_name varchar(30));
insert into department2(dept_id,dept_name)
values(10,'HR'),
(20,'Finance'),
(30,'IT'),
(40,'Admin'),
(50,'Marketing');

create table project2(project_id int primary key , emp_id int , project_name varchar(30));
insert into project2(project_id , emp_id , project_name)
values(101 , 1 , 'Alpha'),
(102 , 2 , 'Beta'),
(103 , 3 , 'Gamma'),
(104 , 3 , 'Delta');

select * from employee2;
-- 1. Write a query to get Employee and Department details using join. 
select e.emp_name , d.dept_name
from employee2 e 
join department2 d 
on e.dept_id = d.dept_id ;

-- 2. Write a query to retrieve all employees with their departments, even if the department is missing.
select e.emp_name , d.dept_name
from employee2 e 
left join department2 d 
on e.dept_id = d.dept_id ;

-- 3. Write a query to get department details even if there are no employees in that department. 
select e.emp_name , d.dept_name
from employee2 e 
right join department2 d 
on e.dept_id = d.dept_id ;

-- 4. Write a query to get all employees and departments, whether matched or not.
select e.emp_name , d.dept_name
from employee2 e 
join department2 d
on e.dept_id = d.dept_id ;

-- 5. JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information. 
select e.emp_name , d.dept_name  , p.project_name
from employee2 e
join  department2 d 
on e.dept_id = d.dept_id 
join project2 p
on e.emp_id = p.emp_id;

-- 6. Find employees who are not assigned to any projects.
select e.emp_name as 'Employee Name '
from employee2 e 
left  join project2 p
on e.emp_id = p.emp_id
group by e.emp_name 
having count(p.project_name) = 0;

-- 7. Find departments with no employees using a RIGHT JOIN. 
select dept_name as "Department Name "
from employee2 e 
right join department2 d
on e.dept_id = d.dept_id 
group by dept_name
having count(e.dept_id)>0;

-- 8. Write a query to get Employee and Department details using join with aliases. 
select e.emp_name as 'Employee Name' , d.dept_name as 'Department Name ' 
from employee2 e 
join  department2 d
on e.dept_id = d.dept_id;


-- 9. Write a query to find projects managed by employees in the 'IT' department. 
select p.project_name as 'Project Name',  e.emp_name 'Employee Name'
from project2 p
join employee2 e
on p.emp_id = e.emp_id
where dept_id = ( select 
dept_id from department2 
where dept_name = 'IT');

-- 10. Write a query to show employees and their project information (even if not assigned to a project).
select e.emp_name as "Employee Name " , p.project_name as "Project Name"
from employee2 e
left join project2 p
on e.emp_id = p.emp_id ;

-- 11. Find employees who work in departments with names starting with 'A'. 
select e.emp_name as 'Employee Name ' , d.dept_name as 'Department Name '
from employee2 e
join department2 d
on e.dept_id = d.dept_id 
where d.dept_name regexp '^a';

-- 12. Find the total number of employees in each department using GROUP BY and JOIN. 
select  d.dept_name as ' Department Name ' ,count(e.emp_id) as 'Total Number of Employees'
from department2 d 
join employee2 e
on d.dept_id= e.dept_id
group by d.dept_name 
having count(e.emp_id);

-- 13. Get the list of departments with more than one employee. 
select d.dept_name  , count(e.emp_id)
from department2 d 
left join employee2 e
on d.dept_id = e.dept_id 
group by d.dept_name 
having count(e.emp_id) > 1 ;
