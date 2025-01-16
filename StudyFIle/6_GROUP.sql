-- GROUP BY, HAVING, ORDER BY

-- 행을 단일화 하는데 쓰는게 GROUP

-- 각 부서의 ID를 그룹하 하여 출력
SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 이제 각 부서별 급여평균을 구하면
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID; 

-- 이제 각 부서별 급여평균의 소숫점 정리
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--  소숫점을 전부 정리
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 여기에 오름차순?
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

-- 내림차순? 
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2 DESC; 

-- 그룹화를 하게 되면 집계함수만 가능함.
-- 집계함수에는 SUM, COUNT, MIN, MAV, AVG 등의 단일행 함수

-- 단일항 함수 : 함수에 1개의 행을 입력해서, 1개의 결과값을 출력한다.
--          EX : UPPER <- 대문자로 만드는거
-- 다중항 함수 : 함수에 여러개의 행을 입력해서, 1개의 결과를 도출
--          EX : SUM, COUNT, MIN, MAV, AVG

-- 부서별 급여의 최댓값
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

-- 부서별 급여의 최솟값
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY 2, 1;

-- 부서별 직원의 수, 급여의 총합, 급여의 평균, 최댓값, 최솟값
SELECT DEPARTMENT_ID, 
    COUNT(DEPARTMENT_ID) AS "직원수",
    SUM(SALARY) AS "급여의 총 합",
    ROUND(AVG(SALARY)) AS "급여평균",
    MAX(SALARY) AS "급여의 최댓값",
    MIN(SALARY) AS "급여의 최솟값"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- COUNT의 경우 *로 하면 NULL도 카운트한다.
SELECT DEPARTMENT_ID, 
    COUNT(DEPARTMENT_ID),
    COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- 문제풀이 ----------------------------
-- 성적표 테이블에서 학생별로 평균점수 출력하기. 단, 반올림을 통해서 소수점 1자리까지만 출력
SELECT 학생ID, ROUND(AVG(성적), 1)
FROM 성적표
GROUP BY 학생ID;

-- 과목별로 최고 성적과 최저 성적을 출력
SELECT 과목, 
    MAX(성적) AS "최고", 
    MIN(성적) AS "최저"
FROM 성적표
GROUP BY 과목;

-- 수강생정보  테이블에서 각 팀에 몇 명이 있는지 출력
SELECT 팀, COUNT(학생ID)
FROM 교육생정보
GROUP BY 팀;

-- 성적표 테이블에서 학생별로 JAVA와 DATABASE 성적의 평균을 출력. 단, 1의 자리에서 반올림
SELECT 학생ID, ROUND(AVG(성적)) AS "평균"
FROM 성적표
WHERE 과목 IN ('JAVA', 'DATABASE')
GROUP BY 학생ID
ORDER BY 학생ID;



-- 6.2 HAVING ---------------
-- HAVING ?? : 그냥 GROUP화 되어있는 것에서 WHERE의 역할을 하는 것임,

SELECT 학생ID, ROUND(AVG(성적))
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) > 80;


-- 직원 테이블에서 부서별 최고 연봉이 100,000이상인 부서만 출력
SELECT DEPARTMENT_ID AS 부서ID, ROUND(AVG(SALARY * 12)) AS 평균연봉
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY * 12) > 100000; 

-- 성적표 테이블에서 학생 별 평균성적을 출력하되, NULL이 아닌 값만 출력. 
SELECT 학생ID, ROUND(AVG(성적)) AS "평균"
FROM 성적표 
GROUP BY 학생ID
HAVING ROUND(AVG(성적)) IS NOT NULL
ORDER BY 학생ID;

