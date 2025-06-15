--Character functions:
--1-case conversion functions:(lower,upper,initcap)
select last_name,lower(last_name),upper(last_name) ,initcap(last_name)
from employees
where department_id=90; 

select last_name,lower(last_name),upper(last_name) ,initcap(last_name)
from employees
where department_id=90
order by upper(last_name);

SELECT employee_id, last_name, department_id
FROM   employees
WHERE  upper(last_name) = upper('higgins');
-------
---character manipulation functions:
--concat:
select employee_id, concat(first_name,last_name) Name 
from employees
where department_id=90;

--substr:
select first_name,substr(first_name,2,4),substr(first_name,3),substr(first_name,-2)
from employees
where department_id=90;

--length:
select first_name ,length(first_name)
from employees;

--instr:
select first_name,instr(first_name,'a'),instr(first_name,'a',3),instr(first_name,'a',1,2)
from employees
where first_name='Sarah';

--lpad & rpad:
select first_name,lpad(first_name,10,'*'),rpad(first_name,10,'*')
from employees
where first_name='Sarah';



--replace:
select first_name,replace(first_name,'a','$'),replace(first_name,'ah','*')
from employees
where first_name='Sarah';



select employee_id, concat(first_name,last_name) Name ,length(last_name),
instr(last_name,'a') "contains 'a'?"
from employees 
where substr(job_id, 4)='REP';



------------------------------------------------------
--Numeric Functions:
--round:
select round(45.925,2),round(45.925),round(45.925,0),round(45.225,1)
from dual ;

select round(45.925,-1) from dual ;

select round(65.925,-2) from dual ;

select round(765.925,-2) from dual ;

--trunc:
select trunc(45.925,2),trunc(45.925),trunc(45.925,0),trunc(45.225,1)
from dual ;

select trunc(45.925,-1) from dual ;

select trunc(65.925,-2) from dual ;

select trunc(765.925,-2) from dual ;


mod:


select mod(3,2) from dual ;
select mod(20,2) from dual ;






