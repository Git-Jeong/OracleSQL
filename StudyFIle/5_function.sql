--함수
--대문자로 출력하기, 소문자로 출력하기
SELECT FIRST_NAME, 
    UPPER(FIRST_NAME) AS 대문자, 
    EMAIL,
    LOWER(EMAIL) AS 이메일
FROM EMPLOYEES ;

--길이 측정
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES;

-- 내림차순
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;

-- 문자열을 추출하는 함수
-- SUBSTR(데이터, 시작위치 )    
SELECT JOB_ID, SUBSTR(JOB_ID, 4)
FROM EMPLOYEES;

-- SUBSTR(데이터, 시작위치 , 길이)   
SELECT JOB_ID, SUBSTR(JOB_ID, 0, 2)
FROM EMPLOYEES;

-- 입사년, 월, 일
SELECT 
    SUBSTR(HIRE_DATE, 1, 2) AS 년,
    SUBSTR(HIRE_DATE, 4, 2) AS 월,
    SUBSTR(HIRE_DATE, 7) AS 일
FROM EMPLOYEES;

-- 문자를 대체하는 함수
-- REPLACE(데이터, 찾을문자, 대체할 문자)
SELECT HIRE_DATE, REPLACE(HIRE_DATE, '/', '-') AS 별표
FROM EMPLOYEES;

-- REPALCE로 제거하기
SELECT HIRE_DATE, REPLACE(HIRE_DATE, '/', '') AS 별표
FROM EMPLOYEES;

-- CONCAT 문자열 합치기
-- CONCAT(합칠거1 + 합칠거2)
SELECT CONCAT('입사일은', HIRE_DATE) AS "입사일 합치기"
FROM EMPLOYEES;

--여러번 합치기
SELECT CONCAT('입사일은', CONCAT(HIRE_DATE, '입니다')) AS "입사일 합치기"
FROM EMPLOYEES;

-- ||, $$
SELECT '입사일은' || HIRE_DATE || '입니다.'
FROM EMPLOYEES;

-------------------------------------------------------
-- 숫자함수 --

-- DAUL 테이블 : 최고 권한 관리자인 SYS소유의 테이블로, 
--      임시 연산이나 함수의 결과값을 확인하는 용도로 사용되는 더미 데이터

--MOD(x, y): x를 y로 나눈 후 나머지를 반환
SELECT MOD(15, 6) AS 나머지,
    MOD(15, 2) AS 홀수,
    MOD(4,2) AS 짝수
FROM DUAL;

-- ROUND 반올림 함수 
SELECT ROUND(15.5) AS 반올림 
FROM DUAL; -- 결과: 3

-- ROUND(3.145, 2) AS 반올림 
SELECT ROUND(3.145, 2) AS "2자리에 반올림값"
FROM DUAL; -- 결과: 3.15

-- TRUNC 버림 함수 
SELECT TRUNC(3.145, 2) AS 버림값
FROM DUAL; -- 결과: 3.14 

-- TRUNC 버림 함수 
SELECT TRUNC(3.145) AS 버림값
FROM DUAL; -- 결과: 3 


-- 날짜 함수 ------------------------------

-- STSDATE
-- 시스템 시간에 맞춰서 시간이 나옴
-- 도구 -> 환경설정 -> 데이터베이스 -> NLS - 날짜형식(YYYY-MM-DD HH24:MI:SS)으로 바꿈
SELECT SYSDATE
FROM DUAL;

-- 내일울 출력
SELECT SYSDATE+1 AS 내일
FROM DUAL;

-- 1시간 후를  출력
SELECT SYSDATE + 1/24 AS "1시간 뒤"
FROM DUAL;

-- 1분 뒤를 출력
SELECT SYSDATE + 1/24/60 AS "1분 뒤"
FROM DUAL;

-- ADD_MONTH 몇개월 이후의 날짜를 구하는 함수
SELECT ADD_MONTHS(SYSDATE, 1) AS "1개월 후"
FROM DUAL; --2025-02-15 15:40:00

--입사를 하고 나서 3개월 후에 정규직
SELECT ADD_MONTHS(HIRE_DATE, 3) AS "정규직 전환일"
FROM EMPLOYEES; --2003-09-17 00:00:00


--------------------------------------------------
-- 5.4 형(TYPE) 변환 함수

-- TO_CHAR : 문자열로 변환
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
FROM DUAL;  -- 2025-01-15 15:42:29	25/01/15/수요일

-- L : 지역 화폐, 9 : 자릿수
SELECT SALARY,
    TO_CHAR(SALARY, 'L999,999')
FROM EMPLOYEES; --24000	         ￦24,000

-- TO_NUMBER
-- 암시적 형변환 가능하다. (자동으로도 가능하다)
SELECT '1' + 1
FROM DUAL;

SELECT TO_NUMBER('1' + 1)
FROM DUAL;

--TO_DATE
SELECT TO_DATE('20250115', 'YYYYMMDD')
FROM DUAL;  -- 2025-01-15 00:00:00

SELECT '202510101' + 1
FROM DUAL;  --202510102

---------------------------------------
-- NULL은?? ---------------------------
-- NULL은 비교가 안 되므로, 여기에 넣 테스트를 해서 널인지 아닌지 파악하는 것
-- NVL(NULL검사할 데이터, NULL일때 반환값)
-- NVL2(NULL검사할 데이터, NULL이 아닐때 반환값, NULL일때 반환값)
SELECT SALARY, NVL(SALARY, 1)
FROM EMPLOYEES
WHERE FIRST_NAME = '수현';

SELECT SALARY, NVL2(SALARY, 12345, 1)
FROM EMPLOYEES
WHERE FIRST_NAME = '수현';

--DECODE 조건문의 SWUTCH문 느낌인 것.
--값이 일치하면 반환
-- DECOVE(검사할 데이터, 비교1, 일치1, 비교2, 일치3 ....  일치X)
SELECT SALARY,  DECODE(DEPARTMENT_ID, 
    100, SALARY * 2,
    90, SALARY * 1,
    80, SALARY * 10,
    SALARY * 0) AS 보너스
FROM EMPLOYEES;

-- 커미션이 NULL 일 때 0으로 대체해서 반환 -- NVL
SELECT FIRST_NAME, COMMISSION_PCT, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES;

-- 커미션이 NULL 일 때 0으로 대체해서 반환 -- NVL2
SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, COMMISSION_PCT, 0)
FROM EMPLOYEES;

-- 커미션이 NULL 일 때 0으로 대체해서 반환 -- DECODE
SELECT FIRST_NAME, COMMISSION_PCT, DECODE(COMMISSION_PCT, 
        NULL, 0, 
        COMMISSION_PCT
        )
FROM EMPLOYEES; 

-- 매니저가 있는 직원은 직원으로, 매니저가 없는 직원은 관리자로 출력 - NVL2
SELECT FIRST_NAME, MANAGER_ID, NVL2(TO_CHAR(MANAGER_ID), '직원' ,'관리자')
FROM EMPLOYEES;

-- 매니저가 있는 직원은 직원으로, 매니저가 없는 직원은 관리자로 출력 - DECODE
SELECT FIRST_NAME, MANAGER_ID, DECODE(TO_CHAR(MANAGER_ID),
    NULL, '관리자',
    '직원')    
FROM EMPLOYEES;