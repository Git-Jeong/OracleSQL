--- VIEW

CREATE VIEW 최고급여_사람_뷰 AS
SELECT DEPARTMENT_ID AS 부서ID, MAX(SALARY) AS 최고급여
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

DROP VIEW 최고급여_사람_뷰;


SELECT * 
FROM 최고급여_사람_뷰 M, DEPARTMENTS D
WHERE M.부서ID = D.DEPARTMENT_ID;

-- 시퀀스 -------------------------
-- 주로 PK의 컬럼 등에 유일한 값을 만들 때 사용 EX: 직원ID
-- SEQUENCE
CREATE TABLE 시퀀스_테스트(
    TEST_SEQUENCE NUMBER
);

DROP TABLE 시퀀스_테스트;
DROP SEQUENCE S_NUM_LINE;

CREATE SEQUENCE S_NUM_LINE 
INCREMENT BY 100
START WITH 1;


INSERT INTO 시퀀스_테스트 VALUES (S_NUM_LINE.NEXTVAL);

SELECT *
FROM 시퀀스_테스트;


------------------------------------------------------
SELECT *
FROM (
    SELECT ROWNUM AS RN, EMPLOYEE_ID
    FROM EMPLOYEES
    )
WHERE RN = 5;

//급여가 제일 높은 상위 5명만 보는 방법
SELECT *
FROM (
    SELECT 
        ROWNUM AS RN, 
        LAST_NAME || ' ' || FIRST_NAME AS NAME, 
        SALARY
    FROM (
        SELECT *
        FROM EMPLOYEES
        WHERE SALARY IS NOT NULL
        ORDER BY SALARY DESC
    ) 
)
WHERE RN <= 5;

-------------------------------