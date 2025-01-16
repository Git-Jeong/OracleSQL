--subQuery란? : Query 속의 Query.

--이름이 Shelli 인 사람보다 SALARY가 높은 사람을 찾기
SELECT 
    E.LAST_NAME || ' ' || E.FIRST_NAME AS NAME
FROM EMPLOYEES E
WHERE E.SALARY < (
    SELECT C.SALARY
    FROM EMPLOYEES C
    WHERE C.FIRST_NAME = 'Shelli' 
); 

SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    HIRE_DATE AS 입사일
FROM EMPLOYEES
WHERE HIRE_DATE < (
    SELECT HIRE_DATE
    FROM EMPLOYEES
    WHERE FIRST_NAME = 'Nancy'
    );


------------------------------
-- 다중형 서브쿼리 in
-- 우선 in의 경우는 '='과, 'or'의 합으로... 실습 해보기
-- 하나라도 일치하면 TRUE
-- IN은 동등성'='만 평가함, 

-- 부서별 최고 급여를 받는 직원과 같은 급여를 받는 직원 출력
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY IN(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );


-- ANY, SOME-----------------------------------
-- ANY, SOME도 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRHE
-- ANY : TRUE를 판단하되, 얘보다 작은거 OR 애보다 큰거를 반환한다.
-- ANT, SOME의 경우도 =를 쓰면 IN과 같은 기능
-- IN연산자와 다르게 대소 관계도 파악한다.

-- 부서별 최고 급여를 받는 직원과 같은 급여를 받는 직원 출력
-- '='SOME을 통해 IN과 같은 기능을 만들어냄.
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY = SOME(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
    
-- 부서별 최고 급여를 받는 직원보다 높은 급여를 받는 직원 출력
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY > SOME(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
    
-- 부서별 최고 급여를 받는 직원보다 낮은 급여를 받는 직원 출력
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY < SOME(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );

-- ALL ---------------------------------
-- ALL의 경우는 전부 TRUE일 경우에만 TRHE임
-- 부서별 최고 급여를 받는 직원보다 낮은 급여를 받는 직원 출력
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY >= ALL(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
    
-- 부서별 최고 연봉을 받는 직원을 출력한다.
SELECT 
    FIRST_NAME || ' ' || LAST_NAME AS NAME,
    SALARY AS 최고급여,
    DEPARTMENT_ID AS 부서
FROM EMPLOYEES
WHERE (SALARY, DEPARTMENT_ID) IN (
    SELECT MAX(SALARY), DEPARTMENT_ID
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
ORDER BY DEPARTMENT_ID;


-- SELECT문 속의 서브쿼리
SELECT 
    E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME,
    E.DEPARTMENT_ID,
    (SELECT DEPARTMENT_NAME
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = E.DEPARTMENT_ID )
FROM EMPLOYEES E;