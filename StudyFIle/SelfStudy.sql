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

-- 6번 문제 : 
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME , SALARY * 12 AS 연봉
FROM EMPLOYEES
WHERE SALARY * 12 BETWEEN 20000 AND 250000;

-- 7번 2006년에 고용된 사람의 이름과 고용일을 조회한다
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '2006%';

-- 8번 문제 :  매니저ID가 없는 사람들의 이름 및 업무를 출력
SELECT LAST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 9번 문제 : 매니저가 있는 사람의 이름, 업무, 매니저번호
SELECT LAST_NAME, MANAGER_ID, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL ;

-- 10번 문제 : 

-- 11번 문제 :

-- 12번 문제 :

-- 13번 문제 : 
SELECT SALARY, FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM EMPLOYEES
WHERE (SALARY BETWEEN 3000 AND 5000)
    AND
    ( JOB_ID =  'IT_PROG')
ORDER BY SALARY;

-- 14번 문제 : 
SELECT DISTINCT JOB_ID
FROM JOB_HISTORY
WHERE DEPARTMENT_ID IN (30, 90)
ORDER BY JOB_ID;

-- 15번 문제 : 

-- 16번 문제 : 

-- 17번 문제 : 