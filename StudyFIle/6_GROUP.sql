-- GROUP BY, HAVING, ORDER BY

-- ���� ����ȭ �ϴµ� ���°� GROUP

-- �� �μ��� ID�� �׷��� �Ͽ� ���
SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- ���� �� �μ��� �޿������ ���ϸ�
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID; 

-- ���� �� �μ��� �޿������ �Ҽ��� ����
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--  �Ҽ����� ���� ����
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ���⿡ ��������?
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

-- ��������? 
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2 DESC; 

-- �׷�ȭ�� �ϰ� �Ǹ� �����Լ��� ������.
-- �����Լ����� SUM, COUNT, MIN, MAV, AVG ���� ������ �Լ�

-- ������ �Լ� : �Լ��� 1���� ���� �Է��ؼ�, 1���� ������� ����Ѵ�.
--          EX : UPPER <- �빮�ڷ� ����°�
-- ������ �Լ� : �Լ��� �������� ���� �Է��ؼ�, 1���� ����� ����
--          EX : SUM, COUNT, MIN, MAV, AVG

-- �μ��� �޿��� �ִ�
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

-- �μ��� �޿��� �ּڰ�
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY 2, 1;

-- �μ��� ������ ��, �޿��� ����, �޿��� ���, �ִ�, �ּڰ�
SELECT DEPARTMENT_ID, 
    COUNT(DEPARTMENT_ID) AS "������",
    SUM(SALARY) AS "�޿��� �� ��",
    ROUND(AVG(SALARY)) AS "�޿����",
    MAX(SALARY) AS "�޿��� �ִ�",
    MIN(SALARY) AS "�޿��� �ּڰ�"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- COUNT�� ��� *�� �ϸ� NULL�� ī��Ʈ�Ѵ�.
SELECT DEPARTMENT_ID, 
    COUNT(DEPARTMENT_ID),
    COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- ����Ǯ�� ----------------------------
-- ����ǥ ���̺��� �л����� ������� ����ϱ�. ��, �ݿø��� ���ؼ� �Ҽ��� 1�ڸ������� ���
SELECT �л�ID, ROUND(AVG(����), 1)
FROM ����ǥ
GROUP BY �л�ID;

-- ���񺰷� �ְ� ������ ���� ������ ���
SELECT ����, 
    MAX(����) AS "�ְ�", 
    MIN(����) AS "����"
FROM ����ǥ
GROUP BY ����;

-- ����������  ���̺��� �� ���� �� ���� �ִ��� ���
SELECT ��, COUNT(�л�ID)
FROM ����������
GROUP BY ��;

-- ����ǥ ���̺��� �л����� JAVA�� DATABASE ������ ����� ���. ��, 1�� �ڸ����� �ݿø�
SELECT �л�ID, ROUND(AVG(����)) AS "���"
FROM ����ǥ
WHERE ���� IN ('JAVA', 'DATABASE')
GROUP BY �л�ID
ORDER BY �л�ID;



-- 6.2 HAVING ---------------
-- HAVING ?? : �׳� GROUPȭ �Ǿ��ִ� �Ϳ��� WHERE�� ������ �ϴ� ����,

SELECT �л�ID, ROUND(AVG(����))
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) > 80;


-- ���� ���̺��� �μ��� �ְ� ������ 100,000�̻��� �μ��� ���
SELECT DEPARTMENT_ID AS �μ�ID, ROUND(AVG(SALARY * 12)) AS ��տ���
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY * 12) > 100000; 

-- ����ǥ ���̺��� �л� �� ��ռ����� ����ϵ�, NULL�� �ƴ� ���� ���. 
SELECT �л�ID, ROUND(AVG(����)) AS "���"
FROM ����ǥ 
GROUP BY �л�ID
HAVING ROUND(AVG(����)) IS NOT NULL
ORDER BY �л�ID;

