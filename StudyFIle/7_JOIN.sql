-- JION -----------------------------

-- 직원 ID가 100번인 직원의 부서이름을 출력
-- 직원_ID는 DEPARTMENTS에 있고
-- 부서이름은 DEPARTMENTS에 있음
SELECT D.DEPARTMENT_NAME, 
    D.DEPARTMENT_ID, 
    E.LAST_NAME || ' ' || E.FIRST_NAME AS NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID = 100;

-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 결합하여 각 직원의 ID, 이름, 소속 부서 이름을 조회하는 쿼리
/**/
SELECT E.EMPLOYEE_ID, 
	E.FIRST_NAME, 
	D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 결합하여 각 직원의 ID, 이름, 소속 부서 이름을 조회하는 쿼리
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 INNER JOIN하여 각 직원의 ID, 이름, 소속 부서 이름을 조회하는 쿼리
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 LEFT JOIN하여 각 직원의 ID, 이름, 소속 부서 이름을 조회하는 쿼리
SELECT *
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 RIGHT JOIN하여 각 직원의 ID, 이름, 소속 부서 이름을 조회하는 쿼리
-- 부서에 소속된 직원이 없더라도 모든 부서 정보를 결과에 포함
SELECT *
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES 테이블과 DEPARTMENTS 테이블을 FULL JOIN하여 각 직원의 ID, 이름, 소속 부서 이름을 조회하는 쿼리
-- 직원이 없는 부서와 부서에 소속되지 않은 직원도 결과에 포함
SELECT *
FROM EMPLOYEES E
FULL JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES 테이블을 두 번 사용하여 각 직원과 그 직원의 상사의 ID를 조회하는 쿼리
-- E1은 직원, E2는 상사로 사용하여 직원과 그 상사의 관계를 출력
SELECT *
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID;

-- EMPLOYEES 테이블과 DEPARTMENTS 테이블의 모든 조합을 조회하는 쿼리 
SELECT *
FROM EMPLOYEES E
CROSS JOIN DEPARTMENTS D;

-----------------------
--JOIN을 하게 되면 어디서 불러온 이름인지 명시할 것
SELECT D.DEPARTMENT_ID
FROM DEPARTMENTS D, EMPLOYEES E;
    
    
-- 7.2----------------------------------------
-- CROSS JOIN : 모든 경우의 수가 나오는 것
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E;

-- 7.3 INNER JOIN
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 모든 DB에서 사용 가능한 방법으로 
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 직원 테이블과 직업 테이블을 INNER JOIN을 사용해서 직원ID, 직업ID, 직업TITLE 출력
-- ORACLE문법 
SELECT E.EMPLOYEE_ID, J.JOB_ID, J.JOB_TITLE AS 타이틀
FROM JOBS J, EMPLOYEES E
WHERE J.JOB_ID = E.JOB_ID;

-- 직원 테이블과 직업 테이블을 INNER JOIN을 사용해서 직원ID, 직업ID, 직업TITLE 출력
-- ANSI 문법
SELECT E.EMPLOYEE_ID, J.JOB_ID, J.JOB_TITLE AS 타이틀
FROM JOBS J INNER JOIN EMPLOYEES E
ON   J.JOB_ID = E.JOB_ID;

-- 각 부서의 매니저 직원들을 출력(부서 이름, 매니저ID, 직원 이름)
SELECT 
    D.DEPARTMENT_NAME, 
    D.MANAGER_ID,   
    E.FIRST_NAME || ' ' || E.LAST_NAME AS "매니저 이름"
FROM DEPARTMENTS D
    INNER JOIN 
    EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;


-- OUTER JOIN
-- INNOR JOIN에서 NULL값도 포함하고 싶을 떄 쓰는데 아우터 조인
-- LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 NULL값을 반환
-- RIGHT OUTER JOIN : 오른쪽 테이블을 기준으로 NULL값을 반환
-- FULL OUTER JOIN : 양쪽을 전부 NULL 반환

-- LEFT OUTER JOIN
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1;

-- RIGHT OUTER JOIN
-- 부서는 있는데 직원은 없는 경우도 나옴
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1;

-- FULL OUTER JOIN 
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1;

-- ORACLE식 문법
-- INNER JOIN은 ,
-- LEFT OUTER JOIN의 오른쪽에 (+) 기호
-- RIGHT OUTER JOIN의 경우 왼쪽에 (+) 기호
-- FULL OUTER JOIN의 경우 UNION 연산자를 활용
--      UNION 연산자 : 합집합 (중복X)
--      UNION ALL 연산자 " 합집합 (중복O)


-- LEFY OUTER JOIN
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+)
ORDER BY 1;

-- RIGHT OUTER JOIN
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID 
ORDER BY 1;

--FULL OUTER JOIN 
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+)
UNION
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID 
ORDER BY 1;

-- 각 부서의 매니저 직원들을 출력(부서 이름, 매니저ID, 직원 이름)
-- LEFT OUTER JOIN으로 인해 DEPARTMENTS의 부서는 있어도 매니저가 없는 경우는 매니저가 NULL로 반환
-- 27라인 (부서 수)
SELECT 
    D.DEPARTMENT_NAME AS 부셔명, 
    D.MANAGER_ID AS 매니저ID,   
    E.FIRST_NAME || ' ' || E.LAST_NAME AS "매니저 이름"
FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;

-- 각 부서의 매니저 직원들을 출력(부서 이름, 매니저ID, 직원 이름)
-- RIGHT OUTER JOIN으로 인해 EMPLOYEE_ID는 있어도, 담당하는 부서가 없는경우 NULL로 반환
-- 108라인(직원 수)
SELECT 
    D.DEPARTMENT_NAME AS 부셔명, 
    D.MANAGER_ID AS 매니저ID,   
    E.FIRST_NAME || ' ' || E.LAST_NAME AS "매니저 이름"
FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;

---------------------------------------------------------------------------------