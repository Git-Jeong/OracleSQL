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
