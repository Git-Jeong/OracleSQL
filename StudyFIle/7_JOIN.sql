-- JION -----------------------------

-- ���� ID�� 100���� ������ �μ��̸��� ���
-- ����_ID�� DEPARTMENTS�� �ְ�
-- �μ��̸��� DEPARTMENTS�� ����
SELECT D.DEPARTMENT_NAME, 
    D.DEPARTMENT_ID, 
    E.LAST_NAME || ' ' || E.FIRST_NAME AS NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID = 100;

-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �����Ͽ� �� ������ ID, �̸�, �Ҽ� �μ� �̸��� ��ȸ�ϴ� ����
/**/
SELECT E.EMPLOYEE_ID, 
	E.FIRST_NAME, 
	D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �����Ͽ� �� ������ ID, �̸�, �Ҽ� �μ� �̸��� ��ȸ�ϴ� ����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� INNER JOIN�Ͽ� �� ������ ID, �̸�, �Ҽ� �μ� �̸��� ��ȸ�ϴ� ����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� LEFT JOIN�Ͽ� �� ������ ID, �̸�, �Ҽ� �μ� �̸��� ��ȸ�ϴ� ����
SELECT *
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� RIGHT JOIN�Ͽ� �� ������ ID, �̸�, �Ҽ� �μ� �̸��� ��ȸ�ϴ� ����
-- �μ��� �Ҽӵ� ������ ������ ��� �μ� ������ ����� ����
SELECT *
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� FULL JOIN�Ͽ� �� ������ ID, �̸�, �Ҽ� �μ� �̸��� ��ȸ�ϴ� ����
-- ������ ���� �μ��� �μ��� �Ҽӵ��� ���� ������ ����� ����
SELECT *
FROM EMPLOYEES E
FULL JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- EMPLOYEES ���̺��� �� �� ����Ͽ� �� ������ �� ������ ����� ID�� ��ȸ�ϴ� ����
-- E1�� ����, E2�� ���� ����Ͽ� ������ �� ����� ���踦 ���
SELECT *
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID;

-- EMPLOYEES ���̺�� DEPARTMENTS ���̺��� ��� ������ ��ȸ�ϴ� ���� 
SELECT *
FROM EMPLOYEES E
CROSS JOIN DEPARTMENTS D;

-----------------------
--JOIN�� �ϰ� �Ǹ� ��� �ҷ��� �̸����� ����� ��
SELECT D.DEPARTMENT_ID
FROM DEPARTMENTS D, EMPLOYEES E;
    
    
-- 7.2----------------------------------------
-- CROSS JOIN : ��� ����� ���� ������ ��
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E;

-- 7.3 INNER JOIN
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- ��� DB���� ��� ������ ������� 
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- ���� ���̺�� ���� ���̺��� INNER JOIN�� ����ؼ� ����ID, ����ID, ����TITLE ���
-- ORACLE���� 
SELECT E.EMPLOYEE_ID, J.JOB_ID, J.JOB_TITLE AS Ÿ��Ʋ
FROM JOBS J, EMPLOYEES E
WHERE J.JOB_ID = E.JOB_ID;

-- ���� ���̺�� ���� ���̺��� INNER JOIN�� ����ؼ� ����ID, ����ID, ����TITLE ���
-- ANSI ����
SELECT E.EMPLOYEE_ID, J.JOB_ID, J.JOB_TITLE AS Ÿ��Ʋ
FROM JOBS J INNER JOIN EMPLOYEES E
ON   J.JOB_ID = E.JOB_ID;

-- �� �μ��� �Ŵ��� �������� ���(�μ� �̸�, �Ŵ���ID, ���� �̸�)
SELECT 
    D.DEPARTMENT_NAME, 
    D.MANAGER_ID,   
    E.FIRST_NAME || ' ' || E.LAST_NAME AS "�Ŵ��� �̸�"
FROM DEPARTMENTS D
    INNER JOIN 
    EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;


-- OUTER JOIN
-- INNOR JOIN���� NULL���� �����ϰ� ���� �� ���µ� �ƿ��� ����
-- LEFT OUTER JOIN : ���� ���̺��� �������� NULL���� ��ȯ
-- RIGHT OUTER JOIN : ������ ���̺��� �������� NULL���� ��ȯ
-- FULL OUTER JOIN : ������ ���� NULL ��ȯ

-- LEFT OUTER JOIN
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1;

-- RIGHT OUTER JOIN
-- �μ��� �ִµ� ������ ���� ��쵵 ����
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1;

-- FULL OUTER JOIN 
SELECT e.employee_id, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1;

-- ORACLE�� ����
-- INNER JOIN�� ,
-- LEFT OUTER JOIN�� �����ʿ� (+) ��ȣ
-- RIGHT OUTER JOIN�� ��� ���ʿ� (+) ��ȣ
-- FULL OUTER JOIN�� ��� UNION �����ڸ� Ȱ��
--      UNION ������ : ������ (�ߺ�X)
--      UNION ALL ������ " ������ (�ߺ�O)


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

-- �� �μ��� �Ŵ��� �������� ���(�μ� �̸�, �Ŵ���ID, ���� �̸�)
-- LEFT OUTER JOIN���� ���� DEPARTMENTS�� �μ��� �־ �Ŵ����� ���� ���� �Ŵ����� NULL�� ��ȯ
-- 27���� (�μ� ��)
SELECT 
    D.DEPARTMENT_NAME AS �μŸ�, 
    D.MANAGER_ID AS �Ŵ���ID,   
    E.FIRST_NAME || ' ' || E.LAST_NAME AS "�Ŵ��� �̸�"
FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;

-- �� �μ��� �Ŵ��� �������� ���(�μ� �̸�, �Ŵ���ID, ���� �̸�)
-- RIGHT OUTER JOIN���� ���� EMPLOYEE_ID�� �־, ����ϴ� �μ��� ���°�� NULL�� ��ȯ
-- 108����(���� ��)
SELECT 
    D.DEPARTMENT_NAME AS �μŸ�, 
    D.MANAGER_ID AS �Ŵ���ID,   
    E.FIRST_NAME || ' ' || E.LAST_NAME AS "�Ŵ��� �̸�"
FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;

---------------------------------------------------------------------------------