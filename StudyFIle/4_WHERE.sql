
-------------------------------------------------------------------------------

-- 4. WHEHE

--������ IT_PROG�� ����� ��� ������ ����
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--���� �ڵ尡 105�� ����� ��� ������ ����
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 105;


-- 4.2 ��������� ---------------------------------------
SELECT SALARY, SALARY+2 AS "2�� ���� ��" 
FROM EMPLOYEES;

SELECT SALARY / 4
FROM EMPLOYEES;

SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS Ǯ����, SALARY AS ����
FROM EMPLOYEES
WHERE SALARY <= 5000
ORDER BY SALARY;
