select *
from employees
where department_id=90;

select *
from employees
where last_name='Whalen';

select last_name
from employees
where hire_date='17/02/04';  --hire_date='17-FEB-04';
--------------------------------
select last_name ,salary
from employees
where salary<=3000;

select last_name ,salary
from employees
where salary between 2500 and 3500;

select last_name ,salary
from employees
where salary between 3500 and 2500; 


select last_name ,salary
from employees
where last_name between 'K' and 'S'; 


select last_name ,salary
from employees
where last_name between 'King' and 'Smith'; 
select last_name,manager_id
from employees
where manager_id in(100,201,101);
 


select last_name 
from employees
where last_name in ('Hartstein','Vargas');



select first_name 
from employees
where first_name like 'S%';

select first_name 
from employees
where first_name like '%s';


select first_name 
from employees
where first_name like '%he%';  

select first_name 
from employees
where first_name like '_o%';

select first_name 
from employees
where first_name like '__n%';



select job_id 
from employees
where job_id like 'SA\_%' escape '\';

select last_name ,manager_id 
from employees
where manager_id is null;

select last_name ,manager_id 
from employees
where manager_id is not null;

--------------------------------------
--logical operators:
select last_name ,salary,job_id
from employees
where salary>=10000
and job_id like '%MAN%';

select last_name ,salary,job_id
from employees
where salary>=10000
or job_id like '%MAN%';

select last_name ,job_id
from employees
where job_id not in ('IT_PROG','SA_REP');



--------------------------------------
Rules of precedence:

select last_name ,job_id,salary
from employees
where job_id='SA_REP'
or job_id='AD_PRES' 
and salary >15000;


select last_name ,job_id,salary
from employees
where job_id='SA_REP'
or (job_id='AD_PRES' 
and salary >15000);



select last_name ,job_id,salary
from employees
where (job_id='SA_REP'
or job_id='AD_PRES' )
and salary >15000;

-----------------------------------------
Order by:

select last_name ,job_id,department_id,hire_date
from employees
order by hire_date;

select last_name ,job_id,department_id,hire_date
from employees
order by hire_date asc;

select last_name ,job_id,department_id,hire_date
from employees
order by hire_date desc;

select employee_id,last_name,salary ,salary*12 annual 
from employees
order by annual;


select last_name,department_id,employee_id
where department_id=90
order by employee_id;



select last_name,department_id,employee_id,salary 
from employees
order by 3;


select last_name,department_id,employee_id,salary 
from employees
order by department_id,salary;

select last_name,department_id,employee_id,salary 
from employees
order by department_id,salary desc;



 







