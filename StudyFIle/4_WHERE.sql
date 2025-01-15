
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
    FIRST_NAME AS 이름, SALARY AS 월급
FROM EMPLOYEES
WHERE SALARY <= 5000
ORDER BY SALARY;

SELECT FIRST_NAME AS "이름", SALARY * 12 AS "Annual"
FROM EMPLOYEES
WHERE SALARY * 12 >= 50000
ORDER BY SALARY;

-- 4.4 등가비교 연산자 : 같거나, 같지 않거나

--// 급여가 3천인 사람의 이름과 급여를 표시
SELECT FIRST_NAME AS 이름, SALARY
FROM EMPLOYEES
WHERE SALARY = 3000;

--// 급여가 1만 미만이 아닌 사람의 이름과, 급여를 출력
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE NOT SALARY < 10000;

--//직업 코드가 FI_ACCOUNT가 아닌 사람의 이름과, 직업코드를 출력
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID != 'FI_ACCOUNT ';