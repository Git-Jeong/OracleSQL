
-------------------------------------------------------------------------------

-- 4. WHEHE

--������ IT_PROG�� ����� ��� ������ ����
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--���� �ڵ尡 105�� ����� ��� ������ ����
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 105;


-- 4.2 ��������� ---------------------------------------
SELECT SALARY, SALARY+2 AS "2�� ���� ��" 
FROM EMPLOYEES;

SELECT SALARY / 4
FROM EMPLOYEES;

SELECT 
    FIRST_NAME AS �̸�, SALARY AS ����
FROM EMPLOYEES
WHERE SALARY <= 5000
ORDER BY SALARY;

SELECT FIRST_NAME AS "�̸�", SALARY * 12 AS "Annual"
FROM EMPLOYEES
WHERE SALARY * 12 >= 50000
ORDER BY SALARY;

-- 4.4 ��� ������ : ���ų�, ���� �ʰų�

--// �޿��� 3õ�� ����� �̸��� �޿��� ǥ��
SELECT FIRST_NAME AS �̸�, SALARY
FROM EMPLOYEES
WHERE SALARY = 3000;

--// �޿��� 1�� �̸��� �ƴ� ����� �̸���, �޿��� ���
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE NOT SALARY < 10000;

--//���� �ڵ尡 FI_ACCOUNT�� �ƴ� ����� �̸���, �����ڵ带 ���
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID != 'FI_ACCOUNT ';