--- VIEW

CREATE VIEW �ְ�޿�_���_�� AS
SELECT DEPARTMENT_ID AS �μ�ID, MAX(SALARY) AS �ְ�޿�
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

DROP VIEW �ְ�޿�_���_��;


SELECT * 
FROM �ְ�޿�_���_�� M, DEPARTMENTS D
WHERE M.�μ�ID = D.DEPARTMENT_ID;

-- ������ -------------------------
-- �ַ� PK�� �÷� � ������ ���� ���� �� ��� EX: ����ID
-- SEQUENCE
CREATE TABLE ������_�׽�Ʈ(
    TEST_SEQUENCE NUMBER
);

DROP TABLE ������_�׽�Ʈ;
DROP SEQUENCE S_NUM_LINE;

CREATE SEQUENCE S_NUM_LINE 
INCREMENT BY 100
START WITH 1;


INSERT INTO ������_�׽�Ʈ VALUES (S_NUM_LINE.NEXTVAL);

SELECT *
FROM ������_�׽�Ʈ;


------------------------------------------------------
SELECT *
FROM (
    SELECT ROWNUM AS RN, EMPLOYEE_ID
    FROM EMPLOYEES
    )
WHERE RN = 5;

//�޿��� ���� ���� ���� 5�� ���� ���
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