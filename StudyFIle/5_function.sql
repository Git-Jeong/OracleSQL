--�Լ�
--�빮�ڷ� ����ϱ�, �ҹ��ڷ� ����ϱ�
SELECT FIRST_NAME, 
    UPPER(FIRST_NAME) AS �빮��, 
    EMAIL,
    LOWER(EMAIL) AS �̸���
FROM EMPLOYEES ;

--���� ����
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES;

-- ��������
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;

-- ���ڿ��� �����ϴ� �Լ�
-- SUBSTR(������, ������ġ )    
SELECT JOB_ID, SUBSTR(JOB_ID, 4)
FROM EMPLOYEES;

-- SUBSTR(������, ������ġ , ����)   
SELECT JOB_ID, SUBSTR(JOB_ID, 0, 2)
FROM EMPLOYEES;

-- �Ի��, ��, ��
SELECT 
    SUBSTR(HIRE_DATE, 1, 2) AS ��,
    SUBSTR(HIRE_DATE, 4, 2) AS ��,
    SUBSTR(HIRE_DATE, 7) AS ��
FROM EMPLOYEES;

-- ���ڸ� ��ü�ϴ� �Լ�
-- REPLACE(������, ã������, ��ü�� ����)
SELECT HIRE_DATE, REPLACE(HIRE_DATE, '/', '-') AS ��ǥ
FROM EMPLOYEES;

-- REPALCE�� �����ϱ�
SELECT HIRE_DATE, REPLACE(HIRE_DATE, '/', '') AS ��ǥ
FROM EMPLOYEES;

-- CONCAT ���ڿ� ��ġ��
-- CONCAT(��ĥ��1 + ��ĥ��2)
SELECT CONCAT('�Ի�����', HIRE_DATE) AS "�Ի��� ��ġ��"
FROM EMPLOYEES;

--������ ��ġ��
SELECT CONCAT('�Ի�����', CONCAT(HIRE_DATE, '�Դϴ�')) AS "�Ի��� ��ġ��"
FROM EMPLOYEES;

-- ||, $$
SELECT '�Ի�����' || HIRE_DATE || '�Դϴ�.'
FROM EMPLOYEES;

-------------------------------------------------------
-- �����Լ� --

-- DAUL ���̺� : �ְ� ���� �������� SYS������ ���̺��, 
--      �ӽ� �����̳� �Լ��� ������� Ȯ���ϴ� �뵵�� ���Ǵ� ���� ������

--MOD(x, y): x�� y�� ���� �� �������� ��ȯ
SELECT MOD(15, 6) AS ������,
    MOD(15, 2) AS Ȧ��,
    MOD(4,2) AS ¦��
FROM DUAL;

-- ROUND �ݿø� �Լ� 
SELECT ROUND(15.5) AS �ݿø� 
FROM DUAL; -- ���: 3

-- ROUND(3.145, 2) AS �ݿø� 
SELECT ROUND(3.145, 2) AS "2�ڸ��� �ݿø���"
FROM DUAL; -- ���: 3.15

-- TRUNC ���� �Լ� 
SELECT TRUNC(3.145, 2) AS ������
FROM DUAL; -- ���: 3.14 

-- TRUNC ���� �Լ� 
SELECT TRUNC(3.145) AS ������
FROM DUAL; -- ���: 3 


-- ��¥ �Լ� ------------------------------

-- STSDATE
-- �ý��� �ð��� ���缭 �ð��� ����
-- ���� -> ȯ�漳�� -> �����ͺ��̽� -> NLS - ��¥����(YYYY-MM-DD HH24:MI:SS)���� �ٲ�
SELECT SYSDATE
FROM DUAL;

-- ���Ͽ� ���
SELECT SYSDATE+1 AS ����
FROM DUAL;

-- 1�ð� �ĸ�  ���
SELECT SYSDATE + 1/24 AS "1�ð� ��"
FROM DUAL;

-- 1�� �ڸ� ���
SELECT SYSDATE + 1/24/60 AS "1�� ��"
FROM DUAL;

-- ADD_MONTH ��� ������ ��¥�� ���ϴ� �Լ�
SELECT ADD_MONTHS(SYSDATE, 1) AS "1���� ��"
FROM DUAL; --2025-02-15 15:40:00

--�Ի縦 �ϰ� ���� 3���� �Ŀ� ������
SELECT ADD_MONTHS(HIRE_DATE, 3) AS "������ ��ȯ��"
FROM EMPLOYEES; --2003-09-17 00:00:00


--------------------------------------------------
-- 5.4 ��(TYPE) ��ȯ �Լ�

-- TO_CHAR : ���ڿ��� ��ȯ
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
FROM DUAL;  -- 2025-01-15 15:42:29	25/01/15/������

-- L : ���� ȭ��, 9 : �ڸ���
SELECT SALARY,
    TO_CHAR(SALARY, 'L999,999')
FROM EMPLOYEES; --24000	         ��24,000

-- TO_NUMBER
-- �Ͻ��� ����ȯ �����ϴ�. (�ڵ����ε� �����ϴ�)
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
-- NULL��?? ---------------------------
-- NULL�� �񱳰� �� �ǹǷ�, ���⿡ �� �׽�Ʈ�� �ؼ� ������ �ƴ��� �ľ��ϴ� ��
-- NVL(NULL�˻��� ������, NULL�϶� ��ȯ��)
-- NVL2(NULL�˻��� ������, NULL�� �ƴҶ� ��ȯ��, NULL�϶� ��ȯ��)
SELECT SALARY, NVL(SALARY, 1)
FROM EMPLOYEES
WHERE FIRST_NAME = '����';

SELECT SALARY, NVL2(SALARY, 12345, 1)
FROM EMPLOYEES
WHERE FIRST_NAME = '����';

--DECODE ���ǹ��� SWUTCH�� ������ ��.
--���� ��ġ�ϸ� ��ȯ
-- DECOVE(�˻��� ������, ��1, ��ġ1, ��2, ��ġ3 ....  ��ġX)
SELECT SALARY,  DECODE(DEPARTMENT_ID, 
    100, SALARY * 2,
    90, SALARY * 1,
    80, SALARY * 10,
    SALARY * 0) AS ���ʽ�
FROM EMPLOYEES;

-- Ŀ�̼��� NULL �� �� 0���� ��ü�ؼ� ��ȯ -- NVL
SELECT FIRST_NAME, COMMISSION_PCT, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES;

-- Ŀ�̼��� NULL �� �� 0���� ��ü�ؼ� ��ȯ -- NVL2
SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, COMMISSION_PCT, 0)
FROM EMPLOYEES;

-- Ŀ�̼��� NULL �� �� 0���� ��ü�ؼ� ��ȯ -- DECODE
SELECT FIRST_NAME, COMMISSION_PCT, DECODE(COMMISSION_PCT, 
        NULL, 0, 
        COMMISSION_PCT
        )
FROM EMPLOYEES; 

-- �Ŵ����� �ִ� ������ ��������, �Ŵ����� ���� ������ �����ڷ� ��� - NVL2
SELECT FIRST_NAME, MANAGER_ID, NVL2(TO_CHAR(MANAGER_ID), '����' ,'������')
FROM EMPLOYEES;

-- �Ŵ����� �ִ� ������ ��������, �Ŵ����� ���� ������ �����ڷ� ��� - DECODE
SELECT FIRST_NAME, MANAGER_ID, DECODE(TO_CHAR(MANAGER_ID),
    NULL, '������',
    '����')    
FROM EMPLOYEES;