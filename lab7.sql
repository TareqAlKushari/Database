--You can use avg & sum for numeric data:

select sum(salary),avg(salary)
from employees;

--You can not use avg & sum with charcter & date data types:

select sum(first_name), avg(job_id), sum(hire_date)
from employees;

--You can use max & min for numeric , charcter & date data types:

select salary
from employees 
order by salary;

select max(salary),min(salary)
from employees;

select max(hire_date),min(hire_date)
from employees;

select max(last_name),min(last_name)
from employees;

--count(*) returns the number of rows in a table including duplicate rows and rows containing null values:
select *
from employees; 

select count(*) 
from employees; 

select count(*) 
from employees
where department_id=80;

--count(expr) returns the number of rows with non-null values for expr:

select commission_pct  
from employees
where department_id=50;

select count(commission_pct)  
from employees
where department_id=50;

select commission_pct  
from employees
where department_id=80;

select count(commission_pct) 
from employees
where department_id=80;--returns the duplicate rows

--count(distinct expr) returns the number of distinct non-null values of expr:

select count(department_id) 
from employees;

select count(distinct department_id) 
from employees;


--Group functions ignore null values in the column :

select count(commission_pct) 
from employees;
--The NVL function forces group functions to include null values:

select count(nvl(commission_pct,0)) 
from employees;

--You can divide rows in a table into smaller groups by using the group by clause:

select department_id ,avg(salary)
from employees; --error

--You must include all the columns in the group by clause which are in the select statement:

select department_id ,avg(salary)
from employees
group by department_id; 

select department_id ,job_id,avg(salary)
from employees
group by department_id;

select department_id ,job_id,avg(salary)
from employees
group by department_id,job_id; 

--The group by columns does not have to be in the select list:

select avg(salary)
from employees
group by department_id; 


--You cannot use a column alias in the group by clause:

select department_id n ,avg(salary)
from employees
group by n;

--You can use where & order by with group functions

select department_id n ,job_id ,avg(salary)
from employees
where department_id>40
group by department_id,job_id
order by n;

--You cannot use the where clause to restrict groups:


select department_id n ,avg(salary)
from employees
where avg(salary)>8000
group by department_id
order by n;


--Restricting group results with the having clause:

select department_id n ,avg(salary)
from employees
group by department_id
where avg(salary)>8000
order by n;


select department_id n ,avg(salary)
from employees
group by department_id
having avg(salary)>8000
order by avg(salary);















