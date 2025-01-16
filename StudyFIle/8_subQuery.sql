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


-- ANY, SOME-----------------------------------
-- ANY, SOME�� ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRHE
-- ANY : TRUE�� �Ǵ��ϵ�, �꺸�� ������ OR �ֺ��� ū�Ÿ� ��ȯ�Ѵ�.
-- ANT, SOME�� ��쵵 =�� ���� IN�� ���� ���
-- IN�����ڿ� �ٸ��� ��� ���赵 �ľ��Ѵ�.

-- �μ��� �ְ� �޿��� �޴� ������ ���� �޿��� �޴� ���� ���
-- '='SOME�� ���� IN�� ���� ����� ����.
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY = SOME(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
    
-- �μ��� �ְ� �޿��� �޴� �������� ���� �޿��� �޴� ���� ���
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY > SOME(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
    
-- �μ��� �ְ� �޿��� �޴� �������� ���� �޿��� �޴� ���� ���
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
-- ALL�� ���� ���� TRUE�� ��쿡�� TRHE��
-- �μ��� �ְ� �޿��� �޴� �������� ���� �޿��� �޴� ���� ���
SELECT 
    SALARY,
    LAST_NAME || ' ' || FIRST_NAME AS NAME
FROM EMPLOYEES
WHERE SALARY >= ALL(
    SELECT MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    );
    
-- �μ��� �ְ� ������ �޴� ������ ����Ѵ�.
SELECT 
    FIRST_NAME || ' ' || LAST_NAME AS NAME,
    SALARY AS �ְ�޿�,
    DEPARTMENT_ID AS �μ�
FROM EMPLOYEES
WHERE (SALARY, DEPARTMENT_ID) IN (
    SELECT MAX(SALARY), DEPARTMENT_ID
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
ORDER BY DEPARTMENT_ID;


-- SELECT�� ���� ��������
SELECT 
    E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME,
    E.DEPARTMENT_ID,
    (SELECT DEPARTMENT_NAME
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = E.DEPARTMENT_ID )
FROM EMPLOYEES E;