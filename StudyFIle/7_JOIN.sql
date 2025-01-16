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