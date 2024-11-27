create database assignment;
use assignment;
create table employees
(emp_id int auto_increment primary key,
first_name varchar(20),
last_name varchar(20),
department varchar(20),
salary decimal(20,2),
join_date date );
insert into employees (first_name, last_name, department, salary,join_date)
values('John','Doe','IT', 60000,'2019-01-10'),
('Jane','Smith', "HR", 55000, '2018-03-05'),
('Emily', 'Jones','IT', 62000, '2020-07-23'),
('Michael','Brown','Finance',70000,'2016-05-14'),
('Sarah','Devis','Finance',69000,'2017-11-18'),
('David', 'Johnson','HR', 48000,'2021-09-10');
-- 1. Find the average salary of employees in each department. 
select department , sum(salary) as 'Average Salary' from employees group by department ;

-- 2. Find the total number of employees hired after 2019. 
select count(*) AS 'Total Joinings' from employees where year(join_date) > 2019;

-- 3. List the departments and the total salary of all employees in each department, ordered by the total salary.
select department , sum(salary) as 'Average salary' from employees group by department order by sum(salary);

-- 4. Find the highest salary in the Finance department. 
select max(salary) from employees  where department = 'Finance' order by max(salary);

-- 5. Get the top 3 highest-paid employees.
select salary as 'Salary' from employees order by salary  desc limit 3;

-- 6. Find the department with the minimum average salary.  
select department as 'Department' , avg(salary) as "Minimum Average Salary" from employees group by department  order by avg(salary) limit 1;

-- 7. Display the total number of employees in each department, ordered by the number of employees. 
select department as 'Department', count(*) as 'Total Number of Employees' from employees group by department;

-- 8. Find the average salary of employees who were hired before 2020.  
select avg(salary) as 'Average Salary ' from employees where year(join_date)<2020;

-- 9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first. 
select join_date as "Join Date"  from employees  where department = 'IT';

-- 10. Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary. 
select sum(salary) as 'sum of salaries' from employees  where date(join_date)>'2019-01-01'; 

-- 11. Get the employee with the lowest salary in the HR department.
select salary as "Lowest Salary" from employees where department = 'HR' order by salary limit 1;

-- 12. Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.  
select sum(salary) as 'Total Salary' , department as 'Department' from employees group by department order by sum(salary) desc limit 2;

-- 13. List all employees hired after 2018, ordered by salary, and show only the first 4 employees. 
select salary as 'Salary' from employees where date(join_date)>2018 order by salary asc limit 4;

-- 14. Find the highest salary in the IT department, but limit the results to the top 1 result. 
select salary as 'Highest Salary' from employees where department = 'IT' order by salary desc limit 1;

-- 15. Get the average salary of employees in each department and list only departments with an average salary greater than $60,000.  
select avg(salary) as 'Average Salary' , department as 'Department' from employees group by department having avg(salary)>60000;
