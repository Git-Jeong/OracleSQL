-----------------
-- CREATE TABLE
-- EMPLOYESS
DROP TABLE ����;

CREATE TABLE ����(
    ����ID NUMBER(6), 
    �� VARCHAR(25) NOT NULL,
    �̸� VARCHAR(25),
    �̸��� VARCHAR(25) NOT NULL,
    �Ի��� DATE,
    �޴���ȭ VARCHAR(25),
    ������ȣ VARCHAR(20) NOT NULL,
    �޿� NUMBER(8, 2),
    ���ʽ�_���� NUMBER(2, 2),
    �Ŵ���ID NUMBER(2,2),
    �μ�ID NUMBER(4,0)
)

-- �������� --
-- PRIMARY KEY : NOT NULL + UNIQUE
-- UNIQUE KEY : �ߺ��Ұ�, NULL�� ����
-- NOT NULL : NULL���� �Ұ���
-- FOREIGN KEY : 

ALTER TABLE ���� ADD CONSTRAINT ����_����ID_PK PRIMARY KEY(����ID);
ALTER TABLE ���� ADD CONSTRAINT ����_�̸���_UK UNIQUE(�̸���);
ALTER TABLE ���� ADD CONSTRAINT ����_�޿�_�ּڰ� CHECK(�޿� > 0); 


-- �μ� -------------------------------------------------------------


DROP TABLE �μ�;

CREATE TABLE �μ�(
    �μ�ID NUMBER(4) NOT NULL,
    �μ��̸� VARCHAR(30) NOT NULL,
    �Ŵ���ID NUMBER(6),
    ��ġ NUMBER(4)
)

ALTER TABLE �μ� ADD CONSTRAINT �μ�_�μ�ID_PK PRIMARY KEY(�μ�ID); 

--���� ���̺��� �μ�ID �÷��� �μ� ���̺��� �μ�ID �÷��� �����ϰ� �ȴ�
ALTER TABLE ���� ADD CONSTRAINT ����_�μ�ID_PK FOREIGN KEY (�μ�ID) REFERENCES �μ�(�μ�ID);

ALTER TABLE ���� MODIFY �̸� NOT NULL;

-- ���� ���������� �����Ѵ�?   
ALTER TABLE ���� DROP CONSTRAINT SYS_C007030;
-- SYS_C007030D���� �ɸ� ������ ����.
-- ���⼭ SYS_C007030�� ���� TABLE Ŭ�� �� shift f4�� ��������, �������ǿ� ���� ���´�


-- �������� �׽�Ʈ ------------

DROP TABLE ��������_�׽�Ʈ_1;
DROP TABLE ��������_�׽�Ʈ_2;

CREATE TABLE ��������_�׽�Ʈ_1 (
    PK NUMBER PRIMARY KEY,
    UK VARCHAR(1) UNIQUE,
    NN NUMBER NOT NULL,
    CK VARCHAR(1) CHECK ( CK IN ('1', '2'))
);

CREATE TABLE ��������_�׽�Ʈ_2 (
    PK NUMBER,
    UK VARCHAR(1),
    NN NUMBER,
    CK VARCHAR(1),
    
    CONSTRAINT T_PK_PK PRIMARY KEY(PK),
    CONSTRAINT T_UK_UK UNIQUE(UK),
    CONSTRAINT T_NN_NN CHECK(NN IS NOT NULL),
    CONSTRAINT T_CK_MIN CHECK(CK > 0)
);

INSERT INTO ��������_�׽�Ʈ_1 VALUES (1, 2, 3, 1);   


--���� ���̺� ���̸� �߰�
ALTER TABLE ���� ADD ���� NUMBER(1) NOT NULL;

--������ ũ�⸦ ����
ALTER TABLE ���� MODIFY ���� NUMBER(3);

--�÷� ���̶�� �̸��� AGE�� ����
ALTER TABLE ���� RENAME COLUMN ����  TO AGE;

--AGE��� COLUMN�� ����
ALTER TABLE ���� DROP COLUMN AGE;

--�����Ǵ� ���� �μ��� ��������?
DROP TABLE �μ�;
-- unique/primary keys in table referenced by foreign keys
-- ��, �μ�ID�� ���� ����TABLE�� ������ �Ǿ��ֱ� ������ ������ ����.

-- PK ���踦 ����
DROP TABLE �μ� CASCADE CONSTRAINTS;

-- �������ǿ� �������ǵ� �ɾ����
-- ON DELETE CASCADE -- �θ� ������ �ڳ൵ �����ϴ� ����!
ALTER TABLE ���� ADD CONSTRAINT ����_�μ�ID_PK FOREIGN KEY (�μ�ID) REFERENCES �μ�(�μ�ID) ON DELETE CASCADE;

-- ON DELETE SET NULL -- �θ� ������ �� �ڳ�� NULL�� ���Ե�
ALTER TABLE ���� ADD CONSTRAINT ����_�μ�ID_PK FOREIGN KEY (�μ�ID) REFERENCES �μ�(�μ�ID) ON DELETE SET NULL;


--���̺� ���α��� �ľ�
DESC ��������_�׽�Ʈ_1;
DESC ��������_�׽�Ʈ_2;