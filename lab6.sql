--working with dates:
--default display format is DD-MON-RR
 

select last_name,hire_date 
from employees
where hire_date<'01-FEB-08';

--sysdate returns the current  DB server date & time 
select sysdate from dual;

--Arithmetic with dates:
Date + number=date
select sysdate ,sysdate+5 from dual;
Date - number=date
select sysdate ,sysdate-10 from dual;
date-date=number of day

select last_name ,(sysdate-hire_date)/7 ,round((sysdate-hire_date)/7) as weeks 
from employees 
where department_id=90;

date+number/24=date    add a number of hrs
select sysdate+10/24 from dual;

---------------------------------------------
--Date  manipulation function:
--1)months_between  number of months between 2 dates

select last_name, months_between(sysdate,hire_date),(sysdate-hire_date)/30 
from employees;

--2)add_months:
select last_name,hire_date, add_months(hire_date,3) 
from employees;
select last_name, hire_date, add_months(hire_date,-3) 
from employees;

--3)next_day:

select sysdate,next_day(sysdate,1) 
from dual;

--Monday=1
select sysdate,last_day(sysdate) 
from dual;

---------------------------------------------
--Round & trunc:
--dates:
--1-15 -->first day of the current month
--16-31 -->first day of the next month

select last_name,hire_date,round(hire_date,'MONTH'),trunc(hire_date,'MONTH')
from employees 
order by hire_date;

--Months:
--1-6 -->1-JAN of the current year
--7-12 -->1-JAN of the next year

select last_name,hire_date,round(hire_date,'YEAR'),trunc(hire_date,'YEAR')
from employees 
order by hire_date;

----------------------------------------
--Conversion functions:
--implicit conversion:
--in expression:

select * from employees
where employee_id='100'
or hire_date='21-sep-05'; --hire_date='21-09-05';

 
--in expression evaluation:

select concat(employee_id,first_name),concat(hire_date,first_name)
from employees;


--explicit conversion:

--1)to_char with dates:

select to_char(sysdate,'dd.mm.yy') from dual;
select to_char(sysdate,'dd mm yy') from dual;
select to_char(sysdate,'dd/mm/yy') from dual;
select to_char(sysdate,'dd/mm/yyyy') from dual;

select to_char(sysdate,'dd.mm.yy hh:mi:ss PM') from dual;
select to_char(sysdate,'dd.mm.yy hh24:mi:ss AM') from dual;

select hire_date,to_char(hire_date,'DD Month YYYY') "HireDate"
from employees;

select hire_date,to_char(hire_date,'fmDD Month YYYY') "HireDate" 
from employees;
 
select to_char(sysdate,'FMDD "of" Month YYYY') from dual;
select to_char(sysdate,'FMDD "of" MONTH YYYY') from dual;
select to_char(sysdate,'FMDDsp "of" Month YYYY') from dual;
select to_char(sysdate,'FMDDTH "of" Month YYYY') from dual;

select* from employees
where to_char(hire_date,'yyyy')= '2003';

select* from employees
where to_char(hire_date,'mm')='03';
select* from employees
where to_char(hire_date,'mm')='3';
 
select* from employees
where to_char(hire_date,'fmmm')='3';

--1)to_char with numbers:

select to_char(2000,'9,999') from dual;
select to_char(2000,'$9,999') from dual;
select to_char(2000,'$9G999') from dual;
select to_char(20000,'$9,999') from dual; ---# 
select to_char(200.45,'999.99') from dual; 
select to_char(200.45,'999D99') from dual;
select to_char(200.45,'999.9') from dual; --round
select to_char(2000,'099999999') from dual; 
 

--2)to_number:

select to_number('1,000','9,999') from dual;



-------------------------------------------------------------
--General functions:
 
--1)nvl
select first_name ,commission_pct,nvl(commission_pct,0)
from employees;

select first_name,job_id,nvl(job_id,'No job')
from employees;

select first_name,hire_date,nvl(hire_date,'01-Jan-08')
from employees; --01-01-08

select first_name ,commission_pct,nvl(to_char(commission_pct),'No comm')
from employees;

--2)nvl2:

select first_name ,commission_pct,nvl2(commission_pct,commission_pct,0)
from employees; 

select first_name ,commission_pct,nvl2(commission_pct,'Salary & comm','Only Salary') "Income"
from employees; 

--3)nullif:
select first_name,length(first_name),last_name,length(last_name),
nullif(length(first_name),length(last_name)) result
from employees;

--4)coalesce:
select employee_id,first_name,commission_pct,manager_id,salary,
coalesce(commission_pct,manager_id,salary) return
from employees;
