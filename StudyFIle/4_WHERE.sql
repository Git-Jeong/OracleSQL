
-------------------------------------------------------------------------------

-- 4. WHEHE

--직업이 IT_PROG인 사람의 모든 정보를 나열
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--직원 코드가 105인 사람의 모든 정보를 나열
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 105;


-- 4.2 산술연산자 ---------------------------------------
SELECT SALARY, SALARY+2 AS "2를 더한 값" 
FROM EMPLOYEES;

SELECT SALARY / 4
FROM EMPLOYEES;

SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS 풀네임, SALARY AS 월급
FROM EMPLOYEES
WHERE SALARY <= 5000
ORDER BY SALARY;
