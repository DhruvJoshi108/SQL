create database joins;
use joins;
create table emp(
emp_id int primary key auto_increment,
emp_name varchar(50),
dept_id int,
salary int);

insert into emp(emp_name,dept_id,salary)
values("Alice",101,6000),
      ("Bob",102,7000),
      ("Charlie",103,8000),
      ("David",101,7500),
      ("Eve",102,8500);

create table departments(
dept_id int,
dept_name varchar(50));

insert into departments(dept_id,dept_name)
values(101,"HR"),
      (102,"Sales"),
      (103,"IT"),
      (104,"Marketing");
      
create table projects(
project_id int,
project_name varchar(30),
dept_id int);

insert into projects(project_id,project_name,dept_id)
values(1,"Project A", 101),
      (2,"Project B",102),
      (3,"Project C",103),
      (4,"Project D",104);
-- 1. retrieve all employees name and department name for each employee.
select emp_name , dept_name 
from emp e right join departments d
on e.dept_id=d.dept_id;

-- 2. Find all employees who work in sales department
select emp_name , dept_name 
from emp e 
inner join departments d
on e.dept_id = d.dept_id
where dept_name  = 'sales';

-- 3. List project name along with departments 
select * from projects;
select project_name , dept_name
from projects p 
inner join departments d
on p.dept_id = d.dept_id;

-- 4. Find the employees who have salaries higher than 7500 and work in project of an IT department
select * from emp;
select emp_name , salary , dept_name
from emp e 
inner join departments d
on e.dept_id = d.dept_id
where salary > 7500 and dept_name = 'IT';

-- 5. Find number of employee in each department
select * from departments;
select count(emp_name), dept_name
from emp e 
inner join departments d 
on e.dept_id = d.dept_id
group by dept_name ;

-- 6. Get total salary of each department
select sum(salary) as 'Total Salary',dept_name
from emp e 
inner join departments d 
on e.dept_id = d.dept_id
group by dept_name;

-- 7. Find all departments that have no employees
select emp_name , dept_name
from emp e
right join departments d 
on e.dept_id = d.dept_id
where emp_name is null;

-- 8. List the emploee names and their respective Project names
select emp_name as 'Employee', project_name as 'Project'
from emp e
inner join projects p 
on e.dept_id = p.dept_id;

-- 9. Find the employee and project name for employees in 'HR' department.
select emp_name as 'Employee' , project_name as 'Project', dept_name as 'Department'
from emp e 
inner join projects p
on e.dept_id = p.dept_id
inner join departments d
on e.dept_id = d.dept_id
where dept_name = 'HR';

-- 10. Retrieve departments with more than 1 projects assigned
select dept_name as 'Department' , count(project_name) as 'Project Count'
from departments d 
right join projects p 
on d.dept_id = p.dept_id
group by dept_name  
having count(project_name) > 1 ;

-- 11. Find employees who work in departments that are not assigned any projects.
select count(emp_id) as 'Employee' , dept_name as 'Department', count(project_name) as 'Project'
from emp e 
inner join departments d
on e.dept_id = d.dept_id
inner join projects p
on e.dept_id = p.dept_id
group by dept_name
having count(project_name) = 2;

-- 12. List the departments along with the number of employees and projects.
select dept_name as 'Department' , count(emp_name) as "Employee Count", count(project_name) as "Project Count"
from departments d 
inner join emp e 
on d.dept_id = e.dept_id
inner join projects p 
on d.dept_id = p.dept_id
group by dept_name;

-- 13. Get the department name and total salary spent on employees for departments with at least 2 employees.
select dept_name as 'Department' , sum(salary) as 'Total Salary' , count(emp_name) as 'Employee count'
from departments d 
inner join emp e 
on d.dept_id = e.dept_id 
group by dept_name
having count(emp_name) >=2 ;