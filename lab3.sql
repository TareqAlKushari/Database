select  *
from    employees;

select  last_name, employee_id
from    employees;

-- using arithmetic operatars:-
select  last_name, salary, 12*salary+100
from    employees;

-- Defining a null value [ unavailable, unassigned, unknown ] :- 
  -- Not zero & Not space 
select  job_id, commission_pct
from    employees;

-- Null values in arithmetic expression :-
  -- null value + value = null
  -- null value - value = null
  -- null value * value = null
  -- null value / value = null
select  job_id, 12*salary*commission_pct 
from    employees;

-- Column Aliases :-
select  last_name 
        as  name, 
        commission_pct comm 
from    employees;

select  last_name "Name", salary*12 "Annual Salary" 
from    employees;

-- Concatenation Operator
select  last_name||job_id 
        as  "Employees" 
from    employees;

select  first_name||last_name "Fullname" 
from    employees;

-- Literal Character Strings
select  last_name||' is a '||job_id 
        as "Employee Details" 
from    employees;   

-- Duplicate Rows
select  department_id
from    employees;

select  distinct department_id
from    employees;

-- Describe Command:-
describe employees;
