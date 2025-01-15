-- sql���� ��ҹ��� �������� ��
-- �ٸ�, �̸�, ���ڿ��� ��ҹ��ڸ� ����
-- ���⳪, �ٹٲ��� �ص� �ȴ�. 
-- �ٸ� ���� ���� ������ ���� ';'�� ó��

-- ��ü �÷� SELECT �غ���

SELECT *    FROM EMPLOYEES;   --107��

SELECT *    FROM DEPARTMENTS; --27�� 

SELECT *    FROM JOBS; --19��

SELECT JOB_ID   FROM JOBS;      --JOBS���� JOB_ID���� ������ ���� ��

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES;  --���� ���̺��� ����ID, �̸�, �Ի��� ��� 

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM DEPARTMENTS; --�μ� ���̺��� �μ�ID, �μ���, �ٹ���ID ���

-- �ߺ��� �����ϰ� ����ϴ� ���
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;   -- �ߺ��� ������ 12���ε�, ���� �ϳ��� NULL���� ������ �ִ�.

--�ߺ� ���Ž� ���̸� ����
SELECT  JOB_ID, DEPARTMENT_ID   FROM EMPLOYEES; --������ 107���ε�, 

--�ߺ� ���Ž� ���̸� ����
SELECT DISTINCT JOB_ID, DEPARTMENT_ID   FROM EMPLOYEES; --20���� �پ�����.

-- ���� ���̺��� �Ի��� ��� �� ���� ���� Ȯ�� : 107��
SELECT HIRE_DATE    FROM EMPLOYEES; 
    
-- �ߺ��� ������ �� 98���� ���ڰ� ����
SELECT DISTINCT HIRE_DATE   FROM EMPLOYEES; 

 
-------------------------------------------------------------------------------


-- 3 - 4 ��Ī�� ����� ���� 
-- as�� ���� ��Ī�� �޾ƺ���
SELECT HIRE_DATE as "�ߺ��� ���ŵ� �Ի���"  FROM EMPLOYEES;
SELECT SALARY �޿�, SALARY * 12 ����    FROM EMPLOYEES;
SELECT SALARY "�� ��"  FROM EMPLOYEES;
SELECT SALARY "�޿�"  FROM EMPLOYEES;
SELECT SALARY AS �޿�  FROM EMPLOYEES;
SELECT SALARY "SELECT" FROM EMPLOYEES; 

--�ǽ� �� ���� ���̺��� �Ի���, �Ի��� ���������� ���Ϸ� ���
SELECT HIRE_DATE �Ի���, HIRE_DATE+1 �Ի���_������   FROM EMPLOYEES;
SELECT HIRE_DATE AS �Ի���, HIRE_DATE+1 AS �Ի���_������   FROM EMPLOYEES;
SELECT HIRE_DATE AS "�Ի���", HIRE_DATE+1 AS "�Ի���_������"   FROM EMPLOYEES;
SELECT HIRE_DATE "�Ի���", HIRE_DATE+1 "�Ի���_������"  FROM EMPLOYEES; 
SELECT HIRE_DATE AS "ZIP E GA GO SHIP DA"
FROM EMPLOYEES;

-------------------------------------------------------------------------------

// 3 - 5 NULL 
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (207, '����', '��', 'g@mail', SYSDATE, 'IT_PROG');

// �ǽ� : ���� ���̺��� ������ ���̵�, �޿�, ������ ����ϱ�
SELECT EMPLOYEE_ID, SALARY, SALARY * 12 AS "AnnSal"
FROM EMPLOYEES; 
// SALARY�� ���� ���(EX : ���� ������ �ڼ���)�� ��� ���� NULL���̶�, ���� ��ü�� �Ұ�����, ��� �� ���ϵ� NULL

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = '��' OR FIRST_NAME = '����';


------------------------------------------------------------------------ 