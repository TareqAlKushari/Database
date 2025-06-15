--Using subqueries to solve queries:
-- 1)single-row subquery:
--*Return only one row
--*Use single-row comparsion operators:=,>,>=,<,<=,<>

---who has a salary greater than Abel's

select salary from employees where last_name='Abel';

select last_name ,salary 
from employees 
where salary >(select salary from employees where last_name='Abel');

select last_name,job_id,salary 
from employees 
where job_id=(select job_id 
from employees
where last_name='Abel')
and
salary>(select salary
from employees
where last_name='Abel');


---error:using single row operator with subquery which returns more than one row 
select last_name ,salary
from employees
where salary >(select salary from employees where department_id=50);

---Using group functions in a subquery:

select last_name,job_id,salary 
from employees
where salary = (select min(salary) from employees);

---Having clause with subquery:

select department_id,min(salary)
from employees
group by department_id
having min(salary)>(select min(salary) from employees where department_id=50);

---what is wrong in this statement?

select employee_id,last_name
from employees
where salary=(select min(salary) from employees group by department_id);

---No rows returned by the inner query:

select last_name,job_id  
from employees 
where job_id=(select job_id 
from employees
where last_name='Hass');

---------------------------------------------------------
--2)Multiple-row subqueries:
--*return more than one row
--*use multiple-row comparison operators:
--1-in:equal to any member in the list
--2-any:most be preceded by =,>,>=,<,<=,!= returns true if at least one element exists in the result-set of subquery for which of the relation is true.
--2-all:most be preceded by =,>,>=,<,<=,!= returns true if the relation is true for all elements in the result-set of subquery.

select salary from employees where department_id=90;
--in:
select last_name,salary from employees
where salary in (select salary from employees where department_id=90);

--any:
select last_name,salary from employees
where salary >=any (select salary from employees where department_id=90);

--all:
select last_name,salary from employees
where salary >=all (select salary from employees where department_id=90);


--------------------------------------------
--Null values in subquery:

---Do not use (not in) when the subquery return null values

select last_name from employees
where manager_id is null;

select last_name from employees
where manager_id = null;


select last_name from employees
where manager_id in(100,101,null);

select last_name from employees
where manager_id not in(100,101,null);

---not in is equivalent to <>all
 

select last_name from employees
where employee_id in(select manager_id from employees);

select last_name from employees
where employee_id  not in(select manager_id from employees);


 

 
 



