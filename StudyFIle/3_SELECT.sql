-- sql에서 대소문자 구문하지 않
-- 다만, 이름, 문자열은 대소문자를 구분
-- 띄어쓰기나, 줄바꿈을 해도 된다. 
-- 다른 언어와 같이 문장의 끝은 ';'로 처리

-- 전체 컬럼 SELECT 해보기

SELECT *    FROM EMPLOYEES;   --107행

SELECT *    FROM DEPARTMENTS; --27행 

SELECT *    FROM JOBS; --19행

SELECT JOB_ID   FROM JOBS;      --JOBS에서 JOB_ID값만 가지고 오는 것

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES;  --직원 테이블의 직원ID, 이름, 입사일 출력 

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM DEPARTMENTS; --부서 테이블에서 부서ID, 부서명, 근무지ID 출력

-- 중복을 제거하고 출력하는 방법
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;   -- 중복을 뺐더니 12개인데, 이중 하나는 NULL값을 가지고 있다.

--중복 제거시 차이를 보기
SELECT  JOB_ID, DEPARTMENT_ID   FROM EMPLOYEES; --원래는 107개인데, 

--중복 제거시 차이를 보기
SELECT DISTINCT JOB_ID, DEPARTMENT_ID   FROM EMPLOYEES; --20개로 줄어들었다.

-- 직원 테이블에서 입사일 출력 후 행의 개수 확인 : 107개
SELECT HIRE_DATE    FROM EMPLOYEES; 
    
-- 중복을 제거한 후 98개의 글자가 나옴
SELECT DISTINCT HIRE_DATE   FROM EMPLOYEES; 

 
-------------------------------------------------------------------------------


-- 3 - 4 별칭을 사용해 보기 
-- as를 통해 별칭을 달아보기
SELECT HIRE_DATE as "중복이 제거된 입사일"  FROM EMPLOYEES;
SELECT SALARY 급여, SALARY * 12 연봉    FROM EMPLOYEES;
SELECT SALARY "급 여"  FROM EMPLOYEES;
SELECT SALARY "급여"  FROM EMPLOYEES;
SELECT SALARY AS 급여  FROM EMPLOYEES;
SELECT SALARY "SELECT" FROM EMPLOYEES; 

--실습 ㅣ 직원 데이블에서 입사일, 입사일 다음날ㅇ르 구하려 출력
SELECT HIRE_DATE 입사일, HIRE_DATE+1 입사일_다음날   FROM EMPLOYEES;
SELECT HIRE_DATE AS 입사일, HIRE_DATE+1 AS 입사일_다음날   FROM EMPLOYEES;
SELECT HIRE_DATE AS "입사일", HIRE_DATE+1 AS "입사일_다음날"   FROM EMPLOYEES;
SELECT HIRE_DATE "입사일", HIRE_DATE+1 "입사일_다음날"  FROM EMPLOYEES; 
SELECT HIRE_DATE AS "ZIP E GA GO SHIP DA"
FROM EMPLOYEES;

-------------------------------------------------------------------------------

// 3 - 5 NULL 
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (207, '수현', '박', 'g@mail', SYSDATE, 'IT_PROG');

// 실습 : 직원 테이블에서 직원의 아이디, 급여, 연봉을 출력하기
SELECT EMPLOYEE_ID, SALARY, SALARY * 12 AS "AnnSal"
FROM EMPLOYEES; 
// SALARY가 없던 사람(EX : 내가 삽입한 박수현)의 경우 원래 NULL값이라, 연산 자체가 불가능함, 고로 뭘 곱하든 NULL

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = '박' OR FIRST_NAME = '수현';


------------------------------------------------------------------------ 