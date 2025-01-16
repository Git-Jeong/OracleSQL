-- 1�� ����
select salary * 12, last_name
from employees
where salary * 12 >= 120000;

-- 2�� ����
select last_name, department_id, employee_id
from employees
where employee_id = 176;

-- 3�� ����
select last_name, salary * 12 as ����
from employees
where salary * 12 between 150000 and 200000;

-- 4�� ����
select last_name, employee_id, hire_date
from employees
where hire_date between '030101' and '050530'
order by hire_date desc;

-- 5�� ����
select last_name, department_id
from employees
where department_id in (20, 50)
order by last_name, department_id;

-- 6�� ���� : 
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME , SALARY * 12 AS ����
FROM EMPLOYEES
WHERE SALARY * 12 BETWEEN 20000 AND 250000;

-- 7�� 2006�⿡ ���� ����� �̸��� ������� ��ȸ�Ѵ�
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '2006%';

-- 8�� ���� :  �Ŵ���ID�� ���� ������� �̸� �� ������ ���
SELECT LAST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 9�� ���� : �Ŵ����� �ִ� ����� �̸�, ����, �Ŵ�����ȣ
SELECT LAST_NAME, MANAGER_ID, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL ;

-- 10�� ���� : 
SELECT LAST_NAME, COMMISSION_PCT, SALARY * 12 AS "ANNSAL"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC;

-- 11�� ���� O
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

-- 12�� ���� :
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%e%' AND LAST_NAME LIKE '%a%' ;

-- 13�� ���� :  

-- 14�� ���� :  

-- 15�� ���� :  

-- 16�� ���� : 

-- 17�� ���� : 