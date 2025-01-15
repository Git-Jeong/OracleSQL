-- 1
select salary * 12, last_name
from employees
where salary * 12 >= 120000;

-- 2
select last_name, department_id, employee_id
from employees
where employee_id = 176;

-- 3
select last_name, salary * 12 as 연봉
from employees
where salary * 12 between 150000 and 200000;

--4
select last_name, employee_id, hire_date
from employees
where hire_date between '030101' and '050530'
order by hire_date desc;

--5
select last_name, department_id
from employees
where department_id in (20, 50)
order by last_name, department_id;

--6
select last_name, department_id, salary * 12
from employees
where department_id in (20, 50) and salary * 12 between 20000 and 250000
order by last_name, department_id;


