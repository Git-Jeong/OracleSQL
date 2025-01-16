--subQuery��? : Query ���� Query.

--�̸��� Shelli �� ������� SALARY�� ���� ����� ã��
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
    HIRE_DATE AS �Ի���
FROM EMPLOYEES
WHERE HIRE_DATE < (
    SELECT HIRE_DATE
    FROM EMPLOYEES
    WHERE FIRST_NAME = 'Nancy'
    );


------------------------------
-- ������ �������� in
-- �켱 in�� ���� '='��, 'or'�� ������... �ǽ� �غ���
-- �ϳ��� ��ġ�ϸ� TRUE
-- IN�� ���'='�� ����, 

-- �μ��� �ְ� �޿��� �޴� ������ ���� �޿��� �޴� ���� ���
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY IN(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
